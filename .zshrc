# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.rdey-shell-extensions/zsh/functions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alias
alias dc="docker-compose"
alias lsa="ls -goa"
alias gst="git status -sb"
alias gdf="git diff --color-words"
alias gdt="git difftool"

setopt prompt_subst
precmd() {
    if [[  -n "$(git rev-parse --is-inside-work-tree 2>/dev/null)"  ]];
    then
        # Git info in prompt
        branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
        untracked=$(git status --porcelain 2>/dev/null | grep '^??' | wc -l|tr -d '[:space:]')
        tracked=$(git status --porcelain | grep -v '^??' | grep -E '^[MADRC]' | wc -l|tr -d '[:space:]')
        unpushed_commits=$(git log --branches --not --remotes --oneline | wc -l|tr -d '[:space:]')
        PS1='%2/ %{%F{red}(${branch})%} %{%F{yellow}%}[${untracked} ${tracked} ${unpushed_commits}]%{%f%} $'
    else
        PS1='%2/ %{%F{red}()%f%}'
    fi
}

