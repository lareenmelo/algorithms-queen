// 1742 - Maximum Number of Balls in a Box
func countBalls(_ lowLimit: Int, _ highLimit: Int) -> Int {
	var maxNumber = Int.min
	var boxes = [Int:Int]()
	var low = lowLimit

	while low <= highLimit {
		var box = digitsSum(low)

		var value = boxes[box, default: 0]
		value += 1
		boxes[box] = value

		low += 1
	}

	for occurence in Array(boxes.values) {
		maxNumber = max(maxNumber, occurence)
	}

	return maxNumber
}

private func digitsSum(_ number: Int) -> Int {
	var sum = 0
	var num = number

	while num > 0 {
		sum += num % 10
		num = num / 10
	}

	return sum
}
