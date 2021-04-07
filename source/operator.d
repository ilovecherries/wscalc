module operator;

alias Num = double;

/// Operations that modify numbers
class Operator (T)
{
    /// The operation that is executed when this operator is found
    T operation;
    /// The symbol that represents the operation such as "+" or "-"
    string symbol;
    /// The alias that is represented in the program.
    string altName;

    /// Contstructs an Operator
    this(string symbol, T operation, string altName) {
        this.symbol = symbol;
        this.operation = operation;
        this.altName = altName;
    }
}

alias Prefix = Operator!(Num function(Num));
alias Infix = Operator!(Num function(Num, Num));