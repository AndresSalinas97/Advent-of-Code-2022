//
//  Advent of Code 2022 - Day 2: Rock Paper Scissors
//
//  Created by Andrés Salinas Lima on 02/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

var rounds = input.components(separatedBy: "\n")
rounds.removeAll { $0.isEmpty }

func getRoundScore(hisChoice: Character, myChoice: Character) -> Int {
    var roundScore = 0

    // Shape Score
    if myChoice == "X" {
        roundScore += 1
    } else if myChoice == "Y" {
        roundScore += 2
    } else {
        roundScore += 3
    }

    // Round Score
    if hisChoice == "A" {
        if myChoice == "X" {
            roundScore += 3
        } else if myChoice == "Y" {
            roundScore += 6
        }
    } else if hisChoice == "B" {
        if myChoice == "Y" {
            roundScore += 3
        } else if myChoice == "Z" {
            roundScore += 6
        }
    } else {
        if myChoice == "X" {
            roundScore += 6
        } else if myChoice == "Z" {
            roundScore += 3
        }
    }

    return roundScore
}

func partOne() -> Int {
    var totalScore = 0

    for round in rounds {
        let hisChoice = round[round.startIndex]
        let myChoice = round[round.index(before: round.endIndex)]

        totalScore += getRoundScore(hisChoice: hisChoice, myChoice: myChoice)
    }
    return totalScore
}

print("PART ONE: \(partOne())")
