function tmux_rename_window --on-variable PWD
	tmux info >/dev/null 2>&1 ; and tmux rename-window (basename $PWD)
end
