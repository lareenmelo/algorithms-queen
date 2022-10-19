// 643. Maximum Average Subarray I

func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
	var pointer = 0
	var maxAverage = Double(-Int.max)
	var sum = 0.0

	while pointer < nums.count {
		sum += Double(nums[pointer])

		if pointer >= k - 1 {
			let average = sum / Double(k)
			maxAverage = max(maxAverage, average)

			sum -= Double(nums[pointer - (k-1)])
		}

		pointer += 1
	}

	return maxAverage
}


// PSEUDOCODE

// COMPLEXITY ANALYSIS


