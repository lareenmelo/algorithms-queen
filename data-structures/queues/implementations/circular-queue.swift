/// Node Class
/// A node class is used to create the list of elements in the queue
class Node<T: Equatable> {
	var value: T
	var next: Node?

	init(_ value: T, next: Node<T>? = nil) {
		self.value = value
		self.next = next
	}
}

extension Node: Equatable {
	static func == (lhs: Node, rhs: Node) -> Bool {
		return
			lhs.value == rhs.value
//            lhs.next == rhs.next
	}
}

/// Circular Queue
class CircularQueue<T: Equatable> {
	private var head: Node<T>?
	private var tail: Node<T>?

	init() {
		head = nil
		tail = nil
	}

	/// front variable returns the top item in the queue
	var front: Node<T>? {
		return head
	}

	/// rear variable returns the last item in the queue
	var rear: Node<T>? {
		return tail
	}

	/// isEmpty variable returns true if the queue is empty
	/// false if otherwise
	var isEmpty: Bool {
		return head == nil
	}

	// enQueue(_) inserts a new item to the back of the queue
	func enQueue(_ value: T) {
		var newNode: Node? = Node(value)

		if head == nil {
			head = newNode
			tail = newNode

		} else {
			tail?.next = newNode
			tail = newNode
		}

		tail?.next = head
	}

	// deQueue() methods removes the first item in the queue
	func deQueue() {
		if head === tail {
			head = nil
			tail = nil
		} else {
			tail?.next = head?.next
			head = head?.next
		}
	}

	/// peek method returns the value of the first item
	func peek() -> T? {
		return head?.value
	}
}


extension CircularQueue: CustomStringConvertible {
	var description: String {
		var temporaryHead = head
		var queue = ""

		while temporaryHead != nil {
			if temporaryHead == head {
				queue += "\(temporaryHead!.value)"
			} else {
				queue += ", \(temporaryHead!.value)"
			}

			if temporaryHead == tail {
				temporaryHead = nil
			} else {
				temporaryHead = temporaryHead?.next
			}
		}

		return "[" + queue + "]"
	}
}
