function forgit
	for d in */
		pushd $d
		test -d .git && echo $d && eval $argv
		echo
		popd
	end
end

