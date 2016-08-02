function , --description 'Commajump'
	set found_paths (grep -i $argv ~/.commajump | grep -v (pwd)\$)
	set found_folders (printf '%s\n' $found_paths | xargs basename | grep -in $argv)

	if test (count $found_folders) -ne 0
		set found_paths $found_paths[(printf '%s\n' $found_folders | cut -d':' -f1 | paste -d' ' -s -)]
	end

	cd (printf '%s\n' $found_paths | uniq -c | sort -nr | head -1 | tr -s ' ' | cut -d' ' -f3)
end
