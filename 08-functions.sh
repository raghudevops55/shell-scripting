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

