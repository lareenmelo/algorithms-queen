# queues

## what are they?
a linear data structure that follows the **FIFO** (**f**irst **i**n, **f**irst **o**ut) rule.

## how do they work?
like a line of people in the super market. the first person to stand in line is the first out to get out.
typically implemented using a **dynamic array** or **singly linked list**.

a queue is usually implemented using a **doubly linked list**, because we keep track of last added item too *[a linked list because using a dynamic array wouldn’t give us the constant time operation, insert @ middle or at the beginning of a dynamic array is not 0(1)]*

there are 3 different type of queues:
1. *circular queue*: a queue that has its last element connected to the first element in the queue, forming a circle.
2. priority queue
3. *double-ended queue*: called deque for short, it’s a type of queue where items can be added in the front and at the back too. it has six methods (enqueue first, enqueue last, dequeue first, dequeue last, peek front, peek rear)

## operations
*complexity will be describing the worst case scenario*
| operation | time complexity | space complexity |
| --- | --- | --- |
| enqueue | O(1) | O(1) |
| dequeue | O(1) | O(1) |
| peek | O(1) | O(1) |
| search | O(n) | O(n) |

## pros and cons
| pros | cons |
| --- | --- |
| awesome time complexity for basic operations | limited size |
| can help in the implementation of other ds | searching is not easy |
|  | inserting/deleting in the middle are costly |


#### queues vs stacks
| stack | queue |
| --- | --- |
| lifo | fifo |
| vertical collection visual ds | horizontal collection visual ds |
| there’s only 1 pointer: the element last pushed, to be first popped. | there’s 2 pointers: the element to be pushed and the last to be inserted. |
| used in solving problems with recursion | used in solving problems with sequential processing |