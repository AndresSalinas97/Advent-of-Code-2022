//
// Advent of Code 2022 - Day 1: Calorie Counting
//
//  Created by Andrés Salinas Lima on 01/12/22.
//

import Cocoa

let input = """
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
"""

let elfs = input.components(separatedBy: "\n\n")
var maxCalories = 0

for elf in elfs {
    let foodItems = elf.components(separatedBy: "\n")
    var totalCalories = 0

    for foodItem in foodItems {
        totalCalories += Int(foodItem)!
    }

    if totalCalories > maxCalories {
        maxCalories = totalCalories
    }
}

print(maxCalories)
