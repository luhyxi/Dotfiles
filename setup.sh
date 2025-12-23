#!/bin/bash

# Create necessary directories if they don't exist
mkdir -p ~/.config/kitty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/tmux/tmux.conf

# Link bash configuration
ln -sf ~/Dotfiles/bashrc ~/.bashrc

# Link kitty configuration
ln -sf ~/Dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/Dotfiles/kitty/current-theme.conf ~/.config/kitty/current-theme.conf

# Link tmux configuration
ln -sf ~/Dotfiles/tmux.conf ~/,config/tmux/tmux.conf

# Link nvim configuration (entire directory)
rm -rf ~/.config/nvim
ln -sf ~/Dotfiles/nvim ~/.config/nvim

# Verify links were created
echo "Dotfiles linked successfully!"
echo "Created links:"
ls -la ~/.bashrc ~/.config/kitty/ ~/.config/nvim 

echo "adding startship"
curl -sS https://starship.rs/install.sh | sh
