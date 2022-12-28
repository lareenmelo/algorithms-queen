// 1436 - Destination City

func destCity(_ paths: [[String]]) -> String {
	var finalCity = ""
	var cities: Set<String> = Set<String>()
	var destination: [String: String] = [String: String]()

	for i in 0..<paths.count {
		let path = paths[i]

		let start = path[0]
		let end = path[1]
		destination[start] = end
		cities.insert(start)
		cities.insert(end)
	}

	for city in cities {
		if destination[city] == nil {
			finalCity = city
		}
	}

	return finalCity
}
