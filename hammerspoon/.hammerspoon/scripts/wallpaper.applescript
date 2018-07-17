tell application "System Events"
	set file_list to files of folder "/Users/sahil/Dropbox/Wallpapers/"
	set chosen_file to some item of file_list
	set picture of every desktop to POSIX path of chosen_file
end tell
