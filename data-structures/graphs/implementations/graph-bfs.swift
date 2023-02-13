func bfs<T:Hashable>(on graph: [[T]], source: T) -> [T] {
	// create adjacency list
	var list = [T: [T]]()

	for edge in graph {
		list[edge[0], default: []].append(edge[1])
		list[edge[1], default: []].append(edge[0])
	}

	// start bfs
	var queue = [T]()
	var visited = [T]()

	queue.append(source)

	// start path search
	while !queue.isEmpty {
		let current = queue.removeFirst()
		visited.append(current)

		let neighbors = list[current] ?? []

		for neighbor in neighbors {
			if !visited.contains(neighbor) && !queue.contains(neighbor) {
				// if we don't have the vertex in the visited list, or in the queue pending for visitation, then we add it to
				// the queue
				queue.append(neighbor)
			}
		}
	}

	return visited
}

