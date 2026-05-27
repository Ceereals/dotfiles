source /usr/share/cachyos-fish-config/cachyos-config.fish
zoxide init fish | source
starship init fish | source
mise activate fish | source
zoxide init --cmd cd fish | source
direnv hook fish | source
# try: native fish wrapper. `try init`'s generated function captures `try exec` output into a
# newline-split list, but `try exec` emits a bash-style multiline script (leading `#` comment +
# `\` line-continuations) that fish then can't eval. `string collect` keeps it as one string so
# fish's eval handles the comment and continuations correctly.
function try --description 'ephemeral workspace manager'
    set -l out (/usr/bin/try exec --path ~/Work/tries $argv 2>/dev/tty | string collect)
    set -l rc $pipestatus[1]
    if test $rc -ne 0
        printf '%s\n' $out
        return $rc
    end
    eval $out
end
# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
alias cat=bat