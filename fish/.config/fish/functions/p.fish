function p
    pass show personal/dummy
    find ~/.password-store -name '*.gpg' | sed 's:'$HOME/.password-store/'::' | sed 's/.gpg//' | fzf-tmux --bind "enter:execute(pass show {} | fzf --tac --no-sort | xargs echo -n | pbcopy < /dev/tty > /dev/tty 2>&1)"
end
