// 206 - Reverse Linked List
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
