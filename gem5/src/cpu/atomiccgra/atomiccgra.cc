/*
 * Copyright 2014 Google, Inc.
 * Copyright (c) 2012-2013,2015,2017-2020 ARM Limited
 * All rights reserved.
 *
 * The license below extends only to copyright in the software and shall
 * not be construed as granting a license to any other intellectual
 * property including but not limited to intellectual property relating
 * to a hardware implementation of the functionality of the software
 * licensed hereunder.  You may use the software subject to the license
 * terms below provided that you ensure that this notice is replicated
 * unmodified and in its entirety in all distributions of the software,
 * modified or unmodified, in source code or in binary form.
 * Copyright (c) 2002-2005 The Regents of The University of Michigan
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met: redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer;
 * redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution;
 * neither the name of the copyright holders nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#include <iostream>
#include <fstream>
#include <math.h>
#include "arch/locked_mem.hh"
#include "arch/utility.hh"
#include "base/output.hh"
#include "config/the_isa.hh"
#include "cpu/exetrace.hh"
#include "cpu/utils.hh"
#include "mem/packet.hh"
#include "mem/packet_access.hh"
#include "mem/physical.hh"
#include "sim/faults.hh"
#include "sim/full_system.hh"
#include "sim/system.hh"
#include "cpu/atomiccgra/atomiccgra.hh"

//Debug flags for CGRA
#include "debug/CGRA_Execute.hh"
#include "debug/CGRA_Memory.hh"
#include "debug/CGRA_write_mem.hh"
#include "debug/Setup_DEBUG.hh"
#include "debug/Drain.hh"
#include "debug/ExecFaulting.hh"
#include "debug/SimpleCPU.hh"
#include "debug/Instruction_print.hh"
#include "debug/Cycles.hh"

#include "params/AtomicCGRA.hh"
using namespace std;
using namespace TheISA;

volatile unsigned long cgraCycles = 0;
unsigned long debugCycles = 0;

void
AtomicCGRA::init()
{
    BaseCGRA::init();

    int cid = threadContexts[0]->contextId();
    ifetch_req->setContext(cid);
    data_read_req->setContext(cid);
    data_write_req->setContext(cid);
    data_amo_req->setContext(cid);
}

AtomicCGRA::AtomicCGRA(AtomicCGRAParams *p)
    : BaseCGRA(p),
      tickEvent([this]{ tick(); }, "AtomicCGRA tick",
                false, Event::CPU_Tick_Pri),
      width(p->width), locked(false),
      simulate_data_stalls(p->simulate_data_stalls),
      simulate_inst_stalls(p->simulate_inst_stalls),
      icachePort(name(), this, ".icache_port"),
      dcachePort(name(), this, ".dcache_port"),
      dcache_access(false), dcache_latency(0),
      ppCommit(nullptr),
      CGRA_XDim(p->CGRA_rows),
      CGRA_YDim(p->CGRA_cols),
      RFSize(p->rfsize)
      //connection_type(p->connection)
{
    _status = Idle;
    ifetch_req = std::make_shared<Request>();
    data_read_req = std::make_shared<Request>();
    data_write_req = std::make_shared<Request>();
    data_amo_req = std::make_shared<Request>();

    //CGRA INIT DCACHE PORTS
    DPRINTF(CGRA,"initializing CGRA Dcache ports\n");

    //resize dcache_CGRA_ports to the size of XDims (CGRA_Rows)
    dcache_CGRA_ports.reserve(CGRA_XDim); 
    for(int i=0; i<CGRA_XDim; i++)
        dcache_CGRA_ports.push_back( AtomicCGRADPort(name(), this, std::to_string(i)));

    
    MemData = new int[CGRA_XDim];
    FMemData = new float[CGRA_XDim]; 
    MemBusDatatype = new int[CGRA_XDim];  
    //reserve memaccesses in CGRA
    //MemData.reserve(CGRA_XDim);
    MemAddress.reserve(CGRA_XDim); 
    MemAccessAlignment.reserve(CGRA_XDim);
    MemBusStatus.reserve(CGRA_XDim);

    //Assign the values to 0
    //MemData.assign(CGRA_XDim, 0);
    MemAddress.assign(CGRA_XDim, 0);
    MemAccessAlignment.assign(CGRA_XDim, 4);
    MemBusStatus.assign(CGRA_XDim, 0);


    //CGRA RELATED START
    DPRINTF(CGRA,"Setting Up CGRA\n");
    CGRA_Mode = 0;
    Setup_CGRA();
    DPRINTF(CGRA,"CGRA instantiated\n");
}


AtomicCGRA::~AtomicCGRA()
{
  delete[] CGRA_instructions;
  delete[] MemData;
  delete[] FMemData; 
  delete[] MemBusDatatype; 
  //cgra_PEs.resize(0);
  delete[] cgra_PEs; 
    if (tickEvent.scheduled()) {
        deschedule(tickEvent);
    }
}

AtomicCGRA::DcachePort_Ptr AtomicCGRA:: getDcachePort_ptr_from_addr(Addr vaddr, int xdim)
{
  DcachePort_Ptr result = NULL;

  /*switch(xdim){
    case 0: result = &dcachePort1;
    break;
    case 1: result = &dcachePort2;
    break;
    case 2: result = &dcachePort3;
    break;
    case 3: result = &dcachePort4;
    break;
    default: break;
    }
    return result;*/ 
  if (xdim < CGRA_XDim)
    result = &dcache_CGRA_ports[xdim];
  else {
    DPRINTF(CGRA_Memory, "xdim size: %d\n", xdim);
    //DPRINTF(CGRA_Memory, "dcache port size %d\n", (int) dcache_CGRA_ports.size());
    DPRINTF(CGRA_Memory, "CGRA_XDim size: %d\n", CGRA_XDim);
    panic("This should not happen. If the control reaches here then the vector ports initialization is incorrect. i: %d\n",xdim);
  }

  return result;
}

AtomicCGRA::DcachePort_Ptr AtomicCGRA:: getDcachePort_ptr(RequestPtr req, int xdim)
{
  DcachePort_Ptr result = NULL;
  if(is_CPU())
    result = &dcachePort;
  else
  {
    Addr virtaddr=req->getVaddr();
    result = getDcachePort_ptr_from_addr(virtaddr, xdim);
  }
  return result;
}

AtomicCGRA::StatusPtr AtomicCGRA:: getDcachePort_status_ptr(RequestPtr req, int xdim)
{
  StatusPtr result = NULL;
  DcachePort_Ptr port = getDcachePort_ptr(req, xdim);
  result = &(port->_status);
  //x_dim = xdim;
  return result;
}

DrainState
AtomicCGRA::drain()
{
    // Deschedule any power gating event (if any)
    deschedulePowerGatingEvent();

    if (switchedOut())
        return DrainState::Drained;

    if (!isCpuDrained()) {
        DPRINTF(Drain, "Requesting drain.\n");
        return DrainState::Draining;
    } else {
        if (tickEvent.scheduled())
            deschedule(tickEvent);

        activeThreads.clear();
        DPRINTF(Drain, "Not executing microcode, no need to drain.\n");
        return DrainState::Drained;
    }
}

void
AtomicCGRA::threadSnoop(PacketPtr pkt, ThreadID sender)
{
    DPRINTF(SimpleCPU, "%s received snoop pkt for addr:%#x %s\n",
            __func__, pkt->getAddr(), pkt->cmdString()); //TODO

    for (ThreadID tid = 0; tid < numThreads; tid++) {
        if (tid != sender) {
            if (getCpuAddrMonitor(tid)->doMonitor(pkt)) {
                wakeup(tid);
            }

            TheISA::handleLockedSnoop(threadInfo[tid]->thread,
                                      pkt, dcachePort.cacheBlockMask);
        }
    }
}

void
AtomicCGRA::drainResume()
{
    assert(!tickEvent.scheduled());
    if (switchedOut())
        return;

    DPRINTF(SimpleCPU, "Resume\n"); //TODO
    verifyMemoryMode();

    assert(!threadContexts.empty());

    _status = BaseCGRA::Idle;

    for (ThreadID tid = 0; tid < numThreads; tid++) {
        if (threadInfo[tid]->thread->status() == ThreadContext::Active) {
            threadInfo[tid]->notIdleFraction = 1;
            activeThreads.push_back(tid);
            _status = BaseCGRA::Running;

            // Tick if any threads active
            if (!tickEvent.scheduled()) {
                schedule(tickEvent, nextCycle());
            }
        } else {
            threadInfo[tid]->notIdleFraction = 0;
        }
    }

    // Reschedule any power gating event (if any)
    schedulePowerGatingEvent();
}

