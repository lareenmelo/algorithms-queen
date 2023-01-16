// 1475 - Final Prices With a Special Discount in a Shop

func finalPrices(_ prices: [Int]) -> [Int] {
	var i = 0
	var j = 1
	var stack = [Int]()

	while i < prices.count {
		if j < prices.count && prices[j] <= prices[i] {
			var value = prices[i] - prices[j]
			stack.append(value)

			i += 1
			j = 1 + i
		} else {
			if j >= prices.count {
				stack.append(prices[i])
				i += 1
				j = 1 + i
			} else {
				j += 1
			}
		}
	}

	return stack
}
