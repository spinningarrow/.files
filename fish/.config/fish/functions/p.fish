function p
    pass show personal/dummy
    find ~/.password-store -name '*.gpg' | sed -E 's:'$HOME/.password-store/'(.+).gpg:\1:' | fzf-tmux --bind "enter:execute(pass show {} | fzf --tac --no-sort | xargs echo -n | pbcopy < /dev/tty > /dev/tty 2>&1)"
end
