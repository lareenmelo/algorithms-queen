// 2130 - Maximum Twin Sum of a Linked List

func pairSum(_ head: ListNode?) -> Int {
	var fast = head
	var slow = head
	var previous: ListNode?

	// first, we find middle
	while fast != nil && fast?.next != nil {
		slow = slow?.next
		fast = fast?.next?.next
	}

	// second, we reverse the second half
	while slow != nil {
		var temporary = slow?.next
		slow?.next = previous
		previous = slow
		slow = temporary
	}

	// third, we compare from middle to start
	var list = head
	var maxSum = Int.min

	while previous != nil {
		var sum = list!.val + previous!.val
		maxSum = max(maxSum, sum)

		list = list?.next
		previous = previous?.next
	}

	// then we win
	return maxSum
}
