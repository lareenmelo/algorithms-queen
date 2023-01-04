// 1941 - Check if All Characters Have Equal Number of Occurrences

func areOccurrencesEqual(_ s: String) -> Bool {
	let characters = Array(s)
	var frequency: [Character: Int] = [Character: Int]()

	for character in characters {
		if frequency[character] == nil {
			frequency[character] = 1
		} else {
			var count = frequency[character]!
			count += 1
			frequency[character] = count
		}
	}

	var occurrence = Set(frequency.values)

	return occurrence.count == 1
}
