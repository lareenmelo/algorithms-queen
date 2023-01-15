// 2073 - Time Needed to Buy Tickets
func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
	var line = tickets
	var i = 0
	var time = 0

	while line[k] > 0 {
		if line[i] > 0 {
			line[i] -= 1
			time += 1

		}

		if i == line.count - 1 {
			i = 0
		} else {
			i += 1
		}
	}

	return time
}
