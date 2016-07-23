function , --description 'Commajump'
	cd (grep $argv ~/.commajump | grep -v (pwd)\$ | uniq -c | sort -nr | head -1 | cut -d' ' -f5)
	# cd (cat ~/Library/autojump/autojump.txt | grep $argv | grep -v (pwd)\$ | sort -r | head -1 | cut -f 2)
end
