//
//  DishData.swift
//  Assignment_Chapter_3_iOS(C)
//
//  Created by Bhumik Poshiya on 31/03/26.
//

import Foundation
import UIKit

// MARK: - DishType Enum

enum DishType: String, CaseIterable {
    case veg    = "Veg"
    case nonVeg = "Non-Veg"
    case vegan  = "Vegan"

    func colourCode() -> UIColor {
        switch self {
        case .veg:    return UIColor(red: 0.20, green: 0.78, blue: 0.35, alpha: 0.8)
        case .nonVeg: return UIColor(red: 1.00, green: 0.23, blue: 0.19, alpha: 0.8)
        case .vegan:  return UIColor(red: 0.00, green: 0.78, blue: 0.75, alpha: 0.8)
        }
    }
}

// MARK: - SpiceLevel Enum

enum SpiceLevel: Int, CaseIterable, Comparable {
    case none     = 0
    case mild     = 1
    case medium   = 2
    case spicy    = 3
    case extraHot = 4

    static func < (lhs: SpiceLevel, rhs: SpiceLevel) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    var label: String {
        switch self {
        case .none:     return "None"
        case .mild:     return "Mild"
        case .medium:   return "Medium"
        case .spicy:    return "Spicy"
        case .extraHot: return "Extra Hot"
        }
    }

    var emoji: String {
        switch self {
        case .none:     return ""
        case .mild:     return "🌶"
        case .medium:   return "🌶🌶"
        case .spicy:    return "🌶🌶🌶"
        case .extraHot: return "🌶🌶🌶🌶"
        }
    }

    func badgeColor() -> UIColor {
        switch self {
        case .none:     return .systemGray4
        case .mild:     return UIColor(red: 1.00, green: 0.85, blue: 0.40, alpha: 1)
        case .medium:   return UIColor(red: 1.00, green: 0.60, blue: 0.20, alpha: 1)
        case .spicy:    return UIColor(red: 0.95, green: 0.30, blue: 0.10, alpha: 1)
        case .extraHot: return UIColor(red: 0.75, green: 0.05, blue: 0.05, alpha: 1)
        }
    }
}

// MARK: - Dish Model

struct Dish: Identifiable {
    let id: UUID
    let name: String
    let countryID: UUID        // links to Country.id in CountryData.swift
    let emoji: String
    let type: DishType
    let spiceLevel: SpiceLevel
    let description: String
    let rating: Double         // 1.0 – 5.0
    let calories: Int          // kcal per serving
    let color: UIColor

    /// Resolves the Country object from CountryData
    var country: Country? {
        allCountries.first { $0.id == countryID }
    }
}

// MARK: - All Dishes

