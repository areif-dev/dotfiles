[[ $- == *i* ]] && source $HOME/.local/share/blesh/ble.sh --noattach

export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/share:$HOME/.cargo/bin:$PATH

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

alias la="ls -a"
alias ll="ls -lah --color=auto"
alias led="ledger -f $HOME/Sync/2024.journal"

if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

[[ ${BLE_VERSION-} ]] && ble-attach

if command -v atuin &> /dev/null; then
    eval "$(atuin init bash)"
fi
