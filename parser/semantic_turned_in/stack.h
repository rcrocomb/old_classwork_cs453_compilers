#ifndef STACK_H
#define STACK_H

////////////////////////////////////////////////////////////////////////////////
// Author: Robert Crocombe
// Class: CS453 Fall 04
// Professor: Debray
// Other People's Code: No
//
// A basic templated stack type with a few extra routines that turned
// out to be handy.  I guess it's a good think I didn't notice
// std::stack until too late.  It's an all header implementation.
//
// Only used for debugging.
////////////////////////////////////////////////////////////////////////////////

template <typename T>
class stack
{
private:

    // don't do pointers for allocated memory, only aliases (or
    // do the specialization yourself!)
    std::vector<T> stack_;

public:

    stack(void) : stack_() {}
    ~stack(void) {}

    bool pop_until(const T &reach)
    {
        while (!empty() && (peek() != reach)) pop();
        return !empty();
    }

    void clear(void) { stack_.clear(); }
    int size(void) const { return stack_.size(); }
    bool empty(void) const { return stack_.empty(); }

    void push(const T &d)
    {
        stack_.push_back(d);
    }

    T pop(void)
    {
        if ( empty() ) { return 0; }
        T d = stack_.back();
        stack_.pop_back();
        return d;
    }

    T peek(void)
    {
        return empty() ? 0 : stack_.back();
    }

};

#endif  // STACK_H

