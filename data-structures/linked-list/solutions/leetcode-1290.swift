// 1290 - Convert Binary Number in a Linked List to Integer    
func getDecimalValue(_ head: ListNode?) -> Int {
	var binary = ""
	var decimal = 0
	var list = head
	
	while list != nil {
		if list!.val != nil {
			binary += String(list!.val)
		}
		
		list = list?.next
	}
	
	var array = Array(binary)
	var length = binary.count - 1
	var index = 0
	
	while length >= 0 {
		if array[index] == "0" {
			decimal += 0
			
		} else {
			let exponent = Double(length)
			var number = 1 * pow(2, length)
			decimal += NSDecimalNumber(decimal: number).intValue
		}
		
		length -= 1
		index += 1
		
	}
	
	
	return decimal
}
