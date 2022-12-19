# linked lists
### what are they?
a linear data structure composed of nodes, where each node is composed of a value and a pointer of the following node.

### how do they work?
because in a linked list elements aren’t stored contiguously, traversing a list becomes requires a bit more of work. we don't have the traditional indexing arrays provide.

However elements in the linked list, also called `nodes`, are stored with a pointer that holds a reference of the address of the following `node` in the list.

we know we’re done traversing the reference to the next `node` is nil/empty.

### operations
complexity will be describing the worst case scenario

|operations|time complexity|space complexity|
|:---:|:---:|:---:|
|access|O(n)|O(1)|
|search|O(n)|O(1)|
|insertion|O(1)|O(1)|
|delection|O(1)|O(1)|


### pros and cons
|pros|cons|
|:---:|:---:|
| dynamic data structure, shrink and grow at runtime | reverse traversal is complex |
| no memory waste, list will use the space needed as it grows/shrink | random access is no available |
| insertion and deletion are constant time operations | memory usage, to store an element you have to store it with a pointer |


#### linked lists vs arrays
