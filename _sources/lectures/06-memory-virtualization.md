
# Memory virtualization


```{admonition} Key concept
:class: tip
- Question:
  - How can an illusion of infinite and isolated memory space be managed?
- Objectives:
  - Understand how a process' components are organized in memory.
  - Understand the idea of address space and memory virtualization.
- Keypoints:
  - Memory virtualization is how the OS provides an abstraction of physical 
  memory to process in order to facilitate transparency, efficiency, and protection.
```



## 0. Midterm Exam...

- **Friday, October 6, 2023**
- In class, 50 minutes duration.
- 20 questions  (similar in format to the quizzes).
- Everything (including source codes) up to memory virtualization.


## 1. In the beginning ...

- Users didn't expect much. 
- To be honest, most, if not all, users are also developers ...


## 2. Early systems

- Computers run **one job** at a time. 
- The OS was preloaded into memory and consisted of a set of routines. 
- There was one running program that uses the rest of memory. 

![Early systems](../fig/memory-virtualization/01.png)


## 3. Multiprogramming and time sharing

- Demands for
  - Utilization
  - Efficiency
  - Interactivity
- Multiple processes ready to run at a given time. 
- The OS switches between them. 
- One approach is to run one process at a time and still give it full access to all memory 
(just like the early days ...).
- This requires switch processes from memory.


## 4. Multiprogramming and time sharing

- This solution does not scale as memory grows. 

| System event | Size    | Latency | 
| ------------ | ------- | ------- |  
| CPU          |         | <1ns    |  
| L1 cache     | 32KB    | 1ns     |  
| L2 cache     | 256KB   | 4ns     |  
| L3 cache     | >8MB    | 40ns    |  
| DDR RAM      | 4GB-1TB | 80ns    |  

## 5. Multiprogramming and time sharing

What we want to do  
- Leave processes in memory and let OS implement an efficient time sharing/switching 
mechanism. 
- A new demand: **protection** (through isolation)

![Multiprogramming](../fig/memory-virtualization/02.png)


## 6. Address space

- Provide users (programmers) with an **easy-to-use** abstarction of physical memory. 
- The running program's **view of memory in the system**. 
- Contains all memory states of the running program:
  - `Stack` to keep track of where it is in the function call chain 
  (stack frames), allocate local variables, and pass parameters and 
  return values to and from routines. 
  - `Heap` is used for dynamically allocated, user-managed memory 
  (i.g., malloc()). 
  - `BSS` (block started by symbols) contains all global variables and static 
  variables that are initialized to zero or do not have explicit initialization 
  in source code.
  - `Data` contains the global variables and static variables that are initialized 
  by the programmer.
  - `Code` (binary) of the program.

![Address space](../fig/memory-virtualization/03.png)
![Address space](../fig/memory-virtualization/04.png)

