function p
    gopass ls --flat | fzf-tmux --bind "enter:execute(gopass show -n -u {} | fzf --tac --no-sort | xargs echo -n | pbcopy < /dev/tty > /dev/tty 2>&1)"
end
