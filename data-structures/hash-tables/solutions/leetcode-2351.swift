// 2351 - First Letter to Appear Twice

func repeatedCharacter(_ s: String) -> Character {
	var characters = Array(s)
	var character: Character = "c"

	var frequency: Set<Character> = Set<Character>()

	for character in characters {
		if frequency.contains(character) {
			return character
		}

		frequency.insert(character)
	}

	return character
}
