#!/bin/bash

# Fixes invisible or trailing cursor artifacts
export WLR_NO_HARDWARE_CURSORS=1

# Bypasses OpenGL flickering issues on the 550 driver
export WLR_RENDERER=vulkan 

# Force Wayland specific backends
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export LIBVA_DRIVER_NAME=nvidia

# Explicitly map the GPUs (AMD first, NVIDIA second)
export WLR_DRM_DEVICES=/dev/dri/card1:/dev/dri/card0

# Launch Sway
exec sway --unsupported-gpu "$@"
