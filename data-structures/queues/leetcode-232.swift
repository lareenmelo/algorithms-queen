// 232 - Implement Queue using Stacks
class MyQueue {
	var firstOut: [Int] = []
	var stack: [Int] = []

	init() {
	}

	func push(_ x: Int) {
		stack.append(x)
		firstOut = stack.reversed()
	}

	func pop() -> Int {
		let removed = firstOut.last ?? 0
		firstOut.removeLast()
		stack = firstOut.reversed()

		return removed
	}

	func peek() -> Int {
		return firstOut.last ?? 0
	}

	func empty() -> Bool {
		return stack.count == 0
	}
}
