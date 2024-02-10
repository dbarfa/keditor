OUT = ./bin/keditor
CFLAGS = -Wall -Wextra -std=c99 -pedantic

build: create_bin_directory
	$(CC) keditor.c -o $(OUT) $(CFLAGS)

win: create_bin_directory
	zig cc -target x86_64-windows-gnu ${CFLAGS} -static keditor.c -o $(OUT).exe

create_bin_directory:
	mkdir -p ./bin
