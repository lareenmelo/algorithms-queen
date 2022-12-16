// 1669 - Merge In Between Linked Lists

func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
	var list = list1
	var listA = list1
	var listB = list2
	var index = 1

	var endingNode: ListNode?
	var startingNode: ListNode?

	while listA != nil {
		if index == a {
			endingNode = listA
		}

		if index == b {
			startingNode = listA?.next
		}

		listA = listA?.next
		index += 1
	}

	endingNode?.next = listB
	var finalList = list1

	while finalList?.next != nil {
		finalList = finalList?.next
	}

	finalList?.next = startingNode?.next

	return list
}
