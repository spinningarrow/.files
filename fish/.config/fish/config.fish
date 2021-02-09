# Set path
set -g fish_user_paths $fish_user_paths $HOME/bin

# Include abbreviations
source $HOME/.config/fish/abbreviations.fish

# Initialize special functions
source $HOME/.config/fish/functions/__commajump_add.fish
source $HOME/.config/fish/functions/tmux_rename_window.fish

# Git prompt options
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_show_informative_status 'yes'

# Set program options
set -x HOMEBREW_NO_AUTO_UPDATE true

if which direnv > /dev/null
	eval (direnv hook fish)
end
