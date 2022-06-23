# Set path
set -g fish_user_paths $fish_user_paths /opt/homebrew/bin $HOME/bin $HOME/go/bin

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
set -x COLORTERM true

if which direnv > /dev/null
	eval (direnv hook fish)
end
