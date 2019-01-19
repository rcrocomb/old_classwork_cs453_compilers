/* array subscript not of appropriate type */

int a[10];

void foo(int x)
{
  x = a[foo];
  foo(1);
  return;
}
