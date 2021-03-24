//
//  ContentView.swift
//  Swift_01
//
//  Created by mumu on 2021/3/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var brain: CalculatorBrain = CalculatorBrain.left("0")
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text(brain.output)
                .font(.system(size: 76))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .lineLimit(1)
            Button("test") {
                self.brain = .left("1.23")
            }
            CalculatorButtonPad()
                .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        Group {
            ContentView().previewDevice("iPhone SE")
        }
    }
}

struct CalculatorButtonPad: View {
    
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 8) {
            ForEach(pad, id: \.self) { item in
                CalculatorButtonRow(row: item)
            }
        }
    }
}

struct CalculatorButtonRow: View {
    
    let row: [CalculatorButtonItem]
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
                    print("click->\(item.title)")
                }
                
            }
        }
    }
}

struct CalculatorButton: View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height, alignment: .center)
                .background(Color(backgroundColorName))
                .cornerRadius(44)
        })
    }
}
