#!/bin/bash

# Configuration parameters
# (No additional configuration needed)

echo "========================================="
echo "Gamescope Session Installer for Fedora"
echo "========================================="
echo "Started at: $(date)"
echo "Running as user: $(whoami)"
echo "Working directory: $(pwd)"
echo ""



echo "Phase 1: Installing required packages..."
echo "   Installing mangohud and gamescope via DNF..."
if sudo dnf install mangohud gamescope -y; then
    echo "   SUCCESS: Packages installed successfully"
else
    echo "   ERROR: Failed to install packages"
    exit 1
fi
echo ""

echo "Phase 2: Installing gamescope-session script..."
echo "   Checking if gamescope-session file exists..."
if [ ! -f "./gamescope-session" ]; then
    echo "   ERROR: gamescope-session file not found in current directory"
    exit 1
fi

echo "   Copying gamescope-session to /usr/bin/..."
if sudo cp ./gamescope-session /usr/bin/; then
    echo "   SUCCESS: Script copied to /usr/bin/"
else
    echo "   ERROR: Failed to copy script to /usr/bin/"
    exit 1
fi

echo "   Setting executable permissions..."
if sudo chmod +x /usr/bin/gamescope-session; then
    echo "   SUCCESS: Executable permissions set"
else
    echo "   ERROR: Failed to set executable permissions"
    exit 1
fi
echo ""

echo "Phase 3: Verification..."
echo "   Checking installed files..."
if [ -f "/usr/bin/gamescope-session" ] && [ -x "/usr/bin/gamescope-session" ]; then
    echo "   SUCCESS: /usr/bin/gamescope-session is installed and executable"
else
    echo "   ERROR: /usr/bin/gamescope-session is missing or not executable"
fi



echo ""
echo "========================================="
echo "Installation completed successfully!"
echo "========================================="
echo ""
echo "Usage:"
echo ""
echo "   Run 'gamescope-session' directly from a terminal"

echo "========================================="
