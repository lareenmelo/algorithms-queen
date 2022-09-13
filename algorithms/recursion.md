# recursion

## What's recursion? 
Recursion is a technique used in programming where a function calls itself.

## Why?
Recursion is mostly useful to improve the code's readability. Also, many algorithms utilize this technique in their implementation for simplicity.

## How do we write a recursive function?
Generally, to prevent from infinite recursive calls we need to structure our function so that at some point it stops calling itself. For that we define a **base case** (*where we don't call our function*) and a **recursive case** (*where we call our function*).

## Recursion & call stack
Recursive fuctions use the call stack. The top most item on the call stack tells us exactly what's currently active in the state of our function. With the call stack, we keep track of what's being performed, and what's pending.

What this also tells us, is that as the call stack grows, so does the memory consumption of our algorithm. So it can have an inefficient space complexity. And, at worse, we can get the `stack over flow` error where we consume all of our space.
