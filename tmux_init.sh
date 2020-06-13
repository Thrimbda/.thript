#!/bin/zsh

SESSIONNAME="dashboard"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]
 then
    tmux new-session -s $SESSIONNAME -n script -d
    tmux send-keys -t $SESSIONNAME "~/bin/script" C-m
fi

tmux attach -t $SESSIONNAME
