// 2283 - Check if Number Has Equal Digit Count and Digit Value

func digitCount(_ num: String) -> Bool {
	var digits = Array(num)
	var occurrences = [Int: Int]()
	var index = 0

	for digit in digits {
		let intDigit = digit.wholeNumberValue!
		var value = occurrences[intDigit, default: 0]
		value += 1
		occurrences[intDigit] = value
	}

	while index < digits.count {
		if occurrences[index, default: 0] != digits[index].wholeNumberValue! {
			return false
		}

		index += 1
	}

	return true
}
