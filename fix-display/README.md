# Fix Display - Auto Display Resolution Fixer

This tool monitors your display resolution on Kali Linux and automatically resets it to the recommended resolution if it changes. 

## Installation

### Automatic

1. Clone this repository
2. Run install.sh

### Manual

1. Clone this repository
2. Copy fix-display.sh to ~/.local/bin/
3. Save fix-diplay.service to ~/.config/systemd/user/
4. Run the following commands:

```
chmod +x ~/.local/bin/fix-display.sh
systemctl --user daemon-reexec
systemctl --user daemon-reload
systemctl --user enable --now fix-display.service
systemctl --user start fix-display.service
```

## Usage

The service automatically triggers the script when you start it.

To view status:

`systemctl --user status fix-display.service`

To stop or restart:

```
systemctl --user stop fix-display.service
systemctl --user restart fix-display.service
```

## How it works
- The script runs in the background every second.
- If the current resolution is not the recommended one, it will change it to the recommended one.
- Logs are stored in ~/.local/share/fix-display.log.
