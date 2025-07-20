#!/bin/bash

echo "Installing nvm (Node Version Manager)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Add NVM auto-switch logic if not already present
if ! grep -q "autoload -U add-zsh-hook" ~/.zshrc; then
  cat << 'EOF' >> ~/.zshrc

# NVM: Automatically use .nvmrc if present in directory
# Place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "\$(cat "\${nvmrc_path}")")

    if [ "\$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "\$nvmrc_node_version" != "\$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "\$(PWD=\$OLDPWD nvm_find_nvmrc)" ] && [ "\$(nvm version)" != "\$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
EOF

  echo "✅ Added NVM auto-switching logic to ~/.zshrc"
else
  echo "ℹ️  NVM hook already present. Skipping append."
fi

