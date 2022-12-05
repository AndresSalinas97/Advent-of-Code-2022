//
//  Advent of Code 2022 - Day 04: Camp Cleanup
//
//  Created by Andrés Salinas Lima on 05/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

var elfPairs = input.components(separatedBy: "\n")
while elfPairs.last!.isEmpty {
    elfPairs.removeLast() // Removes the empty lines at the end (if any)
}

// MARK: - PART ONE

func PartOne() -> Int {
    var result = 0

    for elfPair in elfPairs {
        let assignments = elfPair.components(separatedBy: ",")
        
        let elf1Range = assignments[0].components(separatedBy: "-")
        let elf2Range = assignments[1].components(separatedBy: "-")

        let elf1start = Int(elf1Range[0])!
        let elf1end = Int(elf1Range[1])!
        let elf2start = Int(elf2Range[0])!
        let elf2end = Int(elf2Range[1])!

        if (elf2start >= elf1start && elf2end <= elf1end) || (elf1start >= elf2start && elf1end <= elf2end) {
            result += 1
        }
    }

    return result
}

print("PART ONE: \(PartOne())")

// MARK: - PART TWO

func PartTwo() -> Int {
    var result = 0

    return result
}

print("PART TWO: \(PartTwo())")
