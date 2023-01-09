/// Hash Table class that defines the data structure that stores data as key, value pairs
class HashTable<Key: Hashable, Value> {
	/// an element is the key, value pair
	typealias Element = (key: Key, value: Value)
	typealias Bucket = [Element]


	private var capacity: Int
	/// how many defined keys there are
	private var count: Int


	private var loadFactor: Double
	/// the size of the hash table. buckets is an array of
	/// key value pairs. a key may not be in the bucket.
	var buckets: Array<Bucket>

	init(size: Int) {
		self.count = 0
		self.capacity = size
		self.loadFactor = 0.0

		self.buckets = Array<Bucket>(repeating: [], count: self.capacity)
	}


	subscript(_ key: Key) -> Value? {
		get {
			find(key)
		}

		set {
			if let value = newValue {
				add(value: value, to: key)
			} else {
				remove(key)
			}

			loadFactor = Double(count/buckets.count)
		}
	}

	/// finds a key in the hash table and returns its value
	/// if the space is vacant, it returns nil as no element
	/// is occupying the bucket
	private func find(_ key: Key) -> Value? {
		let index = index(of: key)

		let element = buckets[index].first { $0.key == key }?.value

		return element
	}

	/// adds a (key, value) pair to the hash table
	/// it first, hashes the key to determine where
	/// to store the (key, value) pair
	private func add(value: Value, to key: Key) {
		if loadFactor >= 0.75 {
			resize()
		}

		let index = index(of: key)

		if let (location, element) = buckets[index].enumerated().first(where: { $0.1.key == key}) {
			buckets[index][location].value = value
		} else {
			buckets[index].append((key: key, value: value))
			count += 1
		}
	}

	/// removes a (key, value) pair from the hash table
	/// a hash to determine index is performed.
	private func remove(_ key: Key) {
		let index = index(of: key)

		if let (location, element) = buckets[index].enumerated().first(where: { $0.1.key == key }) {
			buckets[index].remove(at: location)
			count -= 1
		}
	}

	/// resize is done when the hash table's buckets
	/// are 60% full. the size grows twice as big and
	/// (key, value) pairs are rehashed
	/// the resize won't reduce in size after being rehashed.
	private func resize() {
		print("resizing...")

		let newCapacity = capacity * 2
		// 1. create new array of double the size of current capcity
		var newBuckets = Array<Bucket>(repeating: [], count: newCapacity)


		// 2. add items to new array
		for index in 0..<buckets.count {
			for (i, element) in buckets[index].enumerated() {
				// rehashing
				let index = rehash(element, to: newBuckets)

				newBuckets[index].append((key: element.key, value: element.value))
			}
		}


		// 3. update buckets array
		buckets = newBuckets
		// 4. update capacity
		capacity = newCapacity

	}


	/// returns how many elements are stored in the
	/// hash table
	func size() -> Int {
		return count
	}
}

// MARK: Hashing Methods
extension HashTable {
	/// hash function taken from https://gist.github.com/kharrison/2355182ac03b481921073c5cf6d77a73#file-country-swift-L31 because no somo loco
	private func djb2Hash(_ string: String) -> Int {
		let unicodeScalars = string.unicodeScalars.map { $0.value }
		return unicodeScalars.reduce(5381) {
			($0 << 5) &+ $0 &+ Int($1)
		}
	}

	/// returns the index where the key should be
	/// stored after being hashed
	private func index(of key: Key) -> Int {
		let stringKey = String(key.hashValue)

		return abs(djb2Hash(stringKey)) % buckets.count
	}

	/// returns the index where the key should be stored
	/// in the new hash table after being hashed
	private func rehash(_ element: Element, to buckets: [Bucket]) -> Int {
		var key = element.key
		let stringKey = String(key.hashValue)


		return abs(djb2Hash(stringKey)) % buckets.count
	}
}
