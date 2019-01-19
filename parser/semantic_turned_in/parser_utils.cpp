////////////////////////////////////////////////////////////////////////////////
// Author: Robert Crocombe
// Class: CS453 Fall 04
// Professor: Debray
// Other People's Code: No
//
// See header.
////////////////////////////////////////////////////////////////////////////////

#include "parser_utils.h"
#include "set_map.h"

#include <cstdarg>
#include <sstream>
#include <iostream>
using std::cerr;

extern unsigned int line_number;    // from scanner

/*!
    Generates error text that will be reported when exception is
    caught.
*/

void
parser_utils::error
(
    const std::string &msg,
    const std::string &text,
    const int token,
    const std::string &last_text,
    const int last_token,
    const unsigned int line,
    const char * const file
)
{
    std::ostringstream s;

    s << "Hit a syntax error at line " << line_number << " of the input.\n"
      << msg << "\n"
//    << file << " line " << line
//      << " hit a syntax error at line " << line_number << " of the input.\n"
      << "Input text was '" << text << "', giving us the token "
      << set_map::reverse_lookup(token) << "\n"
      << "Last thing before that was the text '" << last_text
      << "', giving the token '" << set_map::reverse_lookup(last_token) <<"'\n";

/*
    s << msg
      << ": at line " << line << " in file " << file << "\n"
      << "We were parsing this text: '" << text << "'\n"
      << "At line " << line_number << " of the input and hit token '"
      << set_map::reverse_lookup(token)
      << "'.  The token before that was '"
      << set_map::reverse_lookup(last_token) << "'\n";
*/

    // I want EOF to go all the way out
    if (token == EOF)
    {
        throw EOF_error(s.str().c_str());
    }

    // we catch syntax_error lots of places
    throw syntax_error(s.str().c_str());
}

void
parser_utils::semantics_error
(
    const unsigned int line,
    const char * const file,
    const char * const message
)
{
    std::ostringstream s;

    //s << "Semantic error at line " << line_number << " of the input.\n"
    // << msg << "\n"

    s << "Semantic error at line " << line_number << " of the input\n"
      << "Error reported as:\n\"" << message << "\"\n";

    throw semantic_error(s.str().c_str());
}

void
parser_utils::warning
(
    const unsigned int line,
    const char * const file,
    const char * const message
)
{
    cerr << "WARNING: '" << message
         << "' while checking input line " << line_number << "\n";
}

/*!
    Yeah, cout is type safe, but my god is it bulky and irritating.
*/

char *
parser_utils::smoosh(const char * const format, ...)
{
    // not good practice, but WTF, yo.  Can't overflow because of
    // vsnprintf(), but could truncate.
    const int BUF_SIZE = 512 + 1;
    static char buffer[BUF_SIZE];

    std::va_list ap;

    va_start( ap, format);
    vsnprintf(buffer, BUF_SIZE, format, ap);
    va_end(ap);

    return buffer;
}

////////////////////////////////////////////////////////////////////////////////
// Not in class
////////////////////////////////////////////////////////////////////////////////

/*!
    Handy for seeing what's in a particular vector of tokens (i.e. the
    FIRST/FOLLOW set of a single production)
*/

std::ostream &
operator <<(std::ostream &o, const token_vector &v)
{
    for (unsigned int i = 0; i < v.size(); ++i)
    {
        o << set_map::reverse_lookup(v[i]) << " ";
    }
    o << "\n";
    return o;
}

