//
//  main.swift
//  MontyHall
//
//  Created by Usman Rashid on 1/25/19.
//  Copyright © 2019 Usman Rashid. All rights reserved.
//

import Foundation

enum Option : Int {
    case Stay = 0
    case Switch
}

print("Let us play Monty Hall Puzzle!")
var numOfGames = 1000000
var option = Option.Switch
var wins = 0
var losses = 0

print("Playing \(numOfGames) games")
print ("Option: \(option)")

for _ in 0..<numOfGames {
    
    // Three doors, all empty
    var doors : [Int] = [0, 0, 0]
    
    // Assign car to a random door
    let car = Int(arc4random_uniform(3))
    doors[car] = 1
    
    // Contestant picks a random door as initial choice
    var choice = Int(arc4random_uniform(3))

    // Monty opens a door that doesn't have the car
    // and is not chosen by the contestant
    var opened = -1
    for door in 0...2 {
        if door == choice {
            continue
        }
        
        if doors[door] == 0 {
            opened = door
        }
    }
    
    // If the option was to switch doors, choose the door
    // that is neither the initial choice nor opened by Monty
    let initialChoice = choice
    if option == .Switch {
        for door in 0...2 {
            if door != initialChoice && door != opened {
                choice = door
            }
        }
    }
    
//    print ("Initial: \(initialChoice), Opened: \(opened), Final: \(choice)")
    
    // Record whether contestant won or lost
    doors[choice] == 1 ? (wins += 1) : (losses += 1)
}

print ("Wins: \(wins)")
print ("Losses: \(losses)")
