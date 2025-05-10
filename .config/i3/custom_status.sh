#!/bin/bash
while true; do
    # Get workspace details and exclude workspace "99"
    workspaces=$(i3-msg -t get_workspaces | jq -r '.[] | select(.name != "99") | .name' | tr '\n' ' ')
    # Combine workspaces with other i3status info
    i3status_output=$(i3status)
    echo "Workspaces: $workspaces | $i3status_output" || exit 1
    sleep 1
done
