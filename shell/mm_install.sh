#!/usr/bin/env bash
###
#
#
###
source build/envsetup.sh
function mmb(){
#以下三行定义了变量
DIR_GENERATE='out/target/product/r2_cht_ffd'
pro_current=`pwd -P`
pro_root=`(croot && pwd -P)`
mm -B 2>&1 | tee mm.log
touch mm1.tmp
cat mm.log | grep "Install"| grep -v "test"|awk -F ":" '{print $2}' > mm1.tmp
local num=`wc -l mm1.tmp | cut -d " " -f1`
if [ $num -eq 0 ];
then
    echo -e  "\033[1;32m mm -B failed.waiting log..... \033[0m;"
    sleep 2;
    cat mm.log
    return
fi
cat mm1.tmp | cut -d '/' -f5- > mm2.tmp
#cat mm1.tmp|cut -d '/' -f5->mm3.tmp

if [ ! -d 'tmp' ];
then
    mkdir tmp
fi
while read LINE;
do
    echo ${LINE%/*}>>mm3.tmp
done < mm2.tmp
cat mm3.tmp|uniq >mm4.tmp
cat mm4.tmp | xargs -I {} mkdir -p ${pro_current}/tmp/{} \ ;
while read LINE;
do
    cp ${pro_root}/${DIR_GENERATE}/${LINE} tmp/${LINE}
done < mm2.tmp
#rm *.tmp
(
cd tmp
cp ../mm2.tmp path.cfg
#总结:在cat >>EOF中，如果出现类似$?的变量，那么会进行替换，可以通过\解决
cat <<EOF > install.sh
adb remount
if [ \$? -eq 1 ];
then
    echo -e "\033[1;32madb remount error.exit\033[0m"
    exit 1;
fi
cat path.cfg| xargs -I {} adb push {} {}
adb reboot
EOF
tar -zcvf ../install.tar.gz *
)
#fex -u install.tar.gz
rm *.tmp
rm -rf tmp
}
