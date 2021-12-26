if status is-interactive
    # Commands to run in interactive sessions can go here
end

# exports nvim as default editor
export EDITOR=nvim

# -----------------------------
# PATHS -----------------------
# -----------------------------
set PATH $PATH:/Users/caio.teixeira/.cargo/bin

# -----------------------------
# Abbreviations ---------------
# -----------------------------

# Shorts
abbr -a vim nvim
abbr -a k 'kubectl'

# Edit files
abbr -a arc 'nvim ~/.config/alacritty/alacritty.yml'
abbr -a vrc 'nvim ~/.config/nvim/init.vim'
abbr -a frc 'nvim ~/.config/fish/config.fish'
abbr -a trc 'nvim ~/.tmux.conf'


# Sources
abbr -a ff 'source ~/.config/fish/config.fish'

# Install Plugins Vim
abbr -a ninstall nvim +PlugInstall +qal

# Opens AWS with lastpass
abbr -a creds_aws 'open -a "Google Chrome" https://identity.lastpass.com/redirect\?id\=4cceaabd-c1f2-4854-8135-dd5660fb76f4'

# Vi mode
function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end
