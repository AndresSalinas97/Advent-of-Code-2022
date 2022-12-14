//
//  Advent of Code 2022 - Day 06: Tuning Trouble
//
//  Created by Andrés Salinas Lima on 06/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")!
let input = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)

print("PART ONE: \(findFirstMarker(input: input, distinctCharacters: 4))")
print("PART TWO: \(findFirstMarker(input: input, distinctCharacters: 14))")

func findFirstMarker(input: String, distinctCharacters: Int) -> Int {
    var charCount = 0
    var buffer = [Character]()

    for char in input {
        buffer.append(char)
        charCount += 1

        if buffer.count > distinctCharacters {
            buffer.remove(at: 0)
        }

        if Set(buffer).count == distinctCharacters {
            return charCount
        }
    }

    return -1 // Not found
}
