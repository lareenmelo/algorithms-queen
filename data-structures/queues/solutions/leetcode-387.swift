// 387 - First Unique Character in a String

func firstUniqChar(_ s: String) -> Int {
	var occurrences = [Character: [Int]]()
	var characters = Array(s)
	var queue: [Int] = []

	// step 1: find indices of non-repeating items
	for index in 0..<characters.count {
		let char = characters[index]

		var values = occurrences[char, default: [Int]()]
		values.append(index)
		occurrences[char] = values
	}

	var values = Array(occurrences.values)

	for value in values {
		if value.count == 1 {
			if let first = queue.first {
				if first > value[0] {
					queue.insert(value[0], at: 0)
				}
			} else {
				queue.append(value[0])
			}
		}
	}

	return queue.first ?? -1
}
