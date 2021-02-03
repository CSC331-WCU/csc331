---
title: "Process API"
teaching: 0
exercises: 0
questions:
- "How do you programmatically interact with processes?"
objectives:
- "Knowing the usage of fork, exec, and wait."
keypoints:
- "Through fork, exec, and wait, processes can be controlled and manipulated."
---


> ## 1. Process API
>
> Include three function calls:
> - fork()
> - exec()  
> - wait()  
{: .slide}


> ## 2. fork()
>
> - ... is a system call. 
> - ... is used to create a new process.   
> - [Documentation for fork()](https://www.man7.org/linux/man-pages/man2/fork.2.html)    
> - Some important points:
>   - fork() creates a new process by duplicating the calling process. 
>   The new process is referred to as the child process.  The calling proces
>   is referred to as the parent process.
>   - The child process and the parent process run in separate memory
>   spaces.  **At the time of fork() both memory spaces have the same 
>   content**.  
>   - The child process is an exact duplicate of the parent process except
>   for the following points:
>     - The child has its own unique process ID, and this PID does not 
>     match the ID of any existing process group (setpgid(2)) or session.
>     - The child's parent process ID is the same as the parent's process
>     ID.
>     - The child does not inherit outstanding asynchronous I/O operations
>     from its parent (aio_read(3), aio_write(3)), nor does it inherit 
>     any asynchronous I/O contexts from its parent (see io_setup(2)).
>     - The child inherits copies of the parent's set of open file 
>     descriptors.  Each file descriptor in the child refers to the same 
>     open file description (see open(2)) as the corresponding file 
>     descriptor in the parent.  This means that the two file 
>     descriptors share open file status flags, file offset, and 
>     signal-driven I/O attributes.
{: .slide}


> ## 3. Hands-on: Getting started
>
> - Start the csc331 VM in headless mode. 
> - Connect VSCode to csc331. 
> - Open a terminal
> 
{: .slide}

> ## 4. Hands-on: process creation using fork() 
> 
> - Navigate to `ostep-code/cpu-api`
> - Click on `p1.c` to view the file. 
> - *VSCode will recommend a C/C++ extension for this file type. You can select to install them or not*. 
> <img src="../assets/figure/process-api/01.png" alt="File p1.c" style="height:500px">
>
> - Line 5-6: No idea why the author sets up the source code that way ...
> - Line 8: prints out hello world and the process identifier (pid) of the current process.
> - Line 9: calls `fork()`, which initiate the creation of a new process. The return of this fuction 
> call is assigned to variable `rc`. 
> - Line 10: If `rc` is negative, the function call failed and the program exits with return value 1. 
> This line is evaluated within the parent process (since the child process creation failed).
> - Line 14: If `rc` is non-negative
>   - The `fork` call is successful, and you now have **two** process. 
>     - The new process is an almost exact copy of the calling process.
>     - The new process does not start at `main()`, but begins immediately after `fork()`.
>   - The value of `rc` differs in each process. 
>     - The value of `rc` in the new process is `0`. 
>     - The value of `rc` in the parent process is non-zero and actually is the `pid` of the new process. 
> - Line 16 and line 19 confirms the above point by having the child process prints out its own 
> process ID and the parent process prints out the `rc` value. These two values should be the same. 
{: .slide}


> ## 5. Hands-on: compile and run p1.c 
> 
> - In the terminal, navigate to `ostep-code/cpu-api` using `cd`
>   - Review hands-on from previous lessons on how. 
> - Compile and run `p1.c`.  
> - *You will need to hit Enter to get a new clean prompt. Why?*. 
> <img src="../assets/figure/process-api/02.png" alt="Compile and run p1.c" style="height:500px">
{: .slide}


> ## 6. wait()/waitpid()/waitid()
>
> - ... belongs to a family of system calls. 
> - ... are used to make a process to *wait* for its child process. 
> - [Documentation for wait()](https://man7.org/linux/man-pages/man2/wait.2.html)
> - Some important points:
>   - What are we waiting for? **state changes**. 
>     - The child process was stopped by a signal.  
>     - The child process terminated. 
>     - The child process was resumed by a signal. 
>   - **wait()**: suspends execution of the calling thread until one of its child processes terminates.
{: .slide}


> ## 7. Hands-on: processes management using wait() 
> 
> - If not already done:
>   - SSH into csc331
>   - Run the following commands:
>
> ~~~
> $ cd ~/ostep-code/cpu-api
> $ cat -n p2.c
> ~~~
> {: .language-bash}
>
> <img src="../assets/figure/process-api/03.png" alt="File p2.c" style="height:500px">
>
> - Line 1-4: Pay attention to the libraries included. 
> - Line 6-7: No idea why the author sets up the source code that way ...
> - Line 9: prints out hello world and the process identifier (pid) of the current process.
> - Line 10: calls `fork()`, which initiate the creation of a new process. The return of this fuction 
> call is assigned to variable `rc`. 
> - Line 11: If `rc` is negative, the function call failed and the program exits with return value 1. 
> This line is evaluated within the parent process (since the child process creation failed).
> - Line 15: If `rc` is equal to `0`.
>   - The child process will execute the codes inside this conditional block. 
>   - Line 17: prints out a statement and the child's `pid`. 
>   - Line 18: sleeps for one second. 
> - Line 19: This is the parent process (`rc` is non-negative and not equal to 0) 
>     - Line 21: calls the `wait()` function. 
>     - Line 22: prints out the information of the parent process. 
{: .slide}


> ## 8. Hands-on: compile and run p2.c 
> 
> - If not already done:
>   - SSH into csc331
>   - Run the following commands:
> - Navigate to `~/ostep-code/cpu-api`
>
> ~~~
> $ gcc -o p2 p2.c
> $ ./p2
> ~~~
> {: .language-bash}
>
> <img src="../assets/figure/process-api/04.png" alt="Compile and run p2.c" style="height:200px">
>
{: .slide}


> ## 9. exec()
>
> - [Documentation for exec()](https://linux.die.net/man/3/exec)
> - `fork()` lets you create and run a copy of the original process. 
> - `exec()` lets you run a different process in place of **the copy** of the original process. 
{: .slide}


> ## 10. Hands-on: processes management using exec() 
> 
> - If not already done:
>   - SSH into csc331
>   - Run the following commands:
>
> ~~~
> $ cd ~/ostep-code/cpu-api
> $ gcc -o p3 p3.c
> $ ./p3
> $ cat -n p3.c
> ~~~
> {: .language-bash}
>
> <img src="../assets/figure/process-api/05.png" alt="File p3.c" style="height:500px">
>
> - Line 1-5: Pay attention to the libraries included. 
> - Line 7-8: `main`
> - Line 10: prints out hello world and the process identifier (pid) of the current process.
> - Line 11: calls `fork()`, which initiate the creation of a new process. The return of this fuction 
> call is assigned to variable `rc`. 
> - Line 12: If `rc` is negative, the function call failed and the program exits with return value 1. 
> This line is evaluated within the parent process (since the child process creation failed).
> - Line 16: If `rc` is equal to `0`.
>   - The child process will execute the codes inside this conditional block. 
>   - Line 18: prints out a statement and the child's `pid`. 
>   - Line 18: sleeps for one second. 
> - Line 25: This is the parent process (`rc` is non-negative and not equal to 0) 
>     - Line 21: calls the `wait()` function. 
>     - Line 22: prints out the information of the parent process. 
{: .slide}

> ## 11. Why fork(), wait(), and exec()?
>
> - The separation of `fork()` and `exec()` is essential to the building of a Linux shell.  
> - It lets the shell runs code after the call to `fork()`, but before the call to `exec()`.  
> - This facilitates a number of interesting features in the UNIX shell. 
{: .slide}

> ## 12. The Shell
>
> - What is the UNIX shell?.  
> - In Unix, the shell is a program that interprets commands and acts as an intermediary between 
> the user and the inner workings of the operating system. Providing a command-line interface (that 
> is, the shell prompt or command prompt), the shell is analogous to DOS and serves a purpose similar 
> to graphical interfaces like Windows, Mac, and the X Window System. 
{: .slide}

> ## 13. The Shell
>
> - What is the UNIX shell?.  
> - **In Unix, the shell is a program ...** 
{: .slide}

> ## The Shell
>
> - **In Unix, the shell is a program ...** 
> - Therefore, the running shell is **a process**.
> - In other words, inside a running shell, if we want to run another program, we are essentially
> *asking a process (the running shell) to create and run another process*. 
{: .slide}

> ## 14. When you run a program from the shell prompt ...
>
> The shell will  
> - find out where the program is in the file system. 
> - call `fork()` to create a new child process (to run the program). 
> - call one of the `exec()` family functions in the scope of this child process
> to actually load and run this program. 
> - call `wait()` to wait for the child process to finish (now with new process content) before
> giving user the **shell prompt** again. 
{: .slide}

> ## 15. When you run a program from the shell prompt ...
>
> The shell will  
> - find out where the program is in the file system. 
> - call `fork()` to create a new child process (to run the program). 
> - call one of the `exec()` family functions in the scope of this child process
> to actually load and run this program. 
> - call `wait()` to wait for the child process to finish (now with new process content) before
> giving user the **shell prompt** again. 
{: .slide}

> ## 16. Hands-on 7: redirection 
> 
> - If not already done:
>   - SSH into csc331
>   - Run the following commands:
>
> ~~~
> $ cd ~/ostep-code/cpu-api
> $ wc p3.c
> $ wc p3.c > newfile.txt
> $ cat newfile.txt
> ~~~
> {: .language-bash}
>
> <img src="../assets/figure/process-api/06.png" alt="Redirection" style="height:200px">
>
> The shell ... 
> - finds out where `wc` is in the file system. 
> - prepares `p3` as in input to `wc`. 
> - calls `fork()` to create a new child process to run the command.
> - recognizes that `>` represents a redirection, thus closes the file descriptor to 
> standard output and replaces it with a file descriptor to newfile.txt.
> - calls one of exec() family to run wc p3.c.
>   - output of wc p3.c are now send to newfile.txt.
> - calls wait() to wait for the child process to finish before giving user the prompt again. 
{: .slide}

> ## 17. Hands-on 8: more on file descriptors 
> 
> - If not already done:
>   - SSH into csc331
>   - Run the following commands:
> *you don't have to do this if you have VSCode setup and you can see the lines count on
> VSCode*.
>
> ~~~
> $ cd ~/ostep-code/cpu-api
> $ nano -c p4.c
> ~~~
> {: .language-bash}
>
> <img src="../assets/figure/process-api/07.png" alt="View p4.c" style="height:700px">
>
> - `wc p4` should have printed out to terminal.
> - `close(STDOUT_FILENO)` closes the file descriptor that writes to the terminal 
> (hence free up that particular file descriptor ID).
> - `open(“./p4.output”, …)` creates a file descriptor for the p4.output file, but since the 
> file descriptor ID for the terminal is now free, this file descriptor is assigned to p4.output.
> - As `wc p4` is executed and attempts to write to terminal, it actually writes to p4.output instead.  
>
> Compile and run `p4.c`
>
> ~~~
> $ gcc -o p4 p4.c
> $ ./p4
> $ cat p4.output
> ~~~
> {: .language-bash}
>
> <img src="../assets/figure/process-api/08.png" alt="View p4.c" style="height:200px">
{: .slide}


> ## Hands-on 9: piping 
> 
> - If not already done:
>   - SSH into csc331
>   - Run the following commands:
>
> ~~~
> $ ps aux
> $ ps aux | grep student
> $ ps aux | grep student | wc -l
> ~~~
> {: .language-bash}
>
{: .slide}

> ## Other system calls ...
>
> - `kill()`: send signals to a process, including directive to pause, die, and other imperatives.
>   - http://man7.org/linux/man-pages/man2/kill.2.html
>   - SIGINT: signal to terminate a process  
>   - SIGTSTP: pause the process (can be resumed later).
> - `signal()`: to catch a signal.
>   - http://man7.org/linux/man-pages/man7/signal.7.html 
{: .slide}

{% include links.md %}

