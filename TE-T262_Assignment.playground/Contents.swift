import Foundation

print("Hello World")

//***Variables***
print("")
print("")
print("*** Variables ***")
print("")
print("")

let a = 10
var b = true
let s = "Hiii"
print(a)
print(b)
print(s)

let interestRate = 15
let amount = 100000
let duration = 5 // Years
let intrest = Double(amount * interestRate * duration) / 100

//***Oprators***
print("")
print("")
print("*** Oprators ***")
print("")
print("")

let strOp = "Hello" + "World"
let p = 3 + 2 - 1
let q = 5/2
let r = 5.0/2
//tunery oprator is genrally if else code in online it use three opranda which are define like :  Condtion ? (Condition is true than this result) : (Condition is false than this result)
let result = p>q ? p : q //In other words if(p>q) {assign p to result} else {assign q to result}
print("3 + 2 - 1 = \(p)")
print("5/2 = \(q)")
print("5.0/2 = \(r)")
print("The grater value between p and q will print here using tunery: \(result)")


//***Working with Text***
//***Strings***

print("")
print("")
print("*** Working with Text and String ***")
print("")
print("")


print("--- Problem 1 ---")
print("")

////Problem 1
func firstTwoCharacters(inputStr : String) -> String {
    if inputStr.count < 2 {
        return inputStr
    }
    let idx = inputStr.index(inputStr.startIndex , offsetBy: 2)
    return String(inputStr[..<idx])
}
print(firstTwoCharacters(inputStr: "Simform"))

print("")
print("--- Problem 2 ---")
print("")

//Problem 2
func removeFirstAndLast(inputStr : String) -> String {
    if inputStr.count < 2 {return "Invalid String , Length must at least 2"}
    else if inputStr.count == 2 {return " "}
    let start = inputStr.index(after: inputStr.startIndex)
    let end = inputStr.index(before: inputStr.endIndex)
    return String(inputStr[start..<end])
}
print(removeFirstAndLast(inputStr: "Simform"))
print(removeFirstAndLast(inputStr: "Swift"))

print("")
print("--- Problem 3 ---")
print("")

//Problem 3
func concatWithoutFirstChar(inputStr1 : String , inputStr2 : String) -> String {
    let idx1 = inputStr1.index(after: inputStr1.startIndex)
    let idx2 = inputStr2.index(after: inputStr2.startIndex)
    
    return String( inputStr1[idx1...] + inputStr2[idx2...] )
}
/* If there is no use of function (i.e. the strings are mutable) than we can use this solution too:
 String( str1.removeFirst() + str2.removeFirst()  ) */
print(concatWithoutFirstChar(inputStr1: "Example", inputStr2: "Simform"))

print("")
print("--- Problem 4 ---")
print("")

//Problem 4
func startsWithSw(inputStr : String) -> Bool {
    return inputStr.hasPrefix("Sw")
}
print("Input: Swift, Output: \(startsWithSw(inputStr: "Swift"))")
print("Input: Swift, Output: \(startsWithSw(inputStr: "Solutions"))")

print("")
print("--- Problem 5 ---")
print("")

//Problem 5
func firstAndLastNChars( inputStr : String, n : Int ) -> String {
    let idx1 = inputStr.index(inputStr.startIndex, offsetBy: n)
    let idx2 = inputStr.index(inputStr.endIndex, offsetBy: -n)
    return String( inputStr[..<idx1] + inputStr[idx2...] )
}
print(firstAndLastNChars(inputStr: "Simfrom Solutions", n: 3))

print("-------------------")

//***Array***
print("")
print("")
print("***Array***")
print("")
print("")

print("--- Problem 1 ---")
print("")

//Problem 1
let arr1 = [1,2,3,4,1]
func isFirstAndLastEqual (arr : [Int]) -> Bool {
    return arr.first == arr.last
}
print("Input: \(arr1), Output: \(isFirstAndLastEqual(arr: arr1))")

print("")
print("--- Problem 2---")
print("")

//Problem 2
func doubleLengthArray(inputArr : [Int]) -> [Int] {
    if inputArr.isEmpty {
        print("Enter Valid Input")
        return [-1]
    }
    var resultArr = Array(repeating: 0, count: (inputArr.count * 2))
    resultArr[resultArr.endIndex-1] = inputArr.last ?? 0
    return resultArr
}
print(doubleLengthArray(inputArr: [1,2,3,4]))

print("")
print("--- Problem 3 ---")
print("")

//Problem 3
func firstTwoElements(inputArr : [Int]) -> [Int] {
    if inputArr.count<=2 { return inputArr }
    let idx = inputArr.index(inputArr.startIndex , offsetBy: 2)
    return Array(inputArr[..<idx])
}
print(firstTwoElements(inputArr: [0,1,2,3]))

print("")
print("--- Problem 4 ---")
print("")

//Problem 4
func findMaxValue(inputArr : [Int]) -> Int {
    return inputArr.max() ?? 0
}
print(findMaxValue(inputArr: [0,50,100,20,80,150]))

