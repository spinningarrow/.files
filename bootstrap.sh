#!/usr/bin/env sh

DOTFILES="$HOME/.files"
OS="osx"

# Symlink files
ln -s "$DOTFILES/.gitconfig" $HOME/
ln -s "$DOTFILES/.gitignore" $HOME/
ln -s "$DOTFILES/.tmux.conf" $HOME/

# Fish config
ln -s "$DOTFILES/fish/config.fish.$OS" $HOME/.config/fish/config.fish
ln -s "$DOTFILES/fish/functions" $HOME/.config/fish/
