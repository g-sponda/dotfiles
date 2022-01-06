# Cacaricos dotfiles

My collection of configuration files, the usage of those files is discouraged, use at your own risk.

## Requirements

All the required software to run this repo is listed below:
* neovim
* fish
* exa
* tmux
* peco
* jq
* direnv

```
brew install neovim fish exa tmux peco jq direnv
```
Extra stuff I have installed:
* spotify-tui
* pre-commit
* ipcalc
* ghq
* bat
* viu
* ghostscript
* imagemagick
* poppler
* libmagic
* jump
* starship

```
brew install spotify-tui pre-commit ipcalc ghq bat viu ghostscript imagemagick poppler libmagic jump libx11 starship
```

Pip stuff:
* rainbowstream

```
pip install rainbowstream
```

## Installation

Clone the repo and run make install, this will create a symbolic link of the configuration files to your $HOME dir. It should not overwrite your already existing symlinks if any.
```
git clone git@github.com:cacarico/dotfiles.git
cd dotfiles
make install
```

Or with `ghq` :p
```
ghq git@github.com:cacarico/dotfiles.git
cd $HOME/ghq/github.com/cacarico/dotfiles
```

## Config

### Fish

Have my personal abreviatons, configs and functions for fish.

Configs
* nnn
* peco

Funtions
* n

### Nvim

Lots of configuration for my NeoVim editor.

coc configuraton
* enable terraform language server


Configs for:
* NERDTree
* Glow
* Fugitive
* Telescope

