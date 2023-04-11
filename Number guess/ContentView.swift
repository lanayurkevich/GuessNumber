//
//  ContentView.swift
//  Number guess
//
//  Created by Svetlana Yurkevich on 11/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var userInput: String = ""
    @State var viewModel = ViewModel(min: 1, max: 20)
    
    var body: some View {
        VStack {
            Image(systemName: "questionmark.bubble")
                .resizable()
                .frame(width: 50.0, height: 50.0)
                .foregroundColor(.purple)
                .padding(.top, 50)
            Text("I am thinking of a number between \(viewModel.minNumber) and \(viewModel.maxNumber)")
                .padding(.bottom)
            Text(viewModel.display)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            TextField("Guess Number", text: $userInput)
                .keyboardType(.numberPad)
            Button("Try") {
                viewModel.tryNumber(input: userInput)
            }
            Spacer()
        }
        .padding()
        .buttonStyle(.borderedProminent)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
