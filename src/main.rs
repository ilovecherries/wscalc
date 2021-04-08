type Num = i32;

struct Operator<'a, T> {
	operation: T,
	symbol: &'a str,
	description: &'a str
}

macro_rules! DefOp {
    ($op_lambda:expr, $sym:expr, $desc:expr) => {
        Operator {
            operation: Box::new($op_lambda),
            symbol: $sym,
            description: $desc
        }
    }
}

fn main() {
    let infix_test2 = DefOp!(|x: Num, y: Num| {x + y}, "+", "addition");
        
    println!("{}", (infix_test2.operation)(2, 3));
}
