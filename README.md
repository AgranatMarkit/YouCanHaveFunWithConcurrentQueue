As https://apple.co/2XRppOj says:  
"Important: You should never call the dispatch_sync or dispatch_sync_f function from a task that is executing in the same queue that you are planning to pass to the function. This is particularly important for serial queues, which are guaranteed to deadlock, but should also be avoided for concurrent queues."  
This project show's that nested calls dispatch_sync from concurrent queue could lead to deadlock.  
An Code is located inside ViewController.m.
The result is achieved on iPhone SE.
