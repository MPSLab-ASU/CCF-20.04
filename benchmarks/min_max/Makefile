FILE1 = double_min_max.c main.c

all: min_max

CC = cgracc #gcc
ARMCC = arm-linux-gnueabi-gcc
LIB = -lm -lrt
min_max: ${FILE1} Makefile
	$(CC) -static -O3 ${FILE1} -o min_max
clean:
	rm -rf min_max CGRAExec m5out
