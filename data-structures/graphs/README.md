# graphs

## what are they?
a graph is a collection of nodes, that may or may not be connected. the nodes in a graph are called **vertex (vertices)** and the relationships/connections between that vertices are called **edges (edge)**.

## how do they work?
a graph can have vertices that have two-way (**undirected graph**) or one way (**directed graph**) edges, meaning they can be traversed in one direction or both ways.

some graphs have cycles. a **cycle** in a graph is determined when three or more vertices are connected in form of a closed loop. a graph that has no cycle is called an **acyclic graph**. a graph that has a cycle is called a **cyclic graph**.

lastly if all the vertices of a graph have connecting edges, the graph is **connected**.

<aside>
⚠️ as a general rule of thumb, pay attention for cycles in graphs
</aside>

graphs can be traversed using **dfs** (depth first search) and **bfs** (breadth first search). **dfs** traverses a graph by depth first. **bfs** traverses the wider before going deep.


## operations
*complexity will be describing the worst case scenario*
| graph representation | operation | time complexity | space complexity |
| --- | --- | --- | --- |
| adjacency matrix | traversing | O(n<sup>2</sup>) | O(n<sup>2</sup>) |
| adjacency list | traversing | O(n) | O(e + v) |

## pros and cons
| pros | cons |
| --- | --- |
| easy to find shortest paths | a lot of pointers |
| used to implement search algorithms like dfs and bfs | large memory complexity |
| work well with sparse data | graphs can have cycles which is something to look out for |
| used to find the minimum spamming tree |  |
| supports multiple type of relations (1:1, 1:many, many:1, many:many) |  |
