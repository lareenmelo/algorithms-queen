// 203 - Remove Linked List Elements

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
	var current: ListNode? = head
	var dummy = ListNode(0)
	dummy.next = head
	var previous: ListNode? = dummy

	while current != nil {
		if current?.val == val {

			previous?.next = current?.next

		} else {
			previous = previous?.next
		}
		current = current?.next
	}

	return dummy.next
}
