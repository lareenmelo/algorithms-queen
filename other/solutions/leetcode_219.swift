// 219. Contains Duplicate II
func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
	var numsDictionary = [Int:Int]()
	var shortestDistance = Int.max
	var containsNearbyDuplicate = false

	for i in 0 ..< nums.count {
		let currentValue = nums[i]

		if let j = numsDictionary[currentValue] {
			let currentDistance = abs(i - j)
			shortestDistance = min(shortestDistance, currentDistance)

			containsNearbyDuplicate = shortestDistance <= k

		}

		numsDictionary[currentValue] = i

	}

	return containsNearbyDuplicate

}


// PSEUDOCODE

// TIME COMPLEXITY ANALYSIS
