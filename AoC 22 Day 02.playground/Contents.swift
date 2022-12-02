//
//  Advent of Code 2022 - Day 2: Rock Paper Scissors
//
//  Created by Andrés Salinas Lima on 02/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let rounds = input.components(separatedBy: "\n")

var totalScore = 0

for round in rounds {
    if !round.isEmpty {
        let hisChoice = round[round.startIndex]
        let myChoice = round[round.index(before: round.endIndex)]

        // Shape Score
        if myChoice == "X" {
            totalScore += 1
        } else if myChoice == "Y" {
            totalScore += 2
        } else {
            totalScore += 3
        }

        // Round Score
        if hisChoice == "A" {
            if myChoice == "X" {
                totalScore += 3
            } else if myChoice == "Y" {
                totalScore += 6
            }
        } else if hisChoice == "B" {
            if myChoice == "Y" {
                totalScore += 3
            } else if myChoice == "Z" {
                totalScore += 6
            }
        } else {
            if myChoice == "X" {
                totalScore += 6
            } else if myChoice == "Z" {
                totalScore += 3
            }
        }
    }
}

print(totalScore)
