#!/bin/bash

ZSHRC="$HOME/.zshrc"
HOOK_COMMENT="# place this after nvm initialization!"
HOOK_FUNC="autoload -U add-zsh-hook"

# Check if the hook already exists in .zshrc to prevent duplicates
if ! grep -q "$HOOK_COMMENT" "$ZSHRC"; then
  cat << 'EOF' >> "$ZSHRC"

# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="\$(nvm_find_nvmrc)"

  if [ -n "\$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=\$(nvm version "\$(cat "\${nvmrc_path}")")

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

  echo "✅ Added load-nvmrc function to .zshrc"
else
  echo "ℹ️  load-nvmrc function already present in .zshrc"
fi
