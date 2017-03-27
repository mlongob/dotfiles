# Mario Longobardi's Dotfiles
A collection of dotfiles for my development environment.

## Components
* Editor: `emacs` (with `vim` backup)
* Shell: `zsh` (with `bash` backup)
* Terminal multiplexer: `tmux`
* VCS: `git`

This configuration is well tuned for developing in the following languages:
* `C++`
* `C`
* `Haskell`
* `Java`
* `Javascript`
* `Python`
* `Scala`
* `Scheme`
* `Shellscript`

## Managers
My dotfiles use the following managers:
* [Dotbot](https://github.com/anishathalye/dotbot) for dotfiles installation
* [Vundle](https://github.com/gmarik/Vundle.vim) for `vim` plugin management
* [zgen](https://github.com/tarjoilija/zgen) for `zsh` plugin management
* [tpm](https://github.com/tmux-plugins/tpm) for `tmux` plugin management

## Prerequisites
The following packages need to be installed on the system before installing the dotfiles:
* `build-essential`
* `cmake`
* `emacs`
* `git`
* `htop`
* `python-dev`
* `shellcheck`
* `tmux`
* `vim-gtk`
* `xclip`
* `xsel`
* `zsh`

If you are on Ubuntu, you can install them by running:
```
./install_ubuntu_dependencies.sh
```

## Installing
In order to install the dotfiles:
```
chsh -s $(which zsh)   # Make zsh the default shell
git clone https://github.com/mlongob/dotfiles.git ~/.dotfiles
~/.dotfiles/install
```

The procedure will:
* Install the dotfiles in your home
* Upgrade all submodules
* Install vim plugins
* Install tmux plugins
* Build YouCompleteMe for vim
* Install patched fonts with special symbols

## Making Local Customizations
You can make local customizations for some programs by editing these files:

* `git` : `~/.gitconfig_local`
* `spacemacs` : `~/.spacemacs_local`
* `tmux` : `~/.tmux_local.conf`
* `vim` : `~/.vimrc_local`
* `zsh` : `~/.zshrc_local_after` run after `.zshrc`
* `zsh` : `~/.zshrc_local_before` source before `.zprofile`

## License
Copyright (c) 2015 Mario Longobardi. Released under the MIT License. See
[LICENSE][license] for details.

[license]: LICENSE
