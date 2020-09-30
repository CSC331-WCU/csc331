---
title: "GDB Debugger"
teaching: 0
exercises: 0
questions:
- "Debugging C program the hard way!"
objectives:
- "First learning objective. (FIXME)"
keypoints:
- "First key point. Brief Answer to questions. (FIXME)"
---

> ## 1. In a nutshell
> 
> - Developed in 1986 by Richard Stallman at MIT.
> - Current official maintainers come from RedHat, AdaCore, and Google.
> - Significant contribution from the open source community.
{: .slide}

> ## 2. Brief Technical Details
> 
> - Allows programmers to see inside and interact/modify with all components of a programs,
> including information inside the registers.
> - Allows programmers to walk through the program step by step, including down to 
> instruction level, to debug the program.
{: .slide}

> ## 3. Cheatsheet
> 
> - Study this [cheatsheet](https://cs.brown.edu/courses/cs033/docs/guides/gdb.pdf)
> - Developed by Dr. Doeppner at Brown University. 
> - Become very comfortable with terminal!
> - We will work on the terminal extensively here, say goodbye to VSCode.
> *You can certainly use VSCode, but you will miss out on a fine tool!*
{: .slide}

> ## 4. tmux
> 
> - Our workspace is limited within the scope of a single terminal (a single shell) 
> to interact with the operating system. 
> - `tmux`: *terminal multiplexer*. 
> - `tmux` allows user to open multiple terminals and organize split-views (panes) 
> within these terminals within a single original terminal. 
> - We can run/keep track off multiple programs within a single terminal. 
{: .slide}

> ## 5. tmux quicstart 1: multiple sessions
> 
> - Start new with a session name: `tmux new -s session_name`
> - You are now in the new tmux session. 
> - List sessions: `tmux ls`
> - SCREENSHOT
> - To go back to the main terminal, press `Ctrl-b`, then press `d`. 
> - SCREENSHOT
> - To go back into the `session_name` session: `tmux attach-session -t session_name`. 
> - SCREENSHOT
> - To kill a session: 
>   - From inside the session: `exit`
>   - From outside the session: `tmux kill-session -t session_name`
{: .slide}

> ## 6. Hands on: navigating among multiple tmux sessions
> 
> - Run `tmux ls` to check and `tmux kill-session` to clean up all existing 
> tmux sessions. 
> - Create a new session called `s1`. 
> - Detach from `s1` and go back to the main terminal. 
> - Create a second session called `s2`. 
> - Detach from `s2`, go back to the main terminal, and create a third session called `s3`. 
> - Use `tmux ls` to view the list of tmux sessions. 
> - Navigate back and forth between the three sessions several times. 
> - Kill all three sessions using only `exit`!
> - SCREENSHOT
{: .slide}

> ## 7. tmux quicstart 2: multiple panes
>
> - Create a new session called `p1`.
> - Splits terminal into vertical panels: `Ctrl-b` then `Shift-5` (technical documents
> often write this as `Ctrl-b` and `%`).
> - SCREENSHOT
> - Splits terminal into horizontal panels: `Ctrl-b` then `Shift-'` ( technical documents
> often write this as `Ctrl-b` and `"`).
> - SCREENSHOT
> - Toggle between panels: `Ctrl-b` then `Space`.
> - To move from one panel to other directionally: `Ctrl-b`then the corresponding 
> arrow key. 
> - Typing `exit` will close one pane. 
{: .slide}

> ## 8. Hands on: creating multiple panes
> 
> - Run `tmux ls` to check and `tmux kill-session` to clean up all existing 
> tmux sessions. 
> - Create a new session called `p1`. 
> - Organize `p1` such that: 
>   - `p1` has four vertical panes. 
>   - The last vertical pane of `p1` has three internal horizontal panes. 
> - Kill all panes using `exit`!
> - SCREENSHOT
{: .slide}

{% include links.md %}

