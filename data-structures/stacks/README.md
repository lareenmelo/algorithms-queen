# stacks

## what is they?
a linear data structure that follows the **LIFO** (**l**ast **i**n, **f**irst **o**ut) rule.

## how do they work?
basically, it’s like a stack of pancakes. You’re stacking them as you finish making them, and the order on which the pancakes get taken out are the first one at the top. 

typically implemented using a **dynamic array** or **singly linked list**.

## operations
*complexity will be describing the worst case scenario*
| operation | time complexity | space complexity |
| --- | --- | --- |
| push | O(1) | O(1) |
| pop | O(1) | O(1) |
| peek | O(1) | O(1) |
| search | O(n) | O(n) |

## pros and cons
| pros | cons |
| --- | --- |
| simple to implement | random access is not possible |
| awesome time complexity for basic operations | stack memory is of limited size |

#### queues vs stacks
| stack | queue |
| --- | --- |
| lifo | fifo |
| vertical collection visual ds | horizontal collection visual ds |
| there’s only 1 pointer: the element last pushed, to be first popped. | there’s 2 pointers: the element to be pushed and the last to be inserted. |
| used in solving problems with recursion | used in solving problems with sequential processing |