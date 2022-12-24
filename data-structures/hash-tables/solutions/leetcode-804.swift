// 804 - Unique Morse Code Words

let decoder: [Character: String] = [
	"a": ".-",
	"b": "-...",
	"c": "-.-.",
	"d": "-..",
	"e": ".",
	"f": "..-.",
	"g": "--.",
	"h": "....",
	"i": "..",
	"j": ".---",
	"k": "-.-",
	"l": ".-..",
	"m": "--",
	"n": "-.",
	"o": "---",
	"p": ".--.",
	"q": "--.-",
	"r": ".-.",
	"s": "...",
	"t": "-",
	"u": "..-",
	"v": "...-",
	"w": ".--",
	"x": "-..-",
	"y": "-.--",
	"z": "--.."
]

func uniqueMorseRepresentations(_ words: [String]) -> Int {
	var transformations: Set<String> = Set<String>()

	for word in words {
		let transformation = transform(word: word)

		transformations.insert(transformation)
	}

	return transformations.count
}

private func transform(word: String) -> String {
	var letters = Array(word)
	var string = ""

	for letter in letters {
		string += decoder[letter, default: ""]
	}

	return string
}
