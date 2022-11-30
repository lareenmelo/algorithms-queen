// 876 - Middle of the Linked List
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
