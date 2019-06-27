# External plugins

if ! [[ "$TERM" == "screen-256color" || "$TERM" == "dumb" ]]; then
    export TERM=xterm-256color
fi

if [[ "$TERM" == "dumb" ]]; then
    echo "Dumb ssh connection; making simple prompt"
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    unfunction preexec
    PS1='> '
    return
fi

if [ -n "$SSH_CONNECTION" ]; then
    export ZSH_TMUX_AUTOSTART=false
fi

source ~/.zsh/plugins.zsh

# Settings
source ~/.zsh/settings.zsh

# Aliases
source ~/.zsh/aliases.zsh

# Custom prompt
source ~/.zsh/prompt.zsh

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
