#!/bin/bash

convert_image(){
    local dir_image=$1
    local image=$(ls $dir_image | awk -F. '{ print $1 }')
    convert $image.jpg $image.png
}

files_in_dir(){
    cd $1
    for file in *
    do
        local dir_file=$(find ~/fast-track-shell-scripting/book-imagens -name $file)
        if [ -d $dir_file ]
        then
            files_in_dir $dir_file
        else
            convert_image $dir_file
        fi
    done
}

files_in_dir ~/fast-track-shell-scripting/book-imagens