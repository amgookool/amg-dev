#! /bin/bash

echo 'Installing Starship Terminal...'

echo "Install Nerd Font for Starship Terminal"
echo "https://www.nerdfonts.com/font-downloads"

# Install Starship Terminal
curl -sS https://starship.rs/install.sh | sh

# Copy starship.toml to ~/.config
echo "Copying starship.toml to ~/.config"
mkdir -p ~/.config
cp ./starship.toml ~/.config/starship.toml
echo "Refresh shell using 'exec zsh'"