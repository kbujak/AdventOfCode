import UIKit
import Foundation

let fileUrl = Bundle.main.path(forResource: "ex1Input", ofType: "txt") ?? ""
var fileString = try? String.init(contentsOfFile: fileUrl, encoding: .utf8)

var numberInStringDict = [
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9
]

var sum: Int = 0

if let fileString {
    
    for line in fileString.components(separatedBy: .newlines) {

        var firstDigit: Int?
        var lastDigit: Int?

        var tempLine = line
        while tempLine != "" {
            let character = tempLine.removeFirst()

            if character.isNumber {

                if firstDigit != nil {
                    lastDigit = character.wholeNumberValue
                } else {
                    firstDigit = character.wholeNumberValue
                }
            } else {

                for key in numberInStringDict.keys {

                    if "\(character)\(tempLine)".starts(with: key) {

                        if firstDigit != nil {
                            lastDigit = numberInStringDict[key]
                        } else {
                            firstDigit = numberInStringDict[key]
                        }
                    }
                }
            }
        }

        if let firstDigit {
            sum += firstDigit * 10 + (lastDigit ?? firstDigit)
        }
    }
}

print(sum)
