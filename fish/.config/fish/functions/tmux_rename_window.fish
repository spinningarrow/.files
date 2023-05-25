function tmux_rename_window --on-variable PWD
	tmux info >/dev/null 2>&1 ; and tmux rename-window (basename (git config --get remote.origin.url; or pwd))
end
