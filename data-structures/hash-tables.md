# hash tables
### what is it?
a data structure that stores key, value pairs. Hash tables use hash functions to map the key to a value. This makes look up efficient.

When learning about hash tables it's important to know about collisions and load factors.

The main issue with hashing our keys, is that there can be a same key for an item. This is called a *collision*. When a hash function assigns the same slot to two or more items. One solution for this is chaining. Meaning keys are stored in a linked list for that slot.

Another way to prevent collisions from happening is to keep a *load factor* for the hash table. A load factor is an indicator of how full our hash table is, if it reaches to a specific percentage then the hash table gets a resized (normally it doubles in size) and repositions its items. `HOMEWORK: Why is this a useful way to prevent collisions?`  

### a good hash function
Hash tables have a hash function. This function takes in an input and returns a number/index. This the way to efficiently map a key to a value. To build your own hash function it should have the following characteristics: 

* it should be consistent (if my input is `"Apple"` and it gives back `4`, each time I send `"Apple"`, it should return `4`)
* it should distribute values evenly in the array/hash table
* it should map different words to different numbers.

### performance
search: O(n)
insertion: O(n)
deletion: O(n)

