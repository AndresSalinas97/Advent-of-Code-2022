//
//  Advent of Code 2022 - Day 04: Camp Cleanup
//
//  Created by Andrés Salinas Lima on 05/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")!
let input = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)

var resultPartOne = 0
var resultPartTwo = 0

input.enumerateLines { line, _ in
    let elfRanges = line.components(separatedBy: ",")
        .map { $0.components(separatedBy: "-") }
        .map { Int($0[0])! ... Int($0[1])! }

    if (elfRanges[0].first! >= elfRanges[1].first! && elfRanges[0].last! <= elfRanges[1].last!) ||
        (elfRanges[1].first! >= elfRanges[0].first! && elfRanges[1].last! <= elfRanges[0].last!)
    {
        resultPartOne += 1
        resultPartTwo += 1
    } else if elfRanges[0].overlaps(elfRanges[1]) {
        resultPartTwo += 1
    }
}

print("PART ONE: \(resultPartOne)")
print("PART TWO: \(resultPartTwo)")
