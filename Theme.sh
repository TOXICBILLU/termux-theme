#!/bin/bash
# ==============================
#  Pro Hacker Termux Custom Shell
#  Created by Billal 🔥
# ==============================

clear

# Color list
colors=(31 32 33 34 35 36 37)

# Random color function
random_color() {
    echo "${colors[$RANDOM % ${#colors[@]}]}"
}

# Panel UI
echo -e "\033[1;36m=============================================\033[0m"
echo -e "\033[1;32m        🔥 Termux Theme Setup 🔥        \033[0m"
echo -e "\033[1;36m=============================================\033[0m"
echo
read -p "👉 Enter your Banner Text: " banner
read -p "👉 Enter your Shell Name (ex: billu@termux): " shellname
echo

# Save settings to custom shell file
cat > ~/.custom_shell.sh <<'EOF'
#!/bin/bash
colors=(31 32 33 34 35 36 37)

random_color() {
    echo "\${colors[\$RANDOM % \${#colors[@]}]}"
}

clear
color=\$(random_color)

echo -e "\033[1;\${color}m"
echo "============================================="
echo "        🔥  $banner  🔥"
echo "============================================="
echo -e "\033[1;35m   Created By: Itz Billu \033[0m"
echo
echo -e "\033[0m"

# Fancy PS1 (prompt style)
PS1="\[\e[1;32m\][\u@$shellname] - [\w] >>> \[\e[0m\]"
EOF

chmod +x ~/.custom_shell.sh

# Apply permanently
if ! grep -q ".custom_shell.sh" ~/.bashrc; then
    echo "bash ~/.custom_shell.sh" >> ~/.bashrc
fi

# Run first time
bash ~/.custom_shell.sh# আগে থেকে ডুপ্লিকেট থাকলে ক্লিয়ার করি
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
