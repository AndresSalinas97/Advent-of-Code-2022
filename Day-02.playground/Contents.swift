//
//  Advent of Code 2022 - Day 02: Rock Paper Scissors
//
//  Created by Andrés Salinas Lima on 02/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")!
let input = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)

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
    let hisChoiceDict: [Character: Shape] = ["A": .rock, "B": .paper, "C": .scissors]
    let myChoiceDict: [Character: Shape] = ["X": .rock, "Y": .paper, "Z": .scissors]

    var totalScore = 0

    input.enumerateLines { line, _ in
        let hisChoiceChar = line.first!
        let myChoiceChar = line.last!

        let hisChoice = hisChoiceDict[hisChoiceChar]!
        let myChoice = myChoiceDict[myChoiceChar]!

        totalScore += getRoundScore(hisChoice: hisChoice, myChoice: myChoice)
    }

    return totalScore
}

print("PART ONE: \(partOne())")

// MARK: - PART TWO

func partTwo() -> Int {
    let hisChoiceDict: [Character: Shape] = ["A": .rock, "B": .paper, "C": .scissors]

    var totalScore = 0

    input.enumerateLines { line, _ in
        let hisChoiceChar = line.first!
        let myStrategyChar = line.last!

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
