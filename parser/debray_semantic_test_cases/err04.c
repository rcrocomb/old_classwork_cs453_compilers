/* multiple definitions of a function */

int foo(int x);

foo(int x)
{
  return x+1;
}

char x[10];

foo(int x)
{
  return x+1;
}

