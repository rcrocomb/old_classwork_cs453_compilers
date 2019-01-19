#ifndef GRAMMAR_TOKENS_H
#define GRAMMAR_TOKENS_H

////////////////////////////////////////////////////////////////////////////////
// Author: Robert Crocombe
// Class: CS453 Fall 04
// Professor: Debray
// Other People's Code: Not bloody likely
//
// Here's where I map production names to token values so I can read
// FIRST and FOLLOW sets out of a file.
//
////////////////////////////////////////////////////////////////////////////////

// If first sets are in ASCII files like so:
// 
// expr: ' , ]
// 
// And we read this in as ASCII like:
// 
// key: 'expr'
// first tokens (as ASCII): "'" "," "]"
// 
// then we need to go from ASCII -> numerical token values.
// production_map will hold the ASCII <-> numerical token mapping, so
// that we know things like an "id" is token 257 just by seeing the string "id".
//
// This will be then be used to create a vector of integer token
// values of these first sets, and that will be stored in the
// set_map type: one set_map for FIRST sets and one for FOLLOW.
//

namespace grammar_tokens
{
    const std::string PROGRAM_STRING("program");
    const std::string PROGRAM_ELEMENT_STRING("program_element");
    const std::string PROGRAM_PRIME_STRING("program_prime");
    const std::string FUNC_OR_VAR_THING__STRING("func_or_var_thing");
    const std::string FUNC_DECL_OR_BODY_STRING("func_decl_or_body");
    const std::string FUNC_TYPE_STRING("func_type");
    const std::string FUNC_NAME_AND_ARGS_STRING("func_name_and_args");
    const std::string FUNC_DECL_TAIL_STRING("func_decl_tail");
    const std::string FUNC_BODY_STRING("func_body");
    const std::string PARAM_TYPES_STRING("param_types");
    const std::string TYPE_STMT_STRING("type_stmt");
    const std::string TYPE_STRING("type");
    const std::string PARAM_TYPES_TAIL_STRING("param_types_tail");
    const std::string BUNCHO_VAR_DECLS_STRING("buncho_var_decls");
    const std::string BUNCHO_VAR_DECLS_PRIME_STRING("buncho_var_decls_prime");
    const std::string VAR_DECL_STRING("var_decl");
    const std::string VAR_DECL_TAIL_STRING("var_decl_tail");
    const std::string ARRAY_DECL_MAYBE_STRING("array_decl_maybe");
    const std::string ARRAY_MAYBE_STRING("array_maybe");
    const std::string STMT_SEQUENCE_STRING("stmt_sequence");
    const std::string STMT_STRING("stmt");
    const std::string EXPR_MAYBE_STRING("expr_maybe");
    const std::string FOR_A_STRING("for_A");
    const std::string FOR_B_STRING("for_B");
    const std::string FOR_C_STRING("for_C");
    const std::string ASSG_OR_ID_STRING("assg_or_id");
    const std::string ASSG_OR_ID_PRIME_STRING("assg_or_id_prime");
    const std::string ASSG_PRIME_STRING("assg_prime");
    const std::string ASSG_STRING("assg");
    const std::string ID_PAREN_EXPR_STRING("id_paren_expr");
    const std::string EXPR_TAIL_STRING("expr_tail");
    const std::string EXPR_STRING("expr");
    const std::string EXPR_PRIME_STRING("expr_prime");
    const std::string AND_EXPR_STRING("and_expr");
    const std::string AND_EXPR_PRIME_STRING("and_expr_prime");
    const std::string EQ_EXPR_STRING("eq_expr");
    const std::string EQ_EXPR_PRIME_STRING("eq_expr_prime");
    const std::string CMP_EXPR_STRING("cmp_expr");
    const std::string CMP_EXPR_PRIME_STRING("cmp_expr_prime");
    const std::string ADD_EXPR_STRING("add_expr");
    const std::string ADD_EXPR_PRIME_STRING("add_expr_prime");
    const std::string MULT_EXPR_STRING("mult_expr");
    const std::string MULT_EXPR_PRIME_STRING("mult_expr_prime");
    const std::string UNARY_EXPR_STRING("unary_expr");
    const std::string ID_EXPR_STRING("id_expr");
    const std::string ID_EXPR_PRIME_STRING("id_expr_prime");

