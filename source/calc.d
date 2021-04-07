module calc;

import operator;
import std.stdio;

void main()
{
    Prefix[] prefixOperators = [
        new Prefix("-", (Num x) => -x, "negative"),
        new Prefix("~", (Num x) => x, "bitwise not")
    ];
    Infix[] infixOperators = [
        new Infix("+", (Num x, y) => x + y, "add"),
        new Infix("-", (Num x, y) => x - y, "subtract"),
        new Infix("*", (Num x, y) => x * y, "multiply"),
        new Infix("/", (Num x, y) => x / y, "divide"),
        new Infix("%", (Num x, y) => x % y, "modules")
    ];

    double x = 15, y = 20;
    foreach (Infix i; infixOperators) {
        writefln("%f %s %f = %f", x, i.symbol, y, i.operation(x, y));
    }
    foreach (Prefix i; prefixOperators) {
        writefln("%s%f = %f", i.symbol, x, i.operation(x));
    }
}
