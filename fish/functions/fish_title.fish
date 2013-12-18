function fish_title --description 'Set a custom fish title if the $FISH_TITLE variable is set'
	if set --query FISH_TITLE
		echo $FISH_TITLE
	else
		echo $_ ' '
		pwd
	end
end