let allDishes: [Dish] = [

    // MARK: China
    Dish(id: UUID(), name: "Dim Sum",
         countryID: idChina, emoji: "🥟", type: .nonVeg, spiceLevel: .mild,
         description: "A variety of small bite-sized dishes — dumplings, buns, rolls, and cakes — served in bamboo steamers during the Cantonese yum cha tradition.",
         rating: 4.7, calories: 290,
         color: UIColor(red: 1.00, green: 0.87, blue: 0.84, alpha: 1)),

    Dish(id: UUID(), name: "Fried Rice",
         countryID: idChina, emoji: "🍳", type: .veg, spiceLevel: .mild,
         description: "Day-old rice wok-tossed over intense heat with eggs, soy sauce, spring onions, and vegetables. The hallmark of 'wok hei' — the smoky breath of the wok.",
         rating: 4.5, calories: 340,
         color: UIColor(red: 1.00, green: 0.95, blue: 0.80, alpha: 1)),

    Dish(id: UUID(), name: "Kung Pao Chicken",
         countryID: idChina, emoji: "🍗", type: .nonVeg, spiceLevel: .spicy,
         description: "A Sichuan stir-fry of diced chicken with dried chillies, Sichuan peppercorns, peanuts, and spring onions. Named after a Qing Dynasty official.",
         rating: 4.7, calories: 430,
         color: UIColor(red: 1.00, green: 0.80, blue: 0.78, alpha: 1)),

    Dish(id: UUID(), name: "Mapo Tofu",
         countryID: idChina, emoji: "🍲", type: .vegan, spiceLevel: .extraHot,
         description: "Silken tofu in a fiery Sichuan sauce of fermented black beans, doubanjiang chilli paste, and numbing Sichuan peppercorns. A vegetarian dish with maximum impact.",
         rating: 4.6, calories: 260,
         color: UIColor(red: 1.00, green: 0.82, blue: 0.76, alpha: 1)),

    Dish(id: UUID(), name: "Peking Duck",
         countryID: idChina, emoji: "🦆", type: .nonVeg, spiceLevel: .mild,
         description: "Whole duck air-dried and roasted for lacquered, mahogany skin. Served with thin pancakes, spring onions, cucumber, and hoisin sauce. A Beijing imperial dish.",
         rating: 4.8, calories: 540,
         color: UIColor(red: 0.98, green: 0.84, blue: 0.80, alpha: 1)),

    Dish(id: UUID(), name: "Spring Rolls",
         countryID: idChina, emoji: "🌯", type: .veg, spiceLevel: .mild,
         description: "Crispy fried rolls stuffed with seasoned vegetables and glass noodles. A Chinese New Year staple whose golden colour symbolises prosperity.",
         rating: 4.4, calories: 220,
         color: UIColor(red: 0.93, green: 0.96, blue: 0.80, alpha: 1)),

    // MARK: France
    Dish(id: UUID(), name: "Baguette",
         countryID: idFrance, emoji: "🥖", type: .vegan, spiceLevel: .none,
         description: "France's iconic long bread with a crunchy golden crust and an open, chewy crumb. Made from just flour, water, salt, and yeast — recognised by UNESCO as cultural heritage.",
         rating: 4.6, calories: 200,
         color: UIColor(red: 0.98, green: 0.93, blue: 0.78, alpha: 1)),

    Dish(id: UUID(), name: "Coq au Vin",
         countryID: idFrance, emoji: "🍗", type: .nonVeg, spiceLevel: .mild,
         description: "Chicken braised slowly in red wine with lardons, mushrooms, and pearl onions. A French farmhouse dish that showcases the magic of low-and-slow cooking.",
         rating: 4.6, calories: 480,
         color: UIColor(red: 0.84, green: 0.82, blue: 0.93, alpha: 1)),

    Dish(id: UUID(), name: "Crème Brûlée",
         countryID: idFrance, emoji: "🍮", type: .veg, spiceLevel: .none,
         description: "A silky vanilla custard baked in a water bath and finished with a crisp caramelised sugar shell. The contrast of cool cream and hot toffee is the whole point.",
         rating: 4.8, calories: 310,
         color: UIColor(red: 1.00, green: 0.96, blue: 0.82, alpha: 1)),

    Dish(id: UUID(), name: "Croissant",
         countryID: idFrance, emoji: "🥐", type: .veg, spiceLevel: .none,
         description: "A flaky, buttery viennoiserie made from laminated dough. Achieving the perfect croissant requires 27 alternating layers of butter and dough and three days of patience.",
         rating: 4.7, calories: 231,
         color: UIColor(red: 1.00, green: 0.95, blue: 0.78, alpha: 1)),

    Dish(id: UUID(), name: "French Onion Soup",
         countryID: idFrance, emoji: "🍲", type: .veg, spiceLevel: .mild,
         description: "Slow-caramelised onions in a beef broth, topped with a crouton and a thick gratinéed layer of Gruyère cheese. A rustic bistro classic elevated to perfection.",
         rating: 4.5, calories: 340,
         color: UIColor(red: 0.98, green: 0.89, blue: 0.71, alpha: 1)),

    Dish(id: UUID(), name: "Ratatouille",
         countryID: idFrance, emoji: "🥘", type: .vegan, spiceLevel: .mild,
         description: "A Provençal vegetable stew of courgette, aubergine, peppers, and tomatoes, slow-cooked in olive oil with thyme and bay. Summer in a bowl.",
         rating: 4.3, calories: 180,
         color: UIColor(red: 0.84, green: 0.93, blue: 0.84, alpha: 1)),

    // MARK: Greece
    Dish(id: UUID(), name: "Baklava",
         countryID: idGreece, emoji: "🍯", type: .veg, spiceLevel: .none,
         description: "Layers of phyllo dough filled with chopped pistachios and walnuts, baked until crisp and drenched in honey syrup. Sweet, flaky, and deeply satisfying.",
         rating: 4.8, calories: 430,
         color: UIColor(red: 1.00, green: 0.93, blue: 0.76, alpha: 1)),

    Dish(id: UUID(), name: "Greek Salad",
         countryID: idGreece, emoji: "🥗", type: .vegan, spiceLevel: .none,
         description: "Chunky tomatoes, cucumber, red onion, and Kalamata olives dressed in olive oil and oregano, topped with a thick slab of feta. The taste of the Aegean.",
         rating: 4.5, calories: 210,
         color: UIColor(red: 0.80, green: 0.93, blue: 0.87, alpha: 1)),

    Dish(id: UUID(), name: "Moussaka",
         countryID: idGreece, emoji: "🥘", type: .nonVeg, spiceLevel: .mild,
         description: "Layers of sliced aubergine, spiced minced lamb, and béchamel sauce baked until golden. Greece's answer to lasagne — a dish of warmth and heritage.",
         rating: 4.6, calories: 500,
         color: UIColor(red: 0.84, green: 0.91, blue: 0.98, alpha: 1)),

    Dish(id: UUID(), name: "Souvlaki",
         countryID: idGreece, emoji: "🍢", type: .nonVeg, spiceLevel: .mild,
         description: "Marinated pork or chicken threaded on skewers and grilled over charcoal. Served with pita, tzatziki, and tomato — Greece's ultimate fast food.",
         rating: 4.7, calories: 390,
         color: UIColor(red: 0.87, green: 0.93, blue: 0.98, alpha: 1)),

    Dish(id: UUID(), name: "Spanakopita",
         countryID: idGreece, emoji: "🥧", type: .veg, spiceLevel: .none,
         description: "A savoury phyllo pastry pie filled with spinach, feta cheese, onions, and eggs. Layers of paper-thin dough brushed with olive oil create an irresistible crunch.",
         rating: 4.4, calories: 350,
         color: UIColor(red: 0.84, green: 0.96, blue: 0.89, alpha: 1)),

    // MARK: India
    Dish(id: UUID(), name: "Biryani",
         countryID: idIndia, emoji: "🍚", type: .nonVeg, spiceLevel: .spicy,
         description: "Slow-cooked long-grain basmati rice layered with marinated meat, saffron milk, caramelised onions, and whole spices. A celebration dish with royal origins.",
         rating: 4.9, calories: 620,
         color: UIColor(red: 1.00, green: 0.87, blue: 0.67, alpha: 1)),

    Dish(id: UUID(), name: "Butter Chicken",
         countryID: idIndia, emoji: "🍗", type: .nonVeg, spiceLevel: .medium,
         description: "Tender chicken in a velvety tomato-butter-cream sauce fragrant with garam masala, ginger, and fenugreek. One of the world's most recognised curries.",
         rating: 4.8, calories: 490,
         color: UIColor(red: 1.00, green: 0.91, blue: 0.75, alpha: 1)),

    Dish(id: UUID(), name: "Dal Tadka",
         countryID: idIndia, emoji: "🥣", type: .vegan, spiceLevel: .medium,
         description: "Yellow lentils cooked to a smooth consistency and finished with a tempering of ghee, cumin, garlic, dried chilli, and asafoetida. Simple, nourishing, iconic.",
         rating: 4.5, calories: 280,
         color: UIColor(red: 0.98, green: 0.89, blue: 0.68, alpha: 1)),

    Dish(id: UUID(), name: "Gulab Jamun",
         countryID: idIndia, emoji: "🍮", type: .veg, spiceLevel: .none,
         description: "Soft milk-solid dumplings fried until golden and soaked in a rose-scented sugar syrup. A festive dessert that is sweet, tender, and utterly indulgent.",
         rating: 4.7, calories: 380,
         color: UIColor(red: 0.98, green: 0.84, blue: 0.76, alpha: 1)),

    Dish(id: UUID(), name: "Paneer Tikka",
         countryID: idIndia, emoji: "🧀", type: .veg, spiceLevel: .medium,
         description: "Cubes of fresh cottage cheese marinated in spiced yoghurt and grilled in a tandoor until charred. A vegetarian favourite at Indian restaurants worldwide.",
         rating: 4.6, calories: 350,
         color: UIColor(red: 1.00, green: 0.93, blue: 0.71, alpha: 1)),

    Dish(id: UUID(), name: "Samosa",
         countryID: idIndia, emoji: "🥟", type: .veg, spiceLevel: .medium,
         description: "Crispy pastry triangles filled with spiced potatoes and peas, deep-fried until golden. Served with mint chutney and tamarind sauce as a beloved street snack.",
         rating: 4.7, calories: 260,
         color: UIColor(red: 0.98, green: 0.93, blue: 0.76, alpha: 1)),

    // MARK: Italy
    Dish(id: UUID(), name: "Bruschetta",
         countryID: idItaly, emoji: "🍞", type: .vegan, spiceLevel: .none,
         description: "Grilled sourdough rubbed with garlic and topped with ripe tomatoes, fresh basil, and a drizzle of extra-virgin olive oil. The perfect antipasto.",
         rating: 4.3, calories: 180,
         color: UIColor(red: 0.98, green: 0.91, blue: 0.71, alpha: 1)),

    Dish(id: UUID(), name: "Margherita Pizza",
         countryID: idItaly, emoji: "🍕", type: .veg, spiceLevel: .mild,
         description: "A classic Neapolitan pizza with San Marzano tomato sauce, fresh mozzarella, and basil on a thin, blistered crust baked in a wood-fired oven.",
         rating: 4.7, calories: 285,
         color: UIColor(red: 1.00, green: 0.88, blue: 0.75, alpha: 1)),

    Dish(id: UUID(), name: "Osso Buco",
         countryID: idItaly, emoji: "🥩", type: .nonVeg, spiceLevel: .mild,
         description: "Braised veal shanks slow-cooked in white wine, broth, and gremolata. A Milanese classic that is rich, tender, and deeply satisfying.",
         rating: 4.6, calories: 510,
         color: UIColor(red: 0.98, green: 0.82, blue: 0.75, alpha: 1)),

    Dish(id: UUID(), name: "Pasta Carbonara",
         countryID: idItaly, emoji: "🍝", type: .nonVeg, spiceLevel: .mild,
         description: "A Roman pasta dish made with eggs, Pecorino Romano, guanciale, and black pepper. Creamy without a drop of cream — the egg emulsion is the magic.",
         rating: 4.8, calories: 450,
         color: UIColor(red: 1.00, green: 0.95, blue: 0.75, alpha: 1)),

    Dish(id: UUID(), name: "Risotto",
         countryID: idItaly, emoji: "🍚", type: .veg, spiceLevel: .mild,
         description: "A Northern Italian rice dish cooked slowly with broth until creamy. Commonly finished with Parmesan and butter in a technique called 'mantecatura'.",
         rating: 4.5, calories: 380,
         color: UIColor(red: 1.00, green: 0.97, blue: 0.86, alpha: 1)),

    Dish(id: UUID(), name: "Tiramisu",
         countryID: idItaly, emoji: "🍰", type: .veg, spiceLevel: .none,
         description: "Italy's beloved coffee-flavoured dessert with layers of espresso-soaked ladyfinger biscuits and a whipped mascarpone cream, dusted with cocoa.",
         rating: 4.9, calories: 320,
         color: UIColor(red: 0.91, green: 0.83, blue: 0.77, alpha: 1)),

    // MARK: Japan
    Dish(id: UUID(), name: "Edamame",
         countryID: idJapan, emoji: "🫘", type: .vegan, spiceLevel: .none,
         description: "Whole immature soybeans boiled or steamed in their pods and lightly salted. A popular snack and starter, rich in plant protein and fibre.",
         rating: 4.0, calories: 120,
         color: UIColor(red: 0.84, green: 0.93, blue: 0.80, alpha: 1)),

    Dish(id: UUID(), name: "Miso Soup",
         countryID: idJapan, emoji: "🍵", type: .vegan, spiceLevel: .none,
         description: "A staple of the Japanese diet — a clear broth of fermented soybean paste with tofu, wakame seaweed, and spring onions. Comforting and nutritious.",
         rating: 4.2, calories: 50,
         color: UIColor(red: 0.87, green: 0.93, blue: 0.85, alpha: 1)),

    Dish(id: UUID(), name: "Ramen",
         countryID: idJapan, emoji: "🍜", type: .nonVeg, spiceLevel: .medium,
         description: "A Japanese noodle soup with a rich broth (tonkotsu, shoyu, or miso), wheat noodles, chashu pork, soft-boiled egg, nori, and green onions.",
         rating: 4.9, calories: 500,
         color: UIColor(red: 1.00, green: 0.82, blue: 0.82, alpha: 1)),

    Dish(id: UUID(), name: "Sushi",
         countryID: idJapan, emoji: "🍣", type: .nonVeg, spiceLevel: .mild,
         description: "Vinegared rice paired with fresh raw fish or other toppings. From simple nigiri to elaborate maki rolls, sushi is the icon of Japanese precision.",
         rating: 4.8, calories: 350,
         color: UIColor(red: 0.98, green: 0.87, blue: 0.87, alpha: 1)),

    Dish(id: UUID(), name: "Takoyaki",
         countryID: idJapan, emoji: "🐙", type: .nonVeg, spiceLevel: .medium,
         description: "Ball-shaped street snacks made in a special moulded pan with batter, diced octopus, tempura scraps, and pickled ginger, drizzled with mayo and sauce.",
         rating: 4.6, calories: 310,
         color: UIColor(red: 0.98, green: 0.84, blue: 0.75, alpha: 1)),

    Dish(id: UUID(), name: "Tempura",
         countryID: idJapan, emoji: "🍤", type: .nonVeg, spiceLevel: .mild,
         description: "Lightly battered and deep-fried seafood or vegetables served with a dipping sauce of dashi, mirin, and soy. Introduced by Portuguese missionaries.",
         rating: 4.5, calories: 420,
         color: UIColor(red: 1.00, green: 0.93, blue: 0.80, alpha: 1)),

    // MARK: Mexico
    Dish(id: UUID(), name: "Churros",
         countryID: idMexico, emoji: "🍩", type: .vegan, spiceLevel: .none,
         description: "Fried dough pastry piped through a star nozzle and rolled in cinnamon sugar. Often dipped in warm chocolate sauce for a truly comforting treat.",
         rating: 4.4, calories: 290,
         color: UIColor(red: 1.00, green: 0.93, blue: 0.78, alpha: 1)),

    Dish(id: UUID(), name: "Enchiladas",
         countryID: idMexico, emoji: "🫔", type: .nonVeg, spiceLevel: .spicy,
         description: "Corn tortillas filled with meat and cheese, rolled up and smothered in a deep red chilli sauce. Baked and topped with sour cream and fresh cheese.",
         rating: 4.5, calories: 440,
         color: UIColor(red: 0.91, green: 0.96, blue: 0.78, alpha: 1)),

    Dish(id: UUID(), name: "Guacamole",
         countryID: idMexico, emoji: "🥑", type: .vegan, spiceLevel: .mild,
         description: "Mashed ripe avocados with lime juice, salt, coriander, and jalapeño. An ancient Aztec preparation that has become one of the world's favourite dips.",
         rating: 4.6, calories: 150,
         color: UIColor(red: 0.78, green: 0.93, blue: 0.73, alpha: 1)),

    Dish(id: UUID(), name: "Pozole",
         countryID: idMexico, emoji: "🍲", type: .nonVeg, spiceLevel: .medium,
         description: "A hearty hominy corn and pork soup with a rich broth, garnished with shredded cabbage, radish, oregano, and lime. A pre-Columbian ceremonial dish.",
         rating: 4.4, calories: 420,
         color: UIColor(red: 0.87, green: 0.96, blue: 0.84, alpha: 1)),

    Dish(id: UUID(), name: "Quesadilla",
         countryID: idMexico, emoji: "🧇", type: .veg, spiceLevel: .mild,
         description: "A flour tortilla filled with melted cheese, griddled until crispy. Often upgraded with grilled vegetables, mushrooms, or huitlacoche (corn truffle).",
         rating: 4.3, calories: 380,
         color: UIColor(red: 0.98, green: 0.96, blue: 0.80, alpha: 1)),

    Dish(id: UUID(), name: "Tacos al Pastor",
         countryID: idMexico, emoji: "🌮", type: .nonVeg, spiceLevel: .spicy,
         description: "Marinated pork cooked on a vertical spit, served in small corn tortillas with pineapple, onion, and cilantro. Street food at its most glorious.",
         rating: 4.9, calories: 370,
         color: UIColor(red: 0.84, green: 0.96, blue: 0.82, alpha: 1)),

    // MARK: Spain
    Dish(id: UUID(), name: "Churros Chocolate",
         countryID: idSpain, emoji: "🍫", type: .vegan, spiceLevel: .none,
         description: "Thick, ridged churros fried to order and served with a cup of dense, dark drinking chocolate — a Spanish breakfast or late-night staple enjoyed for centuries.",
         rating: 4.7, calories: 420,
         color: UIColor(red: 0.87, green: 0.78, blue: 0.71, alpha: 1)),

    Dish(id: UUID(), name: "Gazpacho",
         countryID: idSpain, emoji: "🍅", type: .vegan, spiceLevel: .mild,
         description: "A chilled Andalusian soup blended from raw tomatoes, cucumber, peppers, garlic, olive oil, and sherry vinegar. Refreshing, bright, and beautiful in its simplicity.",
         rating: 4.4, calories: 130,
         color: UIColor(red: 1.00, green: 0.84, blue: 0.78, alpha: 1)),

    Dish(id: UUID(), name: "Paella",
         countryID: idSpain, emoji: "🥘", type: .nonVeg, spiceLevel: .mild,
         description: "A Valencian rice dish cooked in a wide flat pan with saffron, seafood or rabbit, green beans, and rosemary. The socarrat — toasted rice crust at the bottom — is the prize.",
         rating: 4.8, calories: 520,
         color: UIColor(red: 1.00, green: 0.91, blue: 0.71, alpha: 1)),

    Dish(id: UUID(), name: "Patatas Bravas",
         countryID: idSpain, emoji: "🥔", type: .vegan, spiceLevel: .spicy,
         description: "Crispy fried potato cubes served with a spicy tomato-paprika sauce and creamy alioli. The defining tapa of Madrid's bar culture.",
         rating: 4.4, calories: 310,
         color: UIColor(red: 0.98, green: 0.93, blue: 0.73, alpha: 1)),

    Dish(id: UUID(), name: "Tortilla Española",
         countryID: idSpain, emoji: "🍳", type: .veg, spiceLevel: .none,
         description: "A thick potato and egg omelette cooked slowly in olive oil. Served at room temperature, it is the most democratic dish in Spain — found from tapas bars to home kitchens.",
         rating: 4.6, calories: 300,
         color: UIColor(red: 1.00, green: 0.96, blue: 0.80, alpha: 1)),

    // MARK: Thailand
    Dish(id: UUID(), name: "Green Curry",
         countryID: idThailand, emoji: "🍛", type: .nonVeg, spiceLevel: .spicy,
         description: "A fragrant coconut milk curry made with green chilli paste, galangal, and kaffir lime. The balance of heat, creaminess, and citrus is uniquely Thai.",
         rating: 4.7, calories: 420,
         color: UIColor(red: 0.84, green: 0.96, blue: 0.84, alpha: 1)),

    Dish(id: UUID(), name: "Mango Sticky Rice",
         countryID: idThailand, emoji: "🥭", type: .vegan, spiceLevel: .none,
         description: "Sweet glutinous rice cooked in coconut milk, served with ripe sliced mango and a drizzle of salted coconut cream. Thailand's most beloved dessert.",
         rating: 4.8, calories: 360,
         color: UIColor(red: 1.00, green: 0.96, blue: 0.76, alpha: 1)),

    Dish(id: UUID(), name: "Pad Thai",
         countryID: idThailand, emoji: "🍜", type: .nonVeg, spiceLevel: .medium,
         description: "Stir-fried rice noodles with shrimp or chicken, eggs, bean sprouts, and spring onions, tossed in tamarind sauce and topped with crushed peanuts.",
         rating: 4.8, calories: 490,
         color: UIColor(red: 0.93, green: 0.84, blue: 0.98, alpha: 1)),

    Dish(id: UUID(), name: "Som Tum",
         countryID: idThailand, emoji: "🥗", type: .vegan, spiceLevel: .spicy,
         description: "Green papaya shredded and pounded in a mortar with chilli, lime, garlic, fish sauce, and palm sugar. A fiery, crunchy, refreshing salad from northeast Thailand.",
         rating: 4.5, calories: 130,
         color: UIColor(red: 0.87, green: 0.96, blue: 0.80, alpha: 1)),

    Dish(id: UUID(), name: "Tom Yum Soup",
         countryID: idThailand, emoji: "🍲", type: .nonVeg, spiceLevel: .extraHot,
         description: "A hot and sour broth with lemongrass, kaffir lime leaves, galangal, and chilli, loaded with prawns or chicken and mushrooms. Intensely aromatic.",
         rating: 4.7, calories: 200,
         color: UIColor(red: 0.98, green: 0.82, blue: 0.93, alpha: 1)),

    // MARK: USA
    Dish(id: UUID(), name: "BBQ Ribs",
         countryID: idUSA, emoji: "🍖", type: .nonVeg, spiceLevel: .medium,
         description: "Pork spare ribs slow-smoked for hours over hickory or applewood, glazed in a tangy barbecue sauce. The centrepiece of Southern American pit culture.",
         rating: 4.8, calories: 680,
         color: UIColor(red: 0.87, green: 0.84, blue: 0.96, alpha: 1)),

    Dish(id: UUID(), name: "Caesar Salad",
         countryID: idUSA, emoji: "🥗", type: .veg, spiceLevel: .none,
         description: "Crispy romaine lettuce tossed in a creamy dressing of anchovies, egg yolk, lemon, Worcestershire, and Parmesan, topped with garlic croutons.",
         rating: 4.4, calories: 280,
         color: UIColor(red: 0.84, green: 0.96, blue: 0.87, alpha: 1)),

    Dish(id: UUID(), name: "Cheeseburger",
         countryID: idUSA, emoji: "🍔", type: .nonVeg, spiceLevel: .mild,
         description: "A griddled beef patty with American cheese, lettuce, tomato, pickles, and condiments in a brioche bun. The quintessential American comfort food.",
         rating: 4.5, calories: 560,
         color: UIColor(red: 0.84, green: 0.89, blue: 0.98, alpha: 1)),

    Dish(id: UUID(), name: "Clam Chowder",
         countryID: idUSA, emoji: "🍵", type: .nonVeg, spiceLevel: .mild,
         description: "A creamy New England soup thick with clams, potatoes, bacon, and onions. Traditionally served in a hollowed sourdough bread bowl on Fisherman's Wharf.",
         rating: 4.5, calories: 390,
         color: UIColor(red: 0.89, green: 0.93, blue: 0.98, alpha: 1)),

    Dish(id: UUID(), name: "Mac and Cheese",
         countryID: idUSA, emoji: "🧀", type: .veg, spiceLevel: .none,
         description: "Elbow macaroni in a creamy cheddar béchamel, baked with a golden breadcrumb topping. A dish traced back to Thomas Jefferson, now America's ultimate comfort food.",
         rating: 4.6, calories: 490,
         color: UIColor(red: 1.00, green: 0.95, blue: 0.76, alpha: 1)),

    Dish(id: UUID(), name: "Pancakes",
         countryID: idUSA, emoji: "🥞", type: .veg, spiceLevel: .none,
         description: "Fluffy stacked pancakes served with maple syrup and butter. The weekend-morning ritual of millions of American households — simple, golden perfection.",
         rating: 4.6, calories: 350,
         color: UIColor(red: 1.00, green: 0.93, blue: 0.82, alpha: 1)),

].sorted { $0.name < $1.name }

// MARK: - Convenience Helpers on [Dish]

extension Array where Element == Dish {

    /// Filter by DishType — pass nil to get all
    func filtered(by type: DishType?) -> [Dish] {
        guard let type else { return self }
        return filter { $0.type == type }
    }

    /// Filter by country UUID
    func filtered(byCountryID id: UUID) -> [Dish] {
        filter { $0.countryID == id }
    }

    /// Filter up to a maximum spice level (inclusive)
    func filtered(upTo spice: SpiceLevel) -> [Dish] {
        filter { $0.spiceLevel <= spice }
    }

    /// Sort by rating, highest first
    var sortedByRating: [Dish] {
        sorted { $0.rating > $1.rating }
    }
}
