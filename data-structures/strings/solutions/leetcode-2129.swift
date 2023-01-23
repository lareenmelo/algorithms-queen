// 2129 - Capitalize the Title
func capitalizeTitle(_ title: String) -> String {
	var capitalizedTitle = ""
	var word = ""

	for char in title {
		if char == " " {
			var lowercasedWord = word.lowercased()

			if word.count < 3 {
				capitalizedTitle += "\(lowercasedWord) "
			} else {
				capitalizedTitle += "\(lowercasedWord.capitalized) "
			}

			word = ""
		} else {
			word.append(char)
		}
	}

	var lowercasedWord = word.lowercased()
	if word.count < 3 {
		capitalizedTitle += "\(lowercasedWord)"
	} else {
		capitalizedTitle += "\(lowercasedWord.capitalized)"
	}

	return capitalizedTitle
}
