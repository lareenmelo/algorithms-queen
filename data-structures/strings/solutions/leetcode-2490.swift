// 2490 - Circular Sentence
func isCircularSentence(_ sentence: String) -> Bool {
	var words = [String]()
	var word = ""

	// step 1) create an array of words
	for (index, character) in sentence.enumerated() {
		var char = String(character)

		if char == " " {
			words.append(word)
			word = ""

		} else if index == sentence.count - 1 {
			word += char

			words.append(word)
			word = ""

		} else {

			word += char
		}
	}

	// step 2) check for circular condition
	var index = 0

	while index < words.count - 1 {
		let current = words[index].last ?? " "
		let next = words[index + 1].first ?? " "

		if current != next {
			return false
		}

		index += 1
	}

	// step 3) check last item with head
	var head = words[0].first ?? " "
	var tail = words[words.count - 1].last ?? " "

	if head != tail { return false }

	// step 4) if no false has been triggered at this point, the sentence is circular
	return true
}
