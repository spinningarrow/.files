# .files

My [dotfiles](http://dotfiles.github.io/). Feel free to use them however you
like.

## Notes

Reasons for specific lines can usually be found by `git blame`ing the file. If in doubt, feel free to ask!

#### General
 
    .editorconfig
    .gemrc
    .jshintrc
    .ssh_config
    .tmux.conf

These are, respectively, configuration files for [EditorConfig][], [Ruby Gems][], [JSHint][], [SSH][], and [Tmux][]. Nothing too fancy going on here.

#### Git

    .gitconfig
    .gitconfig.osx
    .gitconfig.ubuntu
    .gitignore

Configuration files for [Git][]. `.gitignore` contains generic files to be ignored; project-specific files are in the respective project's ignore file.

`.gitconfig.osx` and `.gitconfig.ubuntu` contain configurations specific to that platform (since I currently use both) such as the `helper` configuration. These get magically wired up using the `bootstrap.sh` script (see below).

#### Vim
    .gvimrc
    .vimrc

I've been using (and learning) [Vim][] of late. I started out using [MacVim][] but am currently using Vim from the terminal so the `.gvimrc` is probably going to vanish soon.

The `.vimrc` was created from scratch in an effort to better understand how things work and is updated frequently as a tweak things or find better ways to do them. I try not to put anything in there which I can't understand.

I use [Vundle][] for managing plugins.

#### Bash

    bash
    ├── bash-aliases
    ├── bash-functions
    └── bash_prompt
    
I switched to using the [fish shell][] a while back so these aren't used much except when I want to show someone how to customize their bash prompt or something.

#### Fish

    fish
    ├── config.fish.osx
    ├── config.fish.ubuntu
    └── functions

Fish shell configurations (if you're still using bash, I recommend you definitely give the [fish shell][] a spin – it's great!).

The configs for OS X and Ubuntu are separate; I still need to pull out the common features like I did for the git configs.

#### Sublime Text

    sublime
    ├── Color Schemes - Custom
    │   └── Putty.tmTheme
    ├── Preferences.sublime-settings
    ├── SublimeLinter.sublime-settings
    ├── markdown-emphasis.sublime-snippet
    └── markdown-strength.sublime-snippet

Preferences for Sublime Text, including a slightlty customised theme whose source I can't remember. I've almost entirely switched to vim, but these might still be useful.


## Setup

Running the `bootstrap.sh` script will symlink some of the scripts to the home (`~`) directory. Don't forget to change the `$DOTFILES` and `$OS` variables if you use it!

[EditorConfig]: http://editorconfig.org/
[Ruby Gems]: https://rubygems.org/
[JSHint]: http://jshint.com/
[SSH]: http://linux.die.net/man/5/ssh_config
[Tmux]: http://tmux.sourceforge.net/
[Git]: http://git-scm.com/
[Vim]: http://www.vim.org/
[MacVim]: https://code.google.com/p/macvim/
[Vundle]: https://github.com/gmarik/Vundle.vim
[fish shell]: http://fishshell.com/