/// Node Class
class Node<T: Equatable> {
	var value: T
	var next: Node<T>?

	init(_ value: T) {
		self.value = value
		self.next = nil
	}

}

extension Node: Equatable {
	static func == (lhs: Node, rhs: Node) -> Bool {
		return
			lhs.value == rhs.value &&
			lhs.next == rhs.next
	}
}

/// Double Ended Queue implementation
/// Deque Class
class Deque<T: Equatable> {
	private var head: Node<T>?
	private var tail: Node<T>?

	/// returns the first element in the queue
	var front: Node<T>? { return head }
	/// returns the last element in the queue
	var rear: Node<T>? { return tail }
	/// returns true if the queue is empty, false otherwise
	var isEmpty: Bool { return head == nil }

	init() {
		head = nil
		tail = nil
	}

	// enqueues the first element
	private func enqueueFirst(_ node: Node<T>) {
		head = node
		tail = node
	}

	/// adds a new element to the front of the queue
	func enQueueFront(_ value: T) {
		var node = Node(value)

		if head == nil {
			enqueueFirst(node)
		} else {
			node.next = head
			head = node
		}
	}

	/// adds a new element to the rear of the queue
	func enQueueRear(_ value: T) {
		var node = Node(value)

		if head == nil {
			enqueueFirst(node)
		} else {
			tail?.next = node
			tail = node
		}
	}

	/// dequeues the only element in the queue
	private func deQueueFirst() {
		tail = nil
		head = nil

	}

	/// removes the element at the beginning of the queue
	func deQueueFront() {
		if head == tail {
			deQueueFirst()
		} else {
			head = head?.next
		}

	}

	/// removes the element at the end of the queue
	func deQueueRear() {
		if head == tail {
			deQueueFirst()
		} else {
			var tempHead = head
			var previous: Node<T>?

			while tempHead?.next != nil {
				previous = tempHead
				tempHead = tempHead?.next
			}

			previous?.next = nil
			tail = previous
		}
	}

	/// returns the value of the first element
	func peekFront() -> T? {
		return head?.value
	}

	/// returns the value of the element at the end
	func peekRear() -> T? {
		return tail?.value
	}
}

extension Deque: CustomStringConvertible {
	var description: String {
		var queue = ""

		var tempHead = head

		while tempHead != nil {
			if tempHead == head {
				queue += "\(tempHead!.value)"
			} else {
				queue += ", \(tempHead!.value)"
			}

			tempHead = tempHead?.next
		}

		return "Queue: " + queue
	}
}
