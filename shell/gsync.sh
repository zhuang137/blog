#!/usr/bin/env bash
remote=""
fetchPrefix=""
codeReview=""
defBranch=""
TMP_FILE=".gproj/.tmp.txt"
MANIFEST_FILE=".gproj/manifest.xml"
function initRemoteFetch()
{
    fetchPrefix=$(getValue remote fetch ${MANIFEST_FILE})
}

function initRemoteName()
{
    remote=$(getValue remote name ${MANIFEST_FILE})
}
function initCodeReview()
{
    codeReview=$(getValue remote review ${MANIFEST_FILE})
}
function initDefBranch()
{
    defBranch=$(getValue default revision ${MANIFEST_FILE})
}
function makeProject()
{

    if [ $# -eq 0 ];
    then
        echo -e "\033[1;33must have one arg for makeProject"
    else
        local path=$(getValue project path ${TMP_FILE})
        local name=$(getValue project name ${TMP_FILE})
        if [ ! -d $path ];
        then
            mkdir -p $path
        fi
        (
            cd $path
            if [ -d .git ];
            then
                return
            fi
            git init
            git remote add ${remote} ${fetchPrefix}${name}
            git fetch $remote
            git checkout -b $defBranch ${remote}/${defBranch}
            git rebase ${remote}/${defBranch}
            git config branch.${defBranch}.merge refs/heads/${defBranch}
            git config branch.${defBranch}.rebase true
            git config branch.${defBranch}.push upstream
        )
    fi
}
function getValue()
{
    if [ $# -le 2 ] ;
    then
        echo -e "\033[1;33mmust have three args for getValue\033[0m"
    else
        local tmp1=$(sed -n 's/<'"$1"' .*'"$2"'="\(.*\)".*>/\1/p' $3)
        local tmp2=${tmp1%%\"*}
        echo $tmp2
    fi
}

function init()
{
    if [ ! -d .gproj ];
    then    
        mkdir .gproj
        #mv manifest.xml .gproj
    else
        echo -e "\033[1;34mmaybe you have initilized the gproj here\033[0m"
    fi
    if [ -f manifest.xml ];
    then
        mv manifest.xml ${MANIFEST_FILE}
    else
        echo -e "\033[1;34mcurrent dir can't find manifest.xml\033[0m"
    fi
    if [ -f ${MANIFEST_FILE} ];
    then
        initRemoteFetch
        initRemoteName
        initCodeReview
        initDefBranch
        echo -e "\033[1;33m init gproj success\033[0m"
    else
        echo "this is not a normal gproj,please check"
    fi
    }
function gsync()
{
    if [ $# -eq 0 ];
    then
        awk '/<project/{print $0;}' ${MANIFEST_FILE} | \
        while read line
        do
            echo $line > ${TMP_FILE}
            makeProject ${TMP_FILE}
            rm -f ${TMP_FILE}
        done
    elif [ $# -eq 1 ]
        case $1 in
        .)
            ;;
        all)
            ;;
        start)
            echo  -e "your commands should be this? \033[1;33mgsync start <branch>\033[0m"
            ;;
        status)
            
            ;;
        esac
    fi
    
}

function gitStatus()
{
    if [ $# -gt 0 ] && [ -d $1 ];
    then
        git status>/dev/null 2>&1
        if [ $? -eq 0 ];
        then
            
        fi
    fi
}
function gitUpdate()
{
    if [ -d $1 ];
    then
        (
        cd $1
        git status>/dev/null 2>&1
        if [[ $? ==0 ]];
        then
            git fetch ${remote}
            git rebase FETCH_HEAD
        else
            echo -e "\033[1;33mcurrent dir is not a git\033[0m"
        fi
        )
    fi
}
init
