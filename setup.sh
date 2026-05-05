#!/bin/bash

# Create necessary directories if they don't exist
mkdir -p ~/.config/kitty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/tmux/tmux.conf

# Link bash configuration
ln -sr ./bashrc ~/.bashrc

# Link kitty configuration
ln -sr ./kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sr ./kitty/current-theme.conf ~/.config/kitty/current-theme.conf

# Link tmux configuration
ln -sr ./tmux.conf ~/,config/tmux/tmux.conf

# Link nvim configuration (entire directory)
rm -rf ~/.config/nvim
ln -sr ./nvim ~/.config/nvim

# Adding music daemon and rusty music player client
ln -sr ./rmpc/ ~/.config/
ln -sr ./mpd/ ~/.config/

# Verify links were created
echo "Dotfiles linked successfully!"
echo "Created links:"
ls -la ~/.bashrc ~/.config/kitty/ ~/.config/nvim 

echo "adding startship"
curl -sS https://starship.rs/install.sh | sh
