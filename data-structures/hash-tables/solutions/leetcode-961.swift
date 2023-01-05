// 961 - N-Repeated Element in Size 2N Array

func repeatedNTimes(_ nums: [Int]) -> Int {
	var frequency = nums.count/2
	var storage = [Int:Int]()

	for num in nums {
		var value = storage[num, default: 0]
		value += 1
		storage[num] = value
	}

	var numbers = Set(nums)

	for number in numbers {
		if storage[number]! == Int(frequency) {
			return number
		}
	}
	return 0
}
