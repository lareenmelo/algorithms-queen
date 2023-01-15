// 225 - Implement Stack using Queues
class MyStack {
	private var queue: [Int]

	init() {
		self.queue = []
	}

	func push(_ x: Int) {
		queue.append(x)
	}

	func pop() -> Int {
		queue.removeLast()
	}

	func top() -> Int {
		queue.last!
	}

	func empty() -> Bool {
		queue.isEmpty
	}
}
