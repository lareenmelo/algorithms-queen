/// Singly Node, holds a reference to the next node
/// and its value
class Node<T: Equatable> {
	var value: T
	var next: Node?

	init(with value: T) {
		self.value = value
		self.next = nil
	}
}

/// Equatable conformance
extension Node: Equatable {
	static func == (lhs: Node, rhs: Node) -> Bool {
		return
			lhs.value == rhs.value &&
			lhs.next == rhs.next
	}
}

/// Queue class
/// an linear data structure that follows the FIFO rule
/// has a peek(), enqueue(_ value:), dequeue() methods.
class Queue<T: Equatable> {
	private var head: Node<T>?
	private var tail: Node<T>?
	/// returns wether or not the queue is empty
	var isEmpty: Bool { return head == nil }

	init() {
		head = nil
	}

	/// enqueue method inserts a new item to the back of the queue
	func enqueue(_ value: T) {
		var newNode = Node(with: value)

		if head == nil {
			newNode.next = nil
			head = newNode
			tail = newNode

		} else {
			tail?.next = newNode
			tail = newNode
		}
	}

	// dequeue method removes the first item of the queue
	func dequeue() {
		if head == tail {
			head = nil
			tail = nil
		} else {
			head = head?.next
		}
	}

	// shows the first item in the queue
	func peek() -> T? {
		return head?.value
	}
}

extension Queue: CustomStringConvertible {
	/// helper variable to visualize the queue
	var description: String {
		var openBracket = "["
		var closedBracket = "]"
		var queue = ""
		var secondHead = head

		while secondHead != nil {
			if secondHead == head {
				let value = secondHead!.value
				queue += "\(value)"
			} else {
				let value = secondHead!.value
				queue += ", \(value)"
			}

			secondHead = secondHead?.next
		}

		return openBracket + queue + closedBracket
	}
}
