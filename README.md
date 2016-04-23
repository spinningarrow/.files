# .files

My [dotfiles][]. Feel free to use them however you
like.

The git history is a good place to look if you are curious about something in
this repository.

## Setup

I'm using [GNU Stow][stow] to manage my dotfiles without the hassle of a custom shell
script that does the symlinking. Using `stow` is quite straightforward:

    stow -t ~ git
    stow -t ~ vim

and so on to install, and

    stow -t ~ -D git
	stow -t ~ -D vim

and so on to uninstall.

[dotfiles]: http://dotfiles.github.io/
[stow]: https://www.gnu.org/software/stow/
