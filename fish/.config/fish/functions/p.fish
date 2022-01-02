# Defined in - @ line 1
function p
	pass show (gopass ls --flat | fzf) | fzf --bind "enter:execute(echo -n {} | pbcopy)"
end
