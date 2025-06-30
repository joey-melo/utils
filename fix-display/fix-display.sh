#!/bin/zsh

while true; do
  # Get the connected display name
  display=$(xrandr | grep " connected" | awk '{print $1}')

  # Get the current and recommended resolution
  current_res=$(xrandr | grep current | awk '{ print $8 $9 $10 }' | tr -d ',')
  recommended_res=$(xrandr | grep -A1 "$display connected" | awk 'NR==2 { print $1 }')

  # Set the display to the recommended resolution
  if [[ -n "$current_res" && -n "$recommended_res" && "$current_res" != "$recommended_res" ]]; then  
    if [[ -n "$display" && -n "$recommended_res" ]]; then
      echo "$(date): Fixing resolution from $current_res to $recommended_res on display $display" >> ~/.local/share/fix-display.log
      xrandr --output "$display" --mode "$recommended_res" >> ~/.local/share/fix-display.log
    else
      echo "$(date): ERROR: Could not change resolution from $current_res to $recommended_res on display $display" >> ~/.local/share/fix-display.log
    fi
  fi
  sleep 1
done
