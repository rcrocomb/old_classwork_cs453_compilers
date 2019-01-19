////////////////////////////////////////////////////////////////////////////////
// Author: Robert Crocombe
// Class: CS453 Fall 04
// Professor: Debray
// Other People's Code: No
//
// See header.
////////////////////////////////////////////////////////////////////////////////

#include "set_map.h"
#include "grammar_tokens.h"
#include "tokens.h"

#include <fstream>

using parser_utils::smoosh;

////////////////////////////////////////////////////////////////////////////////
// static member initialization
////////////////////////////////////////////////////////////////////////////////

production_map *set_map::ASCII_to_tokens_ = 0;

////////////////////////////////////////////////////////////////////////////////
// Constructors and destructor
////////////////////////////////////////////////////////////////////////////////

set_map::set_map(const std::string &filename):
    map_(new set_productions())
{
    fill_set_map(filename);
}

/*!
    ASCII_to_tokens_ should be taken care of independently since it's static.
*/

set_map::~set_map(void)
{
    // delete all vectors in map
    set_productions::iterator i = map_->begin();
    const set_productions::iterator end = map_->end();
    while ( i != end)
    {
        delete i->second;
        ++i;
    }

    // delete map
    delete map_;
}

////////////////////////////////////////////////////////////////////////////////
// Private
////////////////////////////////////////////////////////////////////////////////

/*!
    How to change ASCII to numerical tokens
*/

