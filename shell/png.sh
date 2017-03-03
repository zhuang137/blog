#!/usr/bin/env bash
PREFIX="/home/liuzz4/lzz_work/intelCHT_N_dev/frameworks/base/"
cat commit.txt |cut -d " " -f2|sed 's/://g'>lzz.tmp
for line in $(cat lzz.tmp);
do
    echo "${line}"
    cp -f ${line} ${PREFIX}${line%/*}
done
