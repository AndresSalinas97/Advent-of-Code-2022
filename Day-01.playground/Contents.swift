//
//  Advent of Code 2022 - Day 1: Calorie Counting
//
//  Created by Andrés Salinas Lima on 01/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let elfs = input.components(separatedBy: "\n\n")

// MARK: - PART ONE

func partOne() -> Int {
    var maxCalories = 0

    for elf in elfs {
        let foodItems = elf.components(separatedBy: "\n")

        var elfCalories = 0
        foodItems.map { elfCalories += Int($0) ?? 0 }

        maxCalories = max(maxCalories, elfCalories)
    }

    return maxCalories
}

print("PART ONE: \(partOne())")

// MARK: - PART TWO

func partTwo() -> Int {
    var maxCalories = [Int]()

    for elf in elfs {
        let foodItems = elf.components(separatedBy: "\n")

        var elfCalories = 0
        foodItems.map { elfCalories += Int($0) ?? 0 }

        if maxCalories.count < 3 {
            maxCalories.append(elfCalories)
            maxCalories.sort(by: >)
        } else if maxCalories.last! < elfCalories {
            maxCalories.removeLast()
            maxCalories.append(elfCalories)
            maxCalories.sort(by: >)
        }
    }

    return maxCalories.reduce(0, +)
}

print("PART TWO: \(partTwo())")
