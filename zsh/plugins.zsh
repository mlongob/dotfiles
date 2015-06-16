#################
#  Zgen setup   #
#################

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
if [ "$TERM" != "screen-256color" ]; then
    export TERM=xterm-256color
fi

if [ -n "$SSH_CONNECTION" ]; then
    export ZSH_TMUX_AUTOSTART=false
fi

# Load antigen
source ${HOME}/.dotfiles/zgen/zgen.zsh

# check if there's no init script
if ! zgen saved; then
  echo "Creating a zgen save"

  # Load robbyrussell's oh-my-zsh's library
  zgen oh-my-zsh

  # Plugins from robbyrussell's oh-my-zsh
  zgen oh-my-zsh plugins/tmux
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/colored-man
  zgen oh-my-zsh plugins/colorize
  zgen oh-my-zsh plugins/web-search
  #zgen oh-my-zsh plugins/pip
  #zgen oh-my-zsh plugins/python
  #zgen oh-my-zsh plugins/virtualenv
  zgen oh-my-zsh plugins/command-not-found

  # Github plugins
  #zgen load rupa/z
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions src
  #zgen load kennethreitz/autoenv

  zgen oh-my-zsh plugins/history-substring-search

  # Load theme
  #zgen oh-my-zsh themes/ys

  # Tell antigen that you're done
  zgen save
fi

