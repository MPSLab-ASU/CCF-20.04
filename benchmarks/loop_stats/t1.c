#include <stdio.h>
#include <pthread.h>

void loop(int N);
int dummy;

main(){
  printf("t1.c: Now executing loop\n");

  pthread_t loop_thread;
  pthread_create(&loop_thread, NULL, (void*)&loop, (int) 15);

  printf("t1.c: Loop done executing - now joining\n");
  pthread_join(loop_thread, NULL);

  printf("t1.c: Program done - dummy = %d\n", dummy);
}

void loop(int N){
  printf("t1.c: Executing loop with N = %d\n", N);
  dummy = 0;
  for(int i=0; i<N; i++){
    dummy += i;
  }
  return;
}
