// 1869 - Longer Contiguous Segments of Ones than Zeros

func checkZeroOnes(_ s: String) -> Bool {
	var previous: Character = " "
	var counter = 0
	var zeros = 0
	var ones = 0

	// step #1) search for each binary number in the string
	for char in s {
		let num = char.wholeNumberValue ?? -1

		if num == 0 {
			if previous == char {
				counter += 1

			} else {
				counter = 1
			}

			zeros = max(zeros, counter)

		} else {
			if previous == char {
				counter += 1

			} else {
				counter = 1
			}

			ones = max(ones, counter)

		}

		previous = char
	}


	// step #2) return wether or not ones is strictly greater than zeros
	return ones > zeros
}
