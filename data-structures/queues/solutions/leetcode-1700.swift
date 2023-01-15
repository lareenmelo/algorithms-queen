// 1700 - Number of Students Unable to Eat Lunch
func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
	var stack = sandwiches
	var queue = students
	var index = 0
	var count = 0

	while stack.count != 0 && index < stack.count {
		let sandwich = stack.first!
		let student = queue.first!

		if sandwich == student {
			stack.removeFirst()
			queue.removeFirst()
			index = 0
		} else {
			let student = queue[0] ?? 0
			queue.append(student)
			queue.removeFirst()

			index += 1
		}
	}

	print(count)

	return queue.count
}
