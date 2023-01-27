// 521 - Longest Uncommon Subsequence I

func findLUSlength(_ a: String, _ b: String) -> Int {
	return a == b ? -1 : max(a.count, b.count)
}
