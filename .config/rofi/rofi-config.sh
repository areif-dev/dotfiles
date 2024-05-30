#!/usr/bin/env bash

rofi_dir=$HOME/.config/rofi
rofi_config="$rofi_dir/config.rasi"

if [ ! -f "$rofi_config" ] || grep -q "window_width" "$rofi_config" || grep -q "window_height" "$rofi_config" || grep -q "width: 0px" "$rofi_config" || grep -q "height: 0px" "$rofi_config"; then

    MM_PER_INCH=25.4

    # Select the physical width in mm (eg. 600)
    display_size=($(wlr-randr | awk '/Physical size:/ {split($3,a,"x"); print a[2]}'))

    # Select the height in pixels (eg. 1920)
    display_height_px=($(wlr-randr | awk '/current/ {split($1,a,"x"); print a[2]}'))

    # Calculate dots per mm then convert to dots per inch
    dpi=$(echo "scale=2; ${display_height_px} / ${display_size} * $MM_PER_INCH" | bc)

    # Assume that the scale of the display should be the nearest multiple of 100
    # Eg. 108 DPI would be a display scale of 1. 267 DPI is scale of 2.
    scale=$(echo "scale=0; $dpi / 100" | bc)

    # Set the height of the rofi window to be 65% the size of the screen. Adjust for
    # the scaling of the display as well
    rofi_height_px=$(printf "%.0f" $(echo "$display_height_px * 0.65 / $scale" | bc))
    rofi_width_px=$(printf "%.0f" $(echo "$display_height_px * 0.75 / $scale" | bc))

    cp $rofi_dir/config.rasi.bak $rofi_dir/config.rasi

    sed -i "s/window_width/width: ${rofi_width_px}px;/" $rofi_config
    sed -i "s/window_height/height: ${rofi_height_px}px;/" $rofi_config
fi

exec rofi -show drun -drun-show-actions
