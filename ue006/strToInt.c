#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <inttypes.h>

#define RED	"\033[31m"
#define DEFAULT "\033[39m"

#define BOLD	"\033[1m"
#define RESET	"\033[0m"

extern int64_t strToInt(const char*, char**, uint8_t);

int main(int argc, char* argv[]) {
	if(argc < 3) {
		printf(BOLD RED "Not enough arguments!\n" RESET);		
		return EXIT_FAILURE;
	}
	
	char* end = NULL;

	int64_t base = strToInt(argv[2], &end, 10);
	if(*end) {
		printf(BOLD RED "Invalid Argument: %s\n" RESET, argv[2]);
		return EXIT_FAILURE;
	}
	
	int64_t val = strToInt(argv[1], &end, (uint8_t)base);
	if(*end) {
		printf(BOLD RED "Invalid Argument: %s\n" RESET, argv[1]);
		return EXIT_FAILURE;
	}

	printf("Integer: %"PRId64"_%"PRIu8"\n", val, (uint8_t)base);
	
	size_t len = (size_t)end - (size_t)(argv[1]);
	printf("Length: %zd\n", len);
	return EXIT_SUCCESS;
}

