#!/usr/bin/env bash

# Create custom install script here!
# Modify this to match your system


# Directories

target_dir=$PWD
link_dir=$HOME


# Link targets

targets[0]="$target_dir/bash_profile"
targets[1]="$target_dir/bashrc"
targets[2]="$target_dir/tmux.conf"
targets[2]="$target_dir/tmux-osx.conf"
targets[2]="$target_dir/vimrc"
targets[3]="$target_dir/prefs"


# Link Names

links[0]=".bash_profile"
links[1]=".bashrc"
links[2]=".tmux.conf"
links[3]=".tmux-osx.conf"
links[4]=".vimrc"
links[5]=".prefs"


# Create Symlinks

echo "Creating links to bash preferences!"
cd $link_dir

for (( i=0; i<${#targets[@]}; i++ ));
do
    target=${targets[$i]}
    link=${links[$i]}

    if [ -f $target ] || [ -d $target ]; then
        ln -s $target $link
    fi
done

