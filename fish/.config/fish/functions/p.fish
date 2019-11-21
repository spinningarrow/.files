# Defined in - @ line 1
function p
	op get item --vault=$argv[1] $argv[2] | jq -r '.details.fields[] | select(.designation=="password").value' | tr -d '
' | pbcopy
end
