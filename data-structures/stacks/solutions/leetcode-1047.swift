// 1047 - Remove All Adjacent Duplicates In String
func removeDuplicates(_ s: String) -> String {
	var previousWord: Character = " "
	var newString: [Character] = []

	for char in s {
		if char == previousWord {
			newString.popLast()
			previousWord = newString.last ?? " "
		} else {
			previousWord = char
			newString.append(char)
		}
	}

	return String(newString)
}
