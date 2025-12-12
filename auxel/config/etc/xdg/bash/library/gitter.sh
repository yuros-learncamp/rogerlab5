#!/bin/bash
# Gitter : Git commit automcompletion  
# copyright@almuhdilkarim 2025 <null@yuros.org>


function gitpush_updater() {
    echo "appversion=$1" >  ".git/gitter"
    echo "appfeature=$2" >> ".git/gitter"
    echo "apppatcher=$3" >> ".git/gitter"
}


function gitpush_version() {

    read -p "insert message commit : " messagecommit
    
    numversion=$(cat ".git/gitter/versi")
    numsubvers="0"
    numnotatio="0"
    updatevers=$((numversion + 1 ))
    echo $updatevers > ".git/gitter/versi"
    echo $numsubvers > ".git/gitter/feats"
    echo $numnotatio > ".git/gitter/patch"

    echo "==> get latest version" && git pull  &&
    echo "==> populate new files" && git add . &&
    echo "==> set commit message" &&
    if [[ -z $messagecommit ]]; then
        git commit -m "update version $updatevers.$numsubvers.$numnotatio at $(date '+%A %W %Y %X')"
    else
        git commit -m "$messagecommit"
    fi
    echo "==> post to repository" && git push &&

    git checkout -b "v$updatevers.$numsubvers.$numnotatio"
    echo "==> populate new files" && git add . &&
    echo "==> set commit message" &&
    git commit -m "v$updatevers.$numsubvers.$numnotatio"
    echo "==> post to repository" &&  git push -u origin "v$updatevers.$numsubvers.$numnotatio"
    git checkout main
}


function gitpush_minors() {

    read -p "insert message commit : " messagecommit

    numversion=$(cat ".git/gitter/versi")
    numsubvers=$(cat ".git/gitter/feats")
    numnotatio=0
    updatevers=$((numsubvers + 1 ))
    echo $updatevers > ".git/gitter/feats"
    echo $numnotatio > ".git/gitter/patch"

    echo "==> get latest version" && git pull  &&
    echo "==> populate new files" && git add . &&
    echo "==> set commit message" && 
    if [[ -z $messagecommit ]]; then
        git commit -m "update version $numversion.$updatevers.$numnotatio at $(date '+%A %W %Y %X')"
    else
        git commit -m "$messagecommit"
    fi
    echo "==> post to repository" && git push
}


function gitpush_patchs() {

    read -p "insert message commit : " messagecommit

    numversion=$(cat ".git/gitter/versi")
    numsubvers=$(cat ".git/gitter/feats")
    numnotatio=$(cat ".git/gitter/patch")
    updatevers=$((numnotatio + 1 ))
    echo $updatevers > ".git/gitter/patch"


    echo "==> get latest version" && git pull  &&
    echo "==> populate new files" && git add . &&
    echo "==> set commit message" && 

    if [[ -z $messagecommit ]]; then
        git commit -m "update to version $numversion.$numsubvers.$updatevers at $(date '+%A %W %Y %X')"
    else
        git commit -m "$messagecommit"
    fi
    echo "==> post to repository" && git push
}


function gitpush() {

    if [[ -d ".git" ]];then
        
        if [[ ! -d ".git/gitter" ]];then
            mkdir ".git/gitter"
            touch ".git/gitter/versi" &&
            touch ".git/gitter/feats" &&
            touch ".git/gitter/patch" &&
            echo "0" > ".git/gitter/versi"
            echo "0" > ".git/gitter/feats"
            echo "0" > ".git/gitter/patch"
        fi

        if [[ -z $1 ]];then
            gitpush_patchs 
        elif [[ $1 == "-v" ]];then
            gitpush_version
        elif [[ $1 == "-f" ]];then
            gitpush_minors
        fi
    else
        echo "It's not a valid git directory"
    fi
}


