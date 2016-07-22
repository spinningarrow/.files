function fish_prompt --description 'Write out the prompt'
  # Set custom color variables
  set -l username_color fdd8aa
  set -l prompt_color 8cd6ff

  set -l last_status $status

  # PWD
  set_color $fish_color_cwd
  echo -n (pwd | sed -e "s|$HOME|~|")
  set_color normal

  __fish_git_prompt
  echo

  if not test $last_status -eq 0
    set_color $fish_color_error
  else
    set_color $prompt_color
  end

  echo -n '∫ '
  set_color normal
end
