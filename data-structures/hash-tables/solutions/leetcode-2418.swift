// 2418 - Sort the People
func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
	var result: [String] = [String]()
	var heightsRecords: [Int: String] = [Int: String]()

	// associating heights with person to create a log of people's heights
	for i in 0 ..< heights.count {
		let height = heights[i]
		let person = names[i]
		heightsRecords[height] = person
	}

	// sort heights from tallest to shortest
	let sortedHeights = heights.sorted(by: >)

	// create collection of people with the desired order
	for heights in sortedHeights {
		if let person = heightsRecords[heights] {
			result.append(person)
		}
	}

	// return collection
	return result
}

