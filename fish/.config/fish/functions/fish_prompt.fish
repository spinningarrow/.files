function fish_prompt --description 'Write out the prompt'
	# Set custom color variables
	set -l username_color fdd8aa
	set -l prompt_color 8cd6ff

	set -l last_status $status

	# Nix
	set_color $fish_color_operator
	test (echo $PATH | grep /nix/store); and echo -n '[nix] '
	set_color normal

	# PWD
	set_color $fish_color_cwd
	echo -n (pwd | sed -e "s|$HOME|~|")
	set_color normal

	__fish_git_prompt

	set jobs_count (jobs | wc -l | xargs)
	if test $jobs_count != '0'
		printf ' (↩ %s)' $jobs_count
	end

	echo

	if not test $last_status -eq 0
		set_color $fish_color_error
	else
		set_color $prompt_color
	end

	echo -n '∫ '
	set_color normal
end
