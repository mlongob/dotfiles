# ~/.zprofile — login shell configuration
# Sourced once at login, before .zshrc

# Allow local customizations before main config
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# Personal scripts
export PATH="$HOME/.dotfiles/bin:$PATH"

# Local bin
export PATH="$HOME/.local/bin:$PATH"
