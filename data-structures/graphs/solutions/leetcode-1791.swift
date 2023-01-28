// 1791 - Find Center of Star Graph

// 😃 brute force solution
func findCenter(_ edges: [[Int]]) -> Int {
	var i = 0
	var j = 0
	var frequency = [Int: Int]()
	var maxFrequency = -1
	var star = 0

	for i in 0..<edges.count {
		let nodes = edges[i]

		for j in 0..<nodes.count {
			let value = nodes[j]
			frequency[value, default: 0] += 1

			if maxFrequency < frequency[value]! {
				star = value
				maxFrequency = frequency[value]!
			}
		}
	}

	return star
}
}