print("")
print("--- Problem 5 ---")
print("")
// Problem 5
func sortDeseding(inputArr: [Int]) -> [Int] {
    var result = inputArr
    return result.sorted().reversed()
}
print(sortDeseding(inputArr: [0,5,6,2,10]))

print("")
print("--- Problem 6 ---")
print("")
//Problem 6
func filterByDivisors(numberList : [Int] , divisors : [Int]) -> [Int] {
    var resultArr : [Int] = []
    for divisor in divisors {
        for number in numberList {
            if number % divisor == 0 {
                if resultArr.contains(number)  {
                    continue
                } else {
                        resultArr.append(number)
                }
            }
        }
    }
    return resultArr
}
print(filterByDivisors(numberList: [1, 2, 3, 10, 100], divisors: [2, 5]))

print("-------------------")
    
//***Control Flow***
print("")
print("")
print("*** Control Flow ***")
print("")
print("")

print("--- Problem 1 ---")
print("")

// Problem 1
var N = 100
var i = 1.0
while pow(2.0,i) < Double(N) {
    print(Int(pow(2.0,i)))
    i += 1.0
}

print("")
print("--- Problem 2 ---")
print("")

//Problem 2
N = 3
for _ in 1...N {
    for _ in 1...N {
        print("*" , terminator: " ")
    }
    print("")
}
   
print("")
print("--- Problem 3  ---")
print("")


//Problem 3
for i in 1...N {
    for j in 1...i {
        print("*" , terminator: " ")
    }
        print("")
}
   
print("")
print("--- Problem 4 ---")
print("")

//Problem 4
for i in 0..<N {
    for _ in 0..<(N-i) {
        print(" " , terminator: " ")
    }
    for _ in 0..<(2*i+1){
        print("*", terminator: " ")
    }
    print("")
}
    
print("")
print("--- Problem 5 ---")
print("")

//Problem 5
func isPrime(num : Int) {
    for i in 2..<num {
        if num%i == 0 {
            print("\(num) is not prime")
            return
        }
    }
    print("\(num) is prime")
}
isPrime(num: 20)
    
print("-------------------")

//Dictnory
print("")
print("")
print("*** Dictnory ***")
print("")

print("")
print("--- Problem 1 ---")
print("")
//Problem 1
var code = [
    "a" : "b",
    "b" : "c",
    "c" : "d",
    "d" : "e",
    "e" : "f",
    "f" : "g",
    "g" : "h",
    "h" : "i",
    "i" : "j",
    "j" : "k",
    "k" : "l",
    "l" : "m",
    "m" : "n",
    "n" : "o",
    "o" : "p",
    "p" : "q",
    "q" : "r",
    "r" : "s",
    "s" : "t",
    "t" : "u",
    "u" : "v",
    "v" : "w",
    "w" : "x",
    "x" : "y",
    "y" : "z",
    "z" : "a"
]

var encodedMessage = "uijt nfttbhf jt ibse up sfbe"
func decoder(code : [String:String], encodedMessage : String) -> String {
    var result = ""
    for ch in encodedMessage {
        if ch == " "{
            result += " "
            continue
        }
        for(key,value) in code {
            if value == String(ch) {
                result += key
                break
            }
        }
        
    }
    return result
}

print(decoder(code: code, encodedMessage: encodedMessage))

print("")
print("--- Problem 2 ---")
print("")

//Problem 2
var people: [[String:String]] = [
    
    [ "firstName": "Calvin", "lastName": "Newton" ],
    [ "firstName": "Garry", "lastName": "Mckenzie" ],
    [ "firstName": "Leah", "lastName": "Rivera" ],
    [ "firstName": "Sonja", "lastName": "Moreno"],
    [ "firstName": "Noel", "lastName": "Bowen"]
    
]

func firstNameFilter (peopleList : [ [ String:String ] ]) -> [String] {
    var result : [String] = []
    for person in peopleList {
        result.append( person["firstName" , default: ""] )
    }
    return result
}
print(firstNameFilter(peopleList: people))

print("")
print("--- Problem 3 ---")
print("")

//Problem 3
func fullNameGenrator (peopleList : [[String : String]]) -> [String] {
    var fullNamesList : [String] = []
    for person in peopleList {
        let first = person["firstName", default: ""]
        let last  = person["lastName", default: ""]
        
        let fullName = "\(first) \(last)"
        fullNamesList.append(fullName)
    }
    return fullNamesList
}
print(fullNameGenrator(peopleList: people))

print("")
print("--- Problem 4 ---")
print("")

//Problem 4
var peopleDetails: [[String:Any]] = [
    
    [
        "firstName": "Calvin",
        "lastName": "Newton",
        "score": 13
    ],
    
    [
        "firstName": "Garry",
        "lastName": "Mckenzie",
        "score": 12
    ],
    
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "score": 10
    ],
    
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "score": 3
    ],
    
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "score": 16
    ]
    
]

