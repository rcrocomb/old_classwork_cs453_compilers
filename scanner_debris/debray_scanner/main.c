#include <stdio.h>
#include "tokens.h"

extern int yylex();
extern void printtoken(int tok);

int main()
{
  int tok;

  do {
    tok = yylex();
    printtoken(tok);
  } while (tok) ;   /* yylex() returns 0 on EOF */

  return 0;

}
