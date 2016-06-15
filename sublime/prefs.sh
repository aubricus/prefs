#!/usr/bin/env bash

prefs_dir="$PWD/prefs"
snippets_dir="$PWD/snippets"
sublime3_prefs_dir="$prefs_dir/sublime-text-3"
sublime3="/Applications/Sublime Text.app"
sublime3_user_dir="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

# Script Functions

function print_help {
    echo "\

Commands:

copy_prefs          copy prefs into Sublime system prefs dir
copy_snippets       copy snippets into Sublime system prefs dir
copy_all            copy prefs & snippets
help                prints this message
\
"
}

function copy_prefs {
    echo '...copying prefs!'

    if [ -e "$sublime3" ]; then
        cp "$sublime3_prefs_dir/Preferences.sublime-settings" "$sublime3_user_dir/"
        cp "$sublime3_prefs_dir/Package Control.sublime-settings" "$sublime3_user_dir/"
        echo "...success!"
    else
        echo "...failure!"
    fi
}

function copy_snippets {
    echo '...copying snippets!'

    if [ -e "$sublime3" ]; then
        cp -a "$snippets_dir" "$sublime3_user_dir"
        echo "...success!"
    else
        echo "...failure!"
    fi
}

# Command runs here

if [ "$1" = 'help' ]; then
    print_help
fi

if [ "$1" = 'copy_prefs' ]; then
    copy_prefs
fi

if [ "$1" = 'copy_snippets' ]; then
    copy_snippets
fi

if [ "$1" = 'copy_all' ]; then
    copy_prefs
    copy_snippets
fi
