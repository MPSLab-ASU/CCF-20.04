// Author: Shail Dave

#ifndef _CGRA_H
#define _CGRA_H

#include <assert.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define activate_CGRA 15
#define stop_CGRA 16
#define deactivate_CGRA 17
#define CPU_idle  71

void accelerateOnCGRA(unsigned int loopNo);
int setupAndExecuteCGRA(unsigned int loopNo);
int initializeParameters(unsigned int loopID);
int configureCGRA(unsigned int loopID);
void* runOnCGRA(void);
void deleteCGRA(); 

unsigned long *prolog,*epilog,*kernel;
unsigned int *ArrPtr;

unsigned long * prologPtr, *kernelPtr, *epilogPtr;

int *initCGRA;
unsigned totalLoops=0;

pthread_t pth;
static unsigned int thread_cond_cpu = 1;
static unsigned int thread_cond_cgra = 0;
static unsigned int thread_exit = 0;

int dynamicTCVal = 0;
#endif /* EXEC_CGRA_ */
