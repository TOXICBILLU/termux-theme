#!/data/data/com.termux/files/usr/bin/bash
# Termux Pure Setup (No External Links)

set -e

# === CONFIG ===
TITLE="T3RMUX"
SUBTITLE="Termux-OS"
BANNER_FONT="Big"

# === UTILS ===
ok(){ echo -e "\033[1;32m[OK]\033[0m $*"; }
backup_file(){ [ -f "$1" ] && cp "$1" "$1.bak.$(date +%s)"; }

# === BASE TOOLS INSTALL ===
pkg update -y && pkg upgrade -y
pkg install -y zsh bash figlet toilet ruby nano
gem install lolcat --no-document || true

# === BANNER FUNCTION ===
make_banner(){
  clear
  figlet -f "$BANNER_FONT" "$TITLE" | lolcat
  echo "-----------------------------" | lolcat
  echo "$SUBTITLE" | lolcat
  echo
}

# === WRITE .zshrc ===
backup_file "$HOME/.zshrc"
cat > "$HOME/.zshrc" <<EOF
# --- Custom Termux ZSHRC ---
export TERM=xterm-256color
export EDITOR=nano

banner(){
  clear
  figlet -f "$BANNER_FONT" "$TITLE" | lolcat
  echo "-----------------------------" | lolcat
  echo "$SUBTITLE" | lolcat
  echo
}
banner

# Prompt Style
PROMPT='%F{cyan}>>>%f %F{green}%~%f \$ '

# Aliases
alias cls='clear'
alias ll='ls -la'

# --- END ---
EOF
ok ".zshrc created"

# === WRITE .bashrc ===
backup_file "$HOME/.bashrc"
cat > "$HOME/.bashrc" <<EOF
# --- Custom Termux BASHRC ---
export TERM=xterm-256color
export EDITOR=nano

banner(){
  clear
  figlet -f "$BANNER_FONT" "$TITLE" | lolcat
  echo "-----------------------------" | lolcat
  echo "$SUBTITLE" | lolcat
  echo
}
banner

# Prompt Style
PS1='\\[\\e[36m\\]>>>\\[\\e[0m\\] \\[\\e[32m\\]\\w\\[\\e[0m\\] \\$ '

# Aliases
alias cls='clear'
alias ll='ls -la'

# --- END ---
EOF
ok ".bashrc created"

# === EXTRA KEYS (TERMUX) ===
mkdir -p "$HOME/.termux"
cat > "$HOME/.termux/termux.properties" <<'EOF'
extra-keys = [[ '/', 'ls', '$', '~', UP, 'EXIT' ],
               [ 'EX', 'CTRL', 'ALT', LEFT, DOWN, RIGHT ]]
EOF
termux-reload-settings || true
ok "Termux keys configured"

# === DONE ===
ok "Setup complete! Restart Termux or run: exec zsh"
