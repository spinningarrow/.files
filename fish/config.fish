# Set path
set -x PATH $HOME/bin $PATH

# Initialise autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

# Activate chruby
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

# Include aliases
. $HOME/.files/aliases

# Set default pager and options for less
# (copied from zsh, makes it scroll faster for some reason)
# set -x PAGER less
# set -x LESS '-F -g -i -M -R -S -w -X -z-4'
set -x LESS '-R'

# Git prompt options
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_show_informative_status 'yes'

# Make grep use color
set -x GREP_OPTIONS '--color=auto'

source $HOME/.config/fish/config.fish.include
