// 345 - Reverse Vowels of a String
func reverseVowels(_ s: String) -> String {
	let vowels: [String] = ["a", "e", "i", "o", "u"]
	var reversed = ""
	var stack: [Character] = []

	// step 1) store vowels in stack
	for char in s {
		if vowels.contains(char.lowercased()) {
			stack.append(char)
		}
	}

	// step 2) check build reversed string
	for char in s {
		if vowels.contains(char.lowercased()) {
			let vowel = stack.popLast()!
			reversed.append(vowel)
		} else {
			reversed.append(char)
		}
	}

	// step 3) return string
	return reversed
}
