// 206 - Reverse Linked List

// MARK: optimal solution
func reverseList(_ head: ListNode?) -> ListNode? {
	var current = head
	var previous: ListNode?

	while current != nil {
		let temp = current?.next
		current?.next = previous
		previous = current
		current = temp
	}


	return previous
}

// MARK: brute force 🤭
func reverseList(_ head: ListNode?) -> ListNode? {
	var newList: ListNode?
	var tempHead = head

	while tempHead != nil {
		if newList != nil {
			let newNode = ListNode(tempHead!.val, newList)
			newList = newNode

			print(newList!.val)

		} else {
			let newNode = ListNode(tempHead!.val)
			newList = newNode
		}


		tempHead = tempHead?.next
	}

	return newList
}
