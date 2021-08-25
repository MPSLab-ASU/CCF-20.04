/*
 * This example shows the double max and min search kernel
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "double_min_max.h"
#include "stimuli.h"


int32_t *arg[4];

int main(int32_t argc, char* argv[])
{
  printf("Entering main function\n");

  //int end = INPUT_LENGTH;
  int end = atoi(argv[1]); 

  arg[0] = &stimuli[0];
  arg[1] = &end;

  double_min_max(arg);

  printf("Leaving main function\n");

  return 0;
}
