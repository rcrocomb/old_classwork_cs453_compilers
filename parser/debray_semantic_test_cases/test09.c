/* variables: scope distinctions */

int a[10], x[10];

foo(int x)
{
  return a[x];   /* global a, local x */
}

bar(int a)
{
  return x[a];  /* local a, global x */
}
