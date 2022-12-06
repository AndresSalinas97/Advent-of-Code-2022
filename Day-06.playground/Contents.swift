//
//  Advent of Code 2022 - Day 06: Tuning Trouble
//
//  Created by Andrés Salinas Lima on 06/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")!
let input = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)

struct MarkerBuffer {
    private var buffer = [Character]()
    
    mutating func receiveCharacter(_ newChar: Character) {
        buffer.append(newChar)
        
        if buffer.count > 4 {
            buffer.remove(at: 0)
        }
    }
    
    func isMarker() -> Bool {
        if Set(buffer).count == 4 {
            return true
        }
        
        return false
    }
}

var characterCount = 0
var buffer = MarkerBuffer()

for char in input {
    buffer.receiveCharacter(char)
    characterCount += 1
    
    if buffer.isMarker() {
        break
    }
}

print("PART ONE: \(characterCount)")
