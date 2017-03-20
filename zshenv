# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# Add local bin folder (used by stack)
export PATH=~/.local/bin:${PATH}
