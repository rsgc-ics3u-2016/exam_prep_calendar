import Foundation

/*
 
 ORGANIZING YOUR SOLUTION
 
 A good way to orgaize your code is to separate your code into the three sections - input, process, output – as much as possible.
 
 The start of a solution is implemented below. Consider all the possible inputs. Can you finish the solution?
 
 */

/*
 
 INPUT
 
 Be sure that your implementation of this section discards all the possible bad inputs the user could provide.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */
func getInteger(from: Int, through: Int, with prompt: String) -> Int {
    
    // Repeat until we get what we want
    repeat {
        
        // Show the prompt
        print(prompt)
        
        // Get the input
        var input : String?
        input = readLine()
        
        // Check that input is not nil
        if let notNilInput = input {
            
            // Check that input is an integer
            if let integerInput = Int(notNilInput) {
                
                // Is input in the desired range?
                if integerInput >= from && integerInput <= through {
                    
                    return integerInput // return the valid integer; breaks the loop and exits the function
                    
                }
                
            }
            
        }

    } while true
    
}

// Get the day the month begins on
let start = getInteger(from: 1, through: 7, with: "Enter day:")
let daysInMonth = getInteger(from: 28, through: 31, with: "Enter the number of days in the month:")
let specialDay = getInteger(from: 1, through: daysInMonth, with: "Enter the special day:")

/*
 
 PROCESS
 
 Here is where you implement the logic that solves the problem at hand.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */
let padding = " "
let spacer = " "
var currentDay = 0 // day of the month
var output = "Sun Mon Tue Wed Thu Fri Sat\n"
for position in 1...37 {
    
    // When the month hasn't started yet
    if position < start {
        
        output += padding + padding + padding
        
    } else {
        
        // Increment the day of the month
        currentDay += 1
        
        // Add padding for a spot in the calendar
        if currentDay < 10 { // single digit day
            
            if currentDay == specialDay {
                output += padding + "*" + String(currentDay)
            } else {
                output += padding + padding + String(currentDay)
            }
            
        } else {
            
            if currentDay == specialDay {
                output += "*" + String(currentDay)
            } else {
                output += padding + String(currentDay)
            }
            
        }
        
        // Check to see if month is done
        if currentDay == daysInMonth {
            break
        }
        
    }
    
    // Add the spacer
    output += spacer
    
    // Bump to next line when we've printed a position at the end of a week (7 positions)
    if position % 7 == 0 {  // when the remainder is 0 after dividing by 7...
        output += "\n"
    }
    
}

/*
 
 OUTPUT
 
 Here is where you report the results of the 'process' section above.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */

print(output)
