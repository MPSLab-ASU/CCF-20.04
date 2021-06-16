#include <pthread.h>
#include <stdio.h>

void ping(void);
void pong(void);
  
int loops=0;
int number=1;
int pingpong=0;
pthread_mutex_t mutex;
  
main()
  {
     pthread_t pinger, ponger;
  
     pthread_mutex_init(&mutex, NULL);

     pthread_create( &pinger, NULL,
                    (void*)&ping, NULL );

     pthread_create( &ponger, NULL,
                    (void*)&pong, NULL );

     pthread_join( pinger, NULL );

     pthread_join( ponger, NULL );

     printf("%d\n",loops);
  }
  
  void ping(void)
  {
    int i;
    for (i=0; i<100; i++)
     {
          pthread_mutex_lock( &mutex );
          if( pingpong )
          {
               printf("%d - %d - ping\n", number, i);
               number ++;
               pingpong = 0;
          }
          else
          {
               i--;
          }
          pthread_mutex_unlock( &mutex );
          loops++;
     }
    pthread_exit(0);
  }
  
  void pong(void)
  {
    int i;
    for (i=0; i<100; i++)
     {
          pthread_mutex_lock( &mutex );
          if( !pingpong )
          {
               printf("%d - %d - pong\n", number, i);
               number ++;
               pingpong = 1;
          }
          else
          {
               i--;
          }
          pthread_mutex_unlock( &mutex );
          loops++;
     }
    pthread_exit(0);
  }
