function __commajump_add --on-variable PWD
	test $PWD = $HOME; and return
	echo $PWD >> ~/.commajump
end
