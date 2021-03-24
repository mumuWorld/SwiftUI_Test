//
//  Reducer.swift
//  Calculator
//
//  Created by mumu on 2021/3/19.
//  Copyright © 2021 OneV's Den. All rights reserved.
//

import Foundation

typealias CalculatorState = CalculatorBrain
typealias CalculatorStateAction = CalculatorButtonItem

struct Reducer {
    static func reduce (state: CalculatorState, action: CalculatorStateAction) -> CalculatorState {
        return state.apply(item: action)
    }
}
