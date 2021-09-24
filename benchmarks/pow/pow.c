#include <stdio.h>
#include <stdlib.h>

<<<<<<< HEAD
=======
/*int sum(int count){                                                                                                                              
  int ret=0;
  //int vec[10] = {1,2,3,4,5,6,7,8,9,10};
  
  #pragma CGRA 
  for(int i=0; i<count; i++)
    ret += i;

  return ret;
  }*/

>>>>>>> 5f2c8bc0fcd0b4b59a263992775796f8c7c9371d
/*int power(int base, int pow){
  if(pow == 0) return 1;
  printf("Base = %d - Pow = %d\n", base, pow);
  int ret = base;
  #pragma CGRA
  for(int i = 1; i < pow; i++)
    ret *= base;
<<<<<<< HEAD
    return ret;
    }*/
=======
  return ret;
}*/
>>>>>>> 5f2c8bc0fcd0b4b59a263992775796f8c7c9371d

int main(int argc, char *argv[])
{
  int pow = atoi(argv[1]);
<<<<<<< HEAD
  int ret = 1;
=======
  int base = 2;
  if(pow == 0) return 1;
  printf("Base = %d - Pow = %d\n", base, pow);
  int ret = base;
  #pragma CGRA
  for(int i = 1; i < pow; i++)
    ret *= base;
>>>>>>> 5f2c8bc0fcd0b4b59a263992775796f8c7c9371d
  //int ret = sum(pow);

  #pragma CGRA
  for(int i = 1; i < pow; i++)
    ret *= 2;
  
  printf("***** %d^%d = %d *****\n", 2, pow, ret);

}
