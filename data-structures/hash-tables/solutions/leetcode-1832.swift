// 1832 - Check if the Sentence Is Pangram
let alphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

func checkIfPangram(_ sentence: String) -> Bool {
	var isPangram = true
	var sentenceLetters = Array(sentence)

	var dictionary: [Character: Int] = [Character: Int]()
	// creating frequence table of each letter of the sentence
	for letter in sentenceLetters {
		dictionary[letter] = 1
	}

	// checking if all letters of the alphabet are present in
	// frequency table
	for letter in alphabet {
		if dictionary[letter] == nil {
			return false
		}
	}

	return isPangram
}


// clever solution, using set
func checkIfPangram(_ sentence: String) -> Bool {
	let frequency = Set(sentence)

	return frequency.count == 26
}
