
#include <stdio.h>
#include <stdint.h>

#include "double_min_max.h"

#define MAX_SEARCH
#define MIN_SEARCH

void double_min_max(int32_t *arg[])
{

    int32_t* vec  = arg[0];
    int32_t length = *(arg[1]);

    int32_t a, b, c, d;

#ifdef MAX_SEARCH
    printf("Maximum search\n");

    /*kernel_res[0] = vec[0];
    kernel_res[1] = INT32_MIN;
    kernel_res[2] = 0;
    kernel_res[3] = -1;*/

    a = vec[0];
    b =  INT32_MIN;
    c = 0; 
    d = -1; 

    #pragma CGRA
    for(int32_t i=1; i<length; i++) {

      if (vec[i] > a) {
        b = a;
        a = vec[i] ;
        d = c;
        c = i;
      } else if (vec[i] > b) {
        b = vec[i];
        d = i;
      }
    }
    printf("Maximum 1 index = %d\n", a);
    printf("Maximum 1 value = %d\n", c);
    printf("Maximum 2 index = %d\n", b);
    printf("Maximum 2 value = %d\n", d);
#endif // MAX_SEARCH

#ifdef MIN_SEARCH
    printf("Minimum search\n");
    /*kernel_res[0] = vec[0];
    kernel_res[1] = INT32_MAX;
    kernel_res[2] = 0;
    kernel_res[3] = -1;*/ 

    a = vec[0];
    b =  INT32_MIN;
    c = 0;
    d = -1;

    for(int i=1; i<length; i++) {

      if (vec[i] < a) {
        b = a;
        a = vec[i] ;
        d = c;
        c = i;
      } else if (vec[i] < b) {
        b = vec[i];
        d = i;
      }
    }
    printf("Minimum 1 index = %d\n", a);
    printf("Minimum 1 value = %d\n", c);
    printf("Minimum 2 index = %d\n", d);
    printf("Minimum 2 value = %d\n", b);
#endif // MIN_SEARCH

}
