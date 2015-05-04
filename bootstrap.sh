#!/usr/bin/env sh

DOTFILES="$HOME/.files"
OS="osx"

# Symlink general files
ln -s "$DOTFILES/.editorconfig" $HOME/
ln -s "$DOTFILES/.eslintrc" $HOME/
ln -s "$DOTFILES/.gitconfig" $HOME/
ln -s "$DOTFILES/.gitconfig.$OS" $HOME/.gitconfig.include
ln -s "$DOTFILES/.gitignore" $HOME/
ln -s "$DOTFILES/.tmux.conf" $HOME/
ln -s "$DOTFILES/.ssh_config" $HOME/.ssh/config

# Vim configs
ln -s "$DOTFILES/.vimrc" $HOME/
ln -s "$DOTFILES/.gvimrc" $HOME/

# Fish config
ln -s "$DOTFILES/fish/config.fish.$OS" $HOME/.config/fish/config.fish
ln -s "$DOTFILES/fish/functions" $HOME/.config/fish/
