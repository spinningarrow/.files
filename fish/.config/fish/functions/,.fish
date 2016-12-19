function , --description 'Commajump'
	set found_paths (grep $argv ~/.commajump | grep -v (pwd)\$)
	set found_folders (printf '%s\n' $found_paths | xargs basename | grep -in $argv)

	if test (count $found_folders) -ne 0
		set found_paths $found_paths[(printf '%s\n' $found_folders | cut -d':' -f1 | paste -d' ' -s -)]
	end

	set found_directory (printf '%s\n' $found_paths | uniq -c | sort -nr | head -1 | tr -s ' ' | cut -d' ' -f3-)

	if not test -z $found_directory; and not test -d $found_directory
		grep -v \^$found_directory\$ ~/.commajump > ~/.commajump.temp; mv ~/.commajump{.temp,}; and echo Nonexistent path $found_directory pruned.
	end

	cd $found_directory ^ /dev/null; or echo No directories matching "'$argv'" found.
end
