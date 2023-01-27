// 1624 - Largest Substring Between Two Equal Characters

func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
	var maxLength = -1
	var distances: [Character: Int] = [:]

	for (index, char) in s.enumerated() {
		if distances[char] != nil {
			var curr = index + 1
			var distance = (curr - distances[char]!) - 1

			maxLength = max(distance, maxLength)
		} else {
			distances[char] = index + 1
		}
	}

	return maxLength
}
