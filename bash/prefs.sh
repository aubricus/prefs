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
targets[2]="$target_dir/gemrc"
targets[3]="$target_dir/vimrc"
targets[4]="$target_dir/prefs"
targets[5]="$target_dir/tmux"
targets[6]="$target_dir/tmux.conf"
targets[7]="$target_dir/gitconfig"
targets[8]="$target_dir/gitignore_global"

# Link Names
links[0]=".bash_profile"
links[1]=".bashrc"
links[2]=".gemrc"
links[3]=".vimrc"
links[4]=".prefs"
links[5]=".tmux"
links[6]=".tmux.conf"
links[7]=".gitconfig"
links[8]=".gitignore_global"

# Script Functions

function print_help {
    echo "\

Commands:

link        unlinks old prefs, links new prefs
unlink      unlinks old prefs
help        prints this message
\
"
}

function link_prefs {
    echo "...linking prefs!"

    for (( i=0; i<${#targets[@]}; i++ ));
    do
        target=${targets[$i]}
        link=${links[$i]}

        if [ -f $target ] || [ -d $target ]; then
            echo "$link->$target"
            ln -s $target $link
        fi
    done

    echo "...complete!"
}

function unlink_prefs {
    echo "...unlinking prefs!"

    for (( i=0; i<${#targets[@]}; i++ ));
    do
        target=${targets[$i]}
        link=${links[$i]}

        if [ -f $target ] || [ -d $target ]; then
            echo $link_dir/$link
            rm -rf $link_dir/$link
        fi
    done

    echo "...complete!"
}

# Command runs here
cd $link_dir

if [ "$1" = "help" ]; then
    print_help

elif [ "$1" = "link" ]; then
    unlink_prefs
    link_prefs

elif [ "$1" = "unlink" ]; then
    unlink_prefs

fi


