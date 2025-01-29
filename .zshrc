# If you come from bash you might have to change your $PATH
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/share:$HOME/.cargo/bin:$HOME/Sync/ledger-scripts:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

if command -v nvim &> /dev/null; then
    export EDITOR="nvim"
elif command -v vim &> /dev/null; then
    export EDITOR="vim"
elif command -v vi &> /dev/null; then
    export EDITOR="vi"
elif command -v nano &> /dev/null; then
    export EDITOR="nano"
fi

export LEDGER_FILE="$HOME/Sync/2024.journal"

DISABLE_AUTO_UPDATE=true

ZSH_THEME="alanpeabody"

if [ $(hostname) = "desktop" ]; then
    source $ZSH/oh-my-zsh.sh
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

alias la="ls -a"
alias ll="ls -lah --color=auto"
alias led="hledger"

if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

if command -v atuin &> /dev/null; then
    eval "$(atuin init zsh)"
fi
