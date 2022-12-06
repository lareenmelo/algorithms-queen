// 83 - Remove Duplicates from Sorted List
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
	var dummy = head
	var previous: ListNode?
	var result = dummy

	while dummy != nil {
		if dummy?.val == previous?.val {
			var next = dummy?.next
			previous?.next = next
			// dummy?.next = nil
			dummy = next
		} else {
			previous = dummy
			dummy = dummy?.next
		}
	}

	return result
}
