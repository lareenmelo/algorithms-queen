//2363 - Merge Similar Items

func mergeSimilarItems(_ items1: [[Int]], _ items2: [[Int]]) -> [[Int]] {
	var values = [Int]()
	var tracker = [Int:Int]()
	var updatedTable = [[Int]]()

	var list = items1 + items2

	for i in 0..<list.count {
		let value = list[i][0]

		if tracker[value] == nil {
			values.append(value)
			tracker[value] = list[i][1]
		} else {
			var newValue = tracker[value]!
			newValue += list[i][1]
			tracker[value] = newValue
		}
	}

	let sortedValues = values.sorted(by: <)

	for value in sortedValues {
		var newArray = [Int]()

		newArray.append(value)
		newArray.append(tracker[value]!)

		updatedTable.append(newArray)
	}

	return updatedTable
}
