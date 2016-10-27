#include <stdio.h>
extern int func(int, int);

int main()
{
  int a = 5;
  int b = 4;
  a = func(a, b);
  printf("%d\n", a);
  return 0;
}
