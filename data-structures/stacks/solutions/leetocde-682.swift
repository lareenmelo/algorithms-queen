//682 - Baseball Game

func calPoints(_ operations: [String]) -> Int {
	var scores = [Int]()
	var score = 0

	for operation in operations {
		switch(operation) {
			case "C":
			scores.removeLast()

			case "D":
			var value = scores[scores.count-1] * 2
			scores.append(value)

			case "+":
			var value1 = scores[scores.count-1]
			var value2 = scores[scores.count-2]
			scores.append(value1 + value2)

			default:
			var value = Int(operation)!
			scores.append(value)
		}
	}

	for number in scores {
		score += number
	}

	return score
}