bool
AtomicCGRA::tryCompleteDrain()
{
    if (drainState() != DrainState::Draining)
        return false;

    DPRINTF(Drain, "tryCompleteDrain.\n");
    if (!isCpuDrained())
        return false;

    DPRINTF(Drain, "CPU done draining, processing drain event\n");
    signalDrainDone();

    return true;
}


void
AtomicCGRA::switchOut()
{
    BaseCGRA::switchOut();

    assert(!tickEvent.scheduled());
    assert(_status == BaseCGRA::Running || _status == Idle);
    assert(isCpuDrained());
}


void
AtomicCGRA::takeOverFrom(BaseCPU *oldCPU)
{
    BaseCGRA::takeOverFrom(oldCPU);

    // The tick event should have been descheduled by drain()
    assert(!tickEvent.scheduled());
}

void
AtomicCGRA::verifyMemoryMode() const
{
    if (!system->isAtomicMode()) {
        fatal("The atomic CPU requires the memory system to be in "
              "'atomic' mode.\n");
    }
}

void
AtomicCGRA::activateContext(ThreadID thread_num)
{
    DPRINTF(SimpleCPU, "CGRA ActivateContext %d\n", thread_num); //TODO

    assert(thread_num < numThreads);

    threadInfo[thread_num]->notIdleFraction = 1;
    Cycles delta = ticksToCycles(threadInfo[thread_num]->thread->lastActivate -
                                 threadInfo[thread_num]->thread->lastSuspend);
    numCycles += delta;
    cgraCycles += delta;
    debugCycles += delta;

    if (!tickEvent.scheduled()) {
        //Make sure ticks are still on multiples of cycles
        schedule(tickEvent, clockEdge(Cycles(0)));
    }
    _status = BaseCGRA::Running;
    if (std::find(activeThreads.begin(), activeThreads.end(), thread_num)
        == activeThreads.end()) {
        activeThreads.push_back(thread_num);
    }

    BaseCPU::activateContext(thread_num);
}


void
AtomicCGRA::suspendContext(ThreadID thread_num)
{
    DPRINTF(SimpleCPU, "SuspendContext %d\n", thread_num); //TODO

    SimpleExecContext& t_info = *threadInfo[curThread];
    SimpleThread* thread = t_info.thread;
    
    assert(thread_num < numThreads);
    activeThreads.remove(thread_num);
    //assert(thread);

    if (_status == Idle)
        return;

    assert(_status == BaseCGRA::Running);

    threadInfo[thread_num]->notIdleFraction = 0;

    if (activeThreads.empty()) {
        _status = Idle;

        if (tickEvent.scheduled()) {
            deschedule(tickEvent);
        }
    }

    BaseCPU::suspendContext(thread_num);
}

Tick
AtomicCGRA::sendPacket(RequestPort &port, const PacketPtr &pkt)
{
    return port.sendAtomic(pkt);
}

Tick
AtomicCGRA::AtomicCGRADPort::recvAtomicSnoop(PacketPtr pkt)
{
    DPRINTF(SimpleCPU, "%s received atomic snoop pkt for addr:%#x %s\n",
            __func__, pkt->getAddr(), pkt->cmdString()); //TODO

    // X86 ISA: Snooping an invalidation for monitor/mwait
    AtomicCGRA *cpu = (AtomicCGRA *)(&owner);

    for (ThreadID tid = 0; tid < cpu->numThreads; tid++) {
        if (cpu->getCpuAddrMonitor(tid)->doMonitor(pkt)) {
            cpu->wakeup(tid);
        }
    }

    // if snoop invalidates, release any associated locks
    // When run without caches, Invalidation packets will not be received
    // hence we must check if the incoming packets are writes and wakeup
    // the processor accordingly
    if (pkt->isInvalidate() || pkt->isWrite()) {
        DPRINTF(SimpleCPU, "received invalidation for addr:%#x\n",
                pkt->getAddr());
        for (auto &t_info : cpu->threadInfo) {
            TheISA::handleLockedSnoop(t_info->thread, pkt, cacheBlockMask);
        }
    }

    return 0;
}

void
AtomicCGRA::AtomicCGRADPort::recvFunctionalSnoop(PacketPtr pkt)
{
    DPRINTF(SimpleCPU, "%s received functional snoop pkt for addr:%#x %s\n",
            __func__, pkt->getAddr(), pkt->cmdString());

    // X86 ISA: Snooping an invalidation for monitor/mwait
    AtomicCGRA *cpu = (AtomicCGRA *)(&owner);
    for (ThreadID tid = 0; tid < cpu->numThreads; tid++) {
        if (cpu->getCpuAddrMonitor(tid)->doMonitor(pkt)) {
            cpu->wakeup(tid);
        }
    }

    // if snoop invalidates, release any associated locks
    if (pkt->isInvalidate()) {
        DPRINTF(SimpleCPU, "received invalidation for addr:%#x\n",
                pkt->getAddr());
        for (auto &t_info : cpu->threadInfo) {
            TheISA::handleLockedSnoop(t_info->thread, pkt, cacheBlockMask);
        }
    }
}

bool
AtomicCGRA::genMemFragmentRequest(const RequestPtr& req, Addr frag_addr,
                                       int size, Request::Flags flags,
                                       const std::vector<bool>& byte_enable,
                                       int& frag_size, int& size_left) const
{
    bool predicate = true;
    Addr inst_addr = threadInfo[curThread]->thread->pcState().instAddr();

    frag_size = std::min(
        cacheLineSize() - addrBlockOffset(frag_addr, cacheLineSize()),
        (Addr) size_left);
    size_left -= frag_size;
    //std::cout << "genMemFragmentRequest(): size_left = " << size_left << std::endl;
    if (!byte_enable.empty()) {
      //std::cout << "genMemFrag(): if\n";
        // Set up byte-enable mask for the current fragment
        auto it_start = byte_enable.begin() + (size - (frag_size + size_left));
        auto it_end = byte_enable.begin() + (size - size_left);
        if (isAnyActiveElement(it_start, it_end)) {
            req->setVirt(frag_addr, frag_size, flags, dataRequestorId(),
                         inst_addr);
            req->setByteEnable(std::vector<bool>(it_start, it_end));
        } else {
            predicate = false;
        }
    } else {
      //std::cout << "genMemFrag(): else\n";
        req->setVirt(frag_addr, frag_size, flags, dataRequestorId(),
                     inst_addr);
        req->setByteEnable(std::vector<bool>());
    }
    //std::cout << "genMemFrag(): predicate = " << predicate << std::endl;
    return predicate;
}

Fault
AtomicCGRA::readMem(Addr addr, uint8_t * data, unsigned size,
                         Request::Flags flags,
                         const std::vector<bool>& byte_enable)
{
    SimpleExecContext& t_info = *threadInfo[curThread];
    SimpleThread* thread = t_info.thread;

    // use the CPU's statically allocated read request and packet objects
    const RequestPtr &req = data_read_req;

    if (traceData)
        traceData->setMem(addr, size, flags);

    dcache_latency = 0;

    req->taskId(taskId());

    Addr frag_addr = addr;
    int frag_size = 0;
    int size_left = size;
    bool predicate;
    Fault fault = NoFault;

    while (1) {
        predicate = genMemFragmentRequest(req, frag_addr, size, flags,
                                          byte_enable, frag_size, size_left);

        // translate to physical address
        if (predicate) {
            fault = thread->dtb->translateAtomic(req, thread->getTC(),
                                                 BaseTLB::Read);
        }

        // Now do the access.
        if (predicate && fault == NoFault &&
            !req->getFlags().isSet(Request::NO_ACCESS)) {
            Packet pkt(req, Packet::makeReadCmd(req));
            pkt.dataStatic(data);

            if (req->isLocalAccess()) {
                dcache_latency += req->localAccessor(thread->getTC(), &pkt);
            } else {
                dcache_latency += sendPacket(dcachePort, &pkt);
            }
            dcache_access = true;

            assert(!pkt.isError());

            if (req->isLLSC()) {
                TheISA::handleLockedRead(thread, req);
            }
        }

        //If there's a fault, return it
        if (fault != NoFault) {
            if (req->isPrefetch()) {
                return NoFault;
            } else {
                return fault;
            }
        }

        // If we don't need to access further cache lines, stop now.
        if (size_left == 0) {
            if (req->isLockedRMW() && fault == NoFault) {
                assert(!locked);
                locked = true;
            }
            return fault;
        }

        /*
         * Set up for accessing the next cache line.
         */
        frag_addr += frag_size;

        //Move the pointer we're reading into to the correct location.
        data += frag_size;
    }
}

