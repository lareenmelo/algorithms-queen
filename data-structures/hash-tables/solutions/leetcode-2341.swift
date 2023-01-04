// 2341 - Maximum Number of Pairs in Array
func numberOfPairs(_ nums: [Int]) -> [Int] {
	var pairs = 0
	var numbers: [Int: Int] = [Int: Int]()

	for num in nums {
		if numbers[num] == nil {
			numbers[num] = 1
		} else {
			var value = numbers[num]!
			value += 1
			numbers[num] = value
		}


		if numbers[num]! % 2 == 0 {
			pairs += 1
		}
	}


	return [pairs, abs((pairs * 2) - (nums.count))]

}
