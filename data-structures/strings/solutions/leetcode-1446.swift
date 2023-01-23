// 1446 - Consecutive Characters

func maxPower(_ s: String) -> Int {
	var maxPower = Int.min
	var previous: Character = " "
	var power = 1

	for char in s {
		if char == previous {
			power += 1
		} else {
			previous = char
			power = 1
		}

		maxPower = max(maxPower, power)
	}

	return maxPower
}
