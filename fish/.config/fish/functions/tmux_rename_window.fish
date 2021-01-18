function tmux_rename_window --on-variable PWD
	tmux rename-window (basename $PWD)
end
