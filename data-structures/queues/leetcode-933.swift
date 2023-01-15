// 933 - Number of Recent Calls
class RecentCounter {
	private var queue: [Int]

	init() {
		self.queue = []
	}

	func ping(_ t: Int) -> Int {
		queue.append(t)

		while queue[0] < t - 3000 {
			queue.removeFirst()
		}

		return queue.count
	}
}
