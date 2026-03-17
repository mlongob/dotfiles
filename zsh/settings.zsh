# Initialize completion
autoload -Uz compinit && compinit

# Initialize editing command line
autoload -U edit-command-line && zle -N edit-command-line

# Set automatic cd (typing directory name with no 'cd')
setopt autocd

# Enable interactive comments (# on the command line)
setopt interactivecomments

# Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory
setopt extendedhistory

# Time to wait for additional characters in a sequence
KEYTIMEOUT=10 # corresponds to 100ms

# Default editor
export EDITOR="vim"

# Use vim style line editing in zsh
bindkey -v
# Movement
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'G' end-of-buffer-or-history
# Undo
bindkey -a 'u' undo
bindkey -a '^R' redo
# Edit line in editor
bindkey -a '^V' edit-command-line
# Backspace
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# jk to normal mode
bindkey -M viins 'jk' vi-cmd-mode

# Use incremental search
bindkey "^R" history-incremental-search-backward

# zoxide (better cd)
eval "$(zoxide init zsh)"

# direnv (per-project env vars)
if command -v direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

# mise (runtime version manager)
if command -v mise &>/dev/null; then
    eval "$(mise activate zsh)"
fi