    const std::string LPAREN_STRING("LPAREN");
    const std::string RPAREN_STRING("RPAREN");
    const std::string LBRACKET_STRING("LBRACKET");
    const std::string RBRACKET_STRING("RBRACKET");
    const std::string LBRACE_STRING("LBRACE");
    const std::string RBRACE_STRING("RBRACE");
    const std::string COMMA_STRING("COMMA");
    const std::string SEMICOLON_STRING("SEMICOLON");
    const std::string ASSIGNMENT_STRING("ASSIGNMENT");
    const std::string NEG_STRING("NEG");
    const std::string PLUS_STRING("PLUS");
    const std::string MINUS_STRING("MINUS");
    const std::string MULT_STRING("MULT");
    const std::string DIV_STRING("DIV");
    const std::string LT_STRING("LT");
    const std::string GT_STRING("GT");
    const std::string ID_STRING("ID");
    const std::string INTCON_STRING("INTCON");
    const std::string CHARCON_STRING("CHARCON");
    const std::string STRINGCON_STRING("STRINGCON");
    const std::string EXTERN_STRING("EXTERN");
    const std::string VOID_STRING("VOID");
    const std::string CHAR_STRING("CHAR");
    const std::string INT_STRING("INT");
    const std::string IF_STRING("IF");
    const std::string ELSE_STRING("ELSE");
    const std::string WHILE_STRING("WHILE");
    const std::string FOR_STRING("FOR");
    const std::string RETURN_STRING("RETURN");
    const std::string EQ_STRING("EQ");
    const std::string NE_STRING("NE");
    const std::string LE_STRING("LE");
    const std::string GE_STRING("GE");
    const std::string AND_STRING("AND");
    const std::string OR_STRING("OR");
    const std::string EOF_STRING("EOF");
    const std::string NULL_STRING("NULL");

    // make_pair, as a template, is unhappy with anonymous types.
    // I guess 'typename' probably has conniptions.  I am sad.
    enum bob
    {
        EPSILON                     = -42,
        PROGRAM                     = 1000,
        PROGRAM_ELEMENT             = 2000,
        PROGRAM_PRIME               = 3000,
        FUNC_OR_VAR_THING           = 3500,
        FUNC_NAME_AND_ARGS          = 3800,
        FUNC_DECL_OR_BODY           = 4000,
        FUNC_TYPE                   = 5000,
        FUNC_DECL_TAIL              = 6000,
        STMT_SEQUENCE               = 7000,
        PARAM_TYPES_TAIL            = 8000,
        PARAM_TYPES                 = 8500,
        ARRAY_DECL_MAYBE            = 9000,
        TYPE_STMT                   = 9500,
        TYPE                        = 9700,
        BUNCHO_VAR_DECLS            = 9750,
        BUNCHO_VAR_DECLS_PRIME      = 9775,
        VAR_DECL                    = 9800,
        VAR_DECL_TAIL               = 10000,
        ARRAY_MAYBE                 = 11000,
        STMT                        = 11800,
        EXPR_MAYBE                  = 15000,
        FOR_A                       = 15200,
        FOR_B                       = 15500,
        FOR_C                       = 16000,
        ASSG_OR_ID                  = 16200,
        ASSG_OR_ID_PRIME            = 16500,
        ASSG                        = 16700,
        ASSG_PRIME                  = 16800,
        ID_PAREN_EXPR               = 17000,
        EXPR_TAIL                   = 18000,
        AND_EXPR                    = 19000,
        EXPR_PRIME                  = 20000,
        EQ_EXPR                     = 21000,
        AND_EXPR_PRIME              = 22000,
        CMP_EXPR                    = 23000,
        EQ_EXPR_PRIME               = 24000,
        ADD_EXPR                    = 25000,
        MULT_EXPR                   = 26000,
        ADD_EXPR_PRIME              = 27000,
        ID_EXPR_PRIME               = 28000,
        MULT_EXPR_PRIME             = 29000,
        EXPR                        = 30000,
        UNARY_EXPR                  = 31000,
        FUNC_BODY                   = 32000,
        CMP_EXPR_PRIME              = 33000,
        ID_EXPR                     = 3400
    };
}

#endif  // GRAMMAR_TOKENS_H

