/// Directed Unweighted Graph

/// Vertex
/// Representation of a node in a graph.
struct Vertex<T> {
	var index: Int
	var value: T
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}

extension Vertex: CustomStringConvertible {
	var description: String {
		return "\(index): \(value)"
	}
}

/// Edge
/// A relationship connecting two vertices or one vertex with itself
struct Edge<T: Hashable> {
	var source: Vertex<T>
	var destination: Vertex<T>
}

class AdjacencyMatrix<T: Hashable> {
	private var matrix: [[Int]] = []
	private var vertices: [Vertex<T>] = []

	var isEmpty: Bool { return matrix.isEmpty && vertices.isEmpty }

	init () { }

	@discardableResult func createVertex(data: T) -> Vertex<T> {
		let vertex = Vertex(index: vertices.count, value: data)
		vertices.append(vertex)

		// adding new column matrix
		for i in 0..<matrix.count {
			matrix[i].append(0)
		}

		let row = Array(repeating: 0, count: vertices.count)
		matrix.append(row)

		return vertex
	}

	func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>) {
		matrix[source.index][destination.index] = 1
	}

	func edges(from source: Vertex<T>) -> [Edge<T>] {
		var edges = [Edge<T>]()
		let row = matrix[source.index]

		for column in 0..<matrix.count {
			if row[column] == 1 {
				let edge = Edge(source: source, destination: vertices[column])
				edges.append(edge)
			}
		}
		return edges
	}

	func delete(vertex: Vertex<T>) {
		var newMatrix = [[Int]]()

		for (index, row) in matrix.enumerated() {
			if index != vertex.index {
				var newRow = row
				newRow.remove(at: vertex.index)

				newMatrix.append(newRow)
			}
		}

		matrix = newMatrix
		vertices.remove(at: vertex.index)
	}

	func checkPath(from source: Vertex<T>, to destination: Vertex<T>) -> Bool {
		var stack = [Vertex<T>]()
		var visited = [Vertex<T>]()

		stack.append(source)

		while !stack.isEmpty {
			var current = stack.popLast()!

			if current == destination { return true }

			visited.append(current)

			let neighbors = edges(from: current)

			for neighbor in neighbors {
				let vertex = neighbor.destination

				if !stack.contains(vertex) && !visited.contains(vertex) {
					stack.append(vertex)
				}
			}
		}

		return false
	}

	func dfs(from source: Vertex<T>) -> [Vertex<T>] {
		var stack = [Vertex<T>]()
		var visited = [Vertex<T>]()

		stack.append(source)

		while !stack.isEmpty {
			var current = stack.popLast()!
			visited.append(current)

			let edges = edges(from: current)

			for neighbor in edges.reversed() {
				let vertex = neighbor.destination

				if !stack.contains(vertex) && !visited.contains(vertex) {
					stack.append(vertex)
				}
			}
		}

		return visited
	}

	func bfs(from source: Vertex<T>) -> [Vertex<T>] {
		var queue = [Vertex<T>]()
		var visited = [Vertex<T>]()

		queue.append(source)

		while !queue.isEmpty {
			let current = queue.removeFirst()
			visited.append(current)

			let edges = edges(from: current)

			for vertex in edges {
				let neighbor = vertex.destination

				if !queue.contains(neighbor) && !visited.contains(neighbor) {
					queue.append(neighbor)
				}
			}
		}

		return visited
	}
}

extension AdjacencyMatrix: CustomStringConvertible {
	var description: String {
		var string = ""
		var header = "  | "

		// build header
		for vertex in vertices {
			header.append("\(vertex.value) | ")
		}

		string.append(header)
		string.append("\n")

		// build matrix
		for (index, row) in matrix.enumerated() {
			var rowString = "\(vertices[index].value) | "
			let currentRow = row
			for (index, element) in currentRow.enumerated() {
				if index == currentRow.count - 1 {
					rowString.append("\(element) |\n")
				} else {
					rowString.append("\(element) | ")
				}
			}

			string.append(rowString)
		}

		return string
	}
}
