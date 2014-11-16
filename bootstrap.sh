#!/usr/bin/env sh

DOTFILES="$HOME/.files"
OS="osx"

# Symlink general files
ln -s "$DOTFILES/.gitconfig" $HOME/
ln -s "$DOTFILES/.gitignore" $HOME/
ln -s "$DOTFILES/.tmux.conf" $HOME/
ln -s "$DOTFILES/.ssh_config" $HOME/.ssh/config

# Fish config
ln -s "$DOTFILES/fish/config.fish.$OS" $HOME/.config/fish/config.fish
ln -s "$DOTFILES/fish/functions" $HOME/.config/fish/
