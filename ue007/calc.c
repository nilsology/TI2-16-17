#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <inttypes.h>

#define RED	"\033[31m"
#define DEFAULT "\033[39m"

#define BOLD	"\033[1m"
#define RESET	"\033[0m"

extern char calc_add(float, float, float*);
extern char calc_sub(float, float, float*);

int main(int argc, char* argv[]) {
	// Check if enough arguments are provided
	if(argc < 3) {
		printf(RED "Not enough arguments! Try ./calc 1.2 3.4\n" RESET);		
		return EXIT_FAILURE;
	}

	// Read operands from command line
	float operand1 = (float) atof(argv[1]);
	float operand2 = (float) atof(argv[2]);
	float result;
	char ret;

	// Perform addition
	printf("%f \t+ \t%f \t= \t", operand1, operand2);
	ret = calc_add(operand1, operand2, &result);
	if(ret) {
		printf(BOLD RED "error (%d)\n" RESET, ret);
	}
	else {
		printf("%f\n", result);
	}

	// Perform subtraction
	printf("%f \t- \t%f \t= \t", operand1, operand2);
	ret = calc_sub(operand1, operand2, &result);
	if(ret) {
		printf(BOLD RED "error (%d)\n" RESET, ret);
	}
	else {
		printf("%f\n", result);
	}

	return EXIT_SUCCESS;
}

