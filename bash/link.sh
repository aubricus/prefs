#!/usr/bin/env bash

# Create custom install script here!
# Modify this to match your system

# Directories

target_dir=$PWD
link_dir=$HOME

# Link & Target Order MUST match

# Link targets
targets[0]="$target_dir/bash_profile"
targets[1]="$target_dir/bashrc"
targets[2]="$target_dir/vimrc"
targets[3]="$target_dir/prefs"
targets[4]="$target_dir/tmux"
targets[5]="$target_dir/tmux.conf"

# Link Names
links[0]=".bash_profile"
links[1]=".bashrc"
links[2]=".vimrc"
links[3]=".prefs"
links[4]='.tmux'
links[5]='.tmux.conf'

# Script Functions

function link_prefs {
    echo '...linking prefs!'

    for (( i=0; i<${#targets[@]}; i++ ));
    do
        target=${targets[$i]}
        link=${links[$i]}

        if [ -f $target ] || [ -d $target ]; then
            ln -s $target $link
        fi
    done

    echo '...complete!'
}

function unlink_prefs {
    echo '...unlinking prefs!'

    for (( i=0; i<${#targets[@]}; i++ ));
    do
        target=${targets[$i]}
        link=${links[$i]}

        if [ -f $target ] || [ -d $target ]; then
            rm -rf $link_dir/$link
        fi
    done

    echo '...complete!'
}

# Command runs here
cd $link_dir

if [ "$1" = 'link' ]; then
    unlink_prefs
    link_prefs

elif [ "$1" = 'unlink' ]; then
    unlink_prefs

fi


