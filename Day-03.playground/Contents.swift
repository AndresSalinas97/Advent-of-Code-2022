//
//  Advent of Code 2022 - Day 03: Rucksack Reorganization
//
//  Created by Andrés Salinas Lima on 03/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

var rucksacks = input.components(separatedBy: "\n")
while rucksacks.last!.isEmpty {
    rucksacks.removeLast() // Removes the empty lines at the end (if any)
}

// Prepare a dictionary with every item type and its priority value
var priorityByType = [Character: Int]()
var priority = 1
for char in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" {
    priorityByType.updateValue(priority, forKey: char)
    priority += 1
}

var partOneResult = 0

for rucksack in rucksacks {
    let firstCompartment = rucksack.prefix(rucksack.count/2)
    let secondCompartment = rucksack.suffix(rucksack.count/2)

    for itemType in firstCompartment {
        if secondCompartment.contains(itemType) {
            let duplicatedItemType = itemType
            partOneResult += priorityByType[duplicatedItemType]!
            break // (exactly one item type per rucksack)
        }
    }
}

print(partOneResult)
