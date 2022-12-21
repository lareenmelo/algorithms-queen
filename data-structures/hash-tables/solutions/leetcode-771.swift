// 771 - Jewels and Stones
func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
	var jewelCollection = Array(jewels)
	var stoneCollection = Array(stones)
	var counter = 0

	var dictionary: [Character: Int] =  [Character: Int]()

	for jewel in jewelCollection {
		dictionary[jewel] = 0
	}

	for stone in stoneCollection {
		if dictionary[stone] != nil {
			counter += 1
		}
	}
	return counter
}
