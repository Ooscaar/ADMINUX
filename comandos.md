# Lista de comandos
## Procesos
- `lsmod`: te indica los "módulos" cargados en el kernel
- `tty`: indica el fichero asociado a nuestro terminal. No deja de ser la representación "virtual" de lo que era el puerto físico 
  - si uso tmux y voy ejecutando `tty` se puede ir observando como va saliendo /dev/pts/x
- `whoami`   
- `su`: switch user, pero no se utiliza debido a que se acaba quedando en el usuario root (sin pasarlo ningun parámetro).A parte, tengo que poner el password del ususuario root
- `sudo`: está relacionado con el fichero "/etc/sudoers". Donde ahora lo que te pide es el password de tu usuario. Vale por 5 min 
  - `sudo -s`: consola de comandos asociado a root. Donde en los sistemas no vienen con password de root, sino que se le dan permisos en el fichero "sudoers", de forma que pueda ejecutar programas como root.
- `gcc -o hello hello.c`: compila dinámicamente el programa (opción por defecto)
- `gcc -static -o hello hello.c`: compila estaticamente el programa
- `ldd`: muestra dependencies librerias dinámicas.
- `du -h`: disk usage in human readable form
- `ldd`: si ejecutamos sobre un binario que ha sido ejecutado estáticamente, nos aparecerá que no se trata de un binario compilado dinámicamente
- `dpkg`: usado en Ubuntu, te indica dicho paquete, con diferentes informaciones ...
- `ps`: me muestra los hijos
  - `ps -O cmd,pid,ppid`
  - `ps -u`: procesos asociados a mi usuario
  - `ps -T -p 2741`: muestra los threads asociados a dicho proceso (PID)
- `pstree`
- `top`: ordena los procesos por ..
- `time`:
  - real: desde que le doy al comando hasta que se acaba de ejecutar 
  - user: cuantos ciclos de reloj nos ha dado el kernel para la ejecución en espacio de usuario
  - kernel: indica el tiempo que se ha usado dentro del kernel
  - --: al tener varias CPU's puede ser que no acabe siendo la suma de los tiempos indicados
- `fg`: foreground el ultimo proceso, indicando el número de job id
- `bg`: background

## Sistema de ficheros
- `stat`: te indica, junto a diveros metadatos, la información del fichero que le indicas
- `mount`: comando que indica los dispositivos que estan montados en el sistema de ficheros
- `unmount`: desmonta el dispositivo
- `df -h`: te indica "disk free" space
- `du -sh ..` disk usage
- `file`: pasando una serie de test, intenta encontrar el tipo de fichero del que se trata
- `tail -f`: muestra los últimos contenidos del fichero y los va refrescando continuamente
- `hexdump | strings`: el método de string muestra solo aquellos que son imprimibles

