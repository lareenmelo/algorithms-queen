// 997 - Find the Town Judge

func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
	var trustChart = Array(repeating: 0, count: n)
	var trustFrequency = [Int: Int]()

	var judge = 0
	var untrusting = 0

	for pair in trust {
		let i = pair[0] - 1
		trustChart[i] = 1

		trustFrequency[pair[1], default: 0] += 1
	}

	for i in 0..<trustChart.count {
		if trustChart[i] == 0 {
			judge = i + 1
			untrusting += 1
		}
	}

	if untrusting == 1 {
		if let alledgedJudge = trustFrequency[judge] {
			if alledgedJudge == n-1 {
				return judge
			}
		} else {
			return judge
		}
	}

	return -1
}
