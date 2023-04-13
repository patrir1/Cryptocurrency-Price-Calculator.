CC=gcc
CFLAGS=-Wall -Wextra -std=c11 -m64 -g
LDFLAGS=-lm

all: main

main: main.o crypto_conversion.o
	$(CC) $(CFLAGS) -fno-pic -o $@ $^ $(LDFLAGS)

main.o: main.c
	$(CC) $(CFLAGS) -c $<

crypto_conversion.o: crypto_conversion.asm
	nasm -f elf64 -o $@ $<

clean:
	rm -f *.o main
