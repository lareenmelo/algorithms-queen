// 1984. Minimum Difference Between Highest and Lowest of K Scores

func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
	var pointer = 0
	var difference = Int.max
	let sortedNums = nums.sorted()

	while pointer < (nums.count - (k - 1)) {
		let possibleDifference = abs(sortedNums[pointer] - sortedNums[pointer + (k - 1)])
		difference = min(difference, possibleDifference)

		pointer += 1
	}

	return difference
}

// PSEUDOCODE

// TIME COMPLEXITY ANALYSIS
