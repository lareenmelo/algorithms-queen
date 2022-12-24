// 1656 - Design an Ordered Stream

class OrderedStream {
	var dictionary: [Int: String]
	var index: Int

	init(_ n: Int) {
		dictionary = [Int: String]()
		index = 1
	}

	func insert(_ idKey: Int, _ value: String) -> [String] {
		var array = [String]()
		dictionary[idKey] = value

		while dictionary[index] != nil {
			array.append(dictionary[index]!)
			index += 1
		}

		return array
	}
}
