//
//  Advent of Code 2022 - Day 07: No Space Left On Device
//
//  Created by Andrés Salinas Lima on 07/12/22
//

import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")!
let input = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)

struct File {
    var name: String
    var size: Int
}

class Directory {
    var name: String
    var files = [File]()
    var directories = [Directory]()

    init(name: String) {
        self.name = name
    }

    var size: Int {
        var size = 0

        files.map { size += $0.size }
        directories.map { size += $0.size }

        return size
    }

    // For debugging purposes
    func printTree() {
        func printTree(_ dir: Directory, currentLevel: Int) {
            var spacer = ""
            for _ in 0 ..< currentLevel {
                spacer += "  "
            }

            print("\(spacer)\(dir.name) (dir, size= \(dir.size))")

            dir.files.map { print("  \(spacer)\($0.name) (file, size= \($0.size))") }

            dir.directories.map { printTree($0, currentLevel: currentLevel + 1) }
        }

        printTree(self, currentLevel: 0)
    }
}

func buildFileSystemFromInput() -> Directory {
    var currentPath = [Directory]()
    currentPath.append(Directory(name: "/"))

    input.enumerateLines { line, _ in
        if line == "$ cd .." {
            currentPath.popLast()
        } else if line.contains("$ cd "), !(line == "$ cd /") {
            let dirName = line.components(separatedBy: " ")[2]
            let newDir = Directory(name: dirName)

            currentPath.last!.directories.append(newDir)

            currentPath.append(newDir)

        } else if !line.contains("$"), !line.contains("dir ") {
            let fileSize = Int(line.components(separatedBy: " ")[0])!
            let fileName = line.components(separatedBy: " ")[1]

            currentPath.last!.files.append(File(name: fileName, size: fileSize))
        }
    }

    return currentPath.first!
}

func getDirectoriesSmallerThan(dir: Directory, size: Int) -> [Directory] {
    var resultArray = [Directory]()

    dir.directories.map {
        resultArray += getDirectoriesSmallerThan(dir: $0, size: size)
    }

    if dir.size < size {
        resultArray.append(dir)
    }

    return resultArray
}

func getDirectoriesBiggerOrEqThan(dir: Directory, size: Int) -> [Directory] {
    var resultArray = [Directory]()

    dir.directories.map {
        resultArray += getDirectoriesBiggerOrEqThan(dir: $0, size: size)
    }

    if dir.size >= size {
        resultArray.append(dir)
    }

    return resultArray
}

var root = buildFileSystemFromInput()

// MARK: - PART ONE

func partOne() -> Int {
    var result = 0

    let smallDirectories = getDirectoriesSmallerThan(dir: root, size: 100_000)
    smallDirectories.map { result += $0.size }

    return result
}

print("PART ONE: \(partOne())")

// MARK: - PART TWO

func partTwo() -> Int {
    let totalSpace = 70_000_000
    let requiredSpaceForUpdate = 30_000_000
    let usedSpace = root.size
    let availableSpace = totalSpace - usedSpace
    let minSpaceToDelete = requiredSpaceForUpdate - availableSpace

    let optionsToDelete = getDirectoriesBiggerOrEqThan(dir: root, size: minSpaceToDelete)

    var result = optionsToDelete[0].size
    optionsToDelete.map { result = min(result, $0.size) }

    return result
}

print("PART TWO: \(partTwo())")
