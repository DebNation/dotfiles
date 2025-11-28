#!/bin/bash

# Wait a moment to ensure the device is initialized
sleep 1

# Find the pointer device ID for the Corsair KATAR PRO mouse
DEVICE_ID=$(xinput list | grep -i "Corsair CORSAIR KATAR PRO Gaming Mouse" | grep "pointer" | grep -o 'id=[0-9]*' | cut -d= -f2)

if [ -z "$DEVICE_ID" ]; then
  echo "⚠️  Corsair KATAR PRO pointer device not found."
  exit 1
fi

echo "🎯 Found Corsair mouse pointer device ID: $DEVICE_ID"

# Apply libinput settings
xinput --set-prop "$DEVICE_ID" "libinput Accel Profile Enabled" 0, 1
xinput --set-prop "$DEVICE_ID" "libinput Accel Speed" 0

echo "✅ Settings applied successfully."
