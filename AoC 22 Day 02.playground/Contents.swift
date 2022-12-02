//
//  Advent of Code 2022 - Day 2: Rock Paper Scissors
//
//  Created by Andrés Salinas Lima on 02/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

var rounds = input.components(separatedBy: "\n")
while rounds.last!.isEmpty {
    rounds.removeLast() // Removes the empty lines at the end (if any)
}

enum Shape: Int {
    case rock = 1
    case paper = 2
    case scissors = 3
}

func getRoundScore(hisChoice: Shape, myChoice: Shape) -> Int {
    // Draw
    if hisChoice == myChoice {
        return 3 + myChoice.rawValue
    }

    // Won
    if (hisChoice == .rock && myChoice == .paper) ||
        (hisChoice == .paper && myChoice == .scissors) ||
        (hisChoice == .scissors && myChoice == .rock)
    {
        return 6 + myChoice.rawValue
    }

    // Lost
    return myChoice.rawValue
}

// MARK: - PART ONE

func partOne() -> Int {
    let hisChoiceDict: Dictionary<Character, Shape> = ["A": .rock, "B": .paper, "C": .scissors]
    let myChoiceDict: Dictionary<Character, Shape> = ["X": .rock, "Y": .paper, "Z": .scissors]

    
    var totalScore = 0

    for round in rounds {
        let hisChoiceChar = round.first!
        let myChoiceChar = round.last!

        let hisChoice = hisChoiceDict[hisChoiceChar]!
        let myChoice = myChoiceDict[myChoiceChar]!

        totalScore += getRoundScore(hisChoice: hisChoice, myChoice: myChoice)
    }

    return totalScore
}

print("PART ONE: \(partOne())")

// MARK: - PART TWO

func partTwo() -> Int {
    let hisChoiceDict: Dictionary<Character, Shape> = ["A": .rock, "B": .paper, "C": .scissors]

    var totalScore = 0

    for round in rounds {
        let hisChoiceChar = round.first!
        let myStrategyChar = round.last!

        let hisChoice = hisChoiceDict[hisChoiceChar]!

        let myChoice: Shape

        // Lose Strategy
        if myStrategyChar == "X" {
            switch hisChoice {
            case .rock:
                myChoice = .scissors
            case .paper:
                myChoice = .rock
            case .scissors:
                myChoice = .paper
            }
        }

        // Draw Strategy
        else if myStrategyChar == "Y" {
            myChoice = hisChoice
        }

        // Win Strategy
        else {
            switch hisChoice {
            case .rock:
                myChoice = .paper
            case .paper:
                myChoice = .scissors
            case .scissors:
                myChoice = .rock
            }
        }

        totalScore += getRoundScore(hisChoice: hisChoice, myChoice: myChoice)
    }

    return totalScore
}

print("PART TWO: \(partTwo())")
