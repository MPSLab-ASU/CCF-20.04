FILE1 = pow.c

all: pow pow_arm

CC = cgracc
ARMCC = arm-linux-gnueabi-gcc
LIB = -lm
pow: ${FILE1} Makefile
	$(CC) -static -O3 ${FILE1} -o pow
pow_arm: ${FILE1} Makefile
	$(ARMCC) -static -O3 ${FILE1} -o pow_cpu
clean:
	rm -rf pow CGRAExec m5out *.bc *.ll out pow_cpu CPU
