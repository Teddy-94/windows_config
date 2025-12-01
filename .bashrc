alias nvim='~/nvim-linux-x86_64.appimage'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.cargo/env"

. "/home/teddy/.deno/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# alias
alias dc="docker-compose"
alias lsa="ls -goa"
alias gst="git status -sb"
alias gdf="git diff --color-words"
alias gdt="git difftool"
alias gco="git checkout"


get_git_info() {
    # Check if we are inside a Git repository
    if [[ -n "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then
        
        # Get current branch name
        branch=$(git symbolic-ref HEAD 2>/dev/null | sed 's/refs\/heads\///')

        # Get counts for different file states

        untracked=$(git status --porcelain 2>/dev/null | grep '^??' | wc -l | tr -d '[:space:]')
        tracked=$(git status --porcelain | grep -v '^??' | grep -E '^[MADRC]' | wc -l | tr -d '[:space:]')
        modified_files=$(git ls-files --modified | wc -l | tr -d '[:space:]')
        total_changed_files=$((untracked + tracked + modified_files))
        staged=$(git diff --cached --name-only | wc -l | tr -d '[:space:]')

        behind_count=$(git rev-list --right-only --count HEAD...@{u} 2>/dev/null | tr -d '[:space:]')
        ahead_count=$(git rev-list --left-only --count HEAD...@{u} 2>/dev/null | tr -d '[:space:]')
        
        # Define the ANSI color codes for Bash
        RED='\[\033[0;31m\]'
        YELLOW='\[\033[0;33m\]'
        NC='\[\033[0m\]' # No Color
        
        # Construct the PS1 with Bash escape sequences
        # \w: current working directory
        # \$ : standard prompt symbol
        PS1="\w ${RED}(${branch})${NC} ${YELLOW}[U:${total_changed_files} S:${staged} -:${behind_count} +:${ahead_count}]${NC} \$ "
    else
        # Not in a git repo: simple prompt
        PS1='\w \$ '
    fi
}

PROMPT_COMMAND='get_git_info'
