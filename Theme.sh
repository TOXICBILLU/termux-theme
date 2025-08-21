#!/bin/bash
# Termux Theme + Logo + Prompt Installer

echo -e "\n💠 Enter your name (example: Billal): "
read USERNAME

THEME_DIR="$HOME/.termux"
mkdir -p $THEME_DIR

# ---------- Colors ----------
cat > $THEME_DIR/colors.properties <<EOL
# $USERNAME Custom Termux Theme
background=#0F111A
foreground=#A0E7E5
cursor=#FF5E5B
color0=#1B1D2A
color1=#FF5E5B
color2=#00FF85
color3=#FFD700
color4=#00BFFF
color5=#FF69B4
color6=#20B2AA
color7=#FFFFFF
color8=#808080
color9=#FF4500
color10=#32CD32
color11=#FFA500
color12=#1E90FF
color13=#FF1493
color14=#40E0D0
color15=#FFFFFF
EOL

# ---------- Logo + Prompt ----------
BASHRC="$HOME/.bashrc"

# আগে থেকে ডুপ্লিকেট থাকলে ক্লিয়ার করি
sed -i '/# Custom Termux Theme START/,/# Custom Termux Theme END/d' $BASHRC

cat >> $BASHRC <<EOL

# Custom Termux Theme START
clear
echo -e "\e[95m"
echo "████████╗██████╗ ██████╗ ██████╗ ██╗   ██╗██╗   ██╗"
echo "╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██║   ██║╚██╗ ██╔╝"
echo "   ██║   ██████╔╝██████╔╝██████╔╝██║   ██║ ╚████╔╝ "
echo "   ██║   ██╔═══╝ ██╔═══╝ ██╔═══╝ ██║   ██║  ╚██╔╝  "
echo "   ██║   ██║     ██║     ██║     ╚██████╔╝   ██║   "
echo "   ╚═╝   ╚═╝     ╚═╝     ╚═╝      ╚═════╝    ╚═╝   "
echo -e "\e[0m"
echo -e "\n💠 Welcome, $USERNAME!\n"

PS1='[\[\e[1;35m\]$USERNAME\[\e[0m\]@\[\e[1;36m\]\h\[\e[0m\]]-\[\e[1;32m\]\w\[\e[0m\]\n>>> '
# Custom Termux Theme END
EOL

# ---------- Apply ----------
termux-reload-settings

echo -e "\n✅ Theme + Logo + Prompt Installed!"
echo -e "👉 Restart Termux to see the changes.\n"
