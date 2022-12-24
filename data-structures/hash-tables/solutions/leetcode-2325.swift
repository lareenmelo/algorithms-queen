// 2325 - Decode the Message

func decodeMessage(_ key: String, _ message: String) -> String {
	var letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
	var decodedMessage = ""

	var messageLetters = Array(message)
	var keyLetters = Array(key)

	// storing each key letter in a dictionary with its alphabet index
	var position = 1
	var decoder: [Character: Int] = [Character: Int]()

	for letter in keyLetters {
		if decoder[letter] == nil && letter != " " {
			decoder[letter] = position
			position += 1
		}
	}


	// decoding the message
	for letter in messageLetters {
		if letter != " " {
			let index = decoder[letter]
			if let i = index {
				decodedMessage += String(letters[i-1])
			}
		} else {
			decodedMessage += " "
		}
	}

	return decodedMessage
}

