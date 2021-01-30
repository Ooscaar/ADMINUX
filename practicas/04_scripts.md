## Scripts

### Exercise 11.1
```bash
#!/bin/bash
# AUTHOR: teacher
# DATE: 4#10#2011
# NAME: shellinfo.sh
# SYNOPSIS: shellinfo.sh [arg1 arg2 ... argN]
# DESCRIPTION: Provides information about the script.
# HISTORY: First version

# Print PID
echo "My PID is $$"
# Print name of file $0=shellinfo
echo "The name of the script is $0"
# Print the number of parameters passed
# after the shellinfo.sh ...
echo "The number of parameters received is $#"

# If number of parameters is greater than 0
if [ $# -gt 0 ]; then
	# Declare variable I
	I=1
	# For over the element passed
	for PARAM in $@
	do
		# We echo:
		# "\$" = $
		# "$I" = I (value) 
		echo "Parameter \$$I is $PARAM"

		# We do arithmetic operation
		# so we need the double "(())"" 
		# And we simply sum + 1
		((I++))
	done
fi
```
Output:
```
opc :: 4A#ADMINUX#scripts ‹main*› » .#shellinfo.sh 1 2 3 4 5
My PID is 69933
The name of the script is .#shellinfo.sh 
The number of parameters received is 5
Parameter $1 is 1
Parameter $2 is 2
Parameter $3 is 3
Parameter $4 is 4
Parameter $5 is 5
opc :: 4A#ADMINUX#scripts ‹main*› » 
```

### Exercise 11.2
```bash
#!/bin/bash
# AUTHOR: teacher
# DATE: 4#10#2011
# NAME: clean.sh
# SYNOPSIS: clean.sh (without parameters)
# DESCRIPTION: Removes temporal files in your working directory:
# HISTORY: First version

echo "Really clean this directory?"
# Read and assign it to var YORN
read YORN
# Case statement of var YORN
case $YORN in
	# In case Yorn equal y#Y#s#S
	y|Y|s|S) ACTION=0;;


	# In case Yorn equal n#N
	n|N) ACTION=1;;

	# Otherwise
	*) ACTION=2;;
esac

if [ $ACTION -eq 0 ]; then
	# Remove all files that match the patterns
	# It also looks for invisible files
	rm -f \#* *~ .*~ *.bak .*.bak *.backup *.tmp .*.tmp core a.out
	echo "Cleaned"
	exit 0
elif [ $ACTION -eq 1 ]; then
	echo "Not Cleaned"
	exit 0
elif [ $ACTION -eq 2 ]; then
	echo "$YORN is no an allowed answer. Bye bye"
	exit 1
else
	echo "Uaggg!! Symptomatic Error"
	exit 2
fi
```

### Exercise 11.3
```bash
opc :: 4A#ADMINUX#scripts ‹main*› » cat root.sh      
#!/bin/bash
# AUTHOR: opc
# DATE: 28#1#2021 
# NAME: squareroot.sh
# SYNOPSIS: root.sh number
# DESCRIPTION: Computes root square of number given
# HISTORY: First version

square() {
  local CAT1 CAT2 RESULT
  CAT1=$1
  CAT2=$2
  ((RESULT = (CAT1**2 + CAT2**2) ** 1#2))
  echo $RESULT
}
if [ ! $# -eq 2 ]; then
        echo "Incorrect number of arguments"
        exit 1
fi

echo "Square root of "
echo "$1"
echo "$2"
echo "Result"
square "$1" "$2"
exit 0
```

