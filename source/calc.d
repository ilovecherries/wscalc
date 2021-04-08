module calc;

import operator;
import std.stdio;
import std.algorithm.searching;

/// Base prefix operators
Prefix[] prefixOperators = [
    new Prefix("-", (Num x) => -x, "negative"),
    new Prefix("~", (Num x) => x, "bitwise not")
];

/// Base infix operators
Infix[] infixOperators = [
    new Infix("+", (Num x, y) => x + y, "add"),
    new Infix("-", (Num x, y) => x - y, "subtract"),
    new Infix("*", (Num x, y) => x * y, "multiply"),
    new Infix("/", (Num x, y) => x / y, "divide"),
    new Infix("%", (Num x, y) => x % y, "modules")
];

/// The representation of the AST for the calculator
struct Token {
    /// The type of token that is being contained
    TokenType type;
    /// The text representation of the token
    string symbol;
}

/// parses a line and does calculations on the line
/// only does infix operations right now because I am incredibly lazy
/// 12 probably doesn't want me to do it this way, but I am too sleep
/// deprived right now to look at what they did
Num doline(immutable string input) 
{
    // These are the types of tokens that we expect to parse next
    enum Expect{
        Infix, Prefix, 
        Literal, InfixOrLiteral
    }
    // detects the type of token from a given input
    TokenType correctTokenType(immutable string input, Expect expected) {
        // iterate through all prefix and infix operators and see if any of
        // them match
        
        switch (expected) {
            case Expect.Infix:
        }
        foreach (Prefix p; prefixOperators) {
            if (input.startsWith(p.symbol))
                return TokenType.Expression;
        }
        foreach (Infix i; infixOperators) {
            if (input.startsWith(i.symbol))
                return TokenType.Expression;
        }
        return TokenType.Literal;
    }
    // grabs the next token from the input
    Token next() {
        // TODO: whatever char at is idc fix this later i just want to sleep
        // i think
        immutable string symbol = input;
        immutable TokenType tokenType = detectTokenType(symbol);
        // TODO: need to figure out shorthand
        Token token;
        token.type = tokenType;
        token.symbol = symbol;
        return token;
    }
    Expect expectNext = Expect.InfixOrLiteral;
    Num result = 0.0;
    int i;

    return result;
}

/// Integer infix operations
unittest
{
    assert(doline("15+20") == 35.0);
    assert(doline("15-20") == -5.0);
    assert(doline("15*20") == 300.0);
    assert(doline("15/20") == 0.75);
    assert(doline("15%20") == 15);
}

/// Integer infix operations
unittest
{
    assert(doline("-15.0") == -15.0);
}

void main()
{
    writefln(":(");
}
