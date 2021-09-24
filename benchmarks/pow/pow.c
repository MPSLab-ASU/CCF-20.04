#include <stdio.h>
#include <stdlib.h>

/*int power(int base, int pow){
  if(pow == 0) return 1;
  printf("Base = %d - Pow = %d\n", base, pow);
  int ret = base;
  #pragma CGRA
  for(int i = 1; i < pow - 1; i++)
    ret *= base;
    return ret;
    }*/

int main(int argc, char *argv[])
{
  int pow = atoi(argv[1]);
  int ret = 1;
  //int ret = sum(pow);

  #pragma CGRA
  for(int i = 1; i < pow; i++)
    ret *= 2;
  
  printf("***** %d^%d = %d *****\n", 2, pow, ret);

}
