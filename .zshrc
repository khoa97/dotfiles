HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=1000
# If not running interactively, don't do anything
[[ -o interactive ]] || return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pacman="sudo pacman"
alias mkdir="mkdir -p"
alias weather="curl https://wttr.in"
alias audio="pavucontrol"
alias vim="nvim"
alias v="nvim"
alias paru="paru --bottomup"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
#autoload -U colors && colors
PROMPT="%F{121}[%n@%m %1~]$%f "
export EDITOR="nvim"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /home/khoa/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval $(thefuck --alias)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey -v
bindkey '^R' history-incremental-search-backward

export PATH=$PATH:/home/khoa/.cargo/bin


fz() {
    local choice
    choice=$(find /home/khoa -type d,f -not -path '*/\.*' | fzf)

    # Exit if nothing is selected
    if [ -z "$choice" ]; then
        return 0
    fi

    # Echo the choice
    echo "You selected: $choice"

    # Check if choice is a file or directory
    if [ -f "$choice" ]; then
        vim "$choice"
    elif [ -d "$choice" ]; then
        cd "$choice" || return 1
    fi
}

