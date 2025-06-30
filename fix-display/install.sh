#!/bin/zsh
set -e
trap 'echo "Error: installation failed"; exit 1' ERR

mkdir -p ~/.local/bin
cp fix-display.sh ~/.local/bin/
chmod +x ~/.local/bin/fix-display.sh

mkdir -p ~/.config/systemd/user
cp fix-display.service ~/.config/systemd/user/

systemctl --user daemon-reexec
systemctl --user daemon-reload
systemctl --user enable --now fix-display.service

echo "Display auto-fix service installed successfully"