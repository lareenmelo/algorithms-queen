// 496 - Next Greater Element I
func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
	var result = [Int]()

	for i in 0..<nums1.count {
		for j in 0..<nums2.count {
			if nums1[i] == nums2[j] {
				var element = greaterElement(from: j, within: nums2)
				result.append(element)
				break
			}
		}
	}

	return result
}

private func greaterElement(from index: Int, within array: [Int]) -> Int {
	for i in index..<array.count {
		if array[i] > array[index] {
			return array[i]
		}
	}

	return -1
}
