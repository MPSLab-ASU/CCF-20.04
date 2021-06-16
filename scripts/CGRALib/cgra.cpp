// Author: Shail Dave

#include "cgracpp.h"
#include <string.h>
#include <limits.h>
#include <iostream>

int initializeParameters(unsigned int loopID)
{

  //printf("from cgra.c Initialize Parameters\n"); 
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

  //Make some error checking for fopen and fread
  epi=fopen(epifile,"rb");
  pro=fopen(profile,"rb");
  kern=fopen(kernfile,"rb");

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
  
  strcat(configfile,directoryPath);
  strcat(configfile,"/CGRA_config.txt");
  config=fopen(configfile,"r");

  char line[256];
  int XDim, YDim;
  while(fgets(line, sizeof(line), config))
  {
    count++;
    if(count==1)
      XDim = atoi(line);
    else if(count==2)
      YDim = atoi(line);
    else
      break;
  } 

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
  //printf("Entering cgra.c configureCGRA\n");
  unsigned int i=0;
  int kernelCount = *(initCGRA + 7*(loopID-1) + 5);
  FILE* count;
  char loopno[25];
  char directoryPath[20] = "./CGRAExec/L";
  
  sprintf(loopno,"%d",loopID);
  strcat(directoryPath,loopno);

  if(kernelCount <= 0)
  {
    int newTC = kernelCount + dynamicTCVal;
    *(initCGRA + 7*(loopID-1) + 5) = newTC; 
  }

  char initCGRAfile[40] = "./CGRAExec/L1";
  strcat(initCGRAfile,"/initCGRA.txt");
  count = fopen(initCGRAfile, "wb");
  for(i=0; i<7; i++)
    fprintf(count, "%d\n", *(initCGRA + 7*(loopID-1) + i));
  fprintf(count, "%ld\n", (unsigned long long) epilogPtr[loopID-1]);
  fprintf(count, "%ld\n", (unsigned long long) prologPtr[loopID-1]);
  fprintf(count, "%ld\n", (unsigned long long) kernelPtr[loopID-1]);
  fclose(count);
  
  //printf("Exiting cgra.c configureCGRA\n");	
  return 0;
}

void checkTotalLoops( )
{
    //printf("Entering cgra.c checkTotalLoops\n");
    char myfile[40] = "./CGRAExec/total_loops.txt";
    FILE* count;
    count = fopen(myfile, "r");
    fscanf(count, "%u", &totalLoops);
    fclose(count);
    //printf("Exiiting cgra.c checkTotalLoops\n");

}

void* runOnCGRA(void* arg)
{
   //printf("Entering cgra.c runOnCGRA\n");
    while(1) {
        while(thread_cond_cgra != 1) usleep(1);
	
        if(thread_exit == 1) { 
 	    asm("mov r11,%[value]" : :[value]"r" (deactivate_CGRA):); 
	    break; 
        }
	
	thread_cond_cgra = 0;
	asm("mov r11,%[value]" : :[value]"r" (activate_CGRA):); 
	usleep(1);
	thread_cond_cpu = 1;
    }
  //printf("Entering cgra.c runOnCGRA\n");
  return NULL;
}

void accelerateOnCGRA(unsigned int loopNo)
{
    //printf("Entering cgra.c accelerateOnCGRA\n");
    int result = 0; 
   
    int configure = configureCGRA(loopNo);
    if(configure == -1)
    {
      printf("Error in configuring CGRA:\n");
    }
    printf("Core will execute loop %u on CGRA\n",loopNo); 

    thread_cond_cpu = 0;
    thread_cond_cgra = 1;

    while(thread_cond_cpu != 1) usleep(1);
  
    //printf("Exiting Accelerate on CGRA\n"); 
}

void deleteCGRA()
{
  //printf("deleting cgra\n");

  thread_exit = 1;
  thread_cond_cgra = 1;

  printf("Main thread calling join w/ CGRA thread\n");
  pthread_join(pth, NULL); 
 // printf("Exiting cgra.c deleteCGRA\n"); 
}


void createCGRA()
{
  //printf("Entering cgra.c createCGRA\n");
  int result = 0;
  unsigned i=1;

  checkTotalLoops();
  initCGRA  = (int *)malloc(sizeof(int)*7*totalLoops);
  prologPtr = (unsigned long long *)malloc(sizeof(unsigned long long)*totalLoops);
  kernelPtr = (unsigned long long *)malloc(sizeof(unsigned long long)*totalLoops);
  epilogPtr = (unsigned long long *)malloc(sizeof(unsigned long long)*totalLoops);


  for(i = 1; i <= totalLoops; i++)
      initializeParameters(i);

  printf("Main thread calling CGRA thread...\n");
  asm("mov r8,%[value]" : :[value]"r" (CPU_idle):);
  result = pthread_create(&pth, NULL, runOnCGRA, NULL); 
  //printf("Exiting cgra.c createCGRA\n");
}
