export ZSH="$HOME/.oh-my-zsh"

# tmux plugin — auto-start tmux when opening a terminal
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=false
ZSH_TMUX_AUTOCONNECT=false

plugins=(
  tmux
  git
  colored-man-pages
  docker
  docker-compose
  pip
  python
  virtualenv
  history-substring-search
  macos
  gh
  fzf
  z
)

# External plugins (installed via Homebrew)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh
