function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

  # User
  set_color $fish_color_user
  echo -n (whoami)
  set_color normal

  echo -n ' in '

  # PWD
  set_color $fish_color_cwd
  # echo -n (prompt_pwd)
  echo -n (pwd | sed -e "s|$HOME|~|")
  set_color normal

  __terlar_git_prompt
  echo

  if not test $last_status -eq 0
    set_color $fish_color_error
  else
    set_color $fish_color_host
  end

  echo -n '∫ '
  set_color normal
end
