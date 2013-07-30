#!/usr/bin/env bash

# Create custom install script here!
# Modify this to match your system


# Directories

install_dir=$PWD
target_dir=$HOME


# Link targets

targets[0]="$install_dir/bash_profile"
targets[1]="$install_dir/bashrc"
targets[2]="$install_dir/tmux.conf"
targets[2]="$install_dir/vimrc"
targets[3]="$install_dir/prefs"


# Link Names

links[0]=".bash_profile"
links[1]=".bashrc"
links[2]=".tmux.conf"
links[2]=".vimrc"
links[3]=".prefs"


# Create Symlinks

echo "Creating links to bash preferences!"
cd $target_dir

for (( i=0; i<${#targets[@]}; i++ ));
do
    target=${targets[$i]}
    link=${links[$i]}

    if [ -f $target ] || [ -d $target ]; then
        ln -s $target $link
    fi
done

