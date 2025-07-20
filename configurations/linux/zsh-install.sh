#!/bin/bash
echo "This script will install zsh, tmux, default java sdk, and your terminal for linux system."
echo "It will also set up your zsh configuration with Antigen, Starship, and other useful plugins for a better development experience."

echo "Please ensure you have the following prerequisites:"
echo "- A Linux system with sudo privileges"
echo "- An internet connection to download packages and plugins"
echo "- The name of the user on the Windows machine where you want to access the Desktop"
echo "- Your GitHub username and personal access token for authentication"
echo "Press Ctrl+C to cancel or any other key to continue..."
read -n 1 -s

set -euo pipefail

cd ~

read -p "Enter Windows Machine User: " user_input

read -p "Enter github username: " git_username

read -p "Enter git personal access token: " git_token


echo "Updating & Upgrading the package list"
sudo apt update && sudo apt upgrade -y

echo "Installing zsh, Tmux and Default JAVA Sdk packages"
sudo apt install zsh tmux default-jdk -y

echo "Changing the default shell to zsh"
chsh -s $(which zsh)

echo "Creating Scripts directory"
mkdir -p ~/Scripts

echo "Creating .config directory"
mkdir -p ~/.config

echo "Creating Software directory"
mkdir -p ~/Software

echo "Downloading Antigen in the Scripts directory"
curl -L git.io/antigen > ~/Scripts/antigen.zsh && chmod +x ~/Scripts/antigen.zsh

echo "Downloading act (Local Github Actions Tool) in the Scripts directory"
cd ~/Scripts
wget -O act_linux.tar.gz https://github.com/nektos/act/releases/download/v0.2.78/act_Linux_x86_64.tar.gz

echo "Extracting act archive"
tar -xzf act_linux.tar.gz && chmod +x act

echo "Cleaning up act archive"
rm -f act_linux.tar.gz README.md LICENSE
cd ~

echo "Installing Starship Terminal"
curl -sS https://starship.rs/install.sh | sh -s -- -y


echo "Creating starship config to .config directory"
touch ~/.config/starship.toml


if ! grep -q "antigen.zsh" ~/.zshrc; then
  # write the .zshrc block
  echo "Creating .zshrc file"
{
    echo "# Export for east access to Windows Desktop"
    echo "export WINDESK=\"/mnt/c/Users/${user_input}/Desktop\""

    echo "# Git Personal Access Token"
    echo "export GIT_USER=\"${git_username}\""
    echo "export GIT_TOKEN=\"${git_token}\""
    
    echo "# Host Ip Addresses"
    echo 'export WORK_IP="10.90.12.53"'
    echo 'export HOME_IP="10.90.12.53"'
    echo 'export ACTIVE_IP="${WORK_IP}"'

    echo "# Display Driver"
    echo 'export DISPLAY="${ACTIVE_IP}:0.0"'

    echo "# JAVA SDK Setup"
    echo 'export JAVA_HOME="$(dirname $(dirname $(readlink -f $(which java))))"'
    echo 'export PATH=$JAVA_HOME/bin:$PATH'

    echo "# User Scripts"
    echo 'export PATH="$PATH:$HOME/Scripts"'


    echo "# Antigen Configs"
    echo "source $HOME/Scripts/antigen.zsh"
    echo "antigen use oh-my-zsh"
    echo "antigen bundle git"
    echo "antigen bundle sudo"
    echo "antigen bundle dotenv"
    echo "antigen bundle git-auto-fetch"
    echo "antigen bundle command-not-found"
    echo "antigen bundle zsh-users/zsh-autosuggestions"
    echo "antigen bundle zsh-users/zsh-syntax-highlighting"
    echo "antigen apply"

    echo "# Dotenv Plugin for Zsh"
    echo 'ZSH_DOTENV_PROMPT=true'

    echo "# Aliases"
    echo "alias ll='ls -l'"
    echo "alias la='ls -a'"
    echo "alias lla='ls -la'"
    echo "alias lt='ls --tree'"
    echo "alias cls='clear'"

    echo "# Starship Terminal"
    echo "alias starship-update='curl -sS https://starship.rs/install.sh | sh'"
    echo 'eval "$(starship init zsh)"'

    echo "# Configuration File Aliases"
    echo 'alias zshconfig="vim ~/.zshrc"'
    echo 'alias vimconfig="vim ~/.vimrc"'
    echo 'alias starshipconfig="vim ~/.zshrc"'

    echo "# Flutter Binary"
    echo '# export PATH="$PATH:$HOME/Software/flutter/bin"'

    echo "# Android Studio"
    echo '# export PATH="$PATH:$HOME/Software/android-studio/bin"'

    echo "# Android Development Kit"
    echo '# export ANDROID_HOME="$HOME/Android/Sdk"'
    echo '# export PATH="$PATH:$ANDROID_HOME/build-tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin"'

    echo "# Android Emulator"
    echo '# export ANDROID_ADB_SERVER_ADDRESS="${ACTIVE_IP}"'
    echo '# export ANDROID_ADB_SERVER_PORT="5037"'
    echo '# export ADB_SERVER_SOCKET="tcp:${ANDROID_ADB_SERVER_ADDRESS}:${ANDROID_ADB_SERVER_PORT}"'

} >> ~/.zshrc
fi

echo "Zsh configuration file created successfully."

echo "Cloning TPM (Tmux Plugin Manager)"
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Creating .tmux.conf file"
cat << 'EOF' >> ~/.tmux.conf

# --- Custom tmux configuration ---
set -g @plugin 'tmux-plugins/tpm'
set -g mouse on
set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows on
bind | split-window -hc '#{pane_current_path}'
unbind '"'
bind - split-window -vc '#{pane_current_path}'
unbind %
bind c new-window -c '#{pane_current_path}'
bind r source-file ~/.tmux.conf
set-option -g history-limit 100000
set-option -g allow-rename off
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'briansalehi/tmux-acpi'
set -g @plugin 'dracula/tmux'
run -b '~/.tmux/plugins/tpm/tpm'
# --- End of custom config ---
EOF

echo "Tmux configuration file created successfully."

echo "Installation and configuration completed successfully."

echo "Please run the following command to copy the starship configuration to the .config directory:"

echo "cp <directory-path>/starship.toml ~/.config/starship.toml"