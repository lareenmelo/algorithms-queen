# strings

## what are they?
A string is a data type, but they behave like data structures in that they have a wake of manipulation and relations to understand, as they’re capable of become the reason for inefficient solutions. 

## how do they work?
a string is stored in memory as an array of integers. each character is mapped to an integer via character encoding standards like ASCII.

some programming languages treat strings as mutable, but generally they’re immutable. meaning you can’t change them after being declared. this means that appending a character is a costly operation because we’re copying a string and creating a new one, for this reason it’s recommended to sometimes create an array of characters rather than using strings.

## operations
*complexity will be describing the worst case scenario*

| operation | time complexity | space complexity |
| --- | --- | --- |
| traversing | O(n) | O(1) |
| copy | O(n) | O(n) |
| getChar | O(1) | O(1) |