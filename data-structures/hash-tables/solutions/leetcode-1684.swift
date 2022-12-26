// 1684 - Count the Number of Consistent Strings
func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
	var count = 0
	let allowedCharacters = Array(allowed)
	var dictionary: [Character: Int] = [Character: Int]()

	// store allowed characters
	for character in allowedCharacters {
		dictionary[character] = 1
	}

	// search for consistent string in collection
	for word in words {
		var wordCharacters = Array(word)
		let characters = Set(wordCharacters)

		count += 1

		for character in characters {
			if dictionary[character] == nil {
				count -= 1
				break
			}
		}
	}

	return count
}
