// 1748 - Sum of Unique Elements

func sumOfUnique(_ nums: [Int]) -> Int {
	var sum = 0
	var frequency = [Int:Int]()

	// storing the frequency of each number in nums
	for num in nums {
		var value = frequency[num, default: 0]
		value += 1
		frequency[num] = value
	}

	// to search for the frequency of the unique numbers in nums
	var numbers = Set(nums)
	for number in numbers {
		// if the frequency is unique, add that value to sum
		if frequency[number]! == 1 {
			sum += number
		}
	}

	return sum
}
