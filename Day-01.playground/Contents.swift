//
//  Advent of Code 2022 - Day 01: Calorie Counting
//
//  Created by Andrés Salinas Lima on 01/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")!
let input = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)

let elfs = input.components(separatedBy: "\n\n")

print("PART ONE: \(partOne(elfs: elfs))")
print("PART TWO: \(partTwo(elfs: elfs))")

func partOne(elfs: [String]) -> Int {
    var maxCalories = 0

    for elf in elfs {
        let foodItems = elf.components(separatedBy: "\n")

        var elfCalories = 0
        foodItems.map { elfCalories += Int($0) ?? 0 }

        maxCalories = max(maxCalories, elfCalories)
    }

    return maxCalories
}

func partTwo(elfs: [String]) -> Int {
    var top3Calories = [Int]()

    for elf in elfs {
        let foodItems = elf.components(separatedBy: "\n")

        var elfCalories = 0
        foodItems.map { elfCalories += Int($0) ?? 0 }

        if top3Calories.count < 3 {
            top3Calories.append(elfCalories)
            top3Calories.sort(by: >)
        } else if top3Calories.last! < elfCalories {
            top3Calories.removeLast()
            top3Calories.append(elfCalories)
            top3Calories.sort(by: >)
        }
    }

    return top3Calories.reduce(0, +)
}