*Image taken from [Geeksforgeeks](https://www.geeksforgeeks.org/memory-layout-of-c-program/)*


## 7. Hands on: what is in your binary?

- Open a terminal (Windows Terminal or Mac Terminal). 
- Run the command to launch the image container for your platform:

~~~bash
docker run --rm --userns=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it linhbngo/csc-container /bin/bash
~~~

- If you don't have persistent storage, run the following

~~~bash
cd
mkdir csc331
cd csc331
git clone https://github.com/remzi-arpacidusseau/ostep-code.git
cd ostep-code/cpu-api
make
~~~

- Launch a tmux session called `m1` with two vertical panels.  
- In the left panel, run the following commands:

~~~bash
mkdir ~/memory 
cd ~/memory 
~~~ 
  
- Create a C program named `simple.c` inside directory `memory`. 
- **Reminder**: The sequence to create/edit files using `nano` is as follows:
  - Run `nano -c file_name`
  - Type in the contents
  - When done, press `Ctrl-X`
  - Press `y` to confirm that you want to save modification
  - Press `Enter` to confirm the file name to save to. 
- Create `simple.c` with the following contents:
  
<script src="https://gist.github.com/linhbngo/d2f3a0b28b73a3f48c751410c6c91fd6.js?file=simple.c"></script>

- In the left panel, run the followings:

~~~bash
gcc -g -o simple simple.c 
gdb simple 
gdb-peda$ info files
~~~ 

- In the right panel, run the followings:

~~~bash
cd ~/memory 
gdb simple
gdb-peda$ b main
gdb-peda$ run
gdb-peda$ info files
~~~ 

- The left panel shows the binary file, which is basically a packing list. 
- The right panel shows how the contents are loaded from static libraries (with memory changed)

![View binary contents](../fig/memory-virtualization/05.png)

- Move to the right panel and press `Enter` to continue going through the list.
- Go through the remaining steps (using `n`) of the debugging process until finish. 
- Quit `gdb` instances in both panels.  


## 8. Hands on: what is in your binary?

- Disable address randomization. 
- You only need to do this using either tmux panels. 

~~~bash
echo 0 | sudo tee /proc/sys/kernel/randomize_va_space
~~~ 
  
- In the left panel, create `simple2.c` inside `memory` with the following contents:
  
<script src="https://gist.github.com/linhbngo/d2f3a0b28b73a3f48c751410c6c91fd6.js?file=simple2.c"></script>

- In the right panel, create `simple3.c` inside `memory` with the following contents:

<script src="https://gist.github.com/linhbngo/d2f3a0b28b73a3f48c751410c6c91fd6.js?file=simple3.c"></script>

- Compile and run `simple2.c` and `simple3.c` normally. 
- Compare the output. 

![View binary contents](../fig/memory-virtualization/06.png)

- But Dr. Ngo just said the stack grows downward ...?


## 9. Hands on: where the stack grows?  

- Add one more vertical panel to your tmux session. 
- Adjust the panels' width (`resize-pane -L/-R`) so that they balance.
- In the new panel, create `simple4.c` inside `memory` with the following contents:
  
<script src="https://gist.github.com/linhbngo/d2f3a0b28b73a3f48c751410c6c91fd6.js?file=simple4.c"></script>

- Stack grows downward (high to low) relative to stack frames …
- Within a stack frame, memory reserved for data are 
allocated in order of declaration from low to high

![Where the stacks grow](../fig/memory-virtualization/07.png)


## 10. Hands on: observing inner growth (of the stacks)?

- In the first or second panel (the one next to the result from running 
`simple4`, create a copy of `simple4.c` called `simple5.c`.
- Modify `simple5.c` to print out one or two additional variables in each 
of the functions `f1` and `f2`. 
- Compile and run `simple5.c` to observe how within each stack frame, 
memory are allocated in the order from low to high. 
- In the new panel, create `simple4.c` inside `memory` with the following contents:


## 11. What is address space, really?

- The **abstraction of physical memory** that the OS is providing to the 
running program. 
- How can the OS build this abstraction of a private, potentially large 
address space for multiple running processes on top of a single physical memory?
  - This is called **memory virtualization**.

## 12. Goals of memory virtualization

- `Transparency`: The program should not be aware that memory is virtualized 
(did you feel anything different when programming?). The program should perceive 
the memory space as its own private physical memory. 
- `Efficiency`: The virtualization process should be as efficient as possible
  - `Time`: not making processes run more slowly
  - `Space`: not using too much memory for supporting data structures
- `Protection`: Protection enable the property of isolation: each process should be running 
in its own isolated memory space, safe against other processes. 


## 13. Dr. Ngo loves his analogies

- In the firgure to the right, what represents the heap?

![Foods](../fig/memory-virtualization/08.png)



## 14. Hands on: is memory unlimited?

- Reduce the number of vertical panels down to 2 and adjust the sizes 
(see screenshot below).
- In one of the panels, create `largemem.c` inside `memory` with the following 
contents, then compile.

<script src="https://gist.github.com/linhbngo/d2f3a0b28b73a3f48c751410c6c91fd6.js?file=largemem.c"></script>

- Split the right vertical panel to four (or more) horizontal panels. 
- In the left panel, first run `free -hm` and study the output. 
- In the top right panel, inside `memory`, run `largemem` with a command line 
argument of `200`. 
- In the left panel, rerun `free -hm` and study the new output.  
- Subsequently, alternatve between running `largemem` in the right panels and 
`free -hm` in the left panel, adjusting the command line argument of `largemem`
such that you run into a segmentation fault in the last panel. 
- This is the impact of memory allocation (reservation). 

![Memory consumption](../fig/memory-virtualization/09.png)



