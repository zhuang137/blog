#!/usr/bin/env sh
#set -x
CURRENT_BRANCH=`git branch|grep "*"|awk '{print $2}'`
PATCH_BRANCH="smart"
#update code and create temp branch as base branch
git fetch lenovo ${CURRENT_BRANCH}:${PATCH_BRANCH}

git checkout ${PATCH_BRANCH}
#declare k as start number for patch file
declare -i k
k=1;
OUT_DIR="patch"
#create file with no sub file and sub dir.
if [ ! -d ${OUT_DIR} ] ;
then
    mkdir ${OUT_DIR}
else
    rm -r ${OUT_DIR}/*
fi
#We need these commit with key word "smart" .Ignore its case
git log --oneline --reverse --after=2016/02/28 | \
    grep -i "smart"|cut -d " " -f1 > commit.txt

for line in $(cat commit.txt);
do
    git reset --hard ${line}
    git format-patch -o ${OUT_DIR} --start-number $k  HEAD^
    ((k++))
done
#set +x
git checkout ${CURRENT_BRANCH}
git branch -D ${PATCH_BRANCH}
