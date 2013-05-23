# Update path

set -x PATH $PATH /usr/local/share/npm/bin /usr/local/share/python /usr/local/bin /usr/local/sbin $HOME/bin

# Include aliases
. $HOME/dotfiles/aliases

# Set colors

set fish_color_command 89adff
set fish_color_cwd ffffa4 
set fish_color_host 8cd6ff
set fish_color_user fdd8aa

set GREP_COLOR '' # use default grep color
