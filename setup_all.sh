#!/usr/bin/env bash

function backup_if_exists() {
    local target="$1"
    if [[ -f "$target" ]]; then
      mv "$target" "$target".bak.$(date -u +"%Y%m%d%H%M%S")
    fi
}

# Clean common conflicts
backup_if_exists ~/.bash_profile
backup_if_exists ~/.bashrc
backup_if_exists ~/.vimrc

stow .

echo "Done!"
