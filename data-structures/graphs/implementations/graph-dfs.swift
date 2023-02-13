func dfs<T: Hashable>(on graph: [[T]], source: T) -> [T] {
	// 1) create adjacency list neighbors list basically
	var vertices: [T: [T]] = [:]

	for edge in graph {
		vertices[edge[0], default: []].append(edge[1])
		vertices[edge[1], default: []].append(edge[0])
	}

	// 2) dfs
	var stack = [T]()
	var visited = [T]()

	stack.append(source)

	while !stack.isEmpty {
		var current = stack.removeLast()
		visited.append(current)

		let vertex = vertices[current] ?? []

		for neighbor in vertex.reversed() {
			// checking for non visited vertices
			// or vertices in stack waiting
			if !visited.contains(neighbor) && !stack.contains(neighbor) {
				stack.append(neighbor)
			}
		}
	}

	return visited
}
