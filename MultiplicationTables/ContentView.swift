//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Jon Spight on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var multiplcationTable  = 2
    let numOfQues = [5, 10, 20]
    @State private var numOfQue = 5
    @State private var answer : Int?
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.blue.opacity(0.15)
                    .ignoresSafeArea()
                VStack {
                    Stepper(value: $multiplcationTable, in: (2...12)) {
                        Text("Multiples of: **\(multiplcationTable)**")
                    }
                    .animation(.bouncy, value: numOfQue)
                    
                    
                    Picker("Number of questions", selection: $numOfQue) {
                        ForEach(numOfQues, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                        ForEach(0 ..< numOfQue, id: \.self) {_ in
                            
                            //keep track of right answeres
                            //if answer is wrong background light red - or light green for right
                            //add animations
                            let random = Int.random(in: 2...13)
                            let ans = random * multiplcationTable
                                TextField("What is \(multiplcationTable) * \(random)?",
                                          value: $answer,
                                          formatter: NumberFormatter())
                                .background(.white.opacity(0.75))
                                .keyboardType(.numberPad)
                                .animation(.smooth, value: numOfQue)
                        }
                        .onSubmit {
                            // check answer here and udpate score! 
                        }
                        
                    Text("Score: ")
                    
                }
                .padding()
                .navigationTitle("Multi Tables")
            }
        }
    }
}

#Preview {
    ContentView()
}
