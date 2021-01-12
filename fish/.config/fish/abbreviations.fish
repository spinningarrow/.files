abbr -a g git
abbr -a ga git add
abbr -a gap git add --patch
abbr -a gb git branch
abbr -a gc git commit
abbr -a gco git checkout
abbr -a gd git diff
abbr -a gdc git diff --color-words
abbr -a gds git diff --staged
abbr -a gf git fetch
abbr -a gl git log --graph --decorate
abbr -a gl1 git log -1
abbr -a gll git log \'@\{u\}..\'
abbr -a glr git log \'..@\{u\}\'
abbr -a gr git remote
abbr -a gs git status -sb
abbr -a guser git config --file (git config --show-origin user.name | cut -f1 | cut -d':' -f2) user.name

abbr -a -- - 'cd -'
abbr -a axel 'axel -a'
abbr -a b 'brew'
abbr -a c3 'cal -3'
abbr -a dl 'wget -r -l 1 -np -nd'
abbr -a fn 'find . -iname'
abbr -a l 'ls -lahp'
abbr -a le 'less'
abbr -a lx 'less -X'
abbr -a ncl 'nix-shell -p clojure --command "clojure -A:rebel -A:cheshire"'
abbr -a np 'nix-shell -p'
abbr -a ns 'nix-shell --command fish -p'
abbr -a o 'open .'
abbr -a ogr 'open (git remote get-url origin)'
abbr -a gpc 'gopass show -C'
abbr -a ql 'qlmanage -p'
abbr -a t 'tmux'
abbr -a ta 'type -a'
abbr -a tsp 'tmux show-buffer | pbcopy'
abbr -a v vim
