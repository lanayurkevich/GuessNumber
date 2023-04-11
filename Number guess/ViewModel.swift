//
//  ViewModel.swift
//  Number guess
//
//  Created by Svetlana Yurkevich on 11/04/2023.
//

import Foundation


class ViewModel: ObservableObject {
    
    enum State {
        case initial
        case winning
        case greater
        case smaller
        case inputError
    }
    
    @Published var minNumber = 1
    @Published var maxNumber = 20
    @Published var display = "Take a guess"
    @Published var state: State = .initial
    
    private var counter: Int = 0
    private var secret: Int = 0
    
    init(min: Int, max: Int, secret: Int? = nil) {
        self.minNumber = min
        self.maxNumber = max
        
        if let secret {
            self.secret = secret
        } else {
            createRandomNumber()
        }
    }
    
    func createRandomNumber() {
        secret = Int.random(in: minNumber ... maxNumber)
    }
    
    func tryNumber(input: String) {
        counter += 1
                
        guard let number = Int(input) else {
            state = .inputError
            return
        }
        
        if number == secret {
            state = .winning
        } else if number < secret {
            state = .smaller
        } else {
            state = .greater
        }
    }
}
