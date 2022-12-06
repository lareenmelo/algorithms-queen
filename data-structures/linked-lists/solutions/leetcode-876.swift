// 876 - Middle of the Linked List
// MARK: optimal solution
func middleNode(_ head: ListNode?) -> ListNode? {
	var slow = head
	var fast = head

	while fast != nil && fast?.next != nil {
		slow = slow?.next
		fast = fast?.next?.next
	}
	
	// by the time fast gets to the end, slow will be halfway the list
	return slow
}


// MARK: brute force 🤭
func middleNode(_ head: ListNode?) -> ListNode? {
	var listSize = 0
	var temp = head

	// finding list size: did search on the internet
	while temp != nil {
		listSize += 1
		temp = temp?.next

	}

	var index = 0
	var middle = listSize / 2
	temp = head

	// finding middle node
	while index < listSize  {
		if index == middle {
			return temp // this was a mistake, ionno what i did
			// return ListNode(value, temp?.next)
		}

		temp = temp?.next

		index += 1
	}

	return head
}
