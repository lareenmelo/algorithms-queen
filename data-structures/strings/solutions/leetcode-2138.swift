// 2138 - Divide a String Into Groups of Size k
func divideString(_ s: String, _ k: Int, _ fill: Character) -> [String] {
	// step 1) math to determine the size of our new array
	var count: Double = ceil(Double(s.count) / Double(k))
	var size: Int = Int(count) * k

	// step 2) create array of size s * k filled with fill character
	var content: Array<Character> = Array(repeating: fill, count: size)
	var result: [String] = []

	// step 3) fill in content array with values of s
	for (index, char) in s.enumerated() {
		content[index] = char
	}

	// step 4) split content array into k groups strings
	var i = 0
	var groupSize = 0
	var string = ""

	while i < content.count {
		if groupSize >= k {
			groupSize = 0
			result.append(string)
			string = ""
		}

		string.append(content[i])
		i += 1
		groupSize += 1
	}

	result.append(string)

	// step 4) return result
	return result
}
