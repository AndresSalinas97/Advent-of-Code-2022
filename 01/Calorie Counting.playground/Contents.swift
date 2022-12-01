//
// Advent of Code 2022 - Day 1: Calorie Counting
//
//  Created by Andrés Salinas Lima on 01/12/22.
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "sample", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

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

print(maxCalories)
