# Set path
set -x PATH $HOME/bin $PATH

# Include abbreviations
source $HOME/.config/fish/abbreviations.fish

# Initialize commajump
source ~/.config/fish/functions/__commajump_add.fish

# Activate chruby
[ -f /usr/local/share/chruby/chruby.fish ]; and source /usr/local/share/chruby/chruby.fish
[ -f /usr/local/share/chruby/auto.fish ]; and source /usr/local/share/chruby/auto.fish

# Git prompt options
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_show_informative_status 'yes'

# Set program options
set -x GREP_OPTIONS '--color=auto'
set -x LESS '-R'

# Set environment variables
set -x JAVA_HOME (/usr/libexec/java_home)