func lowestScoreFinder(details : [[String : Any]] ) -> String {
    var lowest = Int.max
    var first = ""
    var last = ""
    for person in details {
        if let currentScore = person["score"] as? Int {
            if currentScore < lowest {
                lowest = currentScore
                first = person["firstName"] as? String ?? ""
                last = person["lastName"] as? String ?? ""
            } else {continue}
        }
    }
    return "\(first) \(last)"
}
print(lowestScoreFinder(details: peopleDetails))
    
print("")
print("--- Problem 5 ---")
print("")

//Problem 5
func leaderBoardGenrator (personDetails : [[String:Any]])  {
    var scoreBoard : [String : Int] = [:]
    for person in personDetails {
        let firstName = person["firstName"] as? String ?? ""
        let lastName = person["lastName"] as? String ?? ""
        
        scoreBoard["\(firstName) \(lastName)"] = person["score"] as? Int
    }
    let result = scoreBoard.sorted { $0.value > $1.value}
    var i = 1
    for (key,value) in result {
        print("\(i). \(key) - \(value)")
        i += 1
    }
}
leaderBoardGenrator(personDetails: peopleDetails)

print("")
print("--- Problem 6 ---")
print("")

//Problem 6
func freqCheck(inputArr : [Int]) {
    var result : [Int : Int] = [:]
    for number in inputArr {
        result[number, default: 0] += 1
    }
    for (num,freq) in result {
        print( "\(num) \(freq)" )
    }
}
freqCheck(inputArr: [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2])

print(" ------------------- ")

//***Optional***
print("")
print("")
print("*** Optional ***")
print("")

print("")
print("--- Define Optional ---")
print("")

//Define Optional
var username: String? = "JohnDoe"
var age: Int? = nil

print("")
print("--- Forced Unwrapping ---")
print("")

//Forced Unwarpping
print("My name is \(username!)")
// print(age!) // This would CRASH the code immediately!

print("")
print("--- Optional Binding & Usage of if let ---")
print("")

// Optional Binding
//Usage of if let Statement
var email: String? = "user@example.com"
if let tempEmail = email {
    print("Sending email to: \(tempEmail)")
} else {
    print("No email provided.")
}

print("")
print("--- Usage of guard if ---")
print("")

// Usage of guard Statement
func printDepartment(department: String?) {
    guard let tempDepartment = department else {
        print("Error: No department found, cannot continue.")
        return
    }
   
    print("Fetching deartment for User: \(tempDepartment)...")
}

print("")
print("---Nil Collosion Oprator---")
print("")

// Nil colloison operator
let userMiddleName : String? = "not available"
var currentName = userMiddleName ?? ""
print("Middle Name is \(currentName).")


print("-------------------")

//***Function Problem***

print("")
print("")
print("*** Function Problems ***")
print("")
print("")

print("--- Problem: Breakfast ---")
print("")

//Problem Brakfast
func breakFast(baconAge : Int, eggAge : Int)  {
    var isRotten = false
    if baconAge > 7 {
        print("Threw out bacon.")
        isRotten = true
    }
    if eggAge > 21 {
        print("Threw out eggs.")
        isRotten = true
    }
    if !isRotten {
        print("You can cook bacon and eggs.")
    }
}
breakFast(baconAge: 3, eggAge: 2)

print("")
print("--- Problem: Leap Year ---")
print("")

//LeapYear
func leapYearCheck(year : Int) {
    if year % 4 == 0 {
        if year % 100 == 0{
            if year % 400 == 0{
                print("Leap Year!")
            } else {
                print("Not Leap Year!")
            }
        } else {
            print("Leap Year!")
        }
    } else {
        print("Not Leap Year!")
    }
}
leapYearCheck(year: 2000)

print("")
print("--- Problem: Hitpoints ---")
print("")

//Problem Hitpoints
func regenrateHP(hitpoints : Int) {
    var temp = hitpoints
    if hitpoints == 0 {
        print("He is Dead!")
        return
    }
    if hitpoints % 10 == 0 {
        temp = hitpoints < 20 ? 20 : hitpoints
    } else {
        temp = hitpoints < 20 ? 20 : hitpoints + (10-(temp%10))
    }
    print(temp)
}
regenrateHP(hitpoints: 60)

print("")
print("--- Problem: Above Average ---")
print("")

//Problem Above average
func gradeCheck(
    grade1 : Double,
    grade2 : Double,
    grade3 : Double,
    yourGrade : Double
) {
    let avg = (grade1 + grade2 + grade3 + yourGrade) / 4
    yourGrade > avg ? print("Above Avrage") :  print("Below Avrage")
}
gradeCheck(grade1: 7.9, grade2: 9.0, grade3: 5.0, yourGrade: 8.0)

print("")
print("--- Problem: Tipping ---")
print("")

//Tipping
func totalBill(mealCost : Double, tip : Int) {
    let tipInValue = Double(tip)*mealCost / 100
    print(mealCost+tipInValue)
}
totalBill(mealCost: 3.5, tip: 20)
print("-------------------")
