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

/// The type of token that we are parsing.
enum TokenType {
    Expression, Literal
}

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
    Num result = 0.0;
    int i;
    // detects the type of token from a given input
    TokenType detectTokenType(immutable string input) {
        // iterate through all prefix and infix operators and see if any of
        // them match
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
        immutable string symbol = input[i++];
        immutable TokenType tokenType = detectTokenType(symbol);
        // FIXME: how the fuck do i do struct definitions???
        Token token = {
            tokenType:tokenType;
            symbol:symbol;
        };
        return token;
    }

    return result;
}

void main()
{

}
