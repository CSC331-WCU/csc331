
# Semaphores


## 1. What have we learned so far?

- Both lock and condition variables are needed to solve more complex 
concurrency problems. 
- Can we do better?


## 2. Edsger Dijkstra

- Dijkstra, Edsger W. *"The structure of the "THE" multiprogramming system."* 
In The origin of concurrent programming, pp. 139-152. Springer, New York, NY, 1968.
- Dijkstra, Edsger W. *"Information streams sharing a finite buffer."* In Inf. Proc. 
Letters, vol. 1, pp. 179-180. 1972.
- Together with colleagues, developed semaphore as a single primitive for all things 
related to synchronization. 


## 3. Semaphore

- Is an object with an integer value that can be manipulated with two routines:
  - [sem_wait()](https://man7.org/linux/man-pages/man3/sem_wait.3.html)
  - [sem_post()](https://www.man7.org/linux/man-pages/man3/sem_post.3.html)
- Needs to be initialized to some value. 
  - [sem_init()](http://man7.org/linux/man-pages/man3/sem_init.3.html)


## 3. sem_wait() and sem_post()

- More important, how do we use `sem_wait()` and `sem_post()` to facilitate 
synchronization for concurrency?

![wait and post](../fig/semaphores/01.png) 


## 4. Aspects of sem_wait() and sem_post()

- `sem_wait()` and `sem_post()` are **atomic operations**. 
- `sem_wait()` either return right away or it will cause the caller to wait.
- `sem_post()` simply increase the value of the semaphore and wakes one of the waiting 
thread up. 
- The value of the semaphore, when negative, is equal to the number of waiting threads. 



## 5. Semaphore as lock (binary semaphore)

![sem as lock](../fig/semaphores/02.png) 
![sem as lock](../fig/semaphores/03.png) 

## 6. Semaphore as condition variable

![sem as cv](../fig/semaphores/04.png) 


## 7. Semaphore: producer/consumer I

- What is the risk if MAX > 1 and there are multiple producers/consumers?
  - Race condition: two producers produce at the same time or two consumers
  consume at the same time. 
- What is currently missing from this implementation?
  - Mutual exclusion

![wait and post](../fig/semaphores/05.png) 


## 8. Semaphore: producer/consumer II

- Mutual exclusion is added, incorrectly. 
  - Consumer runs first, then wait on `full` (but still holding `mutex`). 
  - Producer sees negative mutex, decreases it further, then goes to sleep. 

![wait and post](../fig/semaphores/06.png) 


## 9. Semaphore: producer/consumer III

- Mutual exclusion is added, correctly. 
  - `full` and `empty` are for producers and consumers to wait on one another. 
  - `mutex` for producers and consumers to wait among each group. 

![wait and post](../fig/semaphores/07.png) 


## 10. The dining philosophers

- It’s Dijkstra again. 
  - There are five philosophers seating around a table. 
  - Between each pair of philosophers there is a single fork (five forks total).
  - Philosophers alternate between thinking and eating (need fork). 
  - Two forks are needed to eat (one to the left and one to the right). 
  - How to schedule fork grabbing pattern so that no one starves?

![dining philosophers](../fig/semaphores/08.png) 



## 11. Solutions

- which one works?

![dining philosophers](../fig/semaphores/09.png) 

