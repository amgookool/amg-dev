#! /bin/bash
echo "Updating & Upgrading the package list"
sudo apt update && sudo apt upgrade -y

echo "Installing zsh"
sudo apt install zsh -y

echo "Changing the default shell to zsh"
chsh -s $(which zsh)

echo "Creating Scripts directory"
mkdir -p ~/Scripts

echo "Downloading Antigen in the Scripts directory"
curl -L git.io/antigen > ~/Scripts/antigen.zsh

echo "Adding .zshrc configs"
{
    echo "# Exports for environment variables"
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

    echo "# Aliases"
    echo "alias ll='ls -l'"
    echo "alias la='ls -a'"
    echo "alias lla='ls -la'"
    echo "alias lt='ls --tree'"
    echo "alias cls='clear'"

    echo "# Starship Terminal"
    echo "alias starship-update='curl -sS https://starship.rs/install.sh | sh'"
    echo 'eval "$(starship init zsh)"' 

} >> ~/.zshrc