#!/bin/bash

# Set a default VNC password if not already set
if [ ! -f "$HOME/.vnc/passwd" ]; then
  mkdir -p "$HOME/.vnc"
  echo "${VNC_PASSWORD:-kali}" | vncpasswd -f > "$HOME/.vnc/passwd"
  chmod 600 "$HOME/.vnc/passwd"
fi

# Create a minimal xstartup file if it doesn't exist
if [ ! -f "$HOME/.vnc/xstartup" ]; then
  echo "Creating xstartup script for XFCE..."
  cat << 'EOF' > "$HOME/.vnc/xstartup"
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF
  chmod +x "$HOME/.vnc/xstartup"
fi

# Clean any previous VNC locks (if container was restarted)
vncserver -kill :1 > /dev/null 2>&1 || true
rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1

# Start the VNC servermkdir -p ~/.vnc
vncserver :1 -geometry 1280x800 -depth 24

# Wait until the log file appears
LOGFILE="$HOME/.vnc/$(hostname):1.log"
while [ ! -f "$LOGFILE" ]; do
  sleep 0.5
done

# Follow the log file
tail -F "$LOGFILE"
