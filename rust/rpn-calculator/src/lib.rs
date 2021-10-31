#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    let mut stk = Vec::with_capacity(inputs.len());
    for i in inputs {
        if let CalculatorInput::Value(v) = i {
            stk.push(*v);
        } else {
            let rhs = stk.pop()?;
            let lhs = stk.pop()?;
            stk.push(match i {
                &CalculatorInput::Add => lhs + rhs,
                &CalculatorInput::Subtract => lhs - rhs,
                &CalculatorInput::Multiply => lhs * rhs,
                &CalculatorInput::Divide => lhs / rhs,
                _ => panic!("impossible"),
            })
        }
    }
    if stk.len() == 1 {
        stk.pop()
    } else {
        None
    }
}
