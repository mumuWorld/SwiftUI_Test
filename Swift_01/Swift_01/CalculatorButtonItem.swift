//
//  CalculatorButtonItem.swift
//  Swift_01
//
//  Created by mumu on 2021/3/18.
//

import Foundation
import CoreGraphics

enum CalculatorButtonItem: Hashable {
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "x"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    /// 数字
    case digit(Int)
    /// 小数点
    case dot
    
    case op(Op)
    
    case command(Command)
}

extension CalculatorButtonItem {
    
    var title: String {
        switch self {
        case .digit(let value): return String(value)
        case .command(let value): return value.rawValue
        case .dot: return "."
        case .op(let value): return value.rawValue
        }
    }
    
    var size: CGSize {
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 88 * 2, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit , .dot: return "digitBackground"
        case .op: return "operatorBackground"
        case .command: return "commandBackground"
        }
    }
    
}
