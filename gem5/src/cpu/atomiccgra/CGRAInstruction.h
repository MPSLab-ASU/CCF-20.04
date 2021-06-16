/*
 * Instruction.h
 *
 * Created on: May 24, 2011
 * Author: mahdi
 *
 * edited: 24 May 2017
 * Auhtor: Shail Dave
 */

#ifndef INSTRUCTION_H_
#define INSTRUCTION_H_

#include "CGRAdefinitions.h"

class CGRA_Instruction
{
public:
	CGRA_Instruction();
	CGRA_Instruction(unsigned long InstructionWord);
	CGRA_Instruction(Datatype DType,OPCode opc,bool predic,PEInputMux LMuxSel,PEInputMux RMuxSel,\
			int RRegAdd1,int RRegAdd2, int WAdd, bool WE, int ImmVal, bool EDMAdd, bool DMData);

	virtual ~CGRA_Instruction();
  
  unsigned long getInsWord();
	void decode_CGRA_Instruction();

  Datatype getDatatype();
	OPCode getOpCode();
	bool getPredicator();
	PEInputMux getLeftMuxSelector();
	PEInputMux getRightMuxSelector();
	int getReadRegAddress1();
	int getReadRegAddress2();
	int getWriteRegAddress();
	bool getWriteRegisterEnable();
	int getImmediateValue();
	bool getSelectDataMemoryAddressBus();
	bool getSelectDataMemoryDataBus();

	void ENCODE_instruction();

	unsigned long getOpCode_DECODE();
	unsigned long getPredicator_DECODE();
	unsigned long getLeftMuxSelector_DECODE();
	unsigned long getRightMuxSelector_DECODE();
	unsigned long getReadRegAddress1_DECODE();
	unsigned long getReadRegAddress2_DECODE();
	unsigned long getWriteRegAddress_DECODE();
	unsigned long getWriteRegisterEnable_DECODE();
	unsigned long getImmediateValue_DECODE();
	unsigned long getSelectDataMemoryAddressBus_DECODE();
	unsigned long getSelectDataMemoryDataBus_DECODE();

	unsigned long DecodeInstruction(CGRA_Instruction* Ins);

private:
  Datatype DType;
	OPCode opCode;
	bool Predicator;
	PEInputMux LeftMuxSelector;
	PEInputMux RightMuxSelector;
	int ReadRegAddress1;
	int ReadRegAddress2;
	int WriteRegAddress;
	bool WriteRegisterEnable;
	int ImmediateValue;
	bool SelectDataMemoryAddressBus;
	bool SelectDataMemoryDataBus;

	unsigned long InsWord;
};

class Pred_Instruction
{
public:
	Pred_Instruction();
	Pred_Instruction(unsigned long InstructionWord);
	Pred_Instruction(Datatype DType,PredOPCode popc,PEInputMux LMuxSel,PEInputMux RMuxSel,PEInputMux PMuxSel,\
			int RRegAdd1,int RRegAdd2, int RRegAddP, int ImmVal);

	virtual ~Pred_Instruction();

  Datatype getDatatype();
	PredOPCode getPredOpCode();
	PEInputMux getLeftMuxSelector();
	PEInputMux getRightMuxSelector();
	PEInputMux getPredMuxSelector();
	int getReadRegAddress1();
	int getReadRegAddress2();
	int getReadRegAddressP();
	int getImmediateValue();

	void ENCODE_Pred_instruction();

	unsigned long getPredOpCode_DECODE();
	unsigned long getPredicator_DECODE();
	unsigned long getLeftMuxSelector_DECODE();
	unsigned long getRightMuxSelector_DECODE();
	unsigned long getPredMuxSelector_DECODE();
	unsigned long getReadRegAddress1_DECODE();
	unsigned long getReadRegAddress2_DECODE();
	unsigned long getReadRegAddressP_DECODE();
	unsigned long getImmediateValue_DECODE();

	unsigned long DecodePredInstruction(Pred_Instruction* Ins);

private:
  Datatype DType;
	PredOPCode popCode;
	PEInputMux LeftMuxSelector;
	PEInputMux RightMuxSelector;
	PEInputMux PredMuxSelector;
	int ReadRegAddress1;
	int ReadRegAddress2;
	int ReadRegAddressP;
	int ImmediateValue;

	unsigned long PredInsWord;
};

#endif /* INSTRUCTION_H_ */
