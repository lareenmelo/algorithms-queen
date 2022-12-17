// doubly linked list

// MARK: node class
/// nodes have the `.next` and `.previous` properties. The `.next` property signals the following node on the list,
/// if this property is nil it means the node is the tail. Likewise, the `.previous` property signals the previous node,
/// if this property is nil it means the node is the head.
class Node<T: Equatable> {
	var value: T
	var next: Node?
	var previous: Node?

	init(_ value: T) {
		self.value = value
		self.next = nil
		self.previous = nil
	}
}

// MARK: node equatable conformance
extension Node: Equatable {
	static func == (lhs: Node, rhs: Node) -> Bool {
		return
			lhs.value == rhs.value &&
			lhs.next == rhs.next &&
			lhs.previous == rhs.previous
	}
}

// MARK: linked list implementation
class Doubly<T: Equatable> {
	private var head: Node<T>?
	private var tail: Node<T>?
	private var count: Int

	init() {
		head = nil
		tail = nil
		count = 0
	}

	// MARK: head
	func listHead() -> Node<T>? {
		return head
	}

	// MARK: tail
	func listTail() -> Node<T>? {
		return tail
	}

	// MARK: adding methods

	/// adds a node as the tail of the linked list. If list is empty
	/// and `append` method has been used, it updates the list's head
	/// and tail as the node with the value being sent.
	func append(_ value: T) {
		let node = Node(value)

		// if the list is empty
		if head == nil && tail == nil {
			head = node
			tail = node
		} else {
			// since list has at least one node
			node.previous = tail
			tail?.next = node

			tail = node
		}

		count += 1
	}

	/// adds a node as the head of the linked list. If list is empty
	/// and `insert` method has been used, it updatesthe list's head
	/// and tail as the node with the value being sent
	func insert(_ value: T) {
		let node = Node(value)

		// if the list is empty
		if head == nil && tail == nil {
			head = node
			tail = node

		} else {
			// since list has at least one node
			node.next = head
			head?.previous = node

			head = node
		}

		count += 1
	}

	/// adds a node at the given index. index has to be valid, if not
	/// a print statement will complain about index being out of bounds
	/// list is 0-indexed.
	func insert(_ value: T, at index: Int) {
		if index > count || index < 0 {
			print("index out of bounds")
			return
		}

		var node: Node? = Node(value)
		// if list is empty
		if index == 0 && (head == nil && tail == nil) {
			head = node
			tail = node

			count += 1
		} else {
			// we're insert at the beginning of linked list
			if index == count {
				append(value)

			} else if index == 0 {
				// we're inserting at the end of the linked list
				insert(value)

			} else {
				// we're inserting somewhere within our linked list
				var i = 0
				var list: Node? = head

				while list != nil {
					if i == index {
						var previous = list?.previous
						node?.previous = previous
						previous?.next = node
						list?.previous = node
						node?.next = list
					}

					i += 1
					list = list?.next
				}

				count += 1
			}
		}
	}

	// MARK: deletion method

	/// deletes the first node of the linked list (the `head`) if available.
	/// if the list is empty a print statement will post an error.
	func deleteFirst() {
		// if list is empty
		if head == nil && tail == nil {
			print("list is empty")
			return
		}

		// if list has only 1 node
		if head == tail {
			head = nil
			tail = nil

		} else {
			// if list has more than 1 node
			var next = head?.next
			head?.next?.previous = nil
			head = next
		}

		count -= 1
	}

	/// deletes the last node of the linked list (the `tail`) if available.
	/// if the list is empty a print statement will post an error.
	func deleteLast() {
		// if list is empty
		if head == nil && tail == nil {
			print("list is empty")
			return
		}

		// if list has only 1 node
		if head == tail {
			head = nil
			tail = nil
		} else {
			// if list has more than 1 node
			var previous = tail?.previous
			previous?.next = nil
			tail = previous
		}
	}

	/// deletes a node at the given index. index has to be valid, if not
	/// a print statement will complain about index being out of bounds
	/// list deletion should be approached as 0-indexed.
	func delete(at index: Int) {
		// if index isn't valid
		if index >= count || index < 0 {
			print("index out of bounds")
			return
		}

		// if list is empty
		if head == nil && tail == nil {
			print("list is empty")
			return
		}

		// if node to be deleted is the only node of the list
		if index == 0 && (head == tail) {
			head = nil
			tail = nil

			count -= 1

		} else {
			// if node to be deleted is the at the tail
			if index == count - 1 {
				deleteLast()
			} else if index == 0 {
				// if node to be deleted is at the head
				deleteFirst()
			} else {
				// if node to be deleted is within the list
				var list: Node? = head
				var i = 0

				while list != nil {
					if i == index {
						var previous: Node? = list?.previous
						var next: Node? = list?.next

						list?.previous?.next = next
						next?.previous = previous

						list = nil

						break
					}
					list = list?.next
					i += 1
				}
				count -= 1
			}
		}
	}

	// MARK: print list
	/// prints the list in the following custom format: 1 -> 2 -> 3
	func printList() {
		var list: Node? = head
		var string = "no nodes"

		while list != nil {
			if list?.previous == nil {
				string = "\(list!.value)"
			} else {
				string += " -> \(list!.value)"
			}

			list = list?.next
		}

		print(string)
	}

	// MARK: size
	/// returns how many nodes a list currently has
	func size() -> Int {
		return count
	}
}
