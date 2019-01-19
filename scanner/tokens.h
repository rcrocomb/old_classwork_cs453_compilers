/*
 * File: tokens.h
 * Author: Saumya Debray
 * Purpose: Specifies the set of tokens for C--
 */

#ifndef __TOKENS_H__
#define __TOKENS_H__

/*
 * the flex-generated scanner returns 0 on end of file.
 */
#define EndOfFile       0

/*
 * Single character tokens: the value of the token is simply its ASCII
 * value.  These are listed here simply for completeness.
 */
#define LPAREN		'('
#define RPAREN		')'
#define LBRACKET	'['
#define RBRACKET	']'
#define LBRACE		'{'
#define RBRACE		'}'
#define COMMA		','
#define SEMICOLON	';'
#define ASSIGNMENT      '='
#define NEG		'!'
#define PLUS		'+'
#define MINUS		'-'
#define MULT		'*'
#define DIV		'/'
#define LT		'<'
#define GT		'>'

/*
 * Multi-character tokens.  The values are all greater than 256, so as
 * to not conflict with any ASCII-valued single-character token.
 */

#define ID		257
#define INTCON		258
#define CHARCON		259
#define STRINGCON	260
#define EXTERN	       	261
#define VOID		262
#define CHAR		263
#define INT		264
#define	IF		265
#define ELSE		266
#define WHILE		267
#define FOR		268
#define RETURN		269
#define EQ		270
#define NE		271
#define LE		272
#define GE		273
#define AND		274
#define OR		275

#endif /* __TOKENS_H__ */