Fault
AtomicCGRA::readMem(Addr addr, uint8_t * data, unsigned size,
                         Request::Flags flags,
                         const std::vector<bool>& byte_enable, int xdim)
{
    SimpleExecContext& t_info = *threadInfo[curThread];
    SimpleThread* thread = t_info.thread;

    //printf("readMem() address: %lx\n", addr);

    // use the CPU's statically allocated read request and packet objects
    const RequestPtr &req = data_read_req;

    if (traceData)
        traceData->setMem(addr, size, flags);

    dcache_latency = 0;

    req->taskId(taskId());

    /* CGRA Changes */
    StatusPtr portStatus = getDcachePort_status_ptr(req,xdim);
    *portStatus = DTBWaitResponse;
    /* CGRA Changes */

    Addr frag_addr = addr;
    int frag_size = 0;
    int size_left = size;
    bool predicate = true;
    Fault fault = NoFault;
    frag_size = std::min(cacheLineSize() - addrBlockOffset(frag_addr, cacheLineSize()),(Addr) size_left);

    while (1) {
      //if(frag_addr != 632388)
      //predicate = genMemFragmentRequest(req, frag_addr, size, flags,
      //                                  byte_enable, frag_size, size_left);
      Addr inst_addr = threadInfo[curThread]->thread->pcState().instAddr();
      req->setVirt(frag_addr, frag_size, flags, dataRequestorId(), inst_addr);
      size_left -= frag_size;
        // translate to physical address
        if (predicate) {
	  fault = thread->dtb->translateAtomic(req, thread->getTC(),
	                                       BaseTLB::Execute);
        }

	//printf("\tPredicate = %d - fault = %d - getFlags = %d - size_left = %d\n", predicate, fault == NoFault, !req->getFlags().isSet(Request::NO_ACCESS), size_left);
	//printf("ReadMem(): Req = %d\n", req);
	
        // Now do the access.
	fault = NoFault;
        if (predicate && fault == NoFault &&
            !req->getFlags().isSet(Request::NO_ACCESS)) {
	  //printf("ReadMem(): pkt -> ");
	    Packet pkt(req, Packet::makeReadCmd(req));
	    //printf("dataStatic -> ");
	    pkt.dataStatic(data);

            if (req->isLocalAccess()) {
                dcache_latency += req->localAccessor(thread->getTC(), &pkt);
            } else {
	      //printf("sendPacket -> ");
                dcache_latency += sendPacket(dcachePort, &pkt);
            }
	    //printf("done read\n");
            dcache_access = true;

            assert(!pkt.isError());

            if (req->isLLSC()) {
                TheISA::handleLockedRead(thread, req);
            }
	    //printf("\treadMem(): data = %d\n", *data);
        }

        //If there's a fault, return it
        if (fault != NoFault) {
            if (req->isPrefetch()) {
                return NoFault;
            } else {
                return fault;
            }
        }

        // If we don't need to access further cache lines, stop now.
	if(addr = 632388) size_left = 0;
        if (size_left == 0) {
            if (req->isLockedRMW() && fault == NoFault) {
                assert(!locked);
                locked = true;
            }
            return fault;
        }

        /*
         * Set up for accessing the next cache line.
         */
        frag_addr += frag_size;

        //Move the pointer we're reading into to the correct location.
        data += frag_size;
    }
}

Fault
AtomicCGRA::writeMem(uint8_t *data, unsigned size, Addr addr,
                          Request::Flags flags, uint64_t *res,
                          const std::vector<bool>& byte_enable)
{
    SimpleExecContext& t_info = *threadInfo[curThread];
    SimpleThread* thread = t_info.thread;
    static uint8_t zero_array[64] = {};

    if (data == NULL) {
        assert(size <= 64);
        assert(flags & Request::STORE_NO_DATA);
        // This must be a cache block cleaning request
        data = zero_array;
    }

    // use the CPU's statically allocated write request and packet objects
    const RequestPtr &req = data_write_req;

    if (traceData)
        traceData->setMem(addr, size, flags);

    dcache_latency = 0;

    req->taskId(taskId());

    Addr frag_addr = addr;
    int frag_size = 0;
    int size_left = size;
    int curr_frag_id = 0;
    bool predicate;
    Fault fault = NoFault;

    while (1) {
        predicate = genMemFragmentRequest(req, frag_addr, size, flags,
                                          byte_enable, frag_size, size_left);

        // translate to physical address
        if (predicate)
            fault = thread->dtb->translateAtomic(req, thread->getTC(),
                                                 BaseTLB::Write);

        // Now do the access.
        if (predicate && fault == NoFault) {
            bool do_access = true;  // flag to suppress cache access

            if (req->isLLSC()) {
	      assert(curr_frag_id == 0);
                do_access =
                    TheISA::handleLockedWrite(thread, req,
                                              dcachePort.cacheBlockMask);
            } else if (req->isSwap()) {
                assert(curr_frag_id == 0);
                if (req->isCondSwap()) {
                    assert(res);
                    req->setExtraData(*res);
                }
            }

            if (do_access && !req->getFlags().isSet(Request::NO_ACCESS)) {
                Packet pkt(req, Packet::makeWriteCmd(req));
                pkt.dataStatic(data);

                if (req->isLocalAccess()) {
                    dcache_latency +=
                        req->localAccessor(thread->getTC(), &pkt);
                } else {
                    dcache_latency += sendPacket(dcachePort, &pkt);

                    // Notify other threads on this CPU of write
                    threadSnoop(&pkt, curThread);
                }
                dcache_access = true;
                assert(!pkt.isError());

                if (req->isSwap()) {
                    assert(res && curr_frag_id == 0);
                    memcpy(res, pkt.getConstPtr<uint8_t>(), size);
                }
            }

            if (res && !req->isSwap()) {
                *res = req->getExtraData();
            }
        }

        //If there's a fault or we don't need to access a second cache line,
        //stop now.
        if (fault != NoFault || size_left == 0)
        {
            if (req->isLockedRMW() && fault == NoFault) {
                assert(!req->isMasked());
                locked = false;
            }

            if (fault != NoFault && req->isPrefetch()) {
                return NoFault;
            } else {
                return fault;
            }
        }

        /*
         * Set up for accessing the next cache line.
         */
        frag_addr += frag_size;

        //Move the pointer we're reading into to the correct location.
        data += frag_size;

        curr_frag_id++;
    }
}

