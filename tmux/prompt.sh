# tmux statusbar

set -g status-bg "colour235"
set -g status-fg "colour223"
set -g status-justify "left"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status "on"

# Left: session name
set -g status-left "#[fg=colour235,bg=colour109,bold] #S #[fg=colour109,bg=colour235,nobold]"

# Right: date and hostname
set -g status-right "#[fg=colour246,bg=colour235] %Y-%m-%d  %H:%M #[fg=colour109,bg=colour235]#[fg=colour235,bg=colour109,bold] #h "

# Window status
setw -g window-status-format "#[fg=colour246,bg=colour235] #I  #W "
setw -g window-status-current-format "#[fg=colour235,bg=colour214,bold] #I  #W "
setw -g window-status-separator ""
