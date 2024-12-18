# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.rdey-shell-extensions/zsh/functions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alias
alias dc="docker-compose"

alias lsa="ls -goaG"

alias gco="git checkout"
alias gst="git status -sb"
alias gdf="git diff --color-words"
alias gdt="git difftool"
alias gl="git log -10 --pretty=oneline"

alias ecs="rdeyqa ecs --fix"
alias stan="rdeyqa phpstan"
alias phpunit="rdeyqa phpunit"

# Git info in prompt
setopt prompt_subst
precmd() {
    if [[  -n "$(git rev-parse --is-inside-work-tree 2>/dev/null)"  ]];
    then
        branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')

        untracked=$(git status --porcelain 2>/dev/null | grep '^??' | wc -l|tr -d '[:space:]')
        tracked=$(git status --porcelain | grep -v '^??' | grep -E '^[MADRC]' | wc -l|tr -d '[:space:]')
        modified_files=$(git ls-files --modified | wc -l | tr -d '[:space:]')
        total_changed_files=$((untracked + tracked + modified_files))

        staged=$(git diff --cached --name-only | wc -l | tr -d '[:space:]')

        behind_count=$(git rev-list --right-only --count HEAD...@{u} 2>/dev/null | tr -d '[:space:]')
        ahead_count=$(git rev-list --left-only --count HEAD...@{u} 2>/dev/null | tr -d '[:space:]')
        PS1='%2/ %{%F{red}(${branch})%} %{%F{yellow}%}[U:${total_changed_files} S:${staged} -:${behind_count} +:${ahead_count}]%{%f%} $ '
    else
        PS1='%2/ $ '
    fi
}

