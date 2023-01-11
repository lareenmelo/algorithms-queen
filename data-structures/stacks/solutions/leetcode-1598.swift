// 1598 - Crawler Log Folder

func minOperations(_ logs: [String]) -> Int {
	var depth = [String]()

	for log in logs {
		switch(log) {
			case "./":
			break
			case "../":
			depth.popLast()
			default:
			depth.append(log)
		}
	}

	return depth.count
}
