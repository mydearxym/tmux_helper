#! /bin/sh

# author  : xie yiming, mydearxym@gmail.com mydearxym@qq.com
# license : GPL
# created : 2014-06-15

# set-option -g prefix C-j
# unbind-key C-b
# bind-key C-j send-prefix
# #setw -g mode-key vi
# setw -g mode-mouse on
# set -g mouse-select-pane on
# set -g mouse-resize-pane on
# set -g mouse-select-window on

# bind-key 3 split-window -h
# bind-key 2 split-window
# bind-key k selectp -U
# bind-key j selectp -D
# bind-key k selectp -L
# bind-key l selectp -R

# set-option -g status on
# set-option -g status-interval 2
# set-option -g status-utf8 on
# set-option -g status-justify "centre"
# set-option -g status-left-length 60
# set-option -g status-right-length 90
# set-option -g status-left "#(~/code/tmux-powerline/powerline.sh left)"

# set-window-option -g window-status-current-format "#[fg=colour235, bg=colour27]⮀#[fg=colour255, bg=colour27] #I []#W #[fg=colour27, bg=colour235][]


cmd=$(which tmux)
session=rails
proj_dir="/Users/xieyiming/code/test_new"

if [ -z $cmd ]; then
  echo "dude, there is no tmux on your machine"
  exit 1
fi

$cmd kill-session -t rails 
# if rails already exit, it will be duplicate , so it's ok
echo "create your favor tumx env..."
$cmd new-session -s $session -d 

$cmd has -t $session
# $cmd has -t "not_exist"

if [ $? == 0 ]; then

	$cmd neww -n "zeus" -c $proj_dir -t $session
	$cmd neww -n "server" -c $proj_dir -t $session
	$cmd neww -n "console $ log" -c $proj_dir -t $session
	$cmd splitw -h -p 50 -c $proj_dir -t $session

	$cmd neww -n "routes" -c $proj_dir -t $session

fi

echo "config done!"
$cmd att -t $session
exit 0



