//
//  ContentView.swift
//  Calculator
//
//  Created by User on 1/18/24.
//

import SwiftUI

enum CalcButton: String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
}

enum Operation{
    case add, subtract, multiply, divide, none
}

let math = calMaths()

struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation : Operation?
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            // Display Result
            VStack{
                HStack{
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                }
                .padding()
                
                // buttons
                ForEach(buttons, id: \.self){ row in
                    HStack(spacing:12){
                        ForEach(row, id: \.self){ item in
                            Button(action: {
                                self.didTabp(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .frame(width: self.buttonWidth(item: item), height: self.buttonheight())
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(50)
                                    .font(.system(size: 35))
                                    .bold()
                            })
                            
                        }
                    }

                    .padding(.bottom, 3)
                }
                
            }

            
        }

    }
    func didTabp(button: CalcButton){
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add{
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiply{
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .subtract{
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide{
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal{
                
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add:
                    self.value = "\(math.addNumbers(x: runningValue, y: currentValue))"
                case .subtract:
                    self.value = "\(math.subNumbers(x: runningValue, y: currentValue))"
                case .multiply:
                    self.value = "\(math.multiplyNumbers(x: runningValue, y: currentValue))"
                case .divide:
                    self.value = "\(math.divNumbers(x: runningValue, y: currentValue))"
                case nil:
                    break
                case .some(.none):
                    break
                }
            }
            
            if button != .equal {
                self.value = "0"
            }
            
        case .clear:
            self.value = "0"
        case  .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0"{
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
        
    }
    
    func buttonWidth(item: CalcButton) -> CGFloat{
        if item == .zero{
            return (UIScreen.main.bounds.width - (4*12)) / 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    func buttonheight() -> CGFloat{
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
}

#Preview {
    ContentView()
}
