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
setopt hist_ignore_all_dups
setopt share_history

# Time to wait for additional characters in a sequence
KEYTIMEOUT=10 # corresponds to 100ms

# Default editor
export EDITOR="vim"

# GPG — required for commit signing to work correctly in terminal emulators
export GPG_TTY=$(tty)

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

# jk to normal mode
bindkey -M viins 'jk' vi-cmd-mode

# atuin (better shell history — replaces history-substring-search and ^R)
if command -v atuin &>/dev/null; then
    eval "$(atuin init zsh)"
fi

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
