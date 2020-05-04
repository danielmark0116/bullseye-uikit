//
//  GameHandler.swift
//  bullsEye
//
//  Created by Daniel Grychtoł on 25/04/2020.
//  Copyright © 2020 Daniel Grychtoł. All rights reserved.
//

import Foundation

protocol Game {
    var value: Int {get set}
    var target: Int {get set}
    var playersPoints: Int {get set}
    var treshold: Int {get set}
    
    init(_ arg: Int)
    
    mutating func setValue(_ arg: Float)
    func getValue() -> Int
    mutating func getNewTarget()
    mutating func wasCloseToTarget() -> Bool
    mutating func gameReset()
}

struct GameHandler: Game {
    var value: Int = 0
    var target: Int = Int.random(in: 0...100)
    var playersPoints: Int = 0
    var treshold: Int;
    
    init(_ treshold: Int) {
        self.treshold = treshold
    }
    
    mutating func setValue(_ points: Float) {
        self.value = Int(points.rounded())
    }
    
    func getValue() -> Int {
        return self.value
    }
    
    mutating func getNewTarget() {
        self.target = Int.random(in: 0...100)
    }
    
    mutating func wasCloseToTarget() -> Bool {
        let wasClose: Bool = abs(target - value) < self.treshold
        
        if wasClose {
            self.playersPoints += 10
        }
        
        return wasClose
    }
    
    mutating func gameReset() {
        self.getNewTarget()
        self.playersPoints = 0
    }
}
