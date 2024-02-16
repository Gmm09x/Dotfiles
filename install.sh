#!/bin/bash


PATH="/home/$USER"


same_install() {

    sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install polybar -y
}


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
    same_install
    remove_readme
    copy_hidden_files
    move_remaining_files
}

main

