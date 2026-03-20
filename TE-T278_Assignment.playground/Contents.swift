import Foundation


print("--------------- Class ---------------")

print("------------- Exercise - 1 -------------")
class FullName {
    var firstName: String
    var lastName: String
    
    init(firstName: String , lastName: String = "") {
        self.firstName = firstName
        self.lastName = lastName
    }
}
let fullName = FullName(firstName: "Alex")
fullName.lastName = "Turner"

print("Full Name: \(fullName.firstName) \(fullName.lastName)")

print("------------- Exercise - 2 -------------")
class StudentDetails {
    var name: String
    var college: String
    var department: String
    
    init(name: String, college: String, department: String) {
        self.name = name
        self.college = college
            .lowercased()
        self.department = department
    }
    
    convenience init(name: String, college: String) {
        self.init(name: name, college: college, department: "Does not Specified yet!")
    }
    
    convenience init(name: String, department: String) {
        self.init(name: name, college: "Does not Specified yet!", department: department)
    }
    
    func details() {
        print("[Name : \(self.name), College : \(self.college), Department : \(self.department) ]")
    }
}

let student1 = StudentDetails(name: "Elon" , college: "MIT")
let student2 = StudentDetails(name: "Isaac" , department: "Physics")
student1.details()
student2.details()

student2.college = "Trinity College"
student2.details()

print("------------- Exercise - 3 -------------")
class Song {
    var title = "None"
    var artist = "None"
    
}
let song = Song()

print("Before Setting with Defaults.")
print("Song: \(song.title) by Artist: \(song.artist)") //reading properties

song.title = "505"
song.artist = "Arctic Monkey"

print("After Setting with Defaults.")
print("Song: \(song.title) by Artist: \(song.artist)")

print("------------- Exercise - 4 -------------")
class SqureCal {
    var value: Int
    
    init(_ number: Int) {
        self.value = number
    }
    
    var sqr: Int  { value * value } // Directly return value on fly because it is Computed Propertu
}

let num = SqureCal(5)
print("\(num.value) : \(num.sqr)")

num.value = 10
print("\(num.value) : \(num.sqr)")

print("------------- Exercise - 5 -------------")
class RockSong: Song { // Defined Song class at Line : 56 in example 3
    
    init(title: String, artist: String) {
        super.init()
        super.title = title
        super.artist = artist
    }
}

class HipHopSong: Song {
    
    init(title: String, artist: String) {
        super.init()
        super.title = title
        super.artist = artist
    }
}

let songA = RockSong(title: "Do I wann Know?", artist: "Arctic Monkey")
let songB = HipHopSong(title: "Passionfruit", artist: "Drake")

print("Parent Properties: Title and Artist")
print(" ")

print("For songA (Rock Song):")
print("\(songA.title) by \(songA.artist).")
print(" ")

print("For songB (Hip-HopSong):")
print("\(songB.title) by \(songB.artist).")

print("------------- Exercise - 6 -------------")

class Performance { //Base Class
    var city: String
    var venue: String
    
    init(city: String, venue: String) {
        self.city = city
        self.venue = venue
    }
    
    func intro() {
        print("Welcome to tonight's performance at \(venue), \(city)!")
    }
}

class ArcticMonkeysPerformance: Performance { // First Child Class
    var setOpener: String
    
    init(city: String, venue: String, setOpener: String) {
        self.setOpener = setOpener
        super.init(city: city, venue: venue)
    }
    
    override func intro() { //Changing implementation by overriding
        super.intro()//Calling original parent method
        print("Arctic Monkeys are on stage! Opening with '\(setOpener)'.")
    }
}

class HipHopPerformance: Performance { //Second Child Class
    var singer: String
    var openingSong: String
    
    init(city: String, venue: String, singer: String, openingSong: String) {
        self.singer = singer
        self.openingSong = openingSong
        super.init(city: city, venue: venue)
    }
    
