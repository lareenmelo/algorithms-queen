/// implementation of the linear data structure
/// that follows the LIFO rule (last in, first out)
struct Stack<T> {
	/// the dynamic array behind our stack
	private var stack: [T] = []

	/// pushes an element into the stack
	mutating func push(_ value: T) {
		stack.append(value)
	}

	/// removes the top element of the stack
	mutating func pop() {
		stack.dropLast()
	}

	/// returns the top most item in the stack if there's any
	func peek() -> T? {
		stack.last
	}
}

extension Stack: CustomStringConvertible {
	/// custom variable that prints a visualization of the current stack
	var description: String {
		let beginning = "-----"
		let end = "-----"

		var elements: [String] = [String]()
		let reversedStack = stack.reversed()

		for element in reversedStack {
			elements.append("\(element)")
		}

		return beginning + "\n" + elements.joined(separator: "\n") + "\n" + end
	}
}
