//
//  Advent of Code 2022 - Day 1: Calorie Counting
//
//  Created by Andrés Salinas Lima on 01/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "sample", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

func partOne(_ input: String) -> Int {
    let elfs = input.components(separatedBy: "\n\n")
    var maxCalories = 0

    for elf in elfs {
        let foodItems = elf.components(separatedBy: "\n")
        var totalCalories = 0

        for foodItem in foodItems {
            totalCalories += Int(foodItem) ?? 0
        }

        if totalCalories > maxCalories {
            maxCalories = totalCalories
        }
    }

    return maxCalories
}

print(partOne(input))

func partTwo(_ input: String) -> Int {
    let elfs = input.components(separatedBy: "\n\n")
    var maxCalories0 = 0
    var maxCalories1 = 0
    var maxCalories2 = 0

    for elf in elfs {
        let foodItems = elf.components(separatedBy: "\n")
        var totalCalories = 0

        for foodItem in foodItems {
            totalCalories += Int(foodItem) ?? 0
        }

        if totalCalories > maxCalories0 {
            maxCalories2 = maxCalories1
            maxCalories1 = maxCalories0
            maxCalories0 = totalCalories
        } else if totalCalories > maxCalories1 {
            maxCalories2 = maxCalories1
            maxCalories1 = totalCalories
        } else if totalCalories > maxCalories2 {
            maxCalories2 = totalCalories
        }
    }

    return maxCalories0 + maxCalories1 + maxCalories2
}

print(partTwo(input))
