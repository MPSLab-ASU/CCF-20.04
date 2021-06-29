#include <stdio.h>
#include <stdlib.h>

int pow(int base, int pow){
  if(pow == 0) return 1;
  int ret = base;
  //#pragma CGRA
  for(int i = 0; i < pow; i++)
    ret *= base;
  return ret;
}

int power(int base, int pow){
  if(pow == 0) return 1;
  
  int ret = base;
  #pragma CGRA
  for(int i = 0; i < pow -1; i++)
    ret *= base;
  return ret;
}

int bin_2_dec(char* bin, int len){  // takes in characters of binary, 1st index = most significant          
  int ret = 0;
  for(int i=len-1; i>=0; i--)
    ret += (bin[len-i-1] == '1')? power(2, i):0;
  
  return ret;
}

int main(int argc, char *argv[])
{

  /*int iterations = atoi(argv[1]); 

  int a=30, b=3, result = 0; 
  int c = 0;
  
  //char d = 'W', e;
  int i; 

  #pragma CGRA
  for(i=0;i<iterations; i++)
  {
    if(i<5)
      c += a+b;
    result++;
  }

  //printf("Address: %x\n", &result);
  printf("iterations:%d\t, c:%d, result:%d\n", iterations, c , result);*/

  int mode = atoi(argv[1])/100;
  printf("Mode = %d\n", mode);
  
  if(mode == 1){
    printf("Bin to dec mode\n");
    int len = atoi(argv[1]) - 100;
    printf("Len = %d\n", len);
    char bin[] = "1000011001111001";
    unsigned dec = bin_2_dec(bin, len);
    /*unsigned dec = 0;
    //#pragma CGRA
    for(int i=len-1; i>0; i--)
      dec += (bin[len-i-1] == '1')? pow(2, i):0;
    */
    printf("1000011001111001 = %d\n", dec);
    
  } else if(mode != 0){
    printf("Power mode\n");
    int p = atoi(argv[1]) - mode*100;

    /*int ret = 0;
    if(pow == 0) ret = 1;
    else{
      ret = 2;
      //#pragma CGRA
      for(int i = 0; i < pow -1; i++)
	ret *= 2;
	}*/

    int ret = power(2, p);
    
    printf("***** 2^%d = %d *****\n", p, ret);
  }

}
