// Author: Shail Dave

#include "cgra.h"
#include <string.h>
#include <limits.h>
#ifdef __cplusplus
#include <iostream>
#endif

#define DEBUG 1

//#define usleep(time)  myusleep(time)

//pthread_mutex_t mutex;
int initializeParameters(unsigned int loopID)
{

  if(DEBUG) printf("from cgra.c Initialize Parameters\n"); 
  unsigned int i=0;

  *(initCGRA + 7*(loopID-1)) = 0x77e00000;
  *(initCGRA + 7*(loopID-1) + 1) = 0x77e00000; //1st instruction, 0xe7e00000 is the opcode for no operation
  *(initCGRA + 7*(loopID-1) + 2) = 0;	//II
  *(initCGRA + 7*(loopID-1) + 3) = 0;	//Epilog length
  *(initCGRA + 7*(loopID-1) + 4) = 0;	//Prolog length
  *(initCGRA + 7*(loopID-1) + 5) = 0;  //KERNEL COUNTER
  *(initCGRA + 7*(loopID-1) + 6) = 0;	//Live-Variable Store Epilog Lenth

  FILE* epi,*pro,*kern, *count, *config;
  char loopno[25];
  char directoryPath[20] = "./CGRAExec/L";

  sprintf(loopno,"%d",loopID);
  strcat(directoryPath,loopno);

  char epifile[40] = "";
  char profile[40] = "";
  char kernfile[40] = "";
  char liveOutfile[40] = "";
  char configfile[40] = ""; 

  strcat(epifile,directoryPath);
  strcat(epifile,"/epilog_ins.bin");

  strcat(profile,directoryPath);
  strcat(profile,"/prolog_ins.bin");

  strcat(kernfile,directoryPath);
  strcat(kernfile,"/kernel_ins.bin");

  strcat(configfile,directoryPath);
  strcat(configfile,"/CGRA_config.txt");
  //Make some error checking for fopen and fread
  epi=fopen(epifile,"rb");
  pro=fopen(profile,"rb");
  kern=fopen(kernfile,"rb");
  config=fopen(configfile, "r");

  int episize,prosize,kernelsize, livevar_st_size;

  fread(&episize,sizeof(int),1,epi);
  fread(&prosize,sizeof(int),1,pro);
  fread(&kernelsize,sizeof(int),1,kern);

  printf("\n**********EPISIZE %d*********\n",episize);
  printf("\n**********PROSIZE %d*********\n",prosize);
  printf("\n**********KERNSIZE %d*********\n",kernelsize);
  printf("\n******SIZE OF UNSIGNED LONG%d*****\n",sizeof(unsigned long));
  printf("\n******SIZE OF UNSIGNED LONG LONG%d*****\n",sizeof(unsigned long long));  

  epilog=(unsigned long long*)malloc(episize*sizeof(unsigned long long));
  prolog=(unsigned long long*)malloc(prosize*sizeof(unsigned long long));
  kernel=(unsigned long long*)malloc(kernelsize*sizeof(unsigned long long));

  fread(epilog,sizeof(unsigned long long),episize,epi);
  fread(prolog,sizeof(unsigned long long),prosize,pro);
  fread(kernel,sizeof(unsigned long long),kernelsize,kern);

  strcat(liveOutfile,directoryPath);
  strcat(liveOutfile,"/livevar_st_ins_count.txt");
  count=fopen(liveOutfile,"r");
  fscanf(count, "%d", &livevar_st_size);

  char line[256];
  int XDim=0, YDim=0;
  int iter=0; 
  printf("\n*******************before while loop**************\n");
  while(fgets(line, sizeof(line), config))
  {
    iter++;
    if(iter==1)
      XDim = atoi(line);
    else if(iter==2)
      YDim = atoi(line);
    else
      break;
  }

  printf("\n************XDIM and YDim are %d, %d\n", XDim, YDim);
  int II = kernelsize/(XDim*YDim);
  int epiLength = episize/(XDim*YDim);
  int prolength = prosize/(XDim*YDim);
  *(initCGRA + 7*(loopID-1) + 2) = II;
  *(initCGRA + 7*(loopID-1) + 3) = epiLength;
  *(initCGRA + 7*(loopID-1) + 4) = prolength;
  *(initCGRA + 7*(loopID-1) + 6) = livevar_st_size/(XDim*YDim);

  fclose(epi);
  fclose(pro);
  fclose(kern);
  fclose(count);
  fclose(config);

  char loopitfile[40] = "";
  strcat(loopitfile,directoryPath);
  strcat(loopitfile,"/kernel_count.txt");

  int kernelCount = 0;
  count=fopen(loopitfile,"r");
  fscanf(count, "%d", &kernelCount);
  fclose(count);
  printf("Loop Count: %d\n",kernelCount);

  *(initCGRA + 7*(loopID-1) + 5) = kernelCount; 

  printf("From FILE: PROLOGPC= %lx, EPILOGPC=%lx,  KernelPC=%lx\n",(unsigned long)prolog,(unsigned long)epilog,(unsigned long)kernel);

  prologPtr[loopID-1] = (unsigned long long) prolog;
  epilogPtr[loopID-1] = (unsigned long long) epilog;
  kernelPtr[loopID-1] = (unsigned long long) kernel;
  //printf("Exiting cgra.c Initialize Parameters\n");
	
  return 0;
}

