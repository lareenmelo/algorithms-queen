// 412 - Fizz Buzz
func fizzBuzz(_ n: Int) -> [String] {
	var i = 0
	var result: [String] = []

	while i < n {
		var value = i + 1

		if value % 15 == 0 {
			result.append("FizzBuzz")

		} else if value % 5 == 0 {
			result.append("Buzz")

		} else if value % 3 == 0 {
			result.append("Fizz")

		} else {
			result.append("\(value)")
		}

		i += 1
	}

	return result
}
