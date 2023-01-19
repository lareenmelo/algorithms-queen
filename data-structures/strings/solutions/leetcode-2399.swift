// 2399 - Check Distances Between Same Letters

func checkDistances(_ s: String, _ distance: [Int]) -> Bool {
	var storage = [Character: Int]()

	for (index, character) in s.enumerated() {
		if let i = storage[character] {
			var dist = (index - i) - 1
			let id = Int(character.asciiValue ?? 97) - 97

			if distance[id] != dist { return false }

		} else {
			storage[character] = index
		}
	}

	return true
}
