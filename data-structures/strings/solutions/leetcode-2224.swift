// 2224 - Minimum Number of Operations to Convert Time
func convertTime(_ current: String, _ correct: String) -> Int {
	var count = 0

	// step 1, convert time to minutes full
	var currentHours = Int(current.prefix(2))! * 60
	var currentTime = Int(current.suffix(2))! + currentHours

	var correctHours = Int(correct.prefix(2))! * 60
	var correctTime = Int(correct.suffix(2))! + correctHours

	var time = correctTime - currentTime

	count = convertTime(time)

	return count
}


private func convertTime(_ time: Int) -> Int {
	var count = 0
	var n = time

	while n > 0 {
		if n >= 60 {
			n -= 60

		} else if n >= 15 {
			n -= 15

		} else if n >= 5 {
			n -= 5

		} else {
			n -= 1
		}

		count += 1
	}

	return count
}

