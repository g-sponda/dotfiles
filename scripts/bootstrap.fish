#!/usr/bin/env fish

set CONFIG_DIR $PWD/config
set FISH_CONFIG_DIR $CONFIG_DIR/fish
set HOME_CONFIG_DIR $HOME/.config
set FISH_HOME_CONFIG_DIR $HOME_CONFIG_DIR/fish/conf.d

function create_links

  # FISH
  ln -s $FISH_CONFIG_DIR/config.fish $HOME_CONFIG_DIR/fish/config.fish
  for fish_file in $FISH_CONFIG_DIR/conf.d/*
   ln -s $fish_file $FISH_HOME_CONFIG_DIR/
  end

  ln -s $CONFIG_DIR/tmux.conf $HOME/.tmux.conf
  ln -s $CONFIG_DIR/alacritty.yml $HOME_CONFIG_DIR/alacritty/alacritty.yml
  ln -s $CONFIG_DIR/nvim/init.vim $HOME_CONFIG_DIR/nvim/init.vim
  ln -s $CONFIG_DIR/nvim/coc-settings.json $HOME_CONFIG_DIR/nvim/coc-settings.json
end

function remove_links

  # Fish
  unlink $HOME/.config/fish/config.fish
  for fish_file in (ls $FISH_CONFIG_DIR/conf.d)
    unlink $FISH_HOME_CONFIG_DIR/$fish_file
  end

  unlink $HOME/.tmux.conf
  unlink $HOME_CONFIG_DIR/alacritty/alacritty.yml
  unlink $HOME_CONFIG_DIR/nvim/init.vim
  unlink $HOME_CONFIG_DIR/nvim/coc-settings.json
end

switch $argv
  case create_links
    create_links
  case remove_links
    remove_links
  case '*'
    echo Option $argv not found
end
