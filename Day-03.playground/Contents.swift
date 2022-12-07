//
//  Advent of Code 2022 - Day 03: Rucksack Reorganization
//
//  Created by Andrés Salinas Lima on 03/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")!
let input = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)

print("PART ONE: \(PartOne(input: input))")
print("PART TWO: \(PartTwo(input: input))")

func PartOne(input: String) -> Int {
    let priorityByType = makePriorityByTypeDictionary()
    var result = 0

    input.enumerateLines { line, _ in
        let firstCompartment = line.prefix(line.count / 2)
        let secondCompartment = line.suffix(line.count / 2)

        for itemType in firstCompartment {
            if secondCompartment.contains(itemType) {
                result += priorityByType[itemType]!
                break
            }
        }
    }

    return result
}

func PartTwo(input: String) -> Int {
    let priorityByType = makePriorityByTypeDictionary()
    var result = 0

    var groupRucksacks = [String]() // Array that will contain the rucksacks of each three-Elf group

    input.enumerateLines { line, _ in
        groupRucksacks.append(line)

        if groupRucksacks.count == 3 {
            for itemType in groupRucksacks[0] {
                if groupRucksacks[1].contains(itemType), groupRucksacks[2].contains(itemType) {
                    result += priorityByType[itemType]!
                    break
                }
            }

            groupRucksacks.removeAll()
        }
    }

    return result
}

func makePriorityByTypeDictionary() -> [Character: Int] {
    var dict = [Character: Int]()

    var priority = 1
    for char in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" {
        dict.updateValue(priority, forKey: char)
        priority += 1
    }

    return dict
}
