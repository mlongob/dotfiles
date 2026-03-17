if ! [[ "$TERM" == "screen-256color" || "$TERM" == "dumb" ]]; then
    export TERM=xterm-256color
fi

if [[ "$TERM" == "dumb" ]]; then
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    PS1='> '
    return
fi

# Allow local customizations before main config
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

source ~/.zsh/plugins.zsh
source ~/.zsh/settings.zsh
source ~/.zsh/aliases.zsh

# Prompt
eval "$(starship init zsh)"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# VS Code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Allow local customizations after main config
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi
