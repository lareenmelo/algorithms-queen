# trees

## what are they?
a type of graph. it’s rooted, meaning there’s a root node with children that also have children (or not). it helps with storing data with hierarchy.

## how do they work?
it basically is a graph that’s directed, connected and acyclic. there’s an explicit root node, all of the children nodes have one single parent. 

| terms | definition |
| --- | --- |
| *root* | first node in a tree |
| *leaves* | nodes with no child, nodes at the bottom of a tree |
| *branches* | path between root of a tree and its leaves |
| *height* | length of its longest branch |
| *level(s)* | distances from its tree’s root |
| *parent* | a node that has one or more children (that is no the root) |

## operations
*complexity will be describing the worst case scenario and describing a **binary tree***
| operation | time complexity | space complexity |
| --- | --- | --- |
| access | O(n) | O(1) |
| search | O(n) | O(1) |
| insertion | O(n) | O(1) |
| deletion | O(n) | O(1) |

## pros and cons
| pros | cons |
| --- | --- |
| hierarchical data structure | a lot of useless null pointers |
| traversing from a parent node to a child node and vice versa can be efficiently done | accessing a bst is slower than arrays |
| searching is fast | basic option is dependent of the height of a tree |
|  | deletion is a pain in the butt |
