/// Hash Table class that defines the data structure that stores data as key, value pairs
class HashTable<Key: Hashable, Value> {
	/// an element is the key, value pair
	typealias Element = (key: Key, value: Value)
	/// how many defined keys there are
	private var count: Int
	/// the size of the hash table. buckets is an array of
	/// key value pairs. a key may not be in the bucket.
	var buckets: Array<Element?>

	init(size: Int) {
		self.count = 0
		self.buckets = Array<Element?>(repeating: nil, count: size)
	}


	subscript(_ key: Key) -> Value? {
		get {
			find(key)
		}

		set {
			if let value = newValue {
				add(value: value, to: key)
			}
		}
	}

	/// finds a key in the hash table and returns its value
	/// if the space is vacant, it returns nil as no element
	/// is occupying the bucket
	private func find(_ key: Key) -> Value? {
		let index = index(of: key)

		return buckets[index]?.value
	}

	/// adds a (key, value) pair to the hash table
	/// it first, hashes the key to determine where
	/// to store the (key, value) pair
	private func add(value: Value, to key: Key) {
		let index = index(of: key)

		let item = (key: key, value: value)
		buckets[index] = item

		count += 1
	}
}

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
		var stringKey = String(key.hashValue)

		return abs(djb2Hash(stringKey)) % buckets.count
	}
}
