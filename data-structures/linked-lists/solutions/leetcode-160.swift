// 160 - Intersection of Two Linked Lists
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
	var a = headA
	var b = headB

	// finding size of both lists
	var aSize = sizeOf(list: a)
	var bSize = sizeOf(list: b)

	// update longer list so it starts @ the same as short list
	if aSize < bSize {
		while aSize < bSize {
			b = b?.next
			bSize -= 1
		}
	} else if bSize < aSize {
		while bSize < aSize {
			a = a?.next
			aSize -= 1
		}
	}

	// we search on each node, checking for the intersection, until no nodes are left
	while a != nil && b != nil {
		if a === b {
			return a
		}

		a = a?.next
		b = b?.next
	}

	// if no intersection is found, we return nil
	return nil
}

private func sizeOf(list: ListNode?) -> Int {
	var count = 0
	var lista = list

	while lista != nil {
		count += 1
		lista = lista?.next
	}

	return count
}
