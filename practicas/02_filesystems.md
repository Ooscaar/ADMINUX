## File system

### Exercise 3.1
1,2,3,4,5.
```bash
# Moving directories
opc :: /tmp/ADMINUX » cd ~          
opc :: ~ » cd ../../etc 
opc :: /etc » 
opc :: /etc » cd /home/op          
opc :: ~ » 
# Copying files
opc :: ~ » cp ../../etc/passwd .
# Deleting directories
opc :: /tmp » rm -rf dir{A,B}{1,2}
opc :: /tmp » rm -rf dir{A,B}*
opc :: /tmp » rm -rf dirC?
```

6,7,8,9.
```bash
# Creation files
opc :: /tmp » touch temp.txt  
opc :: /tmp » cat temp.txt      
opc :: /tmp » stat temp.txt                                                                                               Fichero: temp.txt
  Tamaño: 0             Bloques: 0          Bloque E/S: 4096   fichero regular vacío
Dispositivo: 24h/36d    Nodo-i: 1392        Enlaces: 1
Acceso: (0664/-rw-rw-r--)  Uid: ( 1000/      op)   Gid: ( 1000/      op)
Contexto: unconfined_u:object_r:user_tmp_t:s0
      Acceso: 2021-01-26 16:43:56.936980808 +0100
Modificación: 2021-01-26 16:43:54.511964491 +0100
      Cambio: 2021-01-26 16:43:54.511964491 +0100
    Creación: -
opc :: /tmp » 
```

10. 
```bash
opc :: /tmp » cp temp.txt /usr    
cp: no se puede crear el fichero regular '/usr/temp.txt': Permiso denegado
opc :: /tmp » 
```
- We can not write anything to the /usr directory
- As everything is a "file", we can look the permisiosn related to the /usr directory:
```
drwxr-xr-x.  13 root root  4096 nov  6 21:54 usr
```
  - We can see that only the root user and root groupd have the basics permisions. The other only have the "x" permision i.e. execution of programs

11,12.
```bash
opc :: /tmp/practices » mkdir permission
opc :: /tmp/practices » mkdir no_permission
opc :: /tmp/practices » chmod u-w no_permission
opc :: /tmp/practices » 
opc :: /tmp/practices » ls -l
total 0
dr-xrwxr-x. 2 op op 40 ene 26 16:53 no_permission
drwxrwxr-x. 2 op op 40 ene 26 16:53 permission
opc :: /tmp/practices » 
```
- We don't have write permission to the no_permission directory, so we can not create any files inside it
```bash
opc :: /tmp/practices » touch no_permission/temp.txt
touch: no se puede efectuar `touch' sobre 'no_permission/temp.txt': Permiso denegado
opc :: /tmp/practices » touch permission/tempt.txt                                                                      
opc :: /tmp/practices »
```

13.
```
Commands 				read | write | execute
------- 				----------------------
cd no_permission;			ok     no      no
cd no_permission; ls -l                 ok     no      no
cd temp ~/practices/no_permission       ok     ok      no
```


### Exercise 3.2
1,2,3.
```bash
opc :: /tmp » touch temp.txt            
opc :: /tmp » touch origin.txt         
opc :: /tmp » ln -s origin.txt link.txt
```
- Does not matter which file we modify.

4. 
```bash
opc :: /tmp » chmod u-rwx origin.txt 
opc :: /tmp » cat origin.txt        
cat: origin.txt: Permiso denegado
opc :: /tmp » cat link.txt                                                                                              1 ↵
cat: link.txt: Permiso denegado
opc :: /tmp »    
```
- We can not do anything from the symbolic link neither

5. 
```bash
opc :: /tmp/practices » chmod u-w link.txt      
opc :: /tmp/practices » ls -l             
total 4
lrwxrwxrwx. 1 op op 10 ene 26 17:17 link.txt -> origin.txt
d---rwxr-x. 2 op op 40 ene 26 16:53 no_permission
-r--rw-r--. 1 op op  6 ene 26 17:19 origin.txt
drwxrwxr-x. 2 op op 60 ene 26 16:55 permission
opc :: /tmp/practices » 
```
- Removing the write permision into the symbolic link **implies removing access to the main file**

6. 
- In this case, the "hello" is then transfered to the origin.txt. While the origin.txt does not exist, "link.txt" has a broken link, but it "has some content inside" that is "transfered" once we create the archive by opening vi.

7,8,9.
```bash
opc :: /tmp/practices » stat origin.txt 
  Fichero: origin.txt
  Tamaño: 6             Bloques: 8          Bloque E/S: 4096   fichero regular
Dispositivo: 24h/36d    Nodo-i: 1449        Enlaces: 2
Acceso: (0464/-r--rw-r--)  Uid: ( 1000/      op)   Gid: ( 1000/      op)
Contexto: unconfined_u:object_r:user_tmp_t:s0
      Acceso: 2021-01-26 17:20:23.373068406 +0100
Modificación: 2021-01-26 17:19:59.209904892 +0100
      Cambio: 2021-01-26 17:41:29.568391461 +0100
    Creación: -
opc :: /tmp/practices » 
```
- With the hard lin way, the stat command show us the "links"
Then when we remove the origin.txt:
- Now the other one, as we have a hard link (ie. the same file with different links), the file can be modified as if nothign has happened. 
So in conclusion:
- Hard link: creation of the same file
- Soft link: link to a file that can o can not exist

10. 
```bash
opc :: /tmp » cat /etc/services| grep "HTTP" | wc -l
104
opc :: /tmp » 
```

11.
```bash
opc :: /tmp » cat /etc/group | cut -d ":" -f 1,4  
```
- Where not all the groups have some user in them

12.
```bash
opc :: /tmp » touch tex1.txt  
opc :: /tmp » echo "abñ" > tex1.txt                                            
opc :: /tmp » file tex1.txt 
tex1.txt: UTF-8 Unicode text
opc :: /tmp » 
```

13.
The encoding of "ñ" is:
- ISO-8859-15: 0x00F1
- UTF-8: 0xC3 B1
So by looking at the hexadecimals:
- ISO-8859-15: we see "b1c3" due to the endianess
```
opc :: /tmp » hexdump tex1.txt     
0000000 6261 b1c3 000a                         
0000005
opc :: /tmp » 
```

14,15,16.
- 0x0a (UTF-8): corresponts to the line feed (EOL)
- 0x0d (UTF-8): corresponts to the carriage return (cr)





