Fault
AtomicCGRA::writeMem(uint8_t *data, unsigned size, Addr addr,
                          Request::Flags flags, uint64_t *res,
                          const std::vector<bool>& byte_enable, int xdim)
{
    SimpleExecContext& t_info = *threadInfo[curThread];
    SimpleThread* thread = t_info.thread;
    static uint8_t zero_array[64] = {};
    
    if (data == NULL) {
        assert(size <= 64);
        assert(flags & Request::STORE_NO_DATA);
        // This must be a cache block cleaning request
        data = zero_array;
    }

    // use the CPU's statically allocated write request and packet objects
    const RequestPtr &req = data_write_req;

    if (traceData)
        traceData->setMem(addr, size, flags);

    DPRINTF(CGRA_write_mem, "Inside writeMem\n"); 
    dcache_latency = 0;

    
    DPRINTF(CGRA_write_mem, "data:%d\t size:%ld\t addr:%x\n", &data, size, addr ) ;
    req->taskId(taskId());

    /*CGRA CHANGES*/
    StatusPtr portStatus = getDcachePort_status_ptr(req,xdim);
    *portStatus = DTBWaitResponse;
    /*CGRA CHANGES*/

    Addr frag_addr = addr;
    int frag_size = 0;
    int size_left = size;
    int curr_frag_id = 0;
    bool predicate = true;
    Fault fault = NoFault;
    frag_size = std::min(cacheLineSize() - addrBlockOffset(frag_addr, cacheLineSize()),(Addr) size_left);
    
    while (1) {
      Addr inst_addr = threadInfo[curThread]->thread->pcState().instAddr();
      req->setVirt(frag_addr, frag_size, flags, dataRequestorId(), inst_addr);
      size_left -= frag_size;
      //predicate = genMemFragmentRequest(req, frag_addr, size, flags,
      //byte_enable, frag_size, size_left);

        // translate to physical address
    //  if (predicate){
            fault = thread->dtb->translateAtomic(req, thread->getTC(),
                                                 BaseTLB::Execute);
	    //printf("WriteMem(): fault = %d\n", fault == NoFault);
	    //printf("WriteMem(): Req: %d\n", req);
	    fault = NoFault;
	    //	}
	
        // Now do the access.
        if (predicate && fault == NoFault) {
            bool do_access = true;  // flag to suppress cache access
	    //std::cout << "curr_frag_id = " << curr_frag_id << std::endl;
            if (req->isLLSC()) {
	      assert(curr_frag_id == 0);
                do_access =
                    TheISA::handleLockedWrite(thread, req,
                                              dcachePort.cacheBlockMask);
		//printf("handleLockWrite(): do_access = %d\n", do_access);
		do_access = true;
            } else if (req->isSwap()) {
	      assert(curr_frag_id == 0);
                if (req->isCondSwap()) {
                    assert(res);
                    req->setExtraData(*res);
                }
            }
	    //printf("writeMem(): do_access = %d - getFlags = %d\n", do_access, !req->getFlags().isSet(Request::NO_ACCESS));
            if (do_access && !req->getFlags().isSet(Request::NO_ACCESS)) {
                Packet pkt(req, Packet::makeWriteCmd(req));
                pkt.dataStatic(data);

                if (req->isLocalAccess()) {
		  //printf("WriteMem(): localAccessor\n");
                    dcache_latency +=
                        req->localAccessor(thread->getTC(), &pkt);
                } else {
		  //printf("WriteMem(): sendPacket\n");
                    dcache_latency += sendPacket(dcachePort, &pkt);
		    //printf("WriteMem(): threadSnoop\n");
                    // Notify other threads on this CPU of write
                    threadSnoop(&pkt, curThread);
                }
		//printf("WriteMem(): done writing\n");
                dcache_access = true;
                assert(!pkt.isError());

                if (req->isSwap()) {
                    assert(res && curr_frag_id == 0);
                    memcpy(res, pkt.getConstPtr<uint8_t>(), size);
                }
            }

            if (res && req->isSwap() && req->isCondSwap()) {
                *res = req->getExtraData();
            }
        }
	size_left = 0;
        //If there's a fault or we don't need to access a second cache line,
        //stop now.
        if (fault != NoFault || size_left == 0)
        {
            if (req->isLockedRMW() && fault == NoFault) {
                assert(!req->isMasked());
                locked = false;
            }

            if (fault != NoFault && req->isPrefetch()) {
                return NoFault;
            } else {
                return fault;
            }
        }

        /*
         * Set up for accessing the next cache line.
         */
        frag_addr += frag_size;

        //Move the pointer we're reading into to the correct location.
        data += frag_size;

        curr_frag_id++;
    }
}

Fault
AtomicCGRA::amoMem(Addr addr, uint8_t* data, unsigned size,
                        Request::Flags flags, AtomicOpFunctorPtr amo_op)
{
    SimpleExecContext& t_info = *threadInfo[curThread];
    SimpleThread* thread = t_info.thread;

    // use the CPU's statically allocated amo request and packet objects
    const RequestPtr &req = data_amo_req;

    if (traceData)
        traceData->setMem(addr, size, flags);

    //The address of the second part of this access if it needs to be split
    //across a cache line boundary.
    Addr secondAddr = roundDown(addr + size - 1, cacheLineSize());

    // AMO requests that access across a cache line boundary are not
    // allowed since the cache does not guarantee AMO ops to be executed
    // atomically in two cache lines
    // For ISAs such as x86 that requires AMO operations to work on
    // accesses that cross cache-line boundaries, the cache needs to be
    // modified to support locking both cache lines to guarantee the
    // atomicity.
    if (secondAddr > addr) {
        panic("AMO request should not access across a cache line boundary\n");
    }

    dcache_latency = 0;

    req->taskId(taskId());
    req->setVirt(addr, size, flags, dataRequestorId(),
                 thread->pcState().instAddr(), std::move(amo_op));

    // translate to physical address
    Fault fault = thread->dtb->translateAtomic(req, thread->getTC(),
                                                      BaseTLB::Write);

    // Now do the access.
    if (fault == NoFault && !req->getFlags().isSet(Request::NO_ACCESS)) {
        // We treat AMO accesses as Write accesses with SwapReq command
        // data will hold the return data of the AMO access
        Packet pkt(req, Packet::makeWriteCmd(req));
        pkt.dataStatic(data);

        if (req->isLocalAccess())
            dcache_latency += req->localAccessor(thread->getTC(), &pkt);
        else {
            dcache_latency += sendPacket(dcachePort, &pkt);
        }

        dcache_access = true;

        assert(!pkt.isError());
        assert(!req->isLLSC());
    }

    if (fault != NoFault && req->isPrefetch()) {
        return NoFault;
    }

    //If there's a fault and we're not doing prefetch, return it
    return fault;
}

