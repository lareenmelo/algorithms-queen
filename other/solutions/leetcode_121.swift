// 121. Best Time to Buy and Sell Stock

func maxProfit(_ prices: [Int]) -> Int {
	var profit = 0
	var buyIndex = 0
	var sellIndex = 1

	while sellIndex < prices.count {
		if prices[buyIndex] > prices[sellIndex] {
			buyIndex = sellIndex
			sellIndex += 1
		} else {
			let currentProfit = prices[sellIndex] - prices[buyIndex]

			profit = max(currentProfit, profit)
			sellIndex += 1
		}
	}

	return profit
}


// PSEUDOCODE
// 1) We initialize our buy day on day 1, and our sell day on an offset of +1, meaning day two.
// 2) We check if our price on the buy day is < than the price on the sell day. Because we buy low and sell high for the best profit.
// 2.1) If the price on the buy day is higher than the price on our sell day, we change our buy day
// 3) Calculate our profit with the current buy and sell day, and we check if it's the best profit so far
// 3.1) If it is, we update our profit variable that we're returning
//4) Increase our sell day until we get to our last available price (meaning, < prices.count).
// rinse & repeat

// COMPLEXITY ANALYSIS

