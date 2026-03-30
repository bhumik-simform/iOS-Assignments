//
//  DishData.swift
//  Assignment_Chapter_3_iOS(C)
//
//  Created by Bhumik Poshiya on 31/03/26.
//

import Foundation
import UIKit


enum DishType: String {
    case veg    = "Veg"
    case nonVeg = "Non-Veg"
    case vegan  = "Vegan"
     
    func colourCode() -> UIColor {
        switch self {
        case .veg: return UIColor(red: 0.20, green: 0.78, blue: 0.35, alpha: 0.8)
        case .nonVeg: return  UIColor(red: 1.00, green: 0.23, blue: 0.19, alpha: 0.8)
        case.vegan: return UIColor(red: 0.00, green: 0.78, blue: 0.75, alpha: 0.8)
        }
        
    }
    
}

struct Dish {
    let name: String
    let country: String
    let emoji: String
    let type: DishType
    let spiceLevel: String
    let color: UIColor
}

struct Country {
    let name: String
    let emoji: String
    let flagEmoji: String
    let dishCount: Int
    let color: UIColor
}

// MARK: - Countries
let allCountries: [Country] = [
    Country(name: "Italy",    emoji: "🍕", flagEmoji: "🇮🇹", dishCount: 6, color: UIColor(red: 0.91, green: 0.30, blue: 0.24, alpha: 0.8)),
    Country(name: "Japan",    emoji: "🍜", flagEmoji: "🇯🇵", dishCount: 6, color: UIColor(red: 0.75, green: 0.22, blue: 0.17, alpha: 0.8)),
    Country(name: "India",    emoji: "🍛", flagEmoji: "🇮🇳", dishCount: 6, color: UIColor(red: 0.90, green: 0.49, blue: 0.13, alpha: 0.8)),
    Country(name: "Mexico",   emoji: "🌮", flagEmoji: "🇲🇽", dishCount: 6, color: UIColor(red: 0.15, green: 0.68, blue: 0.38, alpha: 0.8)),
    Country(name: "France",   emoji: "🥐", flagEmoji: "🇫🇷", dishCount: 6, color: UIColor(red: 0.20, green: 0.40, blue: 0.73, alpha: 0.8)),
    Country(name: "China",    emoji: "🥟", flagEmoji: "🇨🇳", dishCount: 6, color: UIColor(red: 0.83, green: 0.18, blue: 0.18, alpha: 0.8)),
    Country(name: "Greece",   emoji: "🥗", flagEmoji: "🇬🇷", dishCount: 5, color: UIColor(red: 0.18, green: 0.55, blue: 0.84, alpha: 0.8)),
    Country(name: "Thailand", emoji: "🍲", flagEmoji: "🇹🇭", dishCount: 5, color: UIColor(red: 0.61, green: 0.15, blue: 0.69, alpha: 0.8)),
    Country(name: "USA",      emoji: "🍔", flagEmoji: "🇺🇸", dishCount: 6, color: UIColor(red: 0.18, green: 0.32, blue: 0.57, alpha: 0.8)),
    Country(name: "Spain",    emoji: "🥘", flagEmoji: "🇪🇸", dishCount: 5, color: UIColor(red: 0.83, green: 0.33, blue: 0.00, alpha: 0.8)),
].sorted { $0.name < $1.name }

// MARK: - Dishes
let allDishes: [Dish] = [

    // ITALY
    Dish(name: "Margherita Pizza", country: "Italy",   emoji: "🍕", type: .veg,    spiceLevel: "Mild",      color: UIColor(red: 1.00, green: 0.88, blue: 0.75, alpha: 1)),
    Dish(name: "Pasta Carbonara",  country: "Italy",   emoji: "🍝", type: .nonVeg, spiceLevel: "Mild",      color: UIColor(red: 1.00, green: 0.95, blue: 0.75, alpha: 1)),
    Dish(name: "Tiramisu",         country: "Italy",   emoji: "🍰", type: .veg,    spiceLevel: "None",      color: UIColor(red: 0.91, green: 0.83, blue: 0.77, alpha: 1)),
    Dish(name: "Risotto",          country: "Italy",   emoji: "🍚", type: .veg,    spiceLevel: "Mild",      color: UIColor(red: 1.00, green: 0.97, blue: 0.86, alpha: 1)),
    Dish(name: "Osso Buco",        country: "Italy",   emoji: "🥩", type: .nonVeg, spiceLevel: "Mild",      color: UIColor(red: 0.98, green: 0.82, blue: 0.75, alpha: 1)),
    Dish(name: "Bruschetta",       country: "Italy",   emoji: "🍞", type: .vegan,  spiceLevel: "None",      color: UIColor(red: 0.98, green: 0.91, blue: 0.71, alpha: 1)),

    // JAPAN
    Dish(name: "Ramen",            country: "Japan",   emoji: "🍜", type: .nonVeg, spiceLevel: "Medium",    color: UIColor(red: 1.00, green: 0.82, blue: 0.82, alpha: 1)),
    Dish(name: "Sushi",            country: "Japan",   emoji: "🍣", type: .nonVeg, spiceLevel: "Mild",      color: UIColor(red: 0.98, green: 0.87, blue: 0.87, alpha: 1)),
    Dish(name: "Tempura",          country: "Japan",   emoji: "🍤", type: .nonVeg, spiceLevel: "Mild",      color: UIColor(red: 1.00, green: 0.93, blue: 0.80, alpha: 1)),
    Dish(name: "Miso Soup",        country: "Japan",   emoji: "🍵", type: .vegan,  spiceLevel: "None",      color: UIColor(red: 0.87, green: 0.93, blue: 0.85, alpha: 1)),
    Dish(name: "Takoyaki",         country: "Japan",   emoji: "🐙", type: .nonVeg, spiceLevel: "Medium",    color: UIColor(red: 0.98, green: 0.84, blue: 0.75, alpha: 1)),
    Dish(name: "Edamame",          country: "Japan",   emoji: "🫘", type: .vegan,  spiceLevel: "None",      color: UIColor(red: 0.84, green: 0.93, blue: 0.80, alpha: 1)),

    // INDIA
    Dish(name: "Butter Chicken",   country: "India",   emoji: "🍗", type: .nonVeg, spiceLevel: "Medium",    color: UIColor(red: 1.00, green: 0.91, blue: 0.75, alpha: 1)),
    Dish(name: "Biryani",          country: "India",   emoji: "🍚", type: .nonVeg, spiceLevel: "Spicy",     color: UIColor(red: 1.00, green: 0.87, blue: 0.67, alpha: 1)),
    Dish(name: "Paneer Tikka",     country: "India",   emoji: "🧀", type: .veg,    spiceLevel: "Medium",    color: UIColor(red: 1.00, green: 0.93, blue: 0.71, alpha: 1)),
    Dish(name: "Dal Tadka",        country: "India",   emoji: "🥣", type: .vegan,  spiceLevel: "Medium",    color: UIColor(red: 0.98, green: 0.89, blue: 0.68, alpha: 1)),
    Dish(name: "Samosa",           country: "India",   emoji: "🥟", type: .veg,    spiceLevel: "Medium",    color: UIColor(red: 0.98, green: 0.93, blue: 0.76, alpha: 1)),
    Dish(name: "Gulab Jamun",      country: "India",   emoji: "🍮", type: .veg,    spiceLevel: "None",      color: UIColor(red: 0.98, green: 0.84, blue: 0.76, alpha: 1)),

    // MEXICO
    Dish(name: "Tacos al Pastor",  country: "Mexico",  emoji: "🌮", type: .nonVeg, spiceLevel: "Spicy",     color: UIColor(red: 0.84, green: 0.96, blue: 0.82, alpha: 1)),
    Dish(name: "Guacamole",        country: "Mexico",  emoji: "🥑", type: .vegan,  spiceLevel: "Mild",      color: UIColor(red: 0.78, green: 0.93, blue: 0.73, alpha: 1)),
    Dish(name: "Enchiladas",       country: "Mexico",  emoji: "🫔", type: .nonVeg, spiceLevel: "Spicy",     color: UIColor(red: 0.91, green: 0.96, blue: 0.78, alpha: 1)),
    Dish(name: "Churros",          country: "Mexico",  emoji: "🍩", type: .vegan,  spiceLevel: "None",      color: UIColor(red: 1.00, green: 0.93, blue: 0.78, alpha: 1)),
    Dish(name: "Quesadilla",       country: "Mexico",  emoji: "🧇", type: .veg,    spiceLevel: "Mild",      color: UIColor(red: 0.98, green: 0.96, blue: 0.80, alpha: 1)),
    Dish(name: "Pozole",           country: "Mexico",  emoji: "🍲", type: .nonVeg, spiceLevel: "Medium",    color: UIColor(red: 0.87, green: 0.96, blue: 0.84, alpha: 1)),

    // FRANCE
    Dish(name: "Croissant",        country: "France",  emoji: "🥐", type: .veg,    spiceLevel: "None",      color: UIColor(red: 1.00, green: 0.95, blue: 0.78, alpha: 1)),
    Dish(name: "French Onion Soup",country: "France",  emoji: "🍲", type: .veg,    spiceLevel: "Mild",      color: UIColor(red: 0.98, green: 0.89, blue: 0.71, alpha: 1)),
    Dish(name: "Coq au Vin",       country: "France",  emoji: "🍗", type: .nonVeg, spiceLevel: "Mild",      color: UIColor(red: 0.84, green: 0.82, blue: 0.93, alpha: 1)),
    Dish(name: "Ratatouille",      country: "France",  emoji: "🥘", type: .vegan,  spiceLevel: "Mild",      color: UIColor(red: 0.84, green: 0.93, blue: 0.84, alpha: 1)),
    Dish(name: "Crème Brûlée",     country: "France",  emoji: "🍮", type: .veg,    spiceLevel: "None",      color: UIColor(red: 1.00, green: 0.96, blue: 0.82, alpha: 1)),
    Dish(name: "Baguette",         country: "France",  emoji: "🥖", type: .vegan,  spiceLevel: "None",      color: UIColor(red: 0.98, green: 0.93, blue: 0.78, alpha: 1)),

    // CHINA
    Dish(name: "Dim Sum",          country: "China",   emoji: "🥟", type: .nonVeg, spiceLevel: "Mild",      color: UIColor(red: 1.00, green: 0.87, blue: 0.84, alpha: 1)),
    Dish(name: "Kung Pao Chicken", country: "China",   emoji: "🍗", type: .nonVeg, spiceLevel: "Spicy",     color: UIColor(red: 1.00, green: 0.80, blue: 0.78, alpha: 1)),
    Dish(name: "Peking Duck",      country: "China",   emoji: "🦆", type: .nonVeg, spiceLevel: "Mild",      color: UIColor(red: 0.98, green: 0.84, blue: 0.80, alpha: 1)),
    Dish(name: "Mapo Tofu",        country: "China",   emoji: "🍲", type: .vegan,  spiceLevel: "Extra Hot", color: UIColor(red: 1.00, green: 0.82, blue: 0.76, alpha: 1)),
    Dish(name: "Spring Rolls",     country: "China",   emoji: "🌯", type: .veg,    spiceLevel: "Mild",      color: UIColor(red: 0.93, green: 0.96, blue: 0.80, alpha: 1)),
    Dish(name: "Fried Rice",       country: "China",   emoji: "🍳", type: .veg,    spiceLevel: "Mild",      color: UIColor(red: 1.00, green: 0.95, blue: 0.80, alpha: 1)),

    // GREECE
    Dish(name: "Moussaka",         country: "Greece",  emoji: "🥘", type: .nonVeg, spiceLevel: "Mild",      color: UIColor(red: 0.84, green: 0.91, blue: 0.98, alpha: 1)),
    Dish(name: "Greek Salad",      country: "Greece",  emoji: "🥗", type: .vegan,  spiceLevel: "None",      color: UIColor(red: 0.80, green: 0.93, blue: 0.87, alpha: 1)),
    Dish(name: "Souvlaki",         country: "Greece",  emoji: "🍢", type: .nonVeg, spiceLevel: "Mild",      color: UIColor(red: 0.87, green: 0.93, blue: 0.98, alpha: 1)),
    Dish(name: "Spanakopita",      country: "Greece",  emoji: "🥧", type: .veg,    spiceLevel: "None",      color: UIColor(red: 0.84, green: 0.96, blue: 0.89, alpha: 1)),
    Dish(name: "Baklava",          country: "Greece",  emoji: "🍯", type: .veg,    spiceLevel: "None",      color: UIColor(red: 1.00, green: 0.93, blue: 0.76, alpha: 1)),

    // THAILAND
    Dish(name: "Pad Thai",         country: "Thailand",emoji: "🍜", type: .nonVeg, spiceLevel: "Medium",    color: UIColor(red: 0.93, green: 0.84, blue: 0.98, alpha: 1)),
    Dish(name: "Green Curry",      country: "Thailand",emoji: "🍛", type: .nonVeg, spiceLevel: "Spicy",     color: UIColor(red: 0.84, green: 0.96, blue: 0.84, alpha: 1)),
    Dish(name: "Tom Yum Soup",     country: "Thailand",emoji: "🍲", type: .nonVeg, spiceLevel: "Extra Hot", color: UIColor(red: 0.98, green: 0.82, blue: 0.93, alpha: 1)),
    Dish(name: "Mango Sticky Rice",country: "Thailand",emoji: "🥭", type: .vegan,  spiceLevel: "None",      color: UIColor(red: 1.00, green: 0.96, blue: 0.76, alpha: 1)),
    Dish(name: "Som Tum",          country: "Thailand",emoji: "🥗", type: .vegan,  spiceLevel: "Spicy",     color: UIColor(red: 0.87, green: 0.96, blue: 0.80, alpha: 1)),

    // USA
    Dish(name: "Cheeseburger",     country: "USA",     emoji: "🍔", type: .nonVeg, spiceLevel: "Mild",      color: UIColor(red: 0.84, green: 0.89, blue: 0.98, alpha: 1)),
    Dish(name: "BBQ Ribs",         country: "USA",     emoji: "🍖", type: .nonVeg, spiceLevel: "Medium",    color: UIColor(red: 0.87, green: 0.84, blue: 0.96, alpha: 1)),
    Dish(name: "Mac and Cheese",   country: "USA",     emoji: "🧀", type: .veg,    spiceLevel: "None",      color: UIColor(red: 1.00, green: 0.95, blue: 0.76, alpha: 1)),
    Dish(name: "Clam Chowder",     country: "USA",     emoji: "🍵", type: .nonVeg, spiceLevel: "Mild",      color: UIColor(red: 0.89, green: 0.93, blue: 0.98, alpha: 1)),
    Dish(name: "Pancakes",         country: "USA",     emoji: "🥞", type: .veg,    spiceLevel: "None",      color: UIColor(red: 1.00, green: 0.93, blue: 0.82, alpha: 1)),
    Dish(name: "Caesar Salad",     country: "USA",     emoji: "🥗", type: .veg,    spiceLevel: "None",      color: UIColor(red: 0.84, green: 0.96, blue: 0.87, alpha: 1)),

    // SPAIN
    Dish(name: "Paella",           country: "Spain",   emoji: "🥘", type: .nonVeg, spiceLevel: "Mild",      color: UIColor(red: 1.00, green: 0.91, blue: 0.71, alpha: 1)),
    Dish(name: "Patatas Bravas",   country: "Spain",   emoji: "🥔", type: .vegan,  spiceLevel: "Spicy",     color: UIColor(red: 0.98, green: 0.93, blue: 0.73, alpha: 1)),
    Dish(name: "Gazpacho",         country: "Spain",   emoji: "🍅", type: .vegan,  spiceLevel: "Mild",      color: UIColor(red: 1.00, green: 0.84, blue: 0.78, alpha: 1)),
    Dish(name: "Churros Chocolate",country: "Spain",   emoji: "🍫", type: .vegan,  spiceLevel: "None",      color: UIColor(red: 0.87, green: 0.78, blue: 0.71, alpha: 1)),
    Dish(name: "Tortilla Española",country: "Spain",   emoji: "🍳", type: .veg,    spiceLevel: "None",      color: UIColor(red: 1.00, green: 0.96, blue: 0.80, alpha: 1)),
].sorted { $0.name < $1.name }
