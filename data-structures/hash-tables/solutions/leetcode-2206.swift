// 2206 - Divide Array Into Equal Pairs

func divideArray(_ nums: [Int]) -> Bool {
	var frequency = [Int:Int]()

	for number in nums {
		var value = frequency[number, default: 0]
		value += 1
		frequency[number] = value
	}

	for occurrences in Array(frequency.values) {
		if occurrences % 2 != 0 {
			return false
		}
	}

	return true
}
