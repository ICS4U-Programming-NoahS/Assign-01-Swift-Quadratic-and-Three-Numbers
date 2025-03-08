//
// QuadraticThreeNumbers.swift
//
// Created by Noah Smith
// Created on 2025-03-07
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//
// The QuadraticThreeNumbers is 2 programs in one.
// The user can choose the one they want to try.
// The first program is a solves quadratic equations.
// The user is asked to enter a b and c, then the value(s) of x is displayed
// The second program asks the user to enter 3 numbers.
// The program then displays the smallest number.
// The programs will keep looping until the user presses q to quit.

import Foundation

// Define the different possible error types
enum InputError: Error {
    case invalidInput
}

// Function for the quadratic equation formula.
func calcQuadratic(numA: Double, numB: Double, numC: Double) -> String {

    // Initialize message
    var calcQuadraticMessage = ""

    // Check if the discriminant is negative
    let discriminant = pow(numB, 2) - (4 * numA * numC)

    if discriminant < 0 {
        calcQuadraticMessage = "The discriminant is negative, no real solutions."

    // Check if a is 0 
    } else if numA == 0 {
        calcQuadraticMessage = "a cannot be zero. Try again."

    // Check if the discriminant is equal to 0
    } else if discriminant == 0 {
        // If this is true it will have 1 solution
        let solution = -numB / (2 * numA)
        calcQuadraticMessage = "x is equal to" + String(format: "%.2f", solution) + "x)."

    // If there are 2 solutions
    } else {
        let solution1 = (-numB + sqrt(discriminant)) / (2 * numA)
        let solution2 = (-numB - sqrt(discriminant)) / (2 * numA)
        calcQuadraticMessage = "x is equal to " + String(format: "%.2f", solution1) + " and "
        + String(format: "%.2f", solution2) + "."
    }

    // Return the solution(s) or error message
    return calcQuadraticMessage
}

// Function for the smallest number program.
func smallestNumber(numA: Double, numB: Double, numC: Double) -> String {

    // Initialize message
    var smallestNumberMessage = ""

    // Check if a is the smallest
    if numA < numB && numA < numC {
        smallestNumberMessage = "\(numA) is the smallest."

    // Check if b is the smallest
    } else if numB < numA && numB < numC {
        smallestNumberMessage = "\(numB) is the smallest."

    // Check if c is the smallest
    } else if numC < numA && numC < numB {
        smallestNumberMessage = "\(numC) is the smallest."

    // Check if a and b are the smallest
    } else if numA == numB && numA < numC {
        smallestNumberMessage = "\(numA) and \(numB) are the smallest."

    // Check if a and c are the smallest
    } else if numA == numC && numA < numB {
        smallestNumberMessage = "\(numA) and \(numC) are the smallest."

    // Check if b and c are the smallest
    } else if numB == numC && numB < numA {
        smallestNumberMessage = "\(numB) and \(numC) are the smallest."

    // Check if all are the same
    } else {
        smallestNumberMessage = "\(numA), \(numB), and \(numC) are the smallest."
    }

    // Return the smallest number
    return smallestNumberMessage
}

// Greet user
print("Welcome!\n")

// Initialize user choice
var choice = ""

// Loop to give user another chance to enter valid input
// and to run the program again
repeat {

    // Give user options
    print("Enter 1 to use the quadratic equation program.")
    print("Enter 2 to use the smallest number program.")
    print("If you are done playing, enter 'q' to quit: ")

    // Get choice from user as string
    choice = readLine()!

    // If the user's choice is 1 or 2
    if choice == "1" || choice == "2" {
        if choice == "1" {
            // Give instructions for quadratic equation program
            print("You have chosen the quadratic equation program.")
            print("Enter a, b, and c for the quadratic equation.")
            print("The formula is: (-b ± √(b² - 4ac)) / 2a")
        } else {
            // Give instructions for smallest number program
            print("You have chosen the smallest number program.")
            print("Enter 3 numbers to find the smallest one.")
        }

        // Get the first number
        print("Enter the first number: ")

        // Catch invalid input
        do {
            // Try to catch invalid input for the first number
            if let numAStr = readLine(), let numA = Double(numAStr) {

                // Get the second number
                print("Enter the second number: ")

                // Try to catch invalid input for the second number
                if let numBStr = readLine(), let numB = Double(numBStr) {

                    // Get the third number
                    print("Enter the third number: ")

                    // Try to catch invalid input for the second number
                    if let numCStr = readLine(), let numC = Double(numCStr) {
                        // If the user chooses program 1
                        if choice == "1" {
                            // Call the quadratic equation function
                            let calcQuadraticMessage = calcQuadratic(numA: numA, numB: numB, numC: numC)

                            // Display the solutions of x or the error message
                            print(calcQuadraticMessage)

                        // If the user chooses program 2
                        } else if choice == "2" {
                            // Call the smallest number function
                            let smallestNumMessage = smallestNumber(numA: numA, numB: numB, numC: numC)

                            // Display the smallest number(s)
                            print(smallestNumMessage)

                        // If the user enters an invalid choice
                        } else {
                            print("Invalid choice. Try again.")
                        }

                    // If the third number is invalid
                    } else {
                        throw InputError.invalidInput
                    }

                // If the second number is invalid
                } else {
                    throw InputError.invalidInput
                }

            // If the first number is invalid
            } else {
                throw InputError.invalidInput
            }

        } catch InputError.invalidInput {
            // If user does not enter a number
            print("Invalid input. Enter a number next time.")
        }

    // If the user enters q to quit
    } else if choice == "q" {
        print("Goodbye!")
    } else {
        // If the user enters an invalid choice
        print("Invalid choice. Try again.")
    }

// while the user does not enter q, keep looping
} while choice != "q"
