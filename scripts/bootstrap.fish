#!/usr/bin/env fish

set CONFIG_DIR
set FISH_CONFIG_DIR config/fish
set HOME_CONFIG_DIR $HOME/.config
set FISH_HOME_CONFIG_DIR $HOME_CONFIG_DIR/fish/conf.d

function create_links

  # FISH
  ln -s $FISH_CONFIG_DIR/config.fish $HOME_CONFIG_DIR/fish/config.fish
  for fish_file in $FISH_CONFIG_DIR/conf.d/*
   ln -s $fish_file $FISH_HOME_CONFIG_DIR/
  end

  ln -s config/tmux.conf $HOME/.tmux.conf
  ln -s config/alacritty.yml $HOME/.config/alacritty/alacritty.yml
  ln -s config/nvim/init.vim $HOME/.config/nvim/init.vim
  ln -s config/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
end

function remove_links

  # Fish
  unlink $HOME/.config/fish/config.fish
  for fish_file in $FISH_CONFIG_DIR/conf.d/*
    unlink $HOME/.$fish_file
  end

  unlink $HOME/.tmux.conf
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
