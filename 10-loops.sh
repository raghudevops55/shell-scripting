#!/bin/bash

# Shell has two loops fundamentally
# while and for loop. Two more loops are also there which are inverse to the logic of while and for which are until and select.

## If you want to run a loop based on some condition then while or until loop

## If you want to run a loop based on the inputs we use for and select loop

i=10
while [ $i -gt 0 ]; do
  echo "Welcome to DevOps - While Loop"
  i=$(($i-1))
done

# Above loop will take you inside the loop if your expression is true.
# In cases we need to go if expression is false then we can use until command

i=10
until [ $i -lt 0 ]; do
  echo "Welcome to DevOps - Until Loop"
  i=$(($i-1))
done


for fruit in apple banana orange berry ; do
  echo   Fruit Name = $fruit
  sleep 1
done

select fruit in apple banana orange berry ; do
  echo   Fruit Name = $fruit
  sleep 1
done

