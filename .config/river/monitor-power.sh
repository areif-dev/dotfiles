#!/usr/bin/env bash

# Create array of active display adapters (DP-1, HMDI-1, etc) by selecting the 
# first word of each line in the output of wlr-randr that does not start with 
# a space
display_adapters=$(wlr-randr | awk '/^[^ ]/ {print $1}')
for output in $display_adapters 
do 
  wlr-randr --output $output $1
done
