// 541 - Reverse String II

func reverseStr(_ s: String, _ k: Int) -> String {
	var shouldReverse = false
	var counter = 0
	var reversedString = ""
	var index = reversedString.endIndex

	for char in s {
		if counter % k == 0 {
			shouldReverse.toggle()
			index = reversedString.endIndex
		}

		if shouldReverse {
			reversedString.insert(char, at: index)

		} else {
			reversedString.append(char)
		}
		counter += 1
	}

	return reversedString
}
