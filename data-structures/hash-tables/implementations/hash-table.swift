// hash table implementation with separate chaining

/// Hash Table class that defines the data structure that stores data as key, value pairs
class HashTable<Key, Value> {
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
}
