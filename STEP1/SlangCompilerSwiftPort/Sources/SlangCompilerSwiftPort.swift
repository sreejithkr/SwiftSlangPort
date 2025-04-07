// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct SlangCompilerSwiftPort: ParsableCommand {
    mutating func run() throws {
        print("Hello, world!")
        
        // Abstract Syntax Tree (AST) for 5*10
        let runtimeContex = RuntimeContext()
        
        let exp =  BinaryExpression(NumericConstant(5), .multiply, NumericConstant(10))
        
        print(exp.evaluate(context: runtimeContex))
        
        // AST for  (10 + (30 + 50 ) )
        let exp2 = BinaryExpression(
            NumericConstant(10),
            .add,
            BinaryExpression(
                NumericConstant(30),
               .add,
                NumericConstant(50)
            )
        )
        print(exp2.evaluate(context: runtimeContex))
        //NOTE : The above is not accurate representation of the AST
        // Can you guess why ?
        
        
    }
}
