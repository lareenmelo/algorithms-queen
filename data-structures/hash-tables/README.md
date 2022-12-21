# hash tables

## what is they?
a data structure that stores data in key-value pairs.

## how do they work?
hash tables store values in an array by sending the key through a hash function so it gets transformed into an index (keys can be anything: ints, strings, structs, etc…). you access values by giving the key (but not the other way around)

collisions can happen. a collision is when a hash function returns the same hash for more than 1 key. For this, a solution is to make our array of keys an array of linked lists that store key, value pairs.

hash tables can be resized if we’ve used all the space in it. we use the same resize concept of arrays and by using a load factor.

also, we consider hashing a constant operation.

## operations
*complexity will be describing the worst case scenario*
|operation|time complexity|space complexity|
|:---|:---|:---|
|searching| O(n) | O(n)|
|inserting| O(n) | O(n)|
|deleting| O(n) | On(n)|

## pros and cons
|pros|cons|
|:--|:--|
|hash provides better synchronization than other data structures|hash can be inefficient if it causes a lot of collisions|
|better than search trees & other ds|hash doesn’t allow nil factors|
|provide O(1) time for searching, inserting, and deleting on average |collision cannot be avoided for a very large set of keys|

#### hash tables vs arrays
hash tables use arrays however, unlike arrays, hash tables don’t limit the key to be ints whereas arrays indexing is strictly numeric.
