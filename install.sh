#!/bin/bash

# Copy scripts to /usr/bin
sudo cp ./gamescope-session /usr/bin/
sudo cp ./steamos-session-select /usr/bin/

# Copy desktop file so it appear at login
sudo cp ./steam.desktop /usr/share/wayland-sessions/