void AtomicCGRA::CGRA_Execution(SimpleExecContext& t_info)
{
  DPRINTF(SimpleCPU, "CGRA Pipeline\n");
  Fault fault = NoFault;
  DPRINTF(CGRA_Execute, "\n\n ~~~~~~ CGRA_Execution @ numCycles = %d ~~~~~~~\n", cgraCycles);
  // received a response from the icache: execute the received instruction
  //DPRINTF(CGRA, "Length %d\n", Len);
  //DPRINTF(Instruction_print, "Fault print number: %d\n", (int)fault);
  //DPRINTF(Instruction_print, "stayAtPC: %d\n", (int)stayAtPC); 
  Len--;
  {
    _status = BaseCGRA::Running;
    //numCycles++;
    //cgraCycles++;
    // DPRINTF(CGRA_Execute, "CGRA.CGRA_Exec(): numCycles = %d\n", numCycles);
    //DPRINTF(CGRA_Detailed, "CGRA.Exec(): numCycles = %d\n", numCycles);
    //printf("CGRA.Exec(): numCycles = %d\n", numCycles);
  }

  if (drainState() == DrainState::Draining)
  {
    completeDrain();
    return;
  }

  //*********FETCH********************
  for (unsigned i = 0; i < CGRA_XDim; i++)
  {
    for (unsigned j = 0; j < CGRA_YDim; j++)
    {
      // little modification compared to hardware implementation
      CGRA_Instruction *currentIns = new CGRA_Instruction(CGRA_instructions[i*CGRA_YDim + j]);
      cgra_PEs[i * CGRA_YDim + j].Fetch(currentIns);
  //    DPRINTF(Instruction_print,"Ins: %lx\t @ PE: %d\n",currentIns->getInsWord(), i * CGRA_YDim + j); 
    }
  }

  //*************PRINT INSTRUCTIONS AFTER FETCH*********
  //for(int i=0; i < CGRA_XDim; i++)
    //for(int j =0; j<CGRA_YDim; j++)
      //DPRINTF(Instruction_print, "Ins: %ld, %lx\n", CGRA_instructions[i*CGRA_YDim + j], CGRA_instructions[i*CGRA_YDim + j]);

  //*********DECODE********************
  for (unsigned i = 0; i < CGRA_XDim; i++)
    for (unsigned j = 0; j < CGRA_YDim; j++)
      cgra_PEs[i * CGRA_YDim + j].Decode();

  if(!isTCdynamic)
  {
    if((Len == 0) & (state == KERN))
      KernelCounter--;
  }

  //*********EXECUTE********************
  // Support for multiple datatypes added in exec unit.
  for (int i = 0; i < CGRA_XDim; i++)
  {
    for (int j = 0; j < CGRA_YDim; j++)
    {      
      DPRINTF(CGRA_Detailed, "Ins: %ld, %lx @ PE %d\n", CGRA_instructions[i*CGRA_YDim + j], CGRA_instructions[i*CGRA_YDim + j], (i*CGRA_YDim)+j);
      if(cgra_PEs[i * CGRA_YDim + j].GetDatatype() == character || cgra_PEs[i * CGRA_YDim + j].GetDatatype() == int32) //; int16
        cgra_PEs[i * CGRA_YDim + j].IExecute();
      else if(cgra_PEs[i * CGRA_YDim + j].GetDatatype() == float32)
        cgra_PEs[i * CGRA_YDim + j].FExecute();
      //else if(cgra_PEs[i * CGRA_YDim + j].GetDatatype() == float64)
      //  cgra_PEs[i * CGRA_YDim + j].DExecute();

      if(!cgra_PEs[i * CGRA_YDim + j].isNOOP())
	Conditional_Reg = (Conditional_Reg & cgra_PEs[i * CGRA_YDim + j].getController_Reg());
      DPRINTF(CGRA_Detailed, "Conditional reg is %d : Len = %d\n", Conditional_Reg, Len);
    }
  }

  /*
     If TC is statically known then, decrement KernelCounter till 0.
     Set Conditional_Reg as 0 to exit the kernel, moving to epilogue.
     If TC is not known statically,
     CGRA PE evaluating exit operation would set Conditional_Reg to 0.
   */
 if(!isTCdynamic)
  {
    if(KernelCounter < 1)
      Conditional_Reg = 0;
    else
      Conditional_Reg = 1;
    DPRINTF(CGRA_Detailed, "Conditional reg is %d : Len = %d\n", Conditional_Reg, Len);
  }
 
  //*********WRITE BACK********************
  for (int i = 0; i < CGRA_XDim; i++)
    for (int j = 0; j < CGRA_YDim; j++)
      cgra_PEs[i * CGRA_YDim + j].WriteBack();

  const std::vector<bool> be;
  //*********PERFORM MEMORY OPERATIONS********************
  for (int i = 0; i < CGRA_XDim; i++)
  {
    if (MemBusStatus[i] == CGRA_MEMORY_READ)
    {
      //read int of fp memdata based on the datatype of the membus.
      if(MemBusDatatype[i] == CGRA_MEMORY_INT)
        readMem((Addr) MemAddress[i], (uint8_t *) &MemData[i], (unsigned)MemAccessAlignment[i], (unsigned) 163, be, i);
      else
        readMem((Addr) MemAddress[i], (uint8_t *) &FMemData[i], (unsigned)MemAccessAlignment[i], (unsigned) 163, be, i);
      MemAccessCount++;
      printf("\n************* MEM READ *************\n");
      printf("Row: %d - address: %d - data: %d\n", i, MemAddress[i], MemData[i]);
      //x_dim=0;
      MemBusStatus[i] = CGRA_MEMORY_RESET;
    }
    else if (MemBusStatus[i] == CGRA_MEMORY_WRITE)
    {
      
      // write int of fp memdata based on the datatype of the membus.
      DPRINTF(CGRA_Memory, "i in the MemBus loop %d\n", i);
      DPRINTF(CGRA_Detailed, "In Memwrite with membus: %d\n", MemBusDatatype[i]);
      if(MemBusDatatype[i] == CGRA_MEMORY_INT)
      {
        DPRINTF(CGRA_Detailed, "In writing INT %d\t to address:%lx\t -- &Data: %lx\t and uint: %lx\n" , MemData[i], MemAddress[i], &MemData[i], (uint8_t *) &MemData[i]);


	/****************************/	
	///////////////////////////////////
	/*
	printf("\n********** STARTING READ/WRITE TEST ************\n\n");
	int k = 100;
	const std::vector<bool> be2;
	for(k=200; k<300; k++){
	  //const std::vector<bool> be2;
	  //const std::vector<bool> be3;
	  uint8_t writeData = k;
	  int wm = (writeMem((uint8_t *) &writeData, (unsigned) MemAccessAlignment[i], (Addr) MemAddress[i], (unsigned) 131, unknownRes, be2, i) == NoFault);
	  uint8_t readData;
	  int rm = (readMem((Addr) MemAddress[i], (uint8_t *) &readData, (unsigned)MemAccessAlignment[i], (unsigned) 163, be, i) == NoFault);
	  printf("writeData(%d) = %d\treadData(%d) = %d\n", wm, writeData, rm, readData);
	}
	printf("\n********** END READ/WRITE TEST ************\n\n");
	*/
	///////////////////////////////////
	
	const std::vector<bool> be1;
	writeMem((uint8_t *) &MemData[i], (unsigned) MemAccessAlignment[i], (Addr) MemAddress[i], (unsigned) 0b10110111, unknownRes, be1, i);
	uint8_t memdata; 
	readMem((Addr) MemAddress[i], (uint8_t *) &memdata, (unsigned)MemAccessAlignment[i], (unsigned) 163, be1, i);
        
	/*****************************/
      }
      else
      {
        DPRINTF(CGRA_Detailed, "In writing %f\t to address:%lx\t -- &Data: %lx\t and uint: %lx\n" , FMemData[i], MemAddress[i], &FMemData[i], (uint8_t *) &FMemData[i]); 
        //writeMem((uint8_t *) &FMemData[i], (unsigned) MemAccessAlignment[i], (Addr) MemAddress[i], (unsigned) 0b10110111, unknownRes, be, i);
      }
      MemAccessCount++;
      //x_dim=0;
      MemBusStatus[i] = CGRA_MEMORY_RESET;
    }
    MemBusStatus[i] = CGRA_MEMORY_RESET;
  }

  CGRA_advanceTime();

  DPRINTF(CGRA_Execute, "CGRA advanceTime complete.\n"); 
  
  //DPRINTF(Instruction_print, "Fault after exe: %d\n",(int)fault);

 
  if(fault != NoFault || !t_info.stayAtPC) 
    CGRA_advancePC(t_info.thread);

  
  if (tryCompleteDrain())
  {
    DPRINTF(CGRA_Execute, "Inside tryCompleteDrain().\n"); 
    return;
  }

  DPRINTF(CGRA_Execute, "Passed Complete Drain().\n"); 
  // instruction takes at least one cycle
  if (latency < clockPeriod())
    latency = clockPeriod();

  DPRINTF(CGRA_Execute, "Make latency status=%d.\n", _status); 
  
  if (_status != Idle)
  {
    DPRINTF(CGRA_Execute, "Inside status idle.\n"); 
    schedule(tickEvent, curTick() + latency);
  }
  
  DPRINTF(CGRA_Execute, "Exiting schedule events\n"); 
} //CGRA_Execution

void AtomicCGRA::CGRA_advanceTime()
{
  CycleCounter++;

  if (CycleCounter%II==0)
  {
    CycleCounter = 0;
    for (unsigned i = 0; i < CGRA_XDim; i++)
      for (unsigned j = 0; j < CGRA_YDim; j++)
        cgra_PEs[i * CGRA_YDim + j].advanceTime();
  }
} //CGRA_Execution

