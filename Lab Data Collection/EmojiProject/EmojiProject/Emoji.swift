//
//  Emoji.swift
//  EmojiProject
//
//  Created by Anushka on 21/08/25.
//

import Foundation

let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")

struct Emoji: Codable{
    var symbol: String
    var name: String
    var description: String
    var usage: String
}

func saveEmojis(_ emojis: [Emoji]) {
    let encoder = PropertyListEncoder()
    encoder.outputFormat = .xml
    do {
        let data = try encoder.encode(emojis)
        try data.write(to: archiveURL, options: .noFileProtection)
        print("✅ Emojis saved to file at:", archiveURL.path)
    } catch {
        print("❌ Error saving emojis:", error)
    }
}
func loadEmojis() -> [Emoji] {
    let decoder = PropertyListDecoder()
    do {
        let data = try Data(contentsOf: archiveURL)
        let decodedEmojis = try decoder.decode([Emoji].self, from: data)
        print("📖 Loaded emojis from file")
        return decodedEmojis
    } catch {
        print("⚠️ No saved emojis found, using defaults")
        return []
    }
}

var emojis: [Emoji] = []
var Sampleemojis: [Emoji] = [
  
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "🧑‍💻", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
    ]
