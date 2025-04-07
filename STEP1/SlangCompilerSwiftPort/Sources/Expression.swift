//
//  Untitled.swift
//  SlangCompilerSwiftPort
//
//  Created by workspace on 07/04/25.
//


protocol Expression {
    func evaluate(context: RuntimeContext) -> Double
}


struct NumericConstant: Expression {
    private let value: Double
    
    init(_ value: Double) {
        self.value = value
    }
    
    func evaluate(context: RuntimeContext) -> Double {
        return value
    }
}

struct BinaryExpression: Expression {
    
    private let left: Expression
    private let right: Expression
    private let op: Operator
    
    init(_ left: Expression, _ op: Operator, _ right: Expression) {
        self.left = left
        self.op = op
        self.right = right
    }
    
    func evaluate(context cotext: RuntimeContext) -> Double {
        switch(op) {
        case .add:
            return left.evaluate(context: cotext) + right.evaluate(context: cotext)
        case .subtract:
            return left.evaluate(context: cotext) - right.evaluate(context: cotext)
        case .multiply:
            return left.evaluate(context: cotext) * right.evaluate(context: cotext)
        case .divide:
            return left.evaluate(context: cotext) / right.evaluate(context: cotext)
        case .illegal:
            return Double.nan
        }
    }

}

struct UnaryExpression: Expression {
    private let expression: Expression
    private let op: Operator
    
    init(_ expression: Expression, _ op: Operator) {
        self.expression = expression
        self.op = op
    }
    
    func evaluate(context: RuntimeContext) -> Double {
        switch op {
        case .add:
            return +expression.evaluate(context: context)
        case .subtract:
            return -expression.evaluate(context: context)
        default:
            return Double.nan
        }
    }
}

enum Operator {
    case add
    case subtract
    case multiply
    case divide
    case illegal
}


