# stacks
- LIFO
- PUSH, POP
- TBD


## call stack
### what's a call stack?
A call stack is how our computer keeps track of the instructions/functions we create and it organizes how they're executed.

### how does the call stack work?
// TODO: refine this explanation + add visual aids
At a very high level, our compiler saves a chunk of memory (*stack frames*) for each function that we create. Here we save the location, variables, and parameters of that function. It's common to call functions inside other functions. So, our compiler creates a stack of these stack frames to keep track of the order in which these functions should be executed.

let's say we have the following code: 

func sayHi(to name: String) {
	print("Welcome \(name)!")
	print("Anyway...")
	bye()
}

func bye() {
	print("bye!")
}

Our main function `sayHi` is pushed into the call stack as our active function with the `name` parameter. We start executing the lines within our function until we reach the call of the `bye()` function. Here, `bye()` gets pushed into our call stack and it becomes the active one (since it's the one in the latest place in our stack). Our calling function is paused in a partially complete state until we complete executing `bye()`. Once `bye()` completes printing it returns to `sayHi` and it gets popped off the stack, making our function active again, and eventually popped off as we completed executing it. 


### okay, so why...
It's important to understand what the call stack is because it becomes a useful tool that helps us understand recursion. Also, we only have a certain amount of memory, if have a case were we'd have an infinite loop using our resources till the end, we'll be getting the **stack overflow error**. Also, if we understand how having a large memory stack implies a potentially bad space complexity we'll be able to evaluate the tradeoffs of our code. 
