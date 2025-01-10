//
//  ContentView.swift
//  OXQuizApp
//
//  Created by 최하진 on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var number1: Int = Int.random(in: 1 ... 9)
    @State var number2: Int = Int.random(in: 1 ... 9)
    @State var resultNumber: Int = Int.random(in: 1 ... 81)
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    
    var body: some View {
        // UI 구성 및 로직 작성 부분
        ZStack{
            Color.OX.ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("OXQuiz")
                    .font(.largeTitle)
                    .padding()
                Spacer()
                
                HStack{
                    Spacer()
                    Text("정답 수 : \(countCorrect)")
                    Spacer()
                    Text("오답 수 : \(countWrong)")
                    Spacer()
                }
                Spacer()
                
                
                Text("\(number1) × \(number2) = \(resultNumber)" )
                    .font(.system(size: 60))
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button(action: {
                        if number1 * number2 == resultNumber {
                            selectCorrect()
                        } else {
                            selectWrong()
                        }
                        
                    }
                           , label:
                            {Text("◯")
                            .font(.system(size: 50))
                            .foregroundStyle(Color.blue)
                    })
                    .padding()
                    
                    Spacer()
                    Button(action: {
                        if number1 * number2 != resultNumber {
                            selectCorrect()
                        } else {
                            selectWrong()
                        }}
                           , label:
                            {Text("╳")
                            .font(.system(size: 40))
                            .foregroundStyle(Color.red)
                    })
                    Spacer()
                    
                }
                
                Button(action: {reloadGame()}
                       , label:
                        {Text("Game Reset")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.gray)
                        .padding(20)
                        .background(Color(white: 0.862))
                        .cornerRadius(30)
                })
                .padding()
                Spacer()
                
            }
        }
    }
    func reloadGame() {
        // 게임 재시작 로직
        countCorrect = 0
        countWrong = 0
        numberReset()
    }
    func selectCorrect() {
        // 정답 선택 시 로직
        countCorrect += 1
        numberReset()
    }
    func selectWrong() {
        // 오답 선택 시 로직
        countWrong += 1
        numberReset()
    }
    func numberReset() {//숫자 리셋
        number1 = Int.random(in: 0 ... 9)
        number2 = Int.random(in: 0 ... 9)
        resultNumber = Bool.random() ? number1 * number2 : Int.random(in: 0 ... 81)
    }
}



#Preview {
    ContentView()
}
