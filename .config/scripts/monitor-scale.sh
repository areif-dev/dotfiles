#!/usr/bin/env bash

MM_PER_INCH=25.4

# Select array of active display adapters (eDP-1, DP-1, HDMI-1, etc)
display_adapters=($(wlr-randr | awk '/^[^ ]/ {print $1}'))

# Select the physical width in mm (eg. 600)
display_sizes=($(wlr-randr | awk '/Physical size:/ {split($3,a,"x"); print a[1]}'))

# Select the width in pixels (eg. 1920)
display_dots=($(wlr-randr | awk '/current/ {split($1,a,"x"); print a[1]}'))

for i in "${!display_adapters[@]}"
do 
  # Calculate dots per mm then convert to dots per inch
  dpi=$(echo "scale=2; ${display_dots[$i]} / ${display_sizes[$i]} * $MM_PER_INCH" | bc)

  # Assume that the scale of the display should be the nearest multiple of 100
  # Eg. 108 DPI would be a display scale of 1. 267 DPI is scale of 2.
  scale=$(echo "scale=0; $dpi / 100" | bc)
  scale=$((scale>1 ? scale : 1))

  wlr-randr --output ${display_adapters[$i]} --scale $scale
done
