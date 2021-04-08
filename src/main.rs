use muncher::Muncher;

type Num = i32;

type Infix = fn(Num, Num) -> Num;
type Prefix = fn(Num) -> Num;

macro_rules! mane {($owo:block) => {fn main() {$owo}};}

struct Operator<'a, T> {
   operation: T,
   symbol: &'a str,
   description: &'a str
}

macro_rules! DefOp {
    ($type:ident, $op_lambda:expr, $sym:expr, $desc:expr) => {
        Operator::<Box<$type>> {
            operation: Box::new($op_lambda),
            symbol: $sym,
            description: $desc
        }
    }
}

macro_rules! Ops {
    [$($owo:expr),+] => {
        {
            let mut v = vec![$($owo),+];
            v.sort_by(|a, b| 
                b.symbol.chars().count()
                .cmp(&a.symbol.chars().count()));
            v
        };
    };
}

// this only works on infix operators right now because im too lazy
fn doline<'a>(infix: Vec<Operator<Box<Infix>>>, prefix: Vec<Operator<Box<Prefix>>>,
          input: &'a str) -> Num
{
    enum Expected {
        PrefixOrLiteral, Literal, Infix
    }
    let mut result: Num;
    // first we expect a prefix or literal: - or 20
    let mut expectNext = Expected::Literal;
    let mut m = Muncher::new(input);
    println!("{}", match expectNext {
        Expected::Literal => m.eat_until(|ch| !ch.is_digit(10)).collect::<String>(),
        _ => String::from("...") 
    });
    return 0;
}

mane!({
    let prefixes = Ops![
        DefOp!(Prefix, |x: Num| {-x}, "-", "subtraction")
        // DefOp!(Prefix, |x: Num| {~x}, "~", "bitwise not")
    ];

    let infixes = Ops![
        DefOp!(Infix, |x: Num, y: Num| {x + y}, "+", "addition"), 
        DefOp!(Infix, |x: Num, y: Num| {x - y}, "-", "subtraction"),
        DefOp!(Infix, |x: Num, y: Num| {x * y}, "*", "multiplication"),
        DefOp!(Infix, |x: Num, y: Num| {x / y}, "/", "division"),
        DefOp!(Infix, |x: Num, y: Num| {x % y}, "%", "modulus")
    ];

    let x = 10;
    let y = 20;
    for i in &infixes {
        println!("{}: {} {} {} = {}", i.description, x, i.symbol, y,
                 (i.operation)(x, y));
    }

    println!("{}", doline(infixes, prefixes, "321+5"));
});