    override func intro() { //Changing implementation by overriding
        super.intro()//Calling original parent method
        print("\(singer) is on stage! Opening with '\(openingSong)'.")
    }
}

let amShow = ArcticMonkeysPerformance(city: "Ahmedabad", venue: "Motera Stadium", setOpener: "Brianstorm")
let hiphopShow = HipHopPerformance(city: "Mumbai", venue: "Wankhede", singer: "Drake", openingSong: "Crew Love")
amShow.intro()
print("")
hiphopShow.intro()

print("------------- Exercise - 7 -------------")
class PowerCalculator {
    var value : Double
    var power : Double = 0.0
    init(value: Double) {
        self.value = value
    }
    
    func doPower(power: Double) -> Double {
        self.power = power
        return pow(value, power)
    }
}
let numA = PowerCalculator(value: 5)
let result = numA.doPower(power: 3)

print("\(numA.value)`s \(numA.power) power(\(result))")
 
print("------------- Exercise - 8 -------------")
class Vehicles {
    var brand : String
    var topSpeed : Double
    
    init(brand: String, topSpeed: Double) {
        self.brand = brand
        self.topSpeed = topSpeed
    }
    func details() {
        print("The current vehicle is made by \(brand) with topspeed of \(topSpeed)km/h")
    }
}

class Bike : Vehicles {
    var hasHelmetStorage : Bool
    
    init(brand: String, topSpeed: Double, hasHelmetStorage: Bool) {
        self.hasHelmetStorage = hasHelmetStorage
        super.init(brand: brand, topSpeed: topSpeed)
    }
    override func details() {
        super.details()
        if hasHelmetStorage  { print("And also have Helmet storage.") }
        else { print("And it does not have Helmet storage.") }
    }
}

class Car : Vehicles {
    var numberOfSpeakers : Int
    
    init(brand: String, topSpeed: Double, numberOfSpeakers : Int) {
        self.numberOfSpeakers = numberOfSpeakers
        super.init(brand: brand, topSpeed: topSpeed)
    }
    override func details() {
        super.details()
        print("With \(numberOfSpeakers) speakers.")
    }
}
let commuterBike = Bike(brand: "Honda", topSpeed: 110.5, hasHelmetStorage: true)
commuterBike.details()

let sportBike = Bike(brand: "Ducati", topSpeed: 299.0, hasHelmetStorage: false)
sportBike.details()

let familyCar = Car(brand: "Toyota", topSpeed: 180.0, numberOfSpeakers: 6)
familyCar.details()

print("------------- Exercise - 9 -------------")
class Name {
    var name : String
    
    init(name: String) {
        self.name = name
    }
    
    func greet() {
        print("Hello \(name)")
    }
}

let personT = Name(name: "Ted")
personT.greet()

print("------------- Exercise - 10 -------------")
class GreetingHolder {
    var greeting : String = ""
}
let grtHol1 = GreetingHolder()
grtHol1.greeting = "Hello"

let grtHol2 = grtHol1
grtHol2.greeting = "Hii"

print(grtHol1.greeting)
print(grtHol2.greeting)
//Both Will print Hii
//Because classes are reference types, meaning both variables point to the same instance.

print()
print("--------------- Structure ---------------")

print("------------- Exercise - 1 -------------")
struct Work {
    var workLocation : String
    var workHours : Int
    var projectNames : [String]
    
    func projectList() {
        print(projectNames)
    }
}


let work1 = Work(
    workLocation: "Office: KP Epitom",
    workHours: 8,
    projectNames: [
        "Fix UI glitches in Detail Screen",
        "Integrate Apple Music API",
        "Add Dark Theme for Settings Screen"
    ]
)
print("Work Location: \(work1.workLocation)")
print("Working Hours: \(work1.workHours)")
work1.projectList()


print("------------- Exercise - 2 -------------")
struct Recipe {
    var dishName: String
    var cookingTime: Int
    var ingredients: [String]
    
    func printIngredients() {
        print("List of Ingredients")
        ingredients.forEach { print($0) }
    }
}
let dish1 = Recipe(dishName: "Red Pasta",
                   cookingTime: 25,
                   ingredients: [ "Pasta", "Tomato", "Butter", "Garlic", "Parmesan" ]
            )
print("\(dish1.dishName) takes \(dish1.cookingTime) minutes.")
dish1.printIngredients()

print("------------- Exercise - 3 -------------")
struct Order {
    var drink: String
    var quantity: Int
    
    init(drink: String = "Long Espresso", quantity: Int = 1) {
        self.drink = drink
        self.quantity = quantity
    }
}
let regularOrder = Order()
print("Ragular Order : \(regularOrder.quantity) \(regularOrder.drink)")
let sundayOrder = Order(drink: "Mocha", quantity: 2)
print("Sunday Order : \(sundayOrder.quantity) \(sundayOrder.drink)")

print("------------- Exercise - 4 -------------")
struct NumberFilter {
    var inputArr : [Int]
    
    var oddArr : [Int] {
        inputArr.filter { $0%2 != 0 }
    }
    
    var evenArr : [Int] {
        inputArr.filter { $0%2 == 0 }
    }
    
    init(_ inputArr: [Int]) {
        self.inputArr = inputArr
    }
}

let numbers = NumberFilter( [1, 3, 5, 6, 8, 10, 9, 7, 8, 12] )
print("Input: \(numbers.inputArr)")
print("Even numbers are: \(numbers.evenArr)")
print("Even numbers are: \(numbers.oddArr)")

print("------------- Exercise - 5 -------------")
struct PersonStr {
    var name : String
    var age : Int
    var gender : String
}

var person1 = PersonStr(name: "Joe", age: 27, gender: "Male")
var person2 = PersonStr(name: "Harry", age: 21, gender: "Male")
var person3 = PersonStr(name: "Katey", age: 45, gender: "Female")

var personList: [PersonStr] = [person1, person2, person3]
personList.forEach { person in
    print("Name: \(person.name), Gender: \(person.gender), Age: \(person.age)")
}

print("------------- Exercise - 6 -------------")
struct GreetingHolderStr {
    var greeting : String = ""
}
var grtHolStr1 = GreetingHolderStr()
grtHolStr1.greeting = "Hello"

var grtHolStr2 = grtHol1
grtHol2.greeting = "Hii"

print(grtHol1.greeting)
print(grtHol2.greeting)
//Both Will print different

/* Because structure are value types,
 meaning both variables have different copy of data
 when the value of greeting assign from Hello to Hii.
 */

print("------------- Exercise - 7 -------------")
let reason = """
The Key difference between class and structure is that
classes are Refernce Types i.e. they shared reference on assignment/pass
structure are Value Types i.e. copied value on assignment/pass
"""
//Other than that classes have inheritance and structure
print(reason)

print()
print("--------------- Enumerations ---------------")

print("------------- Exercise - 1 -------------")
enum Weekdays  : Int {
    case monday = 1, tuesday, wednesday, thursday, friday, saturday, sunday
    
    func dayShortName() -> String {
        switch self {
            case .monday : return "mon"
            case .tuesday : return "tue"
            case .wednesday : return "wed"
            case .thursday : return "thu"
            case .friday : return "fri"
            case .saturday : return "sat"
            case .sunday : return "sun"
        }
    }
    
    func dayFullName() -> String {
        switch self {
            case .monday : return "Monday"
            case .tuesday : return "Tuesday"
            case .wednesday : return "Wednesday"
            case .thursday : return "Thursday"
            case .friday : return "Friday"
            case .saturday : return "Saturday"
            case .sunday : return "Sunday"
        }
    }
}


func printDay(number : Int) {
    if let day = Weekdays(rawValue: number) {
        print("Full Name: \(day.dayFullName()), Short Name: \(day.dayShortName())")
    } else {
        print("Enter Valid Input")
    }
}

printDay(number: 1)
printDay(number: 9)

print("------------- Exercise - 2 -------------")
enum Month : Int {
    case january = 1, february, march, april, may, june
    case july, august, september, october, november, december
    
    func findNumberOfDays(in year : Int? = nil) -> Int {
        switch self {
            case .january, .march, .may, .july, .august, .october, .december: return 31
            case .april, .june, .september, .november: return 30
            case .february:
                guard let year else { return 28 }
                
                let isLeap = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
                return isLeap ? 29 : 28
        }
    }
}

func printDaysInMonth(monthNumber: Int,in year : Int? = nil) {
    if let month = Month(rawValue: monthNumber) {
        if let year {
            print("Number of Days in month \(month) of \(year) is : \(month.findNumberOfDays(in: year))")
        } else {
            print("Number of Days in month \(month) is: \( month.findNumberOfDays() )")
        }
        
    } else {
        print("Enter Valid input.")
    }
}

printDaysInMonth(monthNumber: 2, in: 2024)
printDaysInMonth(monthNumber: 5)

print("------------- Exercise - 3 -------------")
enum SpiceLevel : Int {
    case mild = 1, medium, hot, veryHot, mirchiBomb
    
    func warningMessage() -> String {
        switch self {
            case .mild : return "It is gentle level just enough spice to keep toung warm."
            case .medium : return "It is Balanced and flavorful best for comfort zone."
            case .hot : return "This level where you get Actual Kick."
            case .veryHot : return "This is serious zone not for weaks."
            case .mirchiBomb : return "Tackle at your own risk — this spice is very intense"
        }
    }
}

func spiceCheck(ofLevel level: Int) {
    if let spicyness = SpiceLevel(rawValue: level) {
        print("\(spicyness) Level of Spice : \(spicyness.warningMessage())")
    } else {
        print("Enter valid level of Spicyness.")
    }
}
spiceCheck(ofLevel: 5)
spiceCheck(ofLevel: 2)

print("------------- Exercise - 4 -------------")
enum GreatHouses : String {
    case stark = "Winter Is Coming"
    case arryn = "As High as Honor"
    case tully = "Family, Duty, Honor"
    case lannister = "Hear Me Roar!"
    case tyrell = "Growing Strong"
    case baratheon = "Ours Is the Fury"
    case martell = "Unbowed, Unbent, Unbroken"
    case targaryen = "Fire and Blood"
}

func foundWords(house: GreatHouses) {
    switch house {
    case .stark : print("Words of House \(house) are: \(house.rawValue)")
        case .arryn : print("Words of House \(house) are: \(house.rawValue)")
        case .tully : print("Words of House \(house) are: \(house.rawValue)")
        case .lannister : print("Words of House \(house) are: \(house.rawValue)")
        case .tyrell : print("Words of House \(house) are: \(house.rawValue)")
        case .baratheon : print("Words of House \(house) are: \(house.rawValue)")
        case .martell : print("Words of House \(house) are: \(house.rawValue)")
        case .targaryen : print("Words of House \(house) are: \(house.rawValue)")
    }
}

foundWords(house: .stark)
foundWords(house: .targaryen)

print("------------- Exercise - 5 -------------")
enum SuitType: String {
    case classic = "Three-Piece"
    case flight = "Flight Suit"
    case birthday = "Birthday Piece"
}

let inputFromBarney = "Fligth Suit"
if let selectedSuit = SuitType(rawValue: inputFromBarney) {
    print("Suit up for \(selectedSuit)")
} else {
    print("That is not legendary! selct some suit.")
}

print("------------- Exercise - 6 -------------")
enum Direction : CaseIterable { // Optional CaseItrable : If yoo want then you use collections properties from this protocol
    case north
    case south
    case east
    case west
}
Direction.allCases.forEach{ print($0) }
// Compolsory CaseItrable : You must define collection for all cases (If you want) cannnot use CaseItrable Protocol because the cases have assoicated Values
enum TraficLights {
    case stop (colour: String)
    case wait (colour: String)
    case go (colour: String)
    
    static let allLigths : [TraficLights] = [.stop(colour: "Red"),
                                             .wait(colour: "Yellow"),
                                             .go(colour: "Green")]
}
TraficLights.allLigths.forEach { print($0) }


print("------------- Exercise - 7 -------------")
enum Music {
    case playSong (title : String, artist : String, startsAtSeconds : Int = 0)
    case pauseSong (atSecond: Int)
    case skipToNext (currentSong: String, timeSkippedAt: String)
    case addToPlaylist (playListName: String, trackTitle: String, artist: String)
    case playListSwicted (fromPlayList: String, toPlayList: String)
    
     func messageForAction() {
        switch self {
            case .playSong(let title, let artist, let startsAtSeconds) :
                print("Playing \(title) by \(artist) from \(startsAtSeconds) seconds.")
            case .pauseSong(let atSecond):
                print("Paused current song at \(atSecond) seconds.")
            case .skipToNext(let currentSong,let timeSkippedAt) :
                print("Skipping \(currentSong) to \(timeSkippedAt) seconds.")
            case .addToPlaylist(let playListName, let trackTitle, let artist):
                print("Added \(trackTitle) by \(artist) into \(playListName).")
            case .playListSwicted(let fromPlayList, let toPlayList):
                print("Switched from \(fromPlayList) to \(toPlayList).")
        }
    }
}


Music
    .addToPlaylist(playListName: "Do I wann know?", trackTitle: "Indie Rock", artist: "Arctic Monkey")
    .messageForAction()

Music
    .addToPlaylist(playListName: "Indie Rock", trackTitle: "Mardy Bum", artist: "Arctic Monkey")
    .messageForAction()
 
print("------------- Exercise - 8 -------------")
enum ValriyanBlade: String {
    case ice = "House Strak"
    case longClaw = "House Mormont"
    case heartSbne = "House Tarly"
    case blackFyre = "House Blackfyre"
    case darkSister = "House Targaryen"
    
    func printHouse() {
        switch self {
            case .blackFyre : print("\(self) is belongs to \(self.rawValue)")
            case .darkSister : print("\(self) is belongs to \(self.rawValue)")
            case .heartSbne : print("\(self) is belongs to \(self.rawValue)")
            case .ice :  print("\(self) is belongs to \(self.rawValue)")
            case .longClaw : print("\(self) is belongs to \(self.rawValue)")
        }
    }
}

ValriyanBlade.ice.printHouse()
ValriyanBlade.heartSbne.printHouse()

//If we define method printHouse as static and pass enum instance as parameter we can call printHouse method with defining instance
//Example : ValriyanBlade.printHouse( .ice) this same thing is also applied on prevoius Music enum Exercise 7
print()
print("--------------- Properties, Subscripts, Methods & Inheritance ---------------")

print("------------- Exercise - 1 -------------")
class Wallet {
    private(set) var accountBalance : Double
    init(initialalance accountBalance: Double) {
        self.accountBalance = accountBalance
    }
}

let wallet = Wallet(initialalance: 500.0)
print(wallet.accountBalance)
//wallet.accountBalance = 1000.0 (Shows Error)

print("------------- Exercise - 2 -------------")
class F1Telemetry {
    var speedMPH : Double
    var speedKPH : Double {
        get {
            self.speedMPH * 1.609
        } set {
            self.speedMPH = newValue/1.609
        }
    }
    
    init(speedMPH: Double) {
        self.speedMPH = speedMPH
    }
}
var telemetry = F1Telemetry(speedMPH: 100.0)
print("Initial KPH: \(telemetry.speedKPH)")
telemetry.speedKPH = 321.8
print("Updated MPH: \(telemetry.speedMPH)")

print("------------- Exercise - 3 -------------")
class MotorcycleHelmet {
    var model: String
    var type: String
    var hasDualVisor: Bool
    
    init(model: String, type: String, hasDualVisor: Bool) {
        self.model = model
        self.type = type
        self.hasDualVisor = hasDualVisor
    }
}
let myHelmet = MotorcycleHelmet(model: "ABP Axis", type: "Flip-Up", hasDualVisor: true)
print("Helmet: \(myHelmet.model), Dual Visor: \(myHelmet.hasDualVisor)")

print("------------- Exercise - 4 -------------")//Problem
class DatabaseManager {
    private var password: String
    init(password: String) {
        self.password = password
    }
    
    func connect() {
         print("Connecting to database")
    }
}

let db = DatabaseManager(password: "SuperSecret123")
db.connect()
// print(db.rootPassword) This will throw an error

print("------------- Exercise - 5 -------------")
class Person {
    var name: String
    var id: String
    
    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
}

let persons : [Person] = [
    Person(name: "Bruno", id: "8"),
    Person(name: "Marcus", id: "10"),
    Person(name: "Harry", id: "5"),
    Person(name: "Antony", id: "21"), //GOAT 21
    Person(name: "Onana", id: "24")]

persons.map { person in
    print("ID \(person.id): \(person.name)")
}

print("------------- Exercise - 6 -------------")
class FryerTemp {
    var temperature : Int {
        willSet(newValue) {
                print("Warning Heating up to \(newValue).")
        }
        didSet(oldValue) {
            print("Temperature changed by \(temperature-oldValue)")
        }
    }
    
    init(temperature: Int) {
        self.temperature = temperature
    }
}
var oil = FryerTemp(temperature: 180)
oil.temperature = 210

print("------------- Exercise - 7 -------------")
class PlayList {
    var name : String
    lazy var allTracks : [String] = {
        print("Loading Tracks from database.")
        return Array(repeating: " ", count: 20)
    }()
    
    init(name: String) {
        self.name = name
    }
}

var myMix = PlayList(name: "Heap-Hop")
print("Loading Playlist")
myMix.allTracks
print("Number of Tracks in \(myMix.name) is \(myMix.allTracks.count)")

print("------------- Exercise - 8 -------------")
class PersonBase {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Student: PersonBase {
    var college : String
    var rollNumber: String
    
    init(name: String,age: Int, collegeName: String, rollNumber: String) {
        self.college = collegeName
        self.rollNumber = rollNumber
        super.init(name: name, age: age)
    }
}

class Employee: PersonBase {
    var companyName : String
    var role : String
    
    init(name: String,age: Int, companyName: String, role: String) {
        self.companyName = companyName
        self.role = role
        super.init(name: name, age: age)
    }
}

let intern = Employee(name: "Tushar", age: 24, companyName: "Simform", role: "Data Engineer Intern")
let student = Student(name: "Bhumik", age: 21, collegeName: "VGEC", rollNumber: "220170107106")

print("\(intern.name) works at \(intern.companyName).")
print("Roll number of \(student.name) is \(student.rollNumber).")

print("------------- Exercise - 9 -------------")
struct SpanishLesson {
    var wordsLearned : Int
    init(wordsLearned: Int) {
        self.wordsLearned = wordsLearned
    }
    
    mutating func completeLesson(newWords : Int) {
        wordsLearned += newWords
    }
}

var myProgress = SpanishLesson(wordsLearned: 10)
myProgress.completeLesson(newWords: 5)
print("Total Spanish words learned: \(myProgress.wordsLearned)")

print("------------- Exercise - 10 -------------")
class Notification {
    func displayAlert() {
        print("Notification PopUp.")
    }
}

class InstagramNotification : Notification {
    override func displayAlert() {
        print("Aleart From Instagram.")
        super.displayAlert()
    }
}

let standard = Notification()
let reelAlert = InstagramNotification()

standard.displayAlert()
print("---")
reelAlert.displayAlert()

print("------------- Exercise - 11 -------------")
class MathUtiliy {
    static func square(of number: Int) -> Int {
        return number * number
    }
}
let mathResult = MathUtiliy.square(of: 12)
print("Math Result is \(mathResult)")

print("------------- Exercise - 12 -------------")
class AppTheme {
    static func coreTheme() {
        print("Running coreTheme Static Method from base class.")
    }
    
    func buttonStyle() {
        print("Running Button Style Class Method from base class.")
    }
}
class DarkModeTheme: AppTheme {
    override func buttonStyle() {
        print("Running Button Style Class Method from sub class.")
    }
//    override func coreTheme() {
// this will throw error
//    }
}

DarkModeTheme().buttonStyle()
DarkModeTheme.coreTheme()

print("------------- Exercise - 13 -------------")
class DaySchedule {
    let days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    
    subscript (day: Int) -> String {
        if (day<7 && day>0) {
            return days[day-1]
        } else {
            return "Invalid Day"
        }
    }
}
let myWeek = DaySchedule()
print(myWeek[1])
print(myWeek[9])

print("------------- Exercise - 14 -------------")
extension String {
    subscript(_ i: Int)-> Character {
        let idx = self.index(self.startIndex, offsetBy: i)
        return self[idx]
    }
}
let bookTitle = "Tender is the Flesh"
let char = bookTitle[7]
print((bookTitle))
print(char)

print("------------- Exercise - 15 -------------")
extension String {
    subscript(rang : Range<Int>) -> String {
            let startIdx = (self.index(self.startIndex, offsetBy: rang.lowerBound))
            let endIdx = self.index(self.startIndex, offsetBy: rang.upperBound)
            return String(self[startIdx..<endIdx])
    }
}

let quote = "Winter is Coming"
print(quote[1..<6])

print("------------- Exercise - 16 -------------")
extension Array where Element == Int {
    func elements (_ rang: Range<Int>)-> [Int] {
        let safeStrIdx = Swift.max(0, rang.lowerBound)
        let safeEndIdx = Swift.min(self.count, rang.upperBound)
        
        if safeStrIdx > safeEndIdx { return [] }
        
        return Array(self[safeStrIdx..<safeEndIdx])
    }
}
let swordsList = [5,9,10,7,3,6,4,8,2]
let finalSwords = swordsList.elements(1..<5)
print(finalSwords)

print("------------- Exercise - 17 -------------")
extension Array where Element == [Int:String] {
    subscript(at key: Int)-> String? {
        return self.compactMap{ dict in
            dict[key]
        }.first
    }
}
let greetingArray = [[1: "Hello"], [2: "Hi"], [3: "Ola"]]
print(greetingArray[1])

print("------------- Exercise - 18 -------------")
class PersonDetails {
    var name : String
    var age : Int
    var birthDate : String
    
    init(name: String, age: Int, birthDate: String) {
        self.name = name
        self.age = age
        self.birthDate = birthDate
    }
}

extension Array where Element == PersonDetails {
    subscript(name : String) -> PersonDetails? {
        return self.first { $0.name == name }
    }
}

let people: [PersonDetails] = [
    PersonDetails(name: "Alex", age: 37, birthDate: "1986-12-15"),
    PersonDetails(name: "Barbara", age: 25, birthDate: "1998-03-22"),
    PersonDetails(name: "Craig", age: 42, birthDate: "1981-06-11")
]

print("\(people["Alex"]?.name ?? "Not Found") is \(people["Alex"]?.age ?? -1) years old.")


print("------------- Exercise - 19 -------------")
class SongCls {
    var title: String
    var composer: String
    
    init(title: String, composer: String) {
        self.title = title
        self.composer = composer
    }
}

class ClassicalSongCls : SongCls {
    var genre: String
    
    init(title: String, composer: String, genre: String) {
        self.genre = genre
        super.init(title: title, composer: composer)
    }
}

class HipHopSongCls : SongCls {
    var genre: String
    init(title: String, composer: String, genre: String) {
        self.genre = genre
        super.init(title: title, composer: composer)
    }
}

let song1 = ClassicalSongCls(title: "Cornfield Chase",composer: "Hans Zimmer", genre: "Classical")
print("\(song1.title) by \(song1.composer) is of genre \(song1.genre)")
let song2 = HipHopSongCls(title: "Blinding Lights",composer: "The Weeknd", genre: "Pop Rap")
print("\(song2.title) by \(song2.composer) is of genre \(song2.genre)")

print("------------- Exercise - 20 -------------")
class UserProfile {
    var displayName: String

    var loginCount: Int = 0
    
    init(displayName: String) {
        self.displayName = displayName
    }
}

let profile = UserProfile(displayName: "Alex")

profile.displayName = "Sam"
profile.loginCount += 1

print("User: \(profile.displayName), Logins: \(profile.loginCount)")

print("--------------- Error Handling ---------------")
print("------------- Exercise - 1 -------------")
enum PasswordError : Error {
    case emptyPassword
    case passwordTooShort
}

func validatePassword(_ password: String) throws {
    if password.isEmpty {
        throw PasswordError.emptyPassword
    }
    if password.count < 8 {
        throw PasswordError.passwordTooShort
    }
    
    print("Password is valid")
}

let testPasswords: [String] = ["", "1234567", "12345678"]

for password in testPasswords {
    print("Testing Password: \(password)")
    do {
        try validatePassword(password)
    } catch PasswordError.emptyPassword {
        print("Exception thrown: Empty Password.")
    } catch PasswordError.passwordTooShort {
        print("Exception thrown: Password too short.")
    } catch {
        print("Unexpected Error thrown: \(error).")
    }
        
}

print("------------- Exercise - 2 -------------")
enum InventoryError : Error {
    case outOfStock
    case insufficientFunds(available : Int)
}

struct BarCart {
    var barInventory = [
        "Scotch": 10,
        "Beer": 5,
        "Ginger Ale": 2
    ]
    
    var myCart : [String: Int] = [:]
    
    mutating func addInMyCart(item: String, quantity: Int) throws {
        guard let inventoryCount = barInventory[item] else {
            throw InventoryError.outOfStock
        }
        
        if quantity > inventoryCount {
            throw InventoryError.insufficientFunds(available: inventoryCount)
        }
        
        myCart[item, default: 0] += quantity
        barInventory[item, default: -quantity] -= quantity
        print("Added \(myCart[item, default: 0]) \(item)(s) in my cart.")
        print("Avaible \(item) in stock: \(barInventory[item, default: 0])")
    }
    
}
var barneyCart = BarCart()

do {
    try barneyCart.addInMyCart(item: "Scotch", quantity: 3)
} catch InventoryError.outOfStock {
    print("Error: That drink is out of stock here")
} catch InventoryError.insufficientFunds(available: let available) {
    print("Error: We don`t have enogh quantity, We only have \(available) bottles.")
} catch {
    print("An unexpected error occurred: \(error)")
}


print()
print("--------------- Extension ---------------")
print("------------- Exercise - 1 -------------")

extension String {
    func addCharAtFifthPosition(_ char: Character) -> String {
        var stringArray: [Character] = Array(self)
        stringArray.insert(char, at: 4)
        return String(stringArray)
    }
    
    func replaceChar(_ oldChar: Character, with newChar: Character) -> String {
        self.map { String($0 == oldChar ? newChar : $0) }.first ?? "Not found"
    }
    
    func removeSpaces()->String {
        self.filter {$0 != " "}
    }
    
    func countWords()->Int {
        self.split(separator: " ").count
    }
}

let moto = "Our is The Fury"
print("Input String: \(moto)")
print(moto.addCharAtFifthPosition("w"))
print(moto.removeSpaces())
print(moto.replaceChar("i", with: "I"))
print(moto.countWords())
