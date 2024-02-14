#!/bin/bash


PATH="/home/$USER"

remove_readme() {
    # Remove README.md file if exists
    rm -rf README.md
}

copy_hidden_files() {
    # Copy all hidden files to the user's home directory
    cp -r .* $PATH 
}

move_remaining_files() {
    # Move all remaining files (non-hidden) to /home directory
    mv * $PATH 
}

main() {
    remove_readme
    copy_hidden_files
    move_remaining_files
}

main

