#! /bin/bash

echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

{
    echo "alias nvm-update='curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash'"
    echo "# place this after nvm initialization!"
    echo "autoload -U add-zsh-hook"
    echo ""
    echo "load-nvmrc() {"
    echo "  local nvmrc_path"
    echo "  nvmrc_path=\"\$(nvm_find_nvmrc)\""
    echo ""
    echo "  if [ -n \"\$nvmrc_path\" ]; then"
    echo "    local nvmrc_node_version"
    echo "    nvmrc_node_version=\$(nvm version \"\$(cat \"\${nvmrc_path}\")\")"
    echo ""
    echo "    if [ \"\$nvmrc_node_version\" = \"N/A\" ]; then"
    echo "      nvm install"
    echo "    elif [ \"\$nvmrc_node_version\" != \"\$(nvm version)\" ]; then"
    echo "      nvm use"
    echo "    fi"
    echo "  elif [ -n \"\$(PWD=\$OLDPWD nvm_find_nvmrc)\" ] && [ \"\$(nvm version)\" != \"\$(nvm version default)\" ]; then"
    echo "    echo \"Reverting to nvm default version\""
    echo "    nvm use default"
    echo "  fi"
    echo "}"
    echo ""
    echo "add-zsh-hook chpwd load-nvmrc"
    echo "load-nvmrc"
} >>~/.zshrc
