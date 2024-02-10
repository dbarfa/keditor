OUT = ./bin/keditor
CFLAGS = -Wall -Wextra -std=c99 -pedantic

build:
	$(CC) keditor.c -o $(OUT) $(CFLAGS)

win:
	zig cc -target x86_64-windows-gnu ${CFLAGS} -static keditor.c -o $(OUT).exe
