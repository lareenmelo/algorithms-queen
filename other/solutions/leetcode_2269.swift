// 2269. Find the K-Beauty of a Number
func divisorSubstrings(_ num: Int, _ k: Int) -> Int {
	var rightIndex = k - 1
	var leftIndex = 0
	var kBeautyNumber = 0

	var numString = String(num)
	let substring = Array(numString)

	while rightIndex < substring.count {
		var kRange = String(substring[leftIndex...rightIndex])
		let number = Int(kRange) ?? 0

		if number > 0 && num % number == 0 {
			kBeautyNumber += 1
		}

		rightIndex += 1
		leftIndex += 1
	}


	return kBeautyNumber
}

/* PSEUDOCODE
1. Create a string out of num
2. While right index < num.count, we start our search for our kBeautyNumber
3. We create our k sized string and cast it to Int (currentVar)
4. Ask condition: num % currentVar == 0 && currentVar > 0
4.1 If yes, we add 1 to our kBeautyNumber count
5. We increase our left and right indices by 1
*/
