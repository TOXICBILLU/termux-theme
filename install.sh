#!/data/data/com.termux/files/usr/bin/bash
# === Termux Theme & Shell Setup by TOXICBILLU ===

ok() { echo -e "\e[32m[✔]\e[0m $1"; }
err() { echo -e "\e[31m[✘]\e[0m $1"; }

# Update & install basics
pkg update -y && pkg upgrade -y
pkg install -y git curl figlet toilet nano zsh fish lolcat

# === Banner Setup ===
BANNER_FILE="$PREFIX/etc/motd"

cat > "$BANNER_FILE" <<'EOF'
toilet -f big "WELCOME" | lolcat
echo -e "\e[36mCoded by TOXICBILLU 🚀\e[0m" | lolcat
EOF

ok "Banner installed (random rainbow each time)"

# === Random Color Prompt Function ===
RANDOM_COLOR='
# Generate random color each command
random_color() {
  COLORS=(31 32 33 34 35 36)
  COLOR=${COLORS[$RANDOM % ${#COLORS[@]}]}
  echo -ne "\e[1;${COLOR}m"
}
PROMPT_COMMAND="random_color"
'

# === Apply to bash ===
cat >> "$HOME/.bashrc" <<EOF

# --- Custom Random Color Theme ---
$RANDOM_COLOR
PS1='[\u@\h \W]\\$ \[\e[0m\]'
EOF

# === Apply to zsh ===
cat >> "$HOME/.zshrc" <<EOF

# --- Custom Random Color Theme ---
$RANDOM_COLOR
PROMPT='%F{$(echo \$((31 + RANDOM % 6)))}%n@%m %1~ %# %f'
EOF

# === Apply to fish ===
mkdir -p ~/.config/fish
cat >> "$HOME/.config/fish/config.fish" <<EOF

# --- Custom Random Color Theme ---
function fish_prompt
    set -l colors red green yellow blue magenta cyan
    set -l rand (math (random) % (count \$colors) + 1)
    set_color \$colors[\$rand]
    echo -n (whoami)"@"(hostname)" "(prompt_pwd)"> "
    set_color normal
end
EOF

ok "Random color prompt set for bash, zsh, and fish"

# === Shell Selection Menu ===
echo
echo "Choose your default shell:"
echo "1) bash"
echo "2) zsh"
echo "3) fish"
read -p "Enter choice [1-3]: " choice

case "$choice" in
  1) SHELL_PATH=$PREFIX/bin/bash ;;
  2) SHELL_PATH=$PREFIX/bin/zsh ;;
  3) SHELL_PATH=$PREFIX/bin/fish ;;
  *) SHELL_PATH=$PREFIX/bin/bash ;;
esac

# Make shell permanent
chsh -s "$SHELL_PATH"
ok "Default shell set to: $SHELL_PATH"

# Reload Termux settings
termux-reload-settings 2>/dev/null || true

echo
ok "Setup complete! Restart Termux to see the rainbow effects 🎉"