int configureCGRA(unsigned int loopID)
{
  if(DEBUG) printf("configureCGRA\n");
  unsigned int i=0;
  int kernelCount = *(initCGRA + 7*(loopID-1) + 5);
  FILE* count;
  char loopno[25];
  char directoryPath[20] = "./CGRAExec/L";
  
  sprintf(loopno,"%d",loopID);
  strcat(directoryPath,loopno);
  if(DEBUG) printf("\nloopno = %s\n", loopno);

  if(kernelCount <= 0)
  {
    int newTC = kernelCount + dynamicTCVal;
    printf("newTC = %d + %d\n", kernelCount, dynamicTCVal);
    *(initCGRA + 7*(loopID-1) + 5) = newTC; 
  }

  //char initCGRAfile[40] = "./CGRAExec/L1";
  //strcat(initCGRAfile,"/initCGRA.txt");
  //count = fopen(initCGRAfile, "wb");
  strcat(directoryPath,"/initCGRA.txt");
  count = fopen(directoryPath, "wb");
  
  for(i=0; i<7; i++)
    fprintf(count, "%d\n", *(initCGRA + 7*(loopID-1) + i));
  fprintf(count, "%ld\n", (unsigned long long) epilogPtr[loopID-1]);
  fprintf(count, "%ld\n", (unsigned long long) prologPtr[loopID-1]);
  fprintf(count, "%ld\n", (unsigned long long) kernelPtr[loopID-1]);
  fclose(count);

  FILE* execLoop = fopen("./CGRAExec/LoopID.txt", "wb");
  fprintf(execLoop, "L%d", loopID);
  fclose(execLoop);
  
  //printf("Exiting cgra.c configureCGRA\n");	
  return 0;
}

void checkTotalLoops( )
{
    if(DEBUG) printf("checkTotalLoops\n");
    char myfile[40] = "./CGRAExec/total_loops.txt";
    FILE* count;
    count = fopen(myfile, "r");
    fscanf(count, "%u", &totalLoops);
    fclose(count);
}


void* runOnCGRA(void)
{
    printf("\n\nrunOnCGRA\n");
    asm("mov r11,%[value]" : :[value]"r" (activate_CGRA):);
    return NULL;
}

void accelerateOnCGRA(unsigned int loopNo)
{
    printf("\n\naccelerateOnCGRA\n");
    int result = 0; 
    //loopNo = 1;
    int initializeloop = initializeParameters(loopNo);
    int configure = configureCGRA(loopNo);
    //if(DEBUG) printf("configure = %d, loopNo = %d\n", configure, loopNo);
    if(configure == -1)
    {
      	printf("Error in configuring CGRA:\n");
    }
    printf("Core will execute loop %u on CGRA\n",loopNo); 

    //    thread_cond_cpu = 0;
    //thread_cond_cgra = 1;

    runOnCGRA();
    //while(thread_cond_cpu != 1) {
//	usleep(1);
  //  }
    
    //printf("Exiting Accelerate on CGRA\n"); 
}

void deleteCGRA()
{
  printf("\ndeleting cgra\n");
  /*
  thread_exit = 1;
  thread_cond_cgra = 1;

  printf("Main thread calling join w/ CGRA thread\n");
  //pthread_join(pth, NULL); 
  //printf("Exiting cgra.c deleteCGRA\n"); */
}


void createCGRA()
{
  if(DEBUG) printf("createCGRA\n");
  int result = 0;
  unsigned i=1;
  
  checkTotalLoops();
  initCGRA  = (int *)malloc(sizeof(int)*7*totalLoops);
  prologPtr = (int *)malloc(sizeof(int)*totalLoops);
  kernelPtr = (int *)malloc(sizeof(int)*totalLoops);
  epilogPtr = (int *)malloc(sizeof(int)*totalLoops);

  //pthread_mutex_init(&mutex, NULL);
  //pthread_mutex_lock(&mutex);
  //result = pthread_create(&pth, NULL, (void*) &runOnCGRA, NULL);

  //for(i = 1; i <= totalLoops; i++)
  //{
  //    initializeParameters(i);
  //}
    
  //pthread_mutex_init(&mutex, NULL);
  printf("Main thread calling CGRA thread...\n");
  //asm("mov r8,%[value]" : :[value]"r" (CPU_idle):);

  //printf("ASM CPU_IDLE Instruction completed\n");
  //result = pthread_create(&pth, NULL, (void*) &runOnCGRA, NULL); 
  //printf("\n\nresult = %d\n\n", result);
  //fflush(NULL);
}
