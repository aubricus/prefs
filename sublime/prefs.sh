#!/usr/bin/env bash

prefs_dir="$PWD/prefs"
snippets_dir="$PWD/snippets"
sublime2_prefs_dir="$prefs_dir/sublime-text-2"
sublime3_prefs_dir="$prefs_dir/sublime-text-3"

sublime2="/Applications/Sublime Text 2.app"
sublime2_user_dir="$HOME/Library/Application Support/Sublime Text 2/Packages/User"

sublime3="/Applications/Sublime Text.app"
sublime3_user_dir="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

# Script Functions

function copy_prefs {
    echo '...copying prefs!'

    if [ -e "$sublime3" ]; then
        cp "$sublime3_prefs_dir/Preferences.sublime-settings" "$sublime3_user_dir/"
        cp "$sublime3_prefs_dir/Package Control.sublime-settings" "$sublime3_user_dir/"
        echo "...success!"
    fi

    if [ -e "$sublime2" ]; then
        cp "$sublime2_prefs_dir/Preferences.sublime-settings" "$sublime2_user_dir/"
        cp "$sublime2_prefs_dir/Package Control.sublime-settings" "$sublime2_user_dir/"
        echo "...success"
    fi
}

function copy_snippets {
    echo '...copying snippets!'

    if [ -e "$sublime3" ]; then
        cp -a "$snippets_dir" "$sublime3_user_dir"
        echo "...success!"
    fi

    if [ -e "$sublime2" ]; then
        cp -a "$snippets_dir" "$sublime2_user_dir"
        echo "...success!"
    fi
}

# Command runs here

if [ "$1" = 'copyprefs' ]; then
    copy_prefs
fi

if [ "$1" = 'copysnippets' ]; then
    copy_snippets
fi


