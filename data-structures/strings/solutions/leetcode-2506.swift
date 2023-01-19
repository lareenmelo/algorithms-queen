// 2506 - Count Pairs Of Similar Strings

func similarPairs(_ words: [String]) -> Int {
	var a = 0
	var b = 1
	var counter = 0

	while a < words.count - 1 {
		if b < words.count && Set(words[a]) == Set(words[b]) {
			counter += 1
			b += 1
		} else {
			b += 1

			if b >= words.count {
				a += 1
				b = a + 1
			}
		}
	}

	return counter
}