void
AtomicCGRA::tick()
{
    // Change thread if multi-threaded
    swapActiveThread();

    // Set memroy request ids to current thread
    if (numThreads > 1) {
        ContextID cid = threadContexts[curThread]->contextId();

        ifetch_req->setContext(cid);
        data_read_req->setContext(cid);
        data_write_req->setContext(cid);
        data_amo_req->setContext(cid);
    }

    SimpleExecContext& t_info = *threadInfo[curThread];
    SimpleThread* thread = t_info.thread;

    Tick latency = 0;

    for (int i = 0; i < width || locked; ++i) {
        numCycles++;
	debugCycles++;
	DPRINTF(Cycles, "numCycles = %d\n", debugCycles);
	if(!is_CPU())
        {
	    cgraCycles++;
            updateCycleCounters(BaseCPU::CPU_STATE_ON);
        }

        if (!curStaticInst || !curStaticInst->isDelayedCommit()) {
            checkForInterrupts();
            checkPcEventQueue();
        }

        // We must have just got suspended by a PC event
        if (_status == Idle) {
            tryCompleteDrain();
            return;
        }

        Fault fault = NoFault;

        TheISA::PCState pcState = thread->pcState();

        bool needToFetch = !isRomMicroPC(pcState.microPC()) &&
                           !curMacroStaticInst;
        //if CGRA, reset memory instructions status
        if(!is_CPU())
        {
            /*  
              Mahesh:: Set Mem access during the initialization of CGRA constructor.
            */


            //MemBusStatus.reserve(CGRA_XDim); 
            //for (int i = 0; i < CGRA_XDim; i++)
              //MemBusStatus[i] = 0;

            MemAccessCount = 0;
            AccessCount = 0;
        }
        if (needToFetch) {
            ifetch_req->taskId(taskId());
            setupFetchRequest(ifetch_req);
            fault = thread->itb->translateAtomic(ifetch_req, thread->getTC(),
                                                 BaseTLB::Execute);
        }

        if (fault == NoFault) {
            icache_latency = 0;
            icache_access = false;
            dcache_access = false; // assume no dcache access

            if (needToFetch) {
                // This is commented out because the decoder would act like
                // a tiny cache otherwise. It wouldn't be flushed when needed
                // like the I cache. It should be flushed, and when that works
                // this code should be uncommented.
                //Fetch more instruction memory if necessary
                //if (decoder.needMoreBytes())
                icache_access = true;
                Packet ifetch_pkt = Packet(ifetch_req, MemCmd::ReadReq);

                if(is_CPU()) {
                    ifetch_pkt.dataStatic(&inst);
                    //DPRINTF(CGRA_Execute, "CPU1 is_CPU(): %lx\n", inst);
                }
                else
                    ifetch_pkt.dataStatic(CGRA_instructions);


                icache_latency = sendPacket(icachePort, &ifetch_pkt);

                assert(!ifetch_pkt.isError());

                    // ifetch_req is initialized to read the instruction directly
                    // into the CPU object's inst field.
                //}
            }
	}

        if (is_CPU()) {
	  //DPRINTF(SimpleCPU, "CGRA is_CPU().\n"); 
            //DPRINTF(CGRA, "inside isCPU reg: %d\n", (int) thread->readIntReg(11)); 
            preExecute();

            Tick stall_ticks = 0;
            if (curStaticInst) {
                fault = curStaticInst->execute(&t_info, traceData);

                // keep an instruction count
                if (fault == NoFault) {
                    countInst();
                    ppCommit->notify(std::make_pair(thread, curStaticInst));
                } else if (traceData) {
                    traceFault();
                }

                if (fault != NoFault &&
                    dynamic_pointer_cast<SyscallRetryFault>(fault)) {
                    // Retry execution of system calls after a delay.
                    // Prevents immediate re-execution since conditions which
                    // caused the retry are unlikely to change every tick.
                    stall_ticks += clockEdge(syscallRetryLatency) - curTick();
                }

                postExecute();
            }

            // @todo remove me after debugging with legion done
            if (curStaticInst && (!curStaticInst->isMicroop() ||
                        curStaticInst->isFirstMicroop()))
                instCnt++;

            if (simulate_inst_stalls && icache_access)
                stall_ticks += icache_latency;

            if (simulate_data_stalls && dcache_access)
                stall_ticks += dcache_latency;

            if (stall_ticks) {
                // the atomic cpu does its accounting in ticks, so
                // keep counting in ticks but round to the clock
                // period
                latency += divCeil(stall_ticks, clockPeriod()) *
                    clockPeriod();
            }
            if ((int) thread->readIntReg(11) == 17)
            {
                DPRINTF(CGRA,"********Deleting CGRA********\n");
                thread->setStatus(ThreadContext::Halted);
                suspendContext(0);
            }

            if ((int) thread->readIntReg(11) == 15)
            {
                DPRINTF(CGRA,"************************Setting UP the CGRA************\n");
                Setup_CGRA_Execution(thread);

                if(Prolog>0 || KernelCounter>0 || EPILog>0)
                {
                    Switch_To_CGRA();
                    DPRINTF(CGRA,"\nExecuting 1 CGRA Cycle.\n");
                    schedule(tickEvent, nextCycle());
                    DPRINTF(CGRA,"\nExiting 1 CGRA Cycle.\n");
                }
                else
                {
                    //CGRA execution over
                    Prepare_to_Switch_Back_to_CPU(thread);
                    Restore_CPU_Execution(thread);
                    thread->setIntReg(11, 16);
                    Switch_To_CPU();
                    DPRINTF(CGRA,"\nCALL IN ADVANCE INST TO CPU.\n");

                    if(fault != NoFault || !t_info.stayAtPC)
		      CGRA_advancePC(thread);

                    if (tryCompleteDrain())
                        return;

                    // instruction takes at least one cycle
                    if (latency < clockPeriod())
                        latency = clockPeriod();

                    if (_status != Idle)
                        reschedule(tickEvent, curTick() + latency, true);
                }
            }
            else {
                if (fault != NoFault || !t_info.stayAtPC)
                    advancePC(fault);
                if (tryCompleteDrain())
                    return;
                // instruction takes at least one cycle
                if (latency < clockPeriod())
                    latency = clockPeriod();

                if (_status != Idle)
                    reschedule(tickEvent, curTick() + latency, true);
            }
        }
        else {
            DPRINTF(CGRA_Execute, "Inside CGRA Execution else statement.\n"); 
            //CGRA EXECUTION
            if(Len==0)
            {
                if(state==EPI)
                    state=FINISH;
            }

            if(state==FINISH)
            {
                DPRINTF(CGRA,"************************PREPARING TO MOVE TO CPU************\n");
                Prepare_to_Switch_Back_to_CPU(thread);
            }
            //CGRA EXECUTION OVER
            if ((int) thread->readIntReg(8) == 66)
            {
                DPRINTF(CGRA,"newPC=%ld, II=%ld, EPILog=%ld, Prolog=%ld, Len=%ld\n", (long) newPC, (long) II, (long) EPILog, (long) Prolog, (long) Len);
                DPRINTF(CGRA,"**********************CGRA Execution is over**********************\n");
                Restore_CPU_Execution(thread);
                Switch_To_CPU();
                thread->setIntReg(11, 16);
                thread->setIntReg(8,  60);
                DPRINTF(CGRA,"******REG R11= %d*********\n",(int)thread->readIntReg(11));
                DPRINTF(CGRA,"AFTER COMPLETETION PC: %x\n",(unsigned long) thread->instAddr());
                for (int i = 0; i < CGRA_XDim; i++)
                    for (int j = 0; j < CGRA_YDim; j++)
                        cgra_PEs[i * CGRA_YDim + j].ClearRegfile();

                //If thread is not joined after CGRA Execution
                //and we need to continue from old PC of CGRA controller
                if(fault != NoFault || !t_info.stayAtPC)
                    advancePC(fault);

                if (tryCompleteDrain())
                    return;

                // instruction takes at least one cycle
                if (latency < clockPeriod())
                    latency = clockPeriod();

                if (_status != Idle)
                    reschedule(tickEvent, curTick() + latency, true);
            }
            else
            {
                DPRINTF(CGRA_Execute, "Inside CGRA_Execution block.\n"); 
                DPRINTF(CGRA_Detailed,"\nCALL IN NOW CGRA_Execution.\n");
                CGRA_Execution(t_info);
                DPRINTF(CGRA_Execute, "We are here after Execution\n");
            }
        }
    } //end of for loop
} // end of tick()

