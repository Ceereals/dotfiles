# Alias
# ---
#
# alias k="kubectl"
# alias h="helm"
# alias tf="terraform"
# alias a="ansible"
# alias ap="ansible-playbook"
# alias dt="datree"

# mac OS shortcuts
# alias code="open -a 'Visual Studio Code'"



# ALIAS COMMANDS
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"
alias g="goto"
alias grep='grep --color'
alias update="source ~/.zshrc"
alias change="code ~/.zshrc"
alias pub="flutter pub"
alias gam="git commit -am"
alias gp="git push"
alias prepare="~/.dotfiles/init.sh"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias pest='./vendor/bin/pest'
alias run='docker-compose run --rm'

# PHP

installedPhpVersions=($(brew ls --versions | ggrep -E 'php(@.*)?\s' | ggrep -oP '(?<=\s)\d\.\d' | uniq | sort))

for phpVersion in ${installedPhpVersions[*]}; do
    value="{"

    for otherPhpVersion in ${installedPhpVersions[*]}; do
        if [ "${otherPhpVersion}" = "${phpVersion}" ]; then
            continue
        fi

        # unlink other PHP version
        value="${value} brew unlink php@${otherPhpVersion};"
    done

    # link desired PHP version
    value="${value} brew link php@${phpVersion} --force --overwrite; } &> /dev/null && php -v"

    alias "${phpVersion}"="${value}"
done