#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

#define RED		"\033[31m"
#define DEFAULT "\033[39m"

#define BOLD	"\033[1m"
#define RESET	"\033[0m"

extern int32_t formula(int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t);

int main(int argc, char* argv[]) {
	if(argc < 9) {
		fputs(RED BOLD "Not enough arguments!\n" RESET, stderr);
		return EXIT_FAILURE;	
	}
	
	char* test = NULL;
	int32_t a = strtol(argv[1], &test, 10);
	if(*test) {
		fprintf(stderr, BOLD RED "Invalid Argument: %s\n", argv[1]);
	}
	
	int32_t b = strtol(argv[2], &test, 10);
	if(*test) {
		fprintf(stderr, BOLD RED "Invalid Argument: %s\n", argv[2]);
	}
	
	int32_t c = strtol(argv[3], &test, 10);
	if(*test) {
		fprintf(stderr, BOLD RED "Invalid Argument: %s\n", argv[3]);
	}
	
	int32_t d = strtol(argv[4], &test, 10);
	if(*test) {
		fprintf(stderr, BOLD RED "Invalid Argument: %s\n", argv[4]);
	}
	
	int32_t e = strtol(argv[5], &test, 10);
	if(*test) {
		fprintf(stderr, BOLD RED "Invalid Argument: %s\n", argv[5]);
	}
	
	int32_t f = strtol(argv[6], &test, 10);
	if(*test) {
		fprintf(stderr, BOLD RED "Invalid Argument: %s\n", argv[6]);
	}
	
	int32_t g = strtol(argv[7], &test, 10);
	if(*test) {
		fprintf(stderr, BOLD RED "Invalid Argument: %s\n", argv[7]);
	}
	
	int32_t h = strtol(argv[8], &test, 10);
	if(*test) {
		fprintf(stderr, BOLD RED "Invalid Argument: %s\n", argv[8]);
	}

	if(*test) {
		return EXIT_FAILURE;
	}

	int64_t res = formula(a, b, c, d, e, f, g, h);
	printf("%"PRId64"\n", res);

	return EXIT_SUCCESS;
}

