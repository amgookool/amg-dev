#!/bin/bash

ZSHRC="$HOME/.zshrc"
THEME_LINE='ZSH_THEME="devcontainers"'
ALIAS_LINE="alias zshconfig='vim ~/.zshrc'"

# Remove the ZSH_THEME line if it exists
if grep -q "^$THEME_LINE" "$ZSHRC"; then
  sed -i.bak "/^$THEME_LINE/d" "$ZSHRC"
  echo "✅ Removed ZSH theme line: $THEME_LINE"
else
  echo "ℹ️  No matching ZSH_THEME line found in .zshrc"
fi

# Add the alias if it doesn't exist
if ! grep -qF "$ALIAS_LINE" "$ZSHRC"; then
  echo "$ALIAS_LINE" >> "$ZSHRC"
  echo "✅ Added alias: $ALIAS_LINE"
else
  echo "ℹ️  Alias already exists in .zshrc"
fi
