module operator;

alias Prefix = int function(int);
alias Infix = int function(int, int);

/// Operations that modify numbers
class Operator (T)
{
    /// The operation that is executed when this operator is found
    T operation;
    /// The symbol that represents the operation such as "+" or "-"
    string symbol;
    /// The alias that is represented in the program.
    string altName;

    /// Creates a constructor for the number
    this(string symbol, T operation, string altName) {
        this.symbol = symbol;
        this.operation = operation;
        this.altName = altName;
    }
}