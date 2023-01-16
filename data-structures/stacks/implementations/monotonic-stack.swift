// DISCLAIMER: I'm using my personal stack implementation as the main DS

/// Receives an array as parameter and the type of function (`.ascending` || `.descending`) the monotonic array should be filtered by. It returns a monotonic stack.
func monotonicStack(_ array: [Int], by type: Function) -> Stack<Int> {
	var result = Stack<Int>()

	switch(type) {
	case .ascending:
		result = ascendingStack(array)

	case .descending:
		result = descendingStack(array)

	}

	return result
}

private func ascendingStack(_ array: [Int]) -> Stack<Int> {
	var index = 0
	var stack = Stack<Int>()

	while index < array.count {
		let item = array[index]

		if let last = stack.peek() {
			if item < last {
				stack.pop()
			} else {
				stack.push(item)
				index += 1
			}
		} else {
			stack.push(item)
			index += 1
		}
	}

	return stack
}

private func descendingStack(_ array: [Int]) -> Stack<Int> {
	var index = 0
	var stack = Stack<Int>()

	while index < array.count {
		let item = array[index]

		if let last = stack.peek() {
			if item > last {
				stack.pop()
			} else {
				stack.push(item)
				index += 1
			}
		} else {
			stack.push(item)
			index += 1
		}
	}

	return stack }

func monotonicStack(_ array: [Int], by type: Function) -> Stack<Int> {
	var result = Stack<Int>()

	switch(type) {
	case .ascending:
		result = ascendingStack(array)

	case .descending:
		result = descendingStack(array)

	}

	return result
}

enum Function {
	case ascending
	case descending
}
