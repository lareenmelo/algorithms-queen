// directed unweighted graph


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

/// AdjacencyList
/// Actual implementation of the Graph data structure using a dictionary of edges and vertices
class AdjacencyList<T: Hashable> {
    var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    var isEmpty: Bool { return adjacencies.count == 0 }
    
    init() { }
    
    @discardableResult func createVertex(data: T) -> Vertex<T> {
        let index = adjacencies.count
        let vertex = Vertex(index: index, value: data)
        
        adjacencies[vertex] = []
        
        return vertex
    }
    
    // TODO: check if this would work for disconnect vertices
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>) {
        if adjacencies[source] != nil {
            let edge = Edge(source: source, destination: destination)
            adjacencies[source]?.append(edge)
        } else {
            print("Invalid Vertex")
        }
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        adjacencies[source] ?? []
    }
    
    /// Using DFS traversal we're checking if there's a path from source to destination
    func pathExists(from source: Vertex<T>, to destination: Vertex<T>) -> Bool {
        var stack = [Vertex<T>]()
        var visited = [Vertex<T>]()
        
        stack.append(source)
        
        while !stack.isEmpty {
            let current = stack.popLast()!
            
            visited.append(current)
            
            if current == destination { return true }
            
            let edges = edges(from: current)
            
            for neighbor in edges.reversed() {
                let vertex = neighbor.destination
                
                if !stack.contains(vertex) && !visited.contains(vertex) {
                    stack.append(vertex)
                }
            }
        }
        
        return false
    }
    
    func dfsPath(from source: Vertex<T>) -> [Vertex<T>] {
        var stack = [Vertex<T>]()
        var visited = [Vertex<T>]()
        
        stack.append(source)
        
        while !stack.isEmpty {
            let current = stack.popLast()!
            
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
    
    func bfsPath(from source: Vertex<T>) -> [Vertex<T>] { 
        var queue = [Vertex<T>]()
        var visited = [Vertex<T>]()
        
        queue.append(source)
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            visited.append(current)
            
            let edges = edges(from: current)
            
            for neighbor in edges {
                let vertex = neighbor.destination
                
                if !queue.contains(vertex) && !visited.contains(vertex) {
                    queue.append(vertex)
                }
            }
        }
        
        return visited
    }
    
    /// deletes a vertex from adjacency and edges whose destination is the vertex
    @discardableResult func remove(vertex: Vertex<T>) -> Vertex<T>? {
        if adjacencies[vertex] == nil { return nil }
        
        adjacencies.removeValue(forKey: vertex)
        var deleted = vertex
        
        // check for edges that have destination == deleted vertex
        for (vertex, edges) in adjacencies {
            for (index, edge) in edges.enumerated() {
                let destination: Vertex<T> = edge.destination
                
                if destination == deleted {
                    var updatedEdges = adjacencies[edge.source]
                    
                    updatedEdges?.remove(at: index)
                                        
                    adjacencies[edge.source] = updatedEdges
                    
                }
            }
        }
        
        return vertex
    }    
}

extension AdjacencyList: CustomStringConvertible {
    var description: String {
        var result = ""
        
        for (vertex, edges) in adjacencies {
            var edgeString = ""
            
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) --> [\(edgeString)]\n")
        }
        
        return result
    }
}