declare - r count=$(adb devices|grep -w "device"|wc -l)
if [ $count -lt 1 ];
then
    echo "there is no device found"
    exit
fi
for((i=0;i<10;));
do
    date | tee -a mem.log
    adb shell dumpsys meminfo com.baidu.appsearch | tee -a mem.log
    date | tee -a cpu.log
    adb shell dumpsys cpuinfo|tee -a cpu.log
    sleep 1
done
