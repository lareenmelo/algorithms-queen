// 237 - Delete Node in a Linked List

func deleteNode(_ node: ListNode?) {
	node?.val = node!.next!.val
	node?.next = node?.next?.next
}
