#! /bin/bash

# Install tmux

sudo apt install -y tmux

rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


{
    echo "set -g @plugin 'tmux-plugins/tpm'"
    echo "set -g mouse on"
    echo "set -g base-index 1"
    echo "setw -g pane-base-index 1"
    echo "set -g renumber-windows on"
    echo "bind | split-window -hc '#{pane_current_path}'"
    echo "unbind '\"'"
    echo "bind - split-window -vc '#{pane_current_path}'"
    echo "unbind %"
    echo "bind c new-window -c '#{pane_current_path}'"
    echo "bind r source-file ~/.tmux.conf"
    echo "set-option -g history-limit 100000"
    echo "set-option -g allow-rename off"
    echo "set -g @plugin 'tmux-plugins/tmux-sensible'"
    echo "set -g @plugin 'dracula/tmux'"
    echo "run -b '~/.tmux/plugins/tpm/tpm'"
} > ~/.tmux.conf