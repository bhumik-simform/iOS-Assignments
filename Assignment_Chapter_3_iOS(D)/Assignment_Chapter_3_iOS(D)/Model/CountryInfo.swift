//
//  CountryInfo.swift
//  Assignment_Chapter_3_iOS(D)
//
//  Created by Bhumik Poshiya on 08/04/26.
//

//
//  CountryData.swift
//  Assignment_Chapter_3_iOS(C)
//
//  Created by Bhumik Poshiya on 31/03/26.
//

import Foundation
import UIKit

// MARK: - Country Model

struct Country: Identifiable {
    let id: UUID
    let name: String
    let flagEmoji: String
    let color: UIColor
    let cuisineStyle: String
    let description: String

    /// All dishes that belong to this country
    func dishes(from list: [Dish] = allDishes) -> [Dish] {
        list.filter { $0.countryID == id }
    }

    /// Dish count — handy for country cards in VC1
    func dishCount(from list: [Dish] = allDishes) -> Int {
        dishes(from: list).count
    }
}

// MARK: - Country IDs
// No access modifier = internal, so DishData.swift can reference them in the same module.

let idJapan    = UUID()
let idItaly    = UUID()
let idIndia    = UUID()
let idMexico   = UUID()
let idFrance   = UUID()
let idChina    = UUID()
let idGreece   = UUID()
let idThailand = UUID()
let idUSA      = UUID()
let idSpain    = UUID()

// MARK: - All Countries
// Sorted alphabetically — matches what VC1 displays.

let allCountries: [Country] = [

    Country(id: idChina,
            name: "China",
            flagEmoji: "🇨🇳",
            color: UIColor(red: 0.83, green: 0.18, blue: 0.18, alpha: 0.8),
            cuisineStyle: "Diverse & Complex",
            description: "Chinese cuisine spans eight major regional styles, each with distinct ingredients and methods. From the fiery heat of Sichuan to the light steamed dishes of Cantonese cooking, it offers extraordinary variety."),

    Country(id: idFrance,
            name: "France",
            flagEmoji: "🇫🇷",
            color: UIColor(red: 0.20, green: 0.40, blue: 0.73, alpha: 0.8),
            cuisineStyle: "Refined & Classic",
            description: "French cuisine is the foundation of modern Western cooking. Known for its sauces, pastries, and meticulous technique, it has shaped professional kitchens and fine dining around the globe."),

    Country(id: idGreece,
            name: "Greece",
            flagEmoji: "🇬🇷",
            color: UIColor(red: 0.18, green: 0.55, blue: 0.84, alpha: 0.8),
            cuisineStyle: "Fresh & Mediterranean",
            description: "Greek cuisine celebrates the Mediterranean diet — olive oil, fresh vegetables, legumes, and seafood. Simple preparations that let quality ingredients shine are the hallmark of this ancient culinary tradition."),

    Country(id: idIndia,
            name: "India",
            flagEmoji: "🇮🇳",
            color: UIColor(red: 0.90, green: 0.49, blue: 0.13, alpha: 0.8),
            cuisineStyle: "Spicy & Aromatic",
            description: "Indian cuisine is a vibrant tapestry of spices, herbs, and regional diversity. From creamy curries of the north to tangy coconut-based dishes of the south, every state offers a distinct flavour palette."),

    Country(id: idItaly,
            name: "Italy",
            flagEmoji: "🇮🇹",
            color: UIColor(red: 0.91, green: 0.30, blue: 0.24, alpha: 0.8),
            cuisineStyle: "Rich & Hearty",
            description: "Italian cuisine is rooted in fresh, high-quality ingredients and regional traditions. Pasta, pizza, and slow-cooked sauces form the backbone of a culinary culture loved worldwide."),

    Country(id: idJapan,
            name: "Japan",
            flagEmoji: "🇯🇵",
            color: UIColor(red: 0.75, green: 0.22, blue: 0.17, alpha: 0.8),
            cuisineStyle: "Umami & Delicate",
            description: "Japanese cuisine emphasises seasonal ingredients, precise technique, and a balance of five flavours. From the simplicity of miso soup to the artistry of sushi, every dish tells a story of craftsmanship."),

    Country(id: idMexico,
            name: "Mexico",
            flagEmoji: "🇲🇽",
            color: UIColor(red: 0.15, green: 0.68, blue: 0.38, alpha: 0.8),
            cuisineStyle: "Bold & Fiery",
            description: "Mexican cuisine blends indigenous Aztec and Maya ingredients with Spanish influences. Corn, chilli, and chocolate form its ancient trinity, giving rise to a complex and satisfying food culture."),

    Country(id: idSpain,
            name: "Spain",
            flagEmoji: "🇪🇸",
            color: UIColor(red: 0.83, green: 0.33, blue: 0.00, alpha: 0.8),
            cuisineStyle: "Tapas & Saffron",
            description: "Spanish cuisine is built around communal eating, olive oil, and bold flavours. Tapas culture, saffron-scented paella, and a rich tradition of cured meats make it one of Europe's most celebrated food cultures."),

    Country(id: idThailand,
            name: "Thailand",
            flagEmoji: "🇹🇭",
            color: UIColor(red: 0.61, green: 0.15, blue: 0.69, alpha: 0.8),
            cuisineStyle: "Sweet, Sour & Spicy",
            description: "Thai cuisine achieves a careful balance of sweet, sour, salty, and spicy in every dish. Fresh herbs like lemongrass, galangal, and kaffir lime leave a distinctly aromatic impression."),

    Country(id: idUSA,
            name: "USA",
            flagEmoji: "🇺🇸",
            color: UIColor(red: 0.18, green: 0.32, blue: 0.57, alpha: 0.8),
            cuisineStyle: "Comfort & Bold",
            description: "American cuisine is a melting pot of immigrant traditions and regional identities. From Southern BBQ to New England chowder, it reflects the country's diverse cultural heritage in every bite."),

].sorted { $0.name < $1.name }
