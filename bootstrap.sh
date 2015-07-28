#!/usr/bin/env sh

# The directory where the dotfiles repo is clone or symlinked
DOTFILES="$HOME/.files"

# Some files have OS-specific versions (since I use both OS X and Ubuntu)
: ${DOTFILES_OS:?"DOTFILES_OS is not set. Possible values: osx, ubuntu."}
OS=$DOTFILES_OS

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
