// 2103 - Rings and Rods

func countPoints(_ rings: String) -> Int {
	var counter = 0
	var locations: Set<Int> = Set<Int>()
	var ringsCollection = Array(rings)
	var distribution: [Int: [Character]] = [Int: [Character]]()

	for i in 0...ringsCollection.count - 2 {
		if i % 2 == 0 {
			let index = i + 1

			if let location = ringsCollection[index].wholeNumberValue {
				locations.insert(location)
				let color: [Character] = [ringsCollection[i]]

				if distribution[location] == nil {
					distribution[location] = color
				} else {
					var colors = distribution[location]!
					colors += color

					distribution[location] = colors

				}
			}
		}
	}

	for location in locations {
		let rods: Set<Character> = Set(distribution[location]!)
		if rods.count == 3 {
			counter += 1
		}
	}

	return counter
}

