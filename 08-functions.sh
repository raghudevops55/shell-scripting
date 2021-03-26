#!/bin/bash

## Determine a function
function abc() {
  echo "Welcome to abc function"
}

xyz() {
  echo "Welcome to xyz function"
}

## Call the function
abc
xyz

xyz

print_value() {
  echo "Input Value is $1"
}

print_value 10
print_value 20
print_value 30

##
# Declare a variable in main program and you can access that in function
A() {
  echo value a = $a
}

a=10
A

# Declare a variable in function and you can access in main program

B() {
  b=20
}

B
echo Value b = $b

# Property of a variable is RW, hence the variables declared in main program can still be overwritten in function and vice-versa

# In some particular cases we need was same variable to be used in main program and function with a different values.
# for this we use function local variables

C() {
  local c=10
  echo Local value c = $c
}

c=20
echo Value of C in main program = $c
C
