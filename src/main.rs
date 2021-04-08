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

mane!({
    let prefixes = vec![
        DefOp!(Prefix, |x: Num| {-x}, "-", "subtraction"),
        // DefOp!(Prefix, |x: Num| {~x}, "~", "bitwise not")
    ];
    let infixes = vec![
        DefOp!(Infix, |x: Num, y: Num| {x + y}, "+", "addition"),
        DefOp!(Infix, |x: Num, y: Num| {x - y}, "-", "subtraction"),
        DefOp!(Infix, |x: Num, y: Num| {x * y}, "*", "multiplication"),
        DefOp!(Infix, |x: Num, y: Num| {x / y}, "/", "division"),
        DefOp!(Infix, |x: Num, y: Num| {x % y}, "/", "modulus"),
    ];

    let x = 10;
    let y = 20;
    for i in infixes {
        println!("{}: {} {} {} = {}", i.description, x, i.symbol, y, 
                 (i.operation)(x, y));
    }
});
