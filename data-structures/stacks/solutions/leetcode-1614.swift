// 1614 - Maximum Nesting Depth of the Parentheses

func maxDepth(_ s: String) -> Int {
	var finder = 0
	var depth = Int.min

	for char in s {
		switch(char) {
			case "(":
			finder += 1
			case ")":
			finder -= 1
			default:
			break
		}

		depth = max(depth, finder)
	}

	return depth
}
