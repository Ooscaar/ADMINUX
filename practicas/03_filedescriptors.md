## File descriptors
### Exercise 4.1
-1.
```
opc :: /tmp/ADMINUX » touch mylist.txt 
opc :: /tmp/ADMINUX » ls     
mylist.txt
opc :: /tmp/ADMINUX » ls -R /etc > mylist.txt && echo "CONTENTS OF ETC" >> mylist.txt   opc :: /tmp/ADMINUX » tail --lines=10 < mylist.txt    
rpmfusion-free-updates-testing.repo
rpmfusion-nonfree.repo
rpmfusion-nonfree-updates.repo
rpmfusion-nonfree-updates-testing.repo
tailscale.repo
vscodium.repo

/etc/zfs-fuse:
zfs_pool_alert
CONTENTS OF ETC
opc :: /tmp/ADMINUX » 
```

-2. 
By concateneting the following commands:
```
opc :: /tmp/ADMINUX » sudo echo "CONTENT OF ETC" > mylist.txt && sudo ls -R /etc >> mylist.txt && head -n 10 < mylist.txt
CONTENT OF ETC
/etc:
abrt
adjtime
aliases
alsa
alternatives
anaconda
anacrontab
appstream.conf
opc :: /tmp/ADMINUX » 
```

-3. 
```
opc :: /tmp/ADMINUX » ls /bin | wc --lines
2668
opc :: /tmp/ADMINUX » 
```

-4.
```
opc :: /tmp/ADMINUX » ls /bin | head -n 3 | sort --reverse 
7za
7z
[
opc :: /tmp/ADMINUX » 
```

-5. 
```
opc :: /tmp/ADMINUX » ls /bin | sort --reverse | tail -n 3
7za
7z
[
opc :: /tmp/ADMINUX » 
```

-6.
```
opc :: /tmp/ADMINUX » cat /etc/{group,passwd} | wc --lines
123
opc :: /tmp/ADMINUX » 
```

-7.
```
opc :: /tmp/ADMINUX » ps -A -o pid,ppid,tty,time,cmd | head -n 2
    PID    PPID TT           TIME CMD
      1       0 ?        00:00:02 /usr/lib/systemd/systemd --switched-root --system --deserialize 30
```
- Where the process with PID seems to be the scheluder of the scheluder 

### Exercise 4.2
```
opc :: /tmp/ADMINUX » cat /etc/passwd > /dev/pts/4 
```
and then execute in each terminal the redirection to the other /dev/pts/..

### Exercise 4.3
```
# We create to FIFO pipes
$: mkfifo pipe1 pipe2

# We concatenate cat to the input of the pipe (i.e: x) + 
# the output of the FIFO pipe
# And all of it's output is redirected to the FIFO pipe2
# and we set it to the background
# Problems:
# - pipe1: will wait for someone to insert data 
# - pipe2: will wait for someone to read data
$: echo -n x | cat - pipe1 > pipe2 &

# We connect:
# input: pipe2
# output: pipe1
# Problems:
# pipe2: waiting for someone to put data
# pipe1: waiting for someone to reading data
$: cat <pipe2 > pipe1
```



### Exercise 4.4
-1. 
```
opc :: /tmp/ADMINUX » lsof /etc/passwd                                                  
COMMAND   PID USER   FD   TYPE DEVICE SIZE/OFF    NODE NAME
less    19118   op    4r   REG  253,0     2628 2099117 /etc/passwd
less    19124   op    4r   REG  253,0     2628 2099117 /etc/passwd
opc :: /tmp/ADMINUX » ps -p 19118              
    PID TTY          TIME CMD
  19118 pts/2    00:00:00 less
opc :: /tmp/ADMINUX » ps -p 19124
    PID TTY          TIME CMD
  19124 pts/4    00:00:00 less
opc :: /tmp/ADMINUX » 
```

-2.
```
opc :: /tmp/ADMINUX » fuser /etc/passwd                    
/etc/passwd:         19118 19124
opc :: /tmp/ADMINUX » kill -9 {19118,19124}
opc :: /tmp/ADMINUX » 
```



