/*
 * File: print.c
 * Author: Saumya Debray
 * Purpose: assorted print routines
 *
 *   The only externally visible function in this file is
 *
 *	void printtoken( int tok )
 *
 *   This function should be called with the token returned by yylex(),
 *   e.g.:
 *
 *      int token = yylex(); printtoken( token );
 */

#include <stdio.h>
#include "tokens.h"

extern int line_number;
extern char *yytext;
extern int CurrTok;

/*********************************************************************
 *                                                                   *
 * prtok() prints out the token passed to it.                        *
 *                                                                   *
 *********************************************************************/

static void prtok(int tok)
{
  switch (tok) {
  case EndOfFile:
    printf("-EOF-");
    break;

    /*
     * single character tokens
     */
  case LPAREN:
  case RPAREN:
  case LBRACKET:
  case RBRACKET:
  case LBRACE:
  case RBRACE:
  case COMMA:
  case SEMICOLON:
  case ASSIGNMENT:
  case NEG:
  case PLUS:
  case MINUS:
  case MULT:
  case DIV:
  case LT:
  case GT:
    printf("%c", tok);
    break;
    /*
     * Multi-character tokens
     */
  case ID:
    printf("ID");
    break;
  case INTCON:
    printf("INTCON");
    break;
  case CHARCON:
    printf("CHARCON");
    break;
  case STRINGCON:
    printf("STRINGCON");
    break;

  case EXTERN:
    printf("extern");
    break;
  case VOID:
    printf("void");
    break;
  case CHAR:
    printf("char");
    break;
  case INT:
    printf("int");
    break;
  case IF:
    printf("if");
    break;
  case ELSE:
    printf("else");
    break;
  case WHILE:
    printf("while");
    break;
  case FOR:
    printf("for");
    break;
  case RETURN:
    printf("return");
    break;

  case EQ:
    printf("==");
    break;
  case NE:
    printf("!=");
    break;
  case LE:
    printf("<=");
    break;
  case GE:
    printf(">=");
    break;
  case AND:
    printf("&&");
    break;
  case OR:
    printf("||");
    break;
    break;

  default:
    printf("??? [ %d ]", tok);
    break;
  }
}

/*********************************************************************
 *                                                                   *
 * prlex() prints out the lexeme for the current token, if it is     *
 * a token with multiple possible matching lexemes.                  *
 *                                                                   *
 *********************************************************************/

static void prlex(int tok)
{
  switch (tok) {
  case ID:
  case INTCON:
  case CHARCON:
  case STRINGCON:
    printf(" = %s", yytext);
    break;
  }

  return;
}

/*********************************************************************
 *                                                                   *
 * printtoken() prints out the token passed to it.  This is used to  *
 * get information about the scanner's behavior.                     *
 *                                                                   *
 *********************************************************************/

void printtoken(int tok)
{
  switch (tok) {
  case EndOfFile:
  case LPAREN:
  case RPAREN:
  case LBRACKET:
  case RBRACKET:
  case LBRACE:
  case RBRACE:
  case COMMA:
  case SEMICOLON:
  case ASSIGNMENT:
  case NEG:
  case PLUS:
  case MINUS:
  case MULT:
  case DIV:
  case LT:
  case GT:
  case ID:
  case INTCON:
  case CHARCON:
  case STRINGCON:
  case EXTERN:
  case VOID:
  case CHAR:
  case INT:
  case IF:
  case ELSE:
  case WHILE:
  case FOR:
  case RETURN:
  case EQ:
  case NE:
  case LE:
  case GE:
  case AND:
  case OR:
    printf("Line %d: ", line_number);
    prtok(tok);
    prlex(tok);
    printf("\n");
    break;

  default:
    printf("Line %d: Unrecognized token: %d\n", line_number, tok);
    break;
  }
}

