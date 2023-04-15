CC=gcc
CFLAGS=-Wall -Wextra -std=c11 -m32 -g
LDFLAGS=-lm
CFLAGS_64=-Wall -Wextra -std=c11 -m64 -g 

all: main main64

main: main.o crypto_conversion.o
	$(CC) $(CFLAGS) -fno-pie -fno-pic -o $@ $^ $(LDFLAGS)

main.o: main.c
	$(CC) $(CFLAGS) -c $<

crypto_conversion.o: crypto_conversion.asm
	nasm -f elf32 -o $@ $<

main64: main64.o crypto_conversion64.o
	$(CC) $(CFLAGS_64) -fno-pie -fno-pic -o $@ $^ $(LDFLAGS)

main64.o: main64.c
	$(CC) $(CFLAGS_64) -c $^

crypto_conversion64.o: crypto_conversion64.asm
	nasm -f elf64 -o $@ $<

clean:
	rm -f *.o main main64
