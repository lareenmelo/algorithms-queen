// 21 - Merge Two Sorted Lists
func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
	var mergedList = ListNode()
	var a = list1
	var b = list2
	var list: ListNode? = mergedList
	
	while let l1 = a, let l2 = b {
		if l1.val < l2.val {
			list?.next = l1
			a = l1.next
		} else {
			list?.next = l2
			b = l2.next
		}
		
		list = list?.next
	}
	
	if let l1 = a { list?.next = l1 }
	if let l2 = b { list?.next = l2 }
	
	return mergedList.next
}
