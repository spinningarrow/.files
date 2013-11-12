# Set path
set -x PATH $PATH /Users/sahil/Documents/dev/android/adt/sdk/platform-tools /Users/sahil/Documents/dev/android/adt/sdk/tools /usr/local/heroku/bin /usr/local/bin /usr/local/sbin $HOME/bin

# Initialise rbenv
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Include aliases
. $HOME/.files/aliases

# Set default pager and options for less
# (copied from zsh, makes it scroll faster for some reason)
set -x PAGER less
set -x LESS '-F -g -i -M -R -S -w -X -z-4'

# Set colors
set fish_color_command 89adff
set fish_color_cwd ffffa4
set fish_color_host 8cd6ff
set fish_color_user fdd8aa

set GREP_COLOR '' # use default grep color
