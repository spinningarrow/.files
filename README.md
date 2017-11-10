# .files

Personal configuration files, using [brew bundle][] to manage dependencies, and
[stow][] to install dotfiles.

## Install

1. Install [GNU Stow][stow]

       brew install stow

2. Clone this repository to the home directory

       git clone https://github.com/spinningarrow/.files ~

3. Install a particular configuration using stow

       cd ~/.files
       stow fish
	
Other useful `stow` options:

- `-R`: restow
- `-D`: delete

## Related

- [spinningarrow/up][up]
- [dotfiles][]

[dotfiles]: http://dotfiles.github.io/
[stow]: https://www.gnu.org/software/stow/
[up]: https://github.com/spinningarrow/up
[brew bundle]: https://github.com/Homebrew/homebrew-bundle
