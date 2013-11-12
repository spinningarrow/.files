# Set path
set -x PATH $PATH /Users/sahil/Documents/dev/android/adt/sdk/platform-tools /Users/sahil/Documents/dev/android/adt/sdk/tools /usr/local/heroku/bin /usr/local/bin /usr/local/sbin $HOME/bin

# Initialise rbenv
# Needs latest rbenv (> 0.4.0; i.e., can't use Homebrew just yet)
set -x PATH $PATH $HOME/.rbenv/bin
. (rbenv init -|psub)

# Include aliases
. $HOME/.files/aliases

# Set default pager and options for less
# (copied from zsh, makes it scroll faster for some reason)
set -x PAGER less
set -x LESS '-F -g -i -M -R -S -w -X -z-4'

# Set colors for fish prompt
set fish_color_command 89adff
set fish_color_cwd ffffa4
set fish_color_host 8cd6ff
set fish_color_user fdd8aa

# Make grep use color
set -x GREP_OPTIONS '--color=auto'

