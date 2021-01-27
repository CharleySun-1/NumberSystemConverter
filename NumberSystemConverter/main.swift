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

var startBase = Int()
var toBase = Int()

enum NumberSystemBase: Int {
    case binary = 2
    case octal = 8
    case decimal = 10
    case hexadecimal = 16
}


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
    startBase = 2
case "O":
    startBase = 8
case "D":
    startBase = 10
case "H":
    startBase = 12
default:
    print("Please enter a number system from above.")


}
// PROCESS
print(from)
func decimalEquivalent4(value4:String) -> Double{
    // HEXDECIMAL TO DECIMAL
    // Base 16 to Base 10
    //

    
    let base = 16.0
    var exponent = 0.0
    var decimalEquivalent4 = 0.0

    for character in value4.reversed() {
        
        switch character{
        case "A":
            decimalEquivalent4 += 10 * pow(base, exponent)
        case "B":
            decimalEquivalent4 += 11 * pow(base, exponent)
        case "C":
            decimalEquivalent4 += 12 * pow(base, exponent)
        case "D":
            decimalEquivalent4 += 13 * pow(base, exponent)
        case "E":
            decimalEquivalent4 += 14 * pow(base, exponent)
        case "F":
            decimalEquivalent4 += 15 * pow(base, exponent)
        default:
            let digit4 = Double(String(character))!
            decimalEquivalent4 += digit4 * pow(base, exponent)
        }
exponent += 1

    }
    return(decimalEquivalent4)
}

// OUTPUT

