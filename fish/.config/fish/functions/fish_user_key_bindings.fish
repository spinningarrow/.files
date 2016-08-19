function fish_user_key_bindings
	bind --erase \cd
	bind \e\[A 'history --merge ; up-or-search'
end
