module calc;

import operator;
import std.stdio;

void main()
{
    Operator!Prefix[] prefixOperators = [
        new Operator!Prefix("-", (int x) => -x, "negative"),
        new Operator!Prefix("~", (int x) => ~x, "bitwise not")
    ];
    Operator!Infix[] infixOperators = [
        new Operator!Infix("+", (int x, y) => x + y, "add"),
        new Operator!Infix("-", (int x, y) => x - y, "subtract"),
        new Operator!Infix("*", (int x, y) => x * y, "multiply"),
        new Operator!Infix("/", (int x, y) => x / y, "divide"),
        new Operator!Infix("%", (int x, y) => x % y, "modules")
    ];

    int x = 15, y = 20;
    foreach (Operator!Infix i; infixOperators) {
        writefln("%d %s %d = %d", x, i.symbol, y, i.operation(x, y));
    }
    foreach (Operator!Prefix i; prefixOperators) {
        writefln("%s%d = %d", i.symbol, x, i.operation(x));
    }
}
