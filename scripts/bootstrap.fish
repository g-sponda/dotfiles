#!/usr/bin/env fish

function create_links
  ln -s $PWD/config/tmux.conf $HOME/.tmux.conf
  ln -s $PWD/config/config.fish $HOME/.config/fish/config.fish
  ln -s $PWD/config/alacritty.yml $HOME/.config/alacritty/alacritty.yml
  ln -s $PWD/config/nvim/init.vim $HOME/.config/nvim/init.vim
  ln -s $PWD/config/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
end

function remove_links
  unlink $HOME/.tmux.conf
  unlink $HOME/.config/fish/config.fish
  unlink $HOME/.config/alacritty/alacritty.yml
  unlink $HOME/.config/nvim/init.vim
  unlink $HOME/.config/nvim/coc-settings.json
end

switch $argv
  case create_links
    create_links
  case remove_links
    remove_links
  case '*'
    echo Option $argv not found
end
