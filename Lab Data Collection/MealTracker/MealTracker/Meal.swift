import Foundation
struct Meal{
    var name: String
    var food: [Food]
    
}
var meals: [Meal] {
    
    let breakfast = Meal(name: "Breakfast", food: [
                Food(name: "Pancakes", description: "Fluffy pancakes with syrup"),
                Food(name: "Omelette", description: "Egg omelette with cheese"),
                Food(name: "Fruit Salad", description: "Fresh seasonal fruits")
            ])
            
            let lunch = Meal(name: "Lunch", food: [
                Food(name: "Sandwich", description: "Grilled chicken sandwich"),
                Food(name: "Salad", description: "Green salad with dressing"),
                Food(name: "Soup", description: "Tomato basil soup")
            ])
            
            let dinner = Meal(name: "Dinner", food: [
                Food(name: "Pasta", description: "Spaghetti with marinara sauce"),
                Food(name: "Steak", description: "Grilled steak with veggies")
            ])
    
    return [breakfast,lunch,dinner]
}
