#!/bin/bash

# Two commands are widely used for printing a custom message through script.
# 1. printf
# 2. echo

# Printf needs a lot of syntaxes and echo avoids them, Yet both does the same job.
# Hence we go with echo command

# echo INPUT

echo Hello World
echo Welcome to DevOps Training

# To print multi line outputs we need to enable escape sequences \n
# Syntax: echo -e "Hello\nWorld"
# when we use -e option then give input in quotes, Preferably double quotes

echo -e "Hello\nWorld"
echo -e "Hello\n\nWorld"

