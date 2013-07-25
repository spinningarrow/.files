# Raring to brew
export PATH="/usr/local/share/npm/bin:/usr/local/share/python:/usr/local/bin:~/bin:$PATH"

# Easier than fixing the Unicode issues Vim and nano seem to have
export EDITOR="vim"

# Use the source
source ~/.files/.aliases
source ~/.files/.functions
source ~/.files/.bash_prompt

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#function parse_git_dirty {
#	[[ $(git status --porcelain 2> /dev/null | tail -n1) != "" ]] && echo "*"
#}
#function parse_git_branch {
#	test -d .git && (git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)] /")
#}

#export PS1='\u:${PWD##*/} \[\033[0;33m\]$(parse_git_branch)\[\033[0m\]$ '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
