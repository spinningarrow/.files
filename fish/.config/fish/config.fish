# Set path
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/bin

# Include abbreviations
source $HOME/.config/fish/abbreviations.fish

# Initialize special functions
source $HOME/.config/fish/functions/__commajump_add.fish
source $HOME/.config/fish/functions/tmux_rename_window.fish

# Git prompt options
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'

# Set program options
set -x HOMEBREW_NO_AUTO_UPDATE true
set -x HOMEBREW_NO_INSTALL_CLEANUP true
set -x COLORTERM true
set -x CLOUDSDK_PYTHON /usr/bin/python3

if which direnv > /dev/null
	eval (direnv hook fish)
end
