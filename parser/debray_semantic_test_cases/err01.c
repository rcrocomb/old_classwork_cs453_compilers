/* multiple declarations of a global variable */

int x;

foo(int y)
{
  return y;
}

char x[10];  /* x already declared as global */

bar(int y)
{
  return y+1;
}
