// 1876. Substrings of Size Three with Distinct Characters

func countGoodSubstrings(_ s: String) -> Int {
	var start = 0
	var end = start + 2
	let substr = Array(s)
	var validSubstrings = 0

	while end < s.count {
		let subs = substr[start...end]

		if Set(subs).count == 3 {
			validSubstrings += 1
		}

		start += 1
		end += 1
	}

	return validSubstrings
}



// PSEUDOCODE
// - Check if our substring of range 3 contains any duplicate characters
// - If it doesn't have any duplicate, we increment the valid substring count by 1
// - Continue by moving start index by 1, and end index by + 2.

// COMPLEXITY ANALYSIS
// - Time complexity: O(n)
// - Space complexity: ??
