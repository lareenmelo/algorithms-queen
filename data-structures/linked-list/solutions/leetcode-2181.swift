// 2181 - Merge Nodes in Between Zeros
func mergeNodes(_ head: ListNode?) -> ListNode? {
	var head = head?.next
	var modifiedList = ListNode()
	var dummy: ListNode? = modifiedList
	var counter = 0
	
	while head != nil {
		counter += head!.val
		
		if head!.val == 0 {
			let node = ListNode(counter)
			dummy?.next = node
			dummy = dummy?.next
			
			counter = 0
		}
		
		head = head!.next
		
	}
	
	return modifiedList.next
	
}
