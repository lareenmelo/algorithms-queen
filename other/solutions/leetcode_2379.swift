// 2379. Minimum Recolors to Get K Consecutive Black Blocks

func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
	var swaps = Int.max
	var leftIndex = 0
	var rightIndex = k - 1

	var blocksArray = Array(blocks)

	while rightIndex < blocks.count {
		var swapsTemp = 0
		let blocksSubstring = blocksArray[leftIndex...rightIndex]

		for character in blocksSubstring {
			if character == "W" {
				swapsTemp += 1
			}
		}

		if swapsTemp < swaps {
			swaps = swapsTemp
		}

		leftIndex += 1
		rightIndex += 1
	}

	return swaps
}

// PSEUDOCODE

// COMPLEXITY ANALYSIS
