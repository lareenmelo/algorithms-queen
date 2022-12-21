// 1365 - How Many Numbers Are Smaller Than the Current Number


// brute force approach 🥹
func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
	var list = [Int]()

	for number in nums {
		var count = 0
		for next in nums {
			if next < number {
				count += 1
			}
		}

		list.append(count)
	}

	return list
}
