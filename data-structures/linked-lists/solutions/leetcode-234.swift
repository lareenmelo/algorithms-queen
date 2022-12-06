// 234 - Palindrome Linked List
// MARK: optimal solution
func isPalindrome(_ head: ListNode?) -> Bool {
	var fast = head
	var slow = head
	var list = head
	
	// step 1: find middle
	while fast != nil && fast?.next != nil {
		slow = slow?.next
		fast = fast?.next?.next
	}
	
	// step 2: reverse from middle (slow)
	var previous: ListNode?
	var temp: ListNode?
	
	while slow != nil {
		temp = slow?.next
		slow?.next = previous
		previous = slow
		slow = temp
		
	}
	
	// step 3: compare two halves (list and previous)
	while previous != nil {
		if previous?.val == list?.val {
			previous = previous?.next
			list = list?.next
		} else {
			return false
		}
	}
	
	return true
}


// MARK: brute force 🤭
func isPalindrome(_ head: ListNode?) -> Bool {
	var list = head
	var number: [Int] = [Int]()
	
	while list != nil {
		number.append(list!.val)
		list = list?.next
	}
	
	var a = 0
	var b = number.count - 1
	
	while a < b {
		if number[a] == number[b] {
			a += 1
			b -= 1
		} else {
			return false
		}
	}
	
	return true
}