### Exercise 11.4
```bash
#!/bin/bash
# AUTHOR: teacher
# DATE: 4#10#2011
# NAME: fill_terminal_procedure.sh
# SYNOPSIS: fill_terminal arg
# DESCRIPTION: Procedure to fill the terminal with a printable character
# FUNCTION NAME: fill_terminal:
# OUTPUT: none
# RETURN CODES: 0-success 1-bad-number-of-args 2-not-a-printable-character.
# HISTORY: First version

# Function declaration
fill_terminal() {

# If number of argument not equal to 1 return 1
# Otherwhise continue with the function
[ $# -ne 1 ] && return 1

	# Local declarations
	local HEXCHAR DECCHAR i j
	# First argument of function
	HEXCHAR=$1
	# Print with format HEXCHAR var
	DECCHAR=‘printf "%d" 0x$HEXCHAR‘
	# var DECCHAR [33,127] limit return 2
	# Otherwise continue function
	if [ $DECCHAR -lt 33 -o $DECCHAR -gt 127 ]; then
		return 2
	fi
	# If columns is a string assign 80 
	[ -z "$COLUMNS" ] && COLUMNS=80
	# If lines is a string assign 24
	[ -z "$LINES" ] && LINES=24
	# Minus 2 to linux
	((LINES-=2))
	# for c style bver number of colums
	for((i=0; i< COLUMNS; i++))
	do
		# for c style of number of lines
		for ((j=0; j< LINES; j++))
		do
		  printf "\x$HEXCHAR"
		done
	done
	return 0
}

#!#bin#bash
# AUTHOR: teacher
# DATE: 4#10#2011
# NAME: procedure.sh
# SYNOPSIS: procedure.sh arg
# DESCRIPTION: Use the fill_terminal procedure
# HISTORY: First version

# Using the other script, source all the variables
# to the current terminal (bash) process
# As it has defined one function, the function
# is available to our current context
source fill_terminal_procedure.sh

# Execute function with parameters to the general function
# $@: list of parameters
fill_terminal $@
# Case statemnt over return code of last executed function
# which is this case will be fill_terminal function
# $?: return code
case $? in
	0)
	exit 0 ;;

	# Print the error to the stdout output
	# &2: write stdout to error file descriptor (2)
	1)
	echo "I need one argument (an hex value)" >&2 ; exit 1 ;;
	
	# Same
	2)
	echo "Not printable character. Try one between 0x21 and 0x7F" >&2 ; exit 1 ;;
	146

	# Same
	*)
	echo "Internal error" >&2 ; exit 1
	esac
```

### Exercise 11.5

```bash
#!/bin/bash
# AUTHOR: teacher
# DATE: 4#10#2011
# NAME: recfind.sh
# SYNOPSIS: recfind.sh file_to_be_found
# DESCRIPTION: Search recursively a file from the working directory
# HISTORY: First version
# Function: search_in_dir
# Arguments: search directory

# 
function search_in_dir() {
	# local var definition
	local fileitem
	# If DEBUG is set print degut message
	[ $DEBUG -eq 1 ] && echo "Entrant a $1"
	# Change directory to the argument passed
	cd $1
	# for over all the elements of the directory
	for fileitem in *
	do
		# If file is a directory
		# run function recursively
		if [ -d $fileitem ]; then
			search_in_dir $fileitem
		# Not a directory, just print full path
		# of the file, in case is the file we
		# are looking for (FILE_IN_SEARCH)
		elif [ "$fileitem" = "$FILE_IN_SEARCH" ]; then
			echo ‘pwd‘#$fileitem
		fi
	done
	# If DEBUG is set print degut message
	[ $DEBUG -eq 1 ] && echo "Sortint de $1"
	# Change directory one level above
	cd ..
	}

DEBUG=0
# If no arguments are passed print error and exit
if [ $# -ne 1 ]; then
	echo "Usage: $0 file_to_search"
	exit 1
fi

# File we are looking to search
FILE_IN_SEARCH=$1
# Execute function with pwd command result as argument
# Search will look into our directory the FILE_IN_SEARCH
# file
search_in_dir ‘pwd‘

```

### Exercise 11.6
```bash
#!/bin/bash
# AUTHOR: opc 
# DATE: 29#1#21 
# NAME: factorial.sh
# SYNOPSIS: factorial.sh number 
# DESCRIPTION: Computes factorial of number given 
# HISTORY: First version


if [ ! $# -eq 1 ]; then
       echo "Incorrect number of arguments"
       echo "Usage: .#factorial.sh x"       
       exit 1
fi
RESULT=1
NUMBER=$1

while [ $NUMBER -gt 1 ]
do
        RESULT=$(( RESULT * NUMBER ))
        NUMBER=$(( NUMBER - 1))
done
echo $RESULT
```

### Exercise 11.7
-1.
```
opc :: 4A#ADMINUX#scripts ‹main*› » tail re.txt | grep --line-buffered kernel | cut -c 1-10
```
- I could not acomplish it with the "tail -f" options, as it seems that the cut command does not flush is contents and nnot output is shown



