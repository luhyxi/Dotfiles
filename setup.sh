#! /bin/bash
ln -sf "$(pwd)/bashrc" "$HOME/.bashrc" && mkdir -p "$HOME/.config" && ln -sf "$(pwd)/config/kitty" "$HOME/.config/kitty" && ln -sf "$(pwd)/config/nvim" "$HOME/.config/nvim" && ln -sf "$(pwd)/scripts" "$HOME/scripts"
