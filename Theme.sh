#!/bin/bash
# ==============================
#  Termux Shell Customizer
#  Created by Billu 🔥
# ==============================

clear

# 🔹 রঙের তালিকা
colors=(31 32 33 34 35 36 37)

# 🔹 র‍্যান্ডম রঙ বাছাই
random_color() {
    echo "${colors[$RANDOM % ${#colors[@]}]}"
}

# 🔹 ইউজার ইনপুট
echo -e "\033[1;36m=============================================\033[0m"
echo -e "\033[1;32m      🔥 Termux Custom Banner Setup 🔥     \033[0m"
echo -e "\033[1;36m=============================================\033[0m"
echo
read -p "👉 ব্যানার টেক্সট লিখুন: " banner
read -p "👉 শেল নাম দিন (যেমন: billu@termux): " shellname
echo

# 🔹 কাস্টম শেল স্ক্রিপ্ট তৈরি করছি
cat > ~/.custom_shell.sh <<EOF
#!/bin/bash

colors=(31 32 33 34 35 36 37)

random_color() {
    echo "\${colors[\$RANDOM % \${#colors[@]}]}"
}

clear
color=\$(random_color)

echo -e "\033[1;\${color}m"
echo "============================================="
echo "       🔥  $banner  🔥"
echo "============================================="
echo -e "\033[1;35m   Created By: Itz Billu \033[0m"
echo

# 🔹 প্রম্পট ডিজাইন
PS1="[\[\e[1;32m\]$shellname\[\e[0m\]] - [\[\e[1;36m\]\w\[\e[0m\]] >>> "
EOF

chmod +x ~/.custom_shell.sh

# 🔹 পুরানো থিম থাকলে মুছে ফেলি
BASHRC="$HOME/.bashrc"
sed -i '/# Custom Termux Theme START/,/# Custom Termux Theme END/d' "$BASHRC"
sed -i '/bash ~/.custom_shell.sh/d' "$BASHRC"

# 🔹 নতুন থিম যোগ করছি
cat >> "$BASHRC" <<'EOL'

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
echo -e "\n💠 Welcome, $USER!\n"

bash ~/.custom_shell.sh
# Custom Termux Theme END
EOL

# 🔹 সেটিংস রিলোড করি
termux-reload-settings

# ✅ ইনস্টলেশন শেষ
echo -e "\n✅ কাস্টম ব্যানার + থিম ইনস্টল হয়েছে!"
echo -e "👉 দয়া করে Termux রিস্টার্ট করুন পরিবর্তন দেখতে।\n"