/*int AtomicCGRA::Position(int current, int i, int j)
{
  if(current == 0)
    return topleftcorner;
  else if(i == 0 && (j > 0 && j < CGRA_YDim-1))
    return toprow;
  else if(j == 0 && (i>0 && i<CGRA_XDim-1 ))
    return leftcol;
  else if(i ==0 && j == CGRA_YDim - 1)
    return toprightcorner;
  else if(j == CGRA_YDim -1 && (i>0 && i<CGRA_XDim-1) )
    return rightcol;
  else if(i == CGRA_XDim-1 && j == 0)
    return bottomleftcorner;
  else if(current == (CGRA_XDim * CGRA_YDim)-1)
    return bottomrightcorner;
  else if(i == CGRA_XDim-1 && (j>0 && j<CGRA_YDim-1))
    return bottomrow;
  else
    return regular;  
    }*/

    void AtomicCGRA::Setup_CGRA()
{

  DPRINTF(Setup_DEBUG, "Inside Setup_CGRA() with  %d x %d and RF %d\n", CGRA_XDim, CGRA_YDim, RFSize);
  //CGRA_instructions = new uint32_t[16]; //Shail: TODO Parameterize this
  CGRA_instructions = new uint64_t[CGRA_XDim * CGRA_YDim]; 
  //unknownRes = new uint64_t[16]; // Shail: TODO Parameterize this
  unknownRes = new uint64_t[CGRA_XDim * CGRA_YDim];
  written = 0;

  DPRINTF(Setup_DEBUG, "Passed the first initialization\n");
  //cgra_PEs.reserve(CGRA_XDim * CGRA_YDim); //set number of PEs.
  cgra_PEs = new CGRA_PE[CGRA_XDim * CGRA_YDim]; 

  //cgra_PEs = new CGRA_PE[CGRA_XDim * CGRA_YDim];

  DPRINTF(Setup_DEBUG, "Passed CGRA_PE initialization\n");

  //Setting Neighbors - Populate Output structures
  for (int i = 0; i < CGRA_XDim; i++)
  {
    for (int j = 0; j < CGRA_YDim; j++)
    {
      int current_PE = i * CGRA_YDim + j;
      //int current_position = Position(current_PE, i, j);
      int iIndex;
      int jIndex;
      if (i == 0)
      {
        iIndex = CGRA_XDim;
      }
      else
      {
        iIndex = i;
      }
      if (j == 0)
      {
        jIndex = CGRA_YDim;
      }
      else
      {
        jIndex = j;
      }

      DPRINTF(Setup_DEBUG, "Passed the for loop with RFSIZE: %d\n", RFSize);

      //Set regfile and fpregfilesize per PE
      if(RFSize > 0)
      {
        cgra_PEs[i * CGRA_YDim + j].setRF_per_PE(RFSize);  
        cgra_PEs[i * CGRA_YDim + j].setFPRF_per_PE(RFSize);
      }

      DPRINTF(Setup_DEBUG, "Passed the setting of RF \n"); 
      //set neighbors for PEs.
      //if(connection_type == Simple_Connection) 

      //{
        // Set Integer Neighbors
        cgra_PEs[current_PE].SetNeighbours(
            cgra_PEs[i * CGRA_YDim + ((jIndex - 1) % CGRA_YDim)].getOutputPtr(), //Left
            cgra_PEs[i * CGRA_YDim + ((jIndex + 1) % CGRA_YDim)].getOutputPtr(),	//Right
            cgra_PEs[(((iIndex - 1) % CGRA_XDim) * CGRA_YDim) + j].getOutputPtr(),	//Up
            cgra_PEs[(((iIndex + 1) % CGRA_XDim) * CGRA_YDim) + j].getOutputPtr());	//Down

        // Set Floating Point Neighbors
        cgra_PEs[current_PE].SetFPNeighbours(
            cgra_PEs[i * CGRA_YDim + ((jIndex - 1) % CGRA_YDim)].getFPOutputPtr(), //Left
            cgra_PEs[i * CGRA_YDim + ((jIndex + 1) % CGRA_YDim)].getFPOutputPtr(),  //Right
            cgra_PEs[(((iIndex - 1) % CGRA_XDim) * CGRA_YDim) + j].getFPOutputPtr(),  //Up
            cgra_PEs[(((iIndex + 1) % CGRA_XDim) * CGRA_YDim) + j].getFPOutputPtr()); //Down

        // Set Predicate Neighbors
        cgra_PEs[current_PE].SetPredNeighbours(
            cgra_PEs[i * CGRA_YDim + ((jIndex - 1) % CGRA_YDim)].getPredOutputPtr(), //Left
            cgra_PEs[i * CGRA_YDim + ((jIndex + 1) % CGRA_YDim)].getPredOutputPtr(),  //Right
            cgra_PEs[(((iIndex - 1) % CGRA_XDim) * CGRA_YDim) + j].getPredOutputPtr(),  //Up
            cgra_PEs[(((iIndex + 1) % CGRA_XDim) * CGRA_YDim) + j].getPredOutputPtr()); //Down
      //}
      /*else if(connection_type == Diagonal_Connection)
      {

        if(CGRA_XDim == CGRA_YDim)
        {
          cgra_PEs[current_PE].SetNeighbours(
              cgra_PEs[i * CGRA_YDim + ((jIndex - 1) % CGRA_YDim)].getOutputPtr(), //Left
              cgra_PEs[i * CGRA_YDim + ((jIndex + 1) % CGRA_YDim)].getOutputPtr(),  //Right
              cgra_PEs[(((iIndex - 1) % CGRA_XDim) * CGRA_YDim) + j].getOutputPtr(),  //Up
              cgra_PEs[(((iIndex + 1) % CGRA_XDim) * CGRA_YDim) + j].getOutputPtr()); //Down

          if(current_position == topleftcorner)
            cgra_PEs[current_PE].SetLTCornerDiagonal(
                cgra_PEs[current_PE + (CGRA_YDim+1)].getOutputPtr(),
                cgra_PEs[(CGRA_XDim * CGRA_YDim) -1].getOutputPtr());    
          else if(current_position == toprightcorner)
            cgra_PEs[current_PE].SetRTCornerDiagonal( 
                cgra_PEs[current_PE + CGRA_YDim - 1].getOutputPtr(),
                cgra_PEs[current_PE * CGRA_XDim].getOutputPtr()); 
          else if(current_position == toprow)
            cgra_PEs[current_PE].SetTopRowDiagonal(
                cgra_PEs[current_PE + (CGRA_YDim - 1)].getOutputPtr(),
                cgra_PEs[current_PE + (CGRA_YDim + 1)].getOutputPtr());
          else if(current_position == bottomrightcorner)  
            cgra_PEs[current_PE].SetRBCornerDiagonal(
                cgra_PEs[current_PE - (CGRA_YDim - 2)].getOutputPtr(),
                cgra_PEs[0].getOutputPtr());
          else if(current_position == rightcol)
            cgra_PEs[current_PE].SetRightColDiagonal(
                cgra_PEs[current_PE - CGRA_YDim + 1].getOutputPtr(),
                cgra_PEs[current_PE + CGRA_YDim - 1].getOutputPtr());
          else if(current_position == bottomleftcorner)
            cgra_PEs[current_PE].SetLBCornerDiagonal(
                cgra_PEs[current_PE/CGRA_XDim].getOutputPtr(),
                cgra_PEs[current_PE - CGRA_YDim - 1].getOutputPtr()); 
          else if(current_position == bottomrow)
            cgra_PEs[current_PE].SetBottomRowDiagonal(
                cgra_PEs[current_PE - CGRA_YDim - 1].getOutputPtr(),
                cgra_PEs[current_PE - CGRA_YDim + 1].getOutputPtr());
          else if(current_position == leftcol)
            cgra_PEs[current_PE].SetLeftColDiagonal(
                cgra_PEs[current_PE - CGRA_YDim - 1].getOutputPtr(),
                cgra_PEs[current_PE + CGRA_YDim + 1].getOutputPtr());
          else if(current_position == regular)
            cgra_PEs[current_PE].SetRegularDiagonal(
                cgra_PEs[current_PE - CGRA_YDim - 1].getOutputPtr(),
                cgra_PEs[current_PE - CGRA_YDim + 1].getOutputPtr(),
                cgra_PEs[current_PE + CGRA_YDim - 1].getOutputPtr(),
                cgra_PEs[current_PE + CGRA_YDim + 1].getOutputPtr());
        }
        else
        {
          cgra_PEs[current_PE].SetNeighbours(
              cgra_PEs[i * CGRA_YDim + ((jIndex - 1) % CGRA_YDim)].getOutputPtr(), //Left
              cgra_PEs[i * CGRA_YDim + ((jIndex + 1) % CGRA_YDim)].getOutputPtr(),  //Right
              cgra_PEs[(((iIndex - 1) % CGRA_XDim) * CGRA_YDim) + j].getOutputPtr(),  //Up
              cgra_PEs[(((iIndex + 1) % CGRA_XDim) * CGRA_YDim) + j].getOutputPtr()); //Down  
        }



      }
      else if(connection_type == Hop_Connection)
      {
        cgra_PEs[current_PE].SetNeighbours(
            cgra_PEs[i * CGRA_YDim + ((jIndex - 1) % CGRA_YDim)].getOutputPtr(), //Left
            cgra_PEs[i * CGRA_YDim + ((jIndex + 1) % CGRA_YDim)].getOutputPtr(),  //Right
            cgra_PEs[(((iIndex - 1) % CGRA_XDim) * CGRA_YDim) + j].getOutputPtr(),  //Up
            cgra_PEs[(((iIndex + 1) % CGRA_XDim) * CGRA_YDim) + j].getOutputPtr()); //Down

        cgra_PEs[current_PE].SetHopNeighbors(
            cgra_PEs[i * CGRA_YDim + ((jIndex - 2) % CGRA_YDim)].getOutputPtr(),
            cgra_PEs[i * CGRA_YDim + ((jIndex + 2) % CGRA_YDim)].getOutputPtr(),
            cgra_PEs[(((iIndex - 2) % CGRA_XDim) * CGRA_YDim) + j].getOutputPtr(),
            cgra_PEs[(((iIndex + 2) % CGRA_XDim) * CGRA_YDim) + j].getOutputPtr());

      }
      else if(connection_type == Only_Hop_Connection)
      {
        cgra_PEs[current_PE].SetHopNeighbors(
            cgra_PEs[i * CGRA_YDim + ((jIndex - 2) % CGRA_YDim)].getOutputPtr(),
            cgra_PEs[i * CGRA_YDim + ((jIndex + 2) % CGRA_YDim)].getOutputPtr(),
            cgra_PEs[(((iIndex - 2) % CGRA_XDim) * CGRA_YDim) + j].getOutputPtr(),
            cgra_PEs[(((iIndex + 2) % CGRA_XDim) * CGRA_YDim) + j].getOutputPtr());
      }*/
      DPRINTF(Setup_DEBUG, "Passed the setting of neighbors \n");
      cgra_PEs[i * CGRA_YDim + j].setFDataBus((&FMemData[i]));
      cgra_PEs[i * CGRA_YDim + j].setDataBus(&MemData[i]); 
      cgra_PEs[i * CGRA_YDim + j].setDatatypeBus(&MemBusDatatype[i]);
      DPRINTF(Setup_DEBUG, "Passed the settin data bus\n");
      cgra_PEs[i * CGRA_YDim + j].setAddressBus((uint64_t *)(&MemAddress[i]));
      DPRINTF(Setup_DEBUG, "Passed the settin addr bus\n");
      cgra_PEs[i * CGRA_YDim + j].setRWStatusBus((int*)(&MemBusStatus[i]));
      DPRINTF(Setup_DEBUG, "Passed the settin mem bus\n");
      cgra_PEs[i * CGRA_YDim + j].setAlignmentBus((unsigned*)(&MemAccessAlignment[i]));
      DPRINTF(Setup_DEBUG, "Passed the settin mem alignment bus\n");
      cgra_PEs[i * CGRA_YDim + j].SetController_Reg();//
      DPRINTF(Setup_DEBUG, "Passed the settin control reg\n");
      cgra_PEs[i * CGRA_YDim + j].ClearRegfile();
      DPRINTF(Setup_DEBUG, "Passed the setting of clear reg\n");
    }
  }
  DPRINTF(Setup_DEBUG, "Leaving Setup_CGRA\n");
}

void AtomicCGRA::Setup_CGRA_Parameters()
{
  // Setting up controller
  std::ostringstream osLoopID;
  osLoopID << TotalLoops;

  ifstream execLoop;
  execLoop.open("./CGRAExec/LoopID.txt");
  std::string loopID;
  execLoop >> loopID;
  
  std::string directoryPath = "./CGRAExec/" + loopID + "/initCGRA.txt";

  unsigned long temp;
  ifstream initCGRAFile;
  initCGRAFile.open(directoryPath.c_str());

  initCGRAFile >> temp;
  initCGRAFile >> temp;

  initCGRAFile >> II;
  initCGRAFile >> EPILog;
  initCGRAFile >> Prolog;
  initCGRAFile >> KernelCounter;
  initCGRAFile >> LiveVar_St_Epilog;

  initCGRAFile >> EPILogPC;
  initCGRAFile >> PROLogPC;
  initCGRAFile >> KernelPC;
  initCGRAFile.close();

  DPRINTF(CGRA,"Loop count is %d\n",KernelCounter);
  DPRINTF(CGRA,"Epilog Length is %d\n",EPILog);
  DPRINTF(CGRA,"LiveVar_St_Epilog Length is %d\n",LiveVar_St_Epilog);
  DPRINTF(CGRA,"II is %d\n",II);
  int epilog_count = (int) ceil((float) ((EPILog-LiveVar_St_Epilog)/II));
  int prolog_count = 1;
  DPRINTF(CGRA,"Epilog count is  %d\n",epilog_count);
  DPRINTF(CGRA,"Prolog count is  %d\n",prolog_count);
  DPRINTF(CGRA,"Kernel Counter is  %d\n",KernelCounter);
  DPRINTF(CGRA, "Prolog PC is %lx\n,", PROLogPC); 
  DPRINTF(CGRA, "Kernel PC is %lx\n", KernelPC);
  DPRINTF(CGRA, "Epilog PC is %lx\n", EPILogPC);

  newPC=PROLogPC;
  Len=Prolog;
  state=PRO;
  CycleCounter = 0;
  Conditional_Reg = true;

  if(KernelCounter <= 0) isTCdynamic = true;

  DPRINTF(CGRA,"CGRA PARAMETERS: PROLOG= %d, EPILOG=%d, II=%d, KernelCounter=%d\n",Prolog,EPILog,II,KernelCounter);
  DPRINTF(CGRA_Execute,"CGRA PARAMETERS: PROLOG= %d, EPILOG=%d, II=%d, KernelCounter=%d TCdynamic=%d\n",Prolog,EPILog,II,KernelCounter,isTCdynamic);
  DPRINTF(CGRA,"CGRA PARAMETERS: PROLOGPC= %lx, EPILOGPC=%lx,  KernelPC=%lx\n",(unsigned int)PROLogPC,(unsigned int)EPILogPC,(unsigned int)KernelPC);
  DPRINTF(CGRA_Execute,"CGRA PARAMETERS: PROLOGPC= %lx, EPILOGPC=%lx,  KernelPC=%lx\n",(unsigned int)PROLogPC,(unsigned int)EPILogPC,(unsigned int)KernelPC);
}

void AtomicCGRA::Setup_CGRA_Execution(SimpleThread* thread)
{
  DPRINTF(CGRA,"Inside Setup_CGRA_Execution\n");
  DPRINTF(CGRA,"CGRA: OLD PC: %x\n",(unsigned int) thread->instAddr());
  //DPRINTF(Instruction_print, "CGRA: OLD PC: %x\n",(unsigned long) tc->instAddr());
  Setup_CGRA_Parameters();
  DPRINTF(CGRA,"CGRA PC : %x\n",(unsigned int)newPC);
  DPRINTF(CGRA,"**********************CGRA Execution is started**************************** \n");
  backPC = thread->pcState();
  thread->pcState((Addr) newPC);
}

void AtomicCGRA::Prepare_to_Switch_Back_to_CPU(SimpleThread* thread)
{
  thread->setIntReg(11, 16);
  //make sure to go back to actual  processor state
  thread->setIntReg(8, 66);
  //make sure that you reset the state of the core to make sure it will fetch afterward
  _status = BaseCGRA::Running;
}

void AtomicCGRA::Restore_CPU_Execution(SimpleThread* thread)
{
  thread->pcState(backPC);
}

void AtomicCGRA::Switch_To_CPU()
{
  CGRA_Mode = 0;
}

void AtomicCGRA::Switch_To_CGRA()
{
  CGRA_Mode = 1;
}

bool AtomicCGRA::is_CPU()
{
  return (CGRA_Mode==0);
}


void AtomicCGRA::setupFetchRequest(const RequestPtr &req)
{
  BaseCGRA::setupFetchRequest(req);
  //IF CGRA, FETCH 64 BYTES OF INSTRUCTIONS (X*Y* (size of long))
  if (!is_CPU())
  { //Shail: Parameterize this
    req->setSize(sizeof(unsigned long)*(CGRA_XDim*CGRA_YDim));
  }
}

void AtomicCGRA::CGRA_advancePC(SimpleThread* thread)
{
  DPRINTF(CGRA_Detailed,"*******IN ADVANCE PC******\n");
  //DPRINTF(Instruction_print,"*******IN ADVANCE PC******\n");
  DPRINTF(CGRA_Detailed,"%s,%s,%d,PC:%x\n",
      __FILE__,__func__,__LINE__,(unsigned int) thread->instAddr());
  //DPRINTF(Instruction_print,"%s,%s,%d,PC:%x\n",
   //   __FILE__,__func__,__LINE__,(unsigned int) tc->instAddr());
  //DPRINTF(Instruction_print, "newPC before: %lx\n", (long)newPC) ;
 
  if(Len==0)
  {
    if(state==PRO)
    {
      DPRINTF(CGRA_Detailed,"\nPROLOG->KERNEL\n");
       DPRINTF(Instruction_print,"\nPROLOG->KERNEL\n");
      state=KERN;
      newPC=KernelPC;
      Len=II;
      Conditional_Reg=1;
    }
    else if(state==KERN)
    {
      if(Conditional_Reg)
      {
        Len=II;
        newPC=KernelPC;
      }
      else
      {
        DPRINTF(CGRA_Detailed,"\nKERNEL->EPILOG\n");
        DPRINTF(Instruction_print,"\nKERNEL->EPILOG\n");
        state=EPI;
        newPC=EPILogPC;
        Len=EPILog;
      }
    }
  }
  else
  { 
    //DPRINTF(Instruction_print, "newPC: %lx\n", newPC) ;
    //DPRINTF(Instruction_print, "size of long: %ld\t size of unsigned long: %ld\n", sizeof(long), sizeof(unsigned long));
    //exit(1); 
    newPC+=(sizeof(long))*(CGRA_XDim*CGRA_YDim); //Shail: Parameterize this
  }

  thread->pcState((Addr) newPC);
}

void
AtomicCGRA::regProbePoints()
{
    BaseCPU::regProbePoints();

    ppCommit = new ProbePointArg<pair<SimpleThread*, const StaticInstPtr>>
                                (getProbeManager(), "Commit");
}

void
AtomicCGRA::printAddr(Addr a)
{
    dcachePort.printAddr(a);
}

void AtomicCGRA::completeDrain(){
  setDrainState(DrainState::Drained);
  signalDrainDone();
}

////////////////////////////////////////////////////////////////////////
//
//  AtomicCGRA Simulation Object
//
//  AtomicCGRA Simulation Object
AtomicCGRA * AtomicCGRAParams::create()
{
  numThreads = 1;

  if (!FullSystem && workload.size() != 1)
    panic("only one workload allowed");


  return new AtomicCGRA(this);
}
