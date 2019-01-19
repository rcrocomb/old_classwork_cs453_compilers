#ifndef PARSER_UTILS_H
#define PARSER_UTILS_H

////////////////////////////////////////////////////////////////////////////////
// Author: Robert Crocombe
// Class: CS453 Fall 04
// Professor: Debray
// Other People's Code: Err, no.
//
// Two exception types that make syntax error recovery more
// manageable.
//
// Also, a bunch of typedefs that hold useful stuff.
//
// Finally, a few routines necessary when generating errors.
////////////////////////////////////////////////////////////////////////////////

#include <string>
#include <vector>
#include <map>
#include <stdexcept>
#include <iosfwd>

////////////////////////////////////////////////////////////////////////////////
// Types
////////////////////////////////////////////////////////////////////////////////

typedef std::vector<int> token_vector;
typedef std::map< std::string, int > production_map;
typedef std::map< int, token_vector *> set_productions;

class field_info;
typedef std::vector<field_info *> field_vector;

class syntax_error : public std::runtime_error
{
public:
    explicit syntax_error(const std::string &s): runtime_error(s) {}
    ~syntax_error(void) throw() {}
};

class EOF_error: public std::runtime_error
{
public:
    explicit EOF_error(const std::string &s): runtime_error(s) {}
    ~EOF_error(void) throw() {}
};

class semantic_error: public std::runtime_error
{
public:
    explicit semantic_error(const std::string &s): runtime_error(s) {}
    ~semantic_error(void) throw() {}
};

////////////////////////////////////////////////////////////////////////////////
// Useful junk
////////////////////////////////////////////////////////////////////////////////

#define SEMANTICS(format, ...) \
    do { \
        parser_utils::semantics_error(__LINE__,\
                                      __FILE__,\
                                       parser_utils::smoosh(format, ## __VA_ARGS__)); \
    } while (0)


#define WARNING(format, ...) \
    do { \
        parser_utils::warning(__LINE__,\
                              __FILE__,\
                              parser_utils::smoosh(format, ## __VA_ARGS__));\
    } while (0)

// C++ really needs __func__ like C99 has.
#define RUNTIME_ERROR(format, ...) \
    do { \
        throw std::runtime_error(parser_utils::smoosh(format, ## __VA_ARGS__)); \
    } while(0)

namespace parser_utils
{
    void error(const std::string &msg,
               const std::string &text,
               const int token,
               const std::string &last_text,
               const int last_token,
               const unsigned int line,
               const char * const file);

    void semantics_error(const unsigned int line,
                         const char * const file,
                         const char * const msg);

    void warning(const unsigned int line,
                 const char * const file,
                 const char * const msg);



    // God bless varargs!
    char * smoosh(const char * const format, ...);
}

std::ostream &operator <<(std::ostream &o, const token_vector &v);

#endif  // PARSER_UTILS_H

