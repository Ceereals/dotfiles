source /usr/share/cachyos-fish-config/cachyos-config.fish
zoxide init fish | source
starship init fish | source
mise activate fish | source
zoxide init --cmd cd fish | source
direnv hook fish | source
# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
