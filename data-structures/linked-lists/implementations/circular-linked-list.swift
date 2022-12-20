// circular linked list (singly)

// MARK: node class
/// nodes have the `.next` property, signaling the following node on the list,
/// if this property is nil it means the node is a tail
class Node<T: Equatable> {
	var value: T
	var next: Node?

	init(_ value: T, _ next: Node<T>? = nil) {
		self.value = value
		self.next = next
	}
}

extension Node: Equatable {
	static func == (lhs: Node, rhs: Node) -> Bool {
		return
			lhs.value == rhs.value &&
			lhs.next == rhs.next
	}
}


// MARK: circly linked list class
class Circly<T: Equatable> {
	private var head: Node<T>?
	private var tail: Node<T>?
	private var count: Int

	init () {
		head = nil
		tail = nil
		count = 0
	}

	// MARK: head
	/// method returns the current head of the list, if there's any
	func getHead() -> Node<T>? {
		return head
	}

	// MARK: tail
	/// method returns the current tail of the list, if there's any
	func getTail() -> Node<T>? {
		return tail
	}

	// MARK: insertion methods

	/// adds a node as the tail of the linked list. because list is circular
	/// the node to be added will always point to the head and be used as the
	/// new tail
	func append(_ value: T) {
		let node: Node? = Node(value)

		// if list is empty
		if head == nil && tail == nil {
			head = node
			tail = node
			tail?.next = head

		} else {
			// list size is bigger than 1, inserting list as tail
			node?.next = head
			tail?.next = node
			tail = node

		}

		count += 1
	}

	/// adds a node as head of the linked list. because list is circular
	/// the tail's `.next` reference will be updated with the new head
	func insert(_ value: T) {
		let node: Node? = Node(value)

		if head == nil && tail == nil {
			head = node
			tail = node
			tail?.next = head

		} else {
			// list size is bigger than 1, inserting list as head
			node?.next = head
			tail?.next = node
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

		let node: Node? = Node(value)

		// if list is emtpy
		if index == 0 && (head == nil && tail == nil) {
			head = node
			tail = node
			tail?.next = head

			count += 1

		} else {
			// list is not empty

			// if index is 0, insert at the head
			if index == 0 {
				insert(value)

			} else if index == count {
				// if index is the same as the number of nodes in the list, insert at the tail
				append(value)

			} else {
				// if inserting within the the list
				var list = head
				var previous: Node<T>?
				var i = 0

				while list != nil {
					if i == index {
						node?.next = list
						previous?.next = node
						break
					}

					i += 1
					previous = list
					list = list?.next
				}

				count += 1
			}
		}
	}


	// MARK: deletion methods

	/// deletes the first node of the linked list (the `head`) if available.
	/// if the list is empty a print statement will post an error.
	func deleteFirst() {

		// if list is empty
		if head == nil && tail == nil {
			print("list is empty")
			return
		}

		// if list is sized 1
		if head === tail { // MARK: equatable
			head = nil
			tail = nil

		} else {
			// if list has more than 1 node
			head = head?.next
			tail = head

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

		// if the list is sized 1
		if head === tail { // MARK: equatable
			head = nil
			tail = nil
		} else {
			// if list has more than 1 node
			var list = head
			var previous: Node<T>?

			while list != nil {
				if list?.next === head { // MARK: equatable
					previous?.next = list?.next
					tail = previous

					break
				}

				previous = list
				list = list?.next
			}
		}

		count -= 1
	}

	/// deletes a node at the given index. index has to be valid, if not
	/// a print statement will complain about index being out of bounds
	/// list deletion should be approached as 0-indexed.
	func delete(at index: Int) {
		// if list is empty
		if head == nil && tail == nil {
			print("list is empty")
			return
		}

		if index >= count || index < 0 {
			print("index out of bounds")
			return
		}

		if index == 0 && head === tail { // MARK: equatable
			head = nil
			tail = nil

			count -= 1
		} else {
			// list is not empty

			if index == count - 1 {
				// node to delete is the tail
				deleteLast()

			} else if index == 0 {
				// node to delete is the head
				deleteFirst()

			} else {
				// node to delete is within the list
				var list = head
				var previous: Node<T>?
				var i = 0

				while list != nil {
					if i == index {
						previous?.next = list?.next
					}

					if list?.next === head { // MARK: equatable
						break
					}

					i += 1
					previous = list
					list = list?.next
				}
				count -= 1
			}
		}
	}


	// MARK: print list
	func printList() {
		var list = head
		var string = "no nodes"

		while list != nil {
			if list === head {
				string = "\(list!.value) "
			} else {
				string += "-> \(list!.value) "
			}

			if list?.next === head { // MARK: equatable conformance
				break
			}

			list = list?.next

		}

		print(string)
	}

	// MARK: size
	/// returns the number of nodes in the linked list
	func size() -> Int {
		return count
	}
}

