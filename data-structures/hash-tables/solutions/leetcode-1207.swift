// 1207 - Unique Number of Occurrences

func uniqueOccurrences(_ arr: [Int]) -> Bool {
	var frequency = [Int: Int]()

	// step 1: find occurrences of each number
	for number in arr {
		var value = frequency[number, default: 0]
		value += 1
		frequency[number] = value
	}

	// array of all occurrences of each number
	let occurrences = Array(frequency.values)
	// set of all unique occurrences
	let uniqueOccurrences = Set(occurrences)

	// step 2: if all occurences are unique, set and occurrences count will be
	// the same
	return occurrences.count == uniqueOccurrences.count
}
