# This tmux statusbar config was created by tmuxline.vim
# on Thu, 04 Sep 2014

set -g status-bg "colour233"
set -g status-justify "left"
set -g status-left-length "100"
set -g status "on"
set -g status-right-length "100"
#set -g status-utf8 "on"
setw -g window-status-separator ""
set -g status-left "#[fg=colour195,bg=colour25,bold] #S #[fg=colour25,bg=colour233,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour236,bg=colour233,nobold,nounderscore,noitalics]#[fg=colour145,bg=colour236] %Y-%m-%d  %H:%M #[fg=colour25,bg=colour236,nobold,nounderscore,noitalics]#[fg=colour195,bg=colour25] #h "
setw -g window-status-format "#[fg=colour240,bg=colour233] #I #[fg=colour240,bg=colour233] #W "
setw -g window-status-current-format "#[fg=colour233,bg=colour236,nobold,nounderscore,noitalics]#[fg=colour145,bg=colour236] #I #[fg=colour145,bg=colour236] #W #[fg=colour236,bg=colour233,nobold,nounderscore,noitalics]"