void
set_map::fill_production_table(void)
{
    using namespace grammar_tokens;

    if (ASCII_to_tokens_)
    {
        RUNTIME_ERROR("Duplicate initialization of ASCII map!\n");
    }

    ASCII_to_tokens_ = new production_map();

    ASCII_to_tokens_->insert(std::make_pair(PROGRAM_STRING, PROGRAM));
    ASCII_to_tokens_->insert(std::make_pair(PROGRAM_ELEMENT_STRING, PROGRAM_ELEMENT));
    ASCII_to_tokens_->insert(std::make_pair(PROGRAM_PRIME_STRING, PROGRAM_PRIME));

    ASCII_to_tokens_->insert(std::make_pair(FUNC_OR_VAR_THING__STRING, FUNC_OR_VAR_THING));
    ASCII_to_tokens_->insert(std::make_pair(FUNC_DECL_OR_BODY_STRING, FUNC_DECL_OR_BODY));
    ASCII_to_tokens_->insert(std::make_pair(FUNC_TYPE_STRING, FUNC_TYPE));
    ASCII_to_tokens_->insert(std::make_pair(FUNC_NAME_AND_ARGS_STRING, FUNC_NAME_AND_ARGS));
    ASCII_to_tokens_->insert(std::make_pair(FUNC_DECL_TAIL_STRING, FUNC_DECL_TAIL));
    ASCII_to_tokens_->insert(std::make_pair(FUNC_BODY_STRING, FUNC_BODY));

    ASCII_to_tokens_->insert(std::make_pair(TYPE_STMT_STRING, TYPE_STMT));
    ASCII_to_tokens_->insert(std::make_pair(TYPE_STRING, TYPE));
    ASCII_to_tokens_->insert(std::make_pair(ARRAY_MAYBE_STRING, ARRAY_MAYBE));

    ASCII_to_tokens_->insert(std::make_pair(STMT_SEQUENCE_STRING, STMT_SEQUENCE));
    ASCII_to_tokens_->insert(std::make_pair(STMT_STRING, STMT));

    ASCII_to_tokens_->insert(std::make_pair(BUNCHO_VAR_DECLS_STRING, BUNCHO_VAR_DECLS));
    ASCII_to_tokens_->insert(std::make_pair(BUNCHO_VAR_DECLS_PRIME_STRING, BUNCHO_VAR_DECLS_PRIME));
    ASCII_to_tokens_->insert(std::make_pair(VAR_DECL_STRING, VAR_DECL));
    ASCII_to_tokens_->insert(std::make_pair(VAR_DECL_TAIL_STRING, VAR_DECL_TAIL));
    ASCII_to_tokens_->insert(std::make_pair(ARRAY_DECL_MAYBE_STRING, ARRAY_DECL_MAYBE));
    ASCII_to_tokens_->insert(std::make_pair(PARAM_TYPES_STRING, PARAM_TYPES));
    ASCII_to_tokens_->insert(std::make_pair(PARAM_TYPES_TAIL_STRING, PARAM_TYPES_TAIL));
    ASCII_to_tokens_->insert(std::make_pair(ASSG_STRING, ASSG));
    ASCII_to_tokens_->insert(std::make_pair(ASSG_PRIME_STRING, ASSG_PRIME));
    ASCII_to_tokens_->insert(std::make_pair(ASSG_OR_ID_STRING, ASSG_OR_ID));
    ASCII_to_tokens_->insert(std::make_pair(ASSG_OR_ID_PRIME_STRING, ASSG_OR_ID_PRIME));

    ASCII_to_tokens_->insert(std::make_pair(ID_PAREN_EXPR_STRING, ID_PAREN_EXPR));
    ASCII_to_tokens_->insert(std::make_pair(FOR_A_STRING, FOR_A));
    ASCII_to_tokens_->insert(std::make_pair(FOR_B_STRING, FOR_B));
    ASCII_to_tokens_->insert(std::make_pair(FOR_C_STRING, FOR_C));
    ASCII_to_tokens_->insert(std::make_pair(EXPR_MAYBE_STRING, EXPR_MAYBE));
    ASCII_to_tokens_->insert(std::make_pair(EXPR_TAIL_STRING, EXPR_TAIL));

    ASCII_to_tokens_->insert(std::make_pair(EXPR_STRING, EXPR));
    ASCII_to_tokens_->insert(std::make_pair(EXPR_PRIME_STRING, EXPR_PRIME));
    ASCII_to_tokens_->insert(std::make_pair(AND_EXPR_STRING, AND_EXPR));
    ASCII_to_tokens_->insert(std::make_pair(AND_EXPR_PRIME_STRING, AND_EXPR_PRIME));
    ASCII_to_tokens_->insert(std::make_pair(EQ_EXPR_STRING, EQ_EXPR));
    ASCII_to_tokens_->insert(std::make_pair(EQ_EXPR_PRIME_STRING, EQ_EXPR_PRIME));
    ASCII_to_tokens_->insert(std::make_pair(CMP_EXPR_STRING, CMP_EXPR));
    ASCII_to_tokens_->insert(std::make_pair(CMP_EXPR_PRIME_STRING, CMP_EXPR_PRIME));
    ASCII_to_tokens_->insert(std::make_pair(ADD_EXPR_STRING, ADD_EXPR));
    ASCII_to_tokens_->insert(std::make_pair(ADD_EXPR_PRIME_STRING, ADD_EXPR_PRIME));
    ASCII_to_tokens_->insert(std::make_pair(MULT_EXPR_STRING, MULT_EXPR));
    ASCII_to_tokens_->insert(std::make_pair(MULT_EXPR_PRIME_STRING, MULT_EXPR_PRIME));
    ASCII_to_tokens_->insert(std::make_pair(UNARY_EXPR_STRING, UNARY_EXPR));

    ASCII_to_tokens_->insert(std::make_pair(ID_EXPR_STRING, ID_EXPR));
    ASCII_to_tokens_->insert(std::make_pair(ID_EXPR_PRIME_STRING, ID_EXPR_PRIME));

    ASCII_to_tokens_->insert(std::make_pair(LPAREN_STRING, LPAREN));
    ASCII_to_tokens_->insert(std::make_pair(RPAREN_STRING, RPAREN));
    ASCII_to_tokens_->insert(std::make_pair(LBRACKET_STRING, LBRACKET));
    ASCII_to_tokens_->insert(std::make_pair(RBRACKET_STRING, RBRACKET));
    ASCII_to_tokens_->insert(std::make_pair(LBRACE_STRING, LBRACE));
    ASCII_to_tokens_->insert(std::make_pair(RBRACE_STRING, RBRACE));
    ASCII_to_tokens_->insert(std::make_pair(COMMA_STRING, COMMA));
    ASCII_to_tokens_->insert(std::make_pair(SEMICOLON_STRING, SEMICOLON));
    ASCII_to_tokens_->insert(std::make_pair(ASSIGNMENT_STRING, ASSIGNMENT));
    ASCII_to_tokens_->insert(std::make_pair(NEG_STRING, NEG));
    ASCII_to_tokens_->insert(std::make_pair(PLUS_STRING, PLUS));
    ASCII_to_tokens_->insert(std::make_pair(MINUS_STRING, MINUS));
    ASCII_to_tokens_->insert(std::make_pair(MULT_STRING, MULT));
    ASCII_to_tokens_->insert(std::make_pair(DIV_STRING, DIV));
    ASCII_to_tokens_->insert(std::make_pair(LT_STRING, LT));
    ASCII_to_tokens_->insert(std::make_pair(GT_STRING, GT));
    ASCII_to_tokens_->insert(std::make_pair(ID_STRING, ID));
    ASCII_to_tokens_->insert(std::make_pair(INTCON_STRING, INTCON));
    ASCII_to_tokens_->insert(std::make_pair(CHARCON_STRING, CHARCON));
    ASCII_to_tokens_->insert(std::make_pair(STRINGCON_STRING, STRINGCON));
    ASCII_to_tokens_->insert(std::make_pair(EXTERN_STRING, EXTERN));
    ASCII_to_tokens_->insert(std::make_pair(VOID_STRING, VOID));
    ASCII_to_tokens_->insert(std::make_pair(CHAR_STRING, CHAR));
    ASCII_to_tokens_->insert(std::make_pair(INT_STRING, INT));
    ASCII_to_tokens_->insert(std::make_pair(IF_STRING, IF));
    ASCII_to_tokens_->insert(std::make_pair(ELSE_STRING, ELSE));
    ASCII_to_tokens_->insert(std::make_pair(WHILE_STRING, WHILE));
    ASCII_to_tokens_->insert(std::make_pair(FOR_STRING, FOR));
    ASCII_to_tokens_->insert(std::make_pair(RETURN_STRING, RETURN));
    ASCII_to_tokens_->insert(std::make_pair(EQ_STRING, EQ));
    ASCII_to_tokens_->insert(std::make_pair(NE_STRING, NE));
    ASCII_to_tokens_->insert(std::make_pair(LE_STRING, LE));
    ASCII_to_tokens_->insert(std::make_pair(GE_STRING, GE));
    ASCII_to_tokens_->insert(std::make_pair(AND_STRING, AND));
    ASCII_to_tokens_->insert(std::make_pair(OR_STRING, OR));

    ASCII_to_tokens_->insert(std::make_pair(NULL_STRING, 0));
    ASCII_to_tokens_->insert(std::make_pair(EOF_STRING, EOF));
}

/*!
    Reads production set (FIRST, FOLLOW) information from the given input file.
*/

void
set_map::fill_set_map(const std::string &filename)
{
    using namespace grammar_tokens;

    const int FILE_LINE_LENGTH = 255 + 1;   // whatever

    std::ifstream in(filename.c_str());
    if (!in)
    {
        RUNTIME_ERROR("Unable to open set file %s\n", filename.c_str());
    }

    // while !EOF
    char file_line[FILE_LINE_LENGTH];
    while (1)
    {
        // get name of production - ':' is the delimiter
        in.getline(file_line, FILE_LINE_LENGTH, ':');

        if (in.eof())
        {
            break;
        }

        if (in.fail())
        {
            RUNTIME_ERROR("Failed while reading input file '%s'\n",
                          filename.c_str());
        }

        std::string grammar_rule(file_line, strlen(file_line));
        if (ASCII_to_tokens_->count(grammar_rule) < 1)
        {
            // file entry doesn't match any in table
            RUNTIME_ERROR("File entry '%s' doesn't match any production.\n",
                          grammar_rule.c_str()); 
        }

        // add translated production to set map
        int production = add_production( grammar_rule );

        // get rest of line (space delimited tokens)
        in.getline(file_line, FILE_LINE_LENGTH);
        const char *p = file_line;
        const char *q;

        // turn each token into a string
        while (*p)
        {
            while (*p && (*p == ' ')) ++p;
            q = p;
            while (*q && (*q != ' ')) ++q;
            std::string token(p, q - p);
            p = q;

            if (ASCII_to_tokens_->count(token) < 1)
            {
                // no match for this token in ASCII->integer map
                RUNTIME_ERROR("No match for token '%s'\n",token.c_str());
            }
            add_to_vector(production, token);
        }
    }
}

/*!
    Adds the integer token that is mapped to token_string to the vector
    of tokens for 'production'.  If the production doesn't exist, prints error.
    If token is already in the vector, prints error.
*/

void
set_map::add_to_vector(const int production, const std::string &token_string)
{
    set_productions::iterator p = map_->find(production);

    if ( p == map_->end() )
    {
        // production not in map
        RUNTIME_ERROR("No such production '%s' inserting '%s'\n",
                      reverse_lookup(production).c_str(),
                      token_string.c_str());
    }

    // translate token string into numerical token
    int token = (*ASCII_to_tokens_)[token_string];

    // check to see if already in vector: if not, add it
    token_vector::iterator end = p->second->end();
    if (std::find(p->second->begin(), end, token) != end)
    {
        // already in vector
        RUNTIME_ERROR("Token '%s' already in production '%s'\n",
                      token_string.c_str(),
                      reverse_lookup(production).c_str());
    }

    p->second->push_back(token);
}

/*!
    Add a production called 'production'.  This string will be translated
    into an integer token number via ASCII_to_tokens_, and it is this token
    that actually goes into the map.  If the production already exists,
    then an exception is thrown, since it's generally a bad idea to have
    the same production in a file twice.
*/

int
set_map::add_production(const std::string &production)
{
    // grammar production value to integer token representing production
    int translated_token = (*ASCII_to_tokens_)[production];

    // using token, check to see if production already in map (dupe)
    set_productions::iterator p = map_->find(translated_token);
    if (p != map_->end())
    {
        RUNTIME_ERROR("Duplicate entry for production '%s'\n",
                      production.c_str());
    }

    map_->insert(std::make_pair(translated_token, new token_vector()));

    return translated_token;
}

/*!
    Given the numerical token 'token', get the ASCII string name for the
    token.  This makes reading debugging output way way more legible.
    It's probably damn slow, but I really don't feel like making a
    tokens_to_ASCII map.
*/

const std::string &
set_map::reverse_lookup(const int token)
{
    static std::string temp;

    production_map::const_iterator i = ASCII_to_tokens_->begin();
    production_map::const_iterator end = ASCII_to_tokens_->end();
    for( ; i != end; ++i)
    {
        if (i->second == token)
        {
            return i->first;
        }
    }
    // In case we get a non-mapped character (like maybe a naked letter or
    // something), then return that value in a string.
    return temp = (char)token;
}

int
set_map::lookup(const std::string &string)
{
    return (*ASCII_to_tokens_)[string];
}

////////////////////////////////////////////////////////////////////////////////
// Public
////////////////////////////////////////////////////////////////////////////////

/*!
    See if the token 'token' is in the production 'production'.  True
    if it is, false if it aitn't.
*/

bool
set_map::contains
(
    const int production,
    const int token
) const
{
    set_productions::iterator p = map_->find(production);

    if ( p == map_->end() )
    {
        // production not in map
        RUNTIME_ERROR("Production '%s' is not in the map.\n",
                      reverse_lookup(production).c_str());
    }

    // found production, now see if token is in token vector
    const token_vector::iterator end = p->second->end();
    return std::find(p->second->begin(), end, token) != end;
}

/*!
    Get all the tokens in a production's set vector as a string.
*/

std::string
set_map::get_vector(const int production) const
{
    set_productions::iterator p = map_->find(production);

    if ( p == map_->end() )
    {
        // production not in map
        RUNTIME_ERROR("Production '%s' is not in the map.\n",
                      reverse_lookup(production).c_str());
    }

    std::string s;
    token_vector::const_iterator i = p->second->begin();
    token_vector::const_iterator end = p->second->end();
    for ( ; i != end; ++i)
    {
        s +=  reverse_lookup(*i);
    }
    return s;
}

std::string
set_map::get_vector(const std::string &x) const
{
    int production = lookup(x);
    set_productions::iterator p = map_->find(production);

    if ( p == map_->end() )
    {
        // production not in map
        RUNTIME_ERROR("Production '%s' is not in the map.\n",
                      reverse_lookup(production).c_str());
    }

    std::string s;
    token_vector::const_iterator i = p->second->begin();
    token_vector::const_iterator end = p->second->end();
    for ( ; i != end; ++i)
    {
        s +=  reverse_lookup(*i) + " ";
    }
    return s;
}

////////////////////////////////////////////////////////////////////////////////
// Not in class
////////////////////////////////////////////////////////////////////////////////

/*!
    I'm too sexy for my code.
*/

std::ostream &
operator <<(std::ostream &o, const set_map &m)
{
    set_productions::const_iterator i = m.map_->begin();
    const set_productions::const_iterator e = m.map_->end();

    for ( ; i != e; ++i)
    {
        token_vector *p = i->second;
        o << m.reverse_lookup(i->first) << ": ";
        for(unsigned int x = 0; x < p->size(); ++x)
        {
            o << m.reverse_lookup((*p)[x]) << " ";
        }
        o << "\n";
    }
    return o;
}

