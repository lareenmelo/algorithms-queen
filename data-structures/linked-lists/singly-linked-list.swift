// singly linked list

// node class
/// nodes have the `.next` property, signaling the following node on the list,
/// if this property is nil it means the node is a tail
class Node<T: Equatable> {
	var value: T
	var next: Node?

	init(with value: T, and next: Node<T>? = nil ) {
		self.value = value
		self.next = next
	}
}

// equatable implementation
extension Node: Equatable {
	static func == (lhs: Node, rhs: Node) -> Bool {
		return
			lhs.value == rhs.value &&
			lhs.next == rhs.next
	}
}


class Singly<T: Equatable> {
	private var count: Int = 0
	var head: Node<T>?
	var tail: Node<T>?

	init() {
		head = nil
		tail = nil
	}

	// MARK: Insertion methods
	// plain inserting
	private func insert(node: Node<T>?, previous: Node<T>?) {
		count += 1

		// if the list is empty, we still insert the node
		if head == nil && tail == nil {
			head = node
			tail = node

			return
		}

		// if list is not empty, we proceed with inserting
		// insert at the head
		if previous == nil {
			node?.next = head
			head = node

		} else if previous == tail { // inserting at the tail
			previous?.next = node
			tail = node
		} else {
			// rest of inserting
			node?.next = previous?.next
			previous?.next = node
		}
	}

	// inserts a node as the tail node
	func appendNode(_ value: T) {
		let node = Node(with: value)
		insert(node: node, previous: tail)
	}

	/// inserts a node as the head node
	func insertNode(_ value: T) {
		let node = Node(with: value)
		insert(node: node, previous: nil)
	}

	// insert at given position
	func insertNode(_ value: T, at position: Int) {
		if position < 0 || position > count {
			print("Index is not valid")
			return
		}

		if position == 0 {
			insertNode(value)

		} else if position == count {
			appendNode(value)

		} else {
			var current = head
			var previous: Node<T>?
			var i = 0

			while i < position {
				previous = current
				current = current?.next
				i += 1
			}

			let node = Node(with: value)

			insert(node: node, previous: previous)
		}

	}

	// MARK: Deletion methods
	// plain deleting
	private func delete(node: Node<T>?, previous: Node<T>?) {
		count -= 1

		if head == nil && tail == nil {
			print("List is already empty!")
			return
		}

		if head == tail {
			head = nil
			tail = nil

			return
		}

		if previous == nil {
			// delete head
			head = head?.next
		} else if node == tail {
			// delete tail
			tail = previous
			previous?.next = nil

		} else {
			// deleting
			previous?.next = node?.next
		}
	}

	// deleting at the beginning
	func deleteFirst() {
		delete(node: head, previous: nil)
	}

	// deleting at the end
	func deleteLast() {
		var temp = head
		var previous: Node<T>?

		while temp?.next != nil {
			previous = temp
			temp = temp?.next
		}

		delete(node: tail, previous: previous)
	}

	// deleting at given position
	func delete(at position: Int) {
		if position < 0 || position >= count {
			print("Index is not valid")
			return
		}

		if position == 0 {
			deleteFirst()

		} else if position == count - 1 {
			deleteLast()

		} else {
			var current = head
			var previous: Node<T>?

			var i = 0

			while i < position {
				previous = current
				current = current?.next
				i += 1
			}

			delete(node: current, previous: previous)
		}
	}

	// MARK: Print list
	func printList() {
		var temp = head
		var string = ""

		while temp != nil {
			if temp == head {
				string += "\(temp!.value)"
			} else {
				string += " -> \(temp!.value)"
			}
			temp = temp?.next

		}

		print(string)
	}

	// MARK: Size
	func size() -> Int {
		return count
	}
}


var list = Singly<Int>()
list.appendNode(6)
list.appendNode(5)
list.appendNode(4)
// list is 6 -> 5 -> 4

list.deleteFirst()
list.deleteLast()
// list is 5
