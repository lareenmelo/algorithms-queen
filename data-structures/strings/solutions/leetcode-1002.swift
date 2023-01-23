// 1002 - Find Common Characters

func commonChars(_ words: [String]) -> [String] {
	var result = words[0]
	var commonChars = [String]()

	for word in words {
		var currentWord = ""
		for character in word {
			if result.contains(character) {
				currentWord.append(character)

				if let i = result.firstIndex(of: character)  {
					result.remove(at: i)
				}
			}
		}

		result = currentWord
	}

	for char in result {
		commonChars.append("\(char)")
	}

	return commonChars
}
