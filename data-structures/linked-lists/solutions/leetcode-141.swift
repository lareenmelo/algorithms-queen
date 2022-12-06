// 141 - Linked List Cycle

func hasCycle(_ head: ListNode?) -> Bool {
	var slow = head
	var fast = head

	while fast != nil && fast?.next != nil {
		slow = slow?.next
		fast = fast?.next?.next

		if fast === slow {
			return true
		}
	}
	return false
}
