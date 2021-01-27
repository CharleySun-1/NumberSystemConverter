//
//  main.swift
//  NumberSystemConverter
//
//  Created by Charley Sun on 2021-01-26.
//

import Foundation

// INPUT

// Get the "from" number system
print("What number system do you want to convert from?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H):", terminator: "") // Keep following output
                                                      // On the same line
let from = readLine()!

var startBase = NumberSystemBase.binary
var toBase = Int()

enum NumberSystemBase: Int {
    case binary = 2
    case octal = 8
    case decimal = 10
    case hexadecimal = 16
}

print("Please enter the value that you want to convert.")
let value = readLine()!


// Get the "to" number system
print("What number system do you want to convert to?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H):", terminator: "")
let to = readLine()!


switch from {
case "B":
    startBase = .binary
case "O":
    startBase = .octal
case "D":
    startBase = .decimal
case "H":
    startBase = .hexadecimal
default:
    print("Please enter a number system from above.")


}
// PROCESS
func getDecimalEquivalent(of value: String, from numberSystem: NumberSystemBase) -> Double {
    
    // We are converting from what base?
    var base = 0.0
    switch numberSystem {
    case .binary:
        base = 2.0
    case .octal:
        base = 8.0
    case .decimal:
        base = 10.0
    case .hexadecimal:
        base = 16.0
    }

    // The exponent value at the rightmost digit
    var exponent = 0.0

    // The current sum in decimal
    var decimalEquivalent = 0.0

    // Iterate over each character
    for character in value.reversed() {
        
        // Get the current digit as a Double (decimal)
        if let digit = Double(String(character)) {
            
            // Add the current sum
            decimalEquivalent += digit * pow(base, exponent)
            
        } else {
            
            // If the conversion to a Double failed, it must be a character like A, B, D, E, or F.
            switch character {
            case "A":
                decimalEquivalent += 10.0 * pow(base, exponent)
            case "B":
                decimalEquivalent += 11.0 * pow(base, exponent)
            case "C":
                decimalEquivalent += 12.0 * pow(base, exponent)
            case "D":
                decimalEquivalent += 13.0 * pow(base, exponent)
            case "E":
                decimalEquivalent += 14.0 * pow(base, exponent)
            case "F":
                decimalEquivalent += 15.0 * pow(base, exponent)
            default:
                break
            }
            
        }
        
        // Increment the exponent (+1)
        exponent += 1
        
    }

    return decimalEquivalent

}

let decimalValue = getDecimalEquivalent(of: value, from: startBase)
print(decimalValue)


func getRepresentation(of valueToConvert: Int, inBase base: NumberSystemBase) -> String {

    var decimalValueLeftToConvert = valueToConvert
    var representation = ""
    while decimalValueLeftToConvert > 0 {

        // Get next digit, divide by the raw value of the enumeration
        let nextDigit = decimalValueLeftToConvert % base.rawValue

        // Add to the representation, working from right to left
        if base == .hexadecimal {

            // Set next digit
            switch nextDigit {
            case 0...9:
                representation = String(nextDigit) + representation
            case 10:
                representation = "A" + representation
            case 11:
                representation = "B" + representation
            case 12:
                representation = "C" + representation
            case 13:
                representation = "D" + representation
            case 14:
                representation = "E" + representation
            case 15:
                representation = "F" + representation
            default:
                break
            }

        } else {
            representation = String(nextDigit) + representation
        }

        // Get decimal value still needing conversion
        decimalValueLeftToConvert = decimalValueLeftToConvert / base.rawValue

    }

    return representation

}

// OUTPUT
let result = getRepresentation(of: Int(decimalValue), inBase: .binary) 
