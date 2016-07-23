# Set path
set -x PATH $HOME/bin $PATH

# Include abbreviations
source $HOME/.config/fish/abbreviations.fish

# Initialise autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

# Initialize commajump
source ~/.config/fish/functions/__commajump_add.fish

# Activate chruby
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

# Git prompt options
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_show_informative_status 'yes'

# Set program options
set -x GREP_OPTIONS '--color=auto'
set -x LESS '-R'

# Set environment variables
set -x JAVA_HOME (/usr/libexec/java_home)
