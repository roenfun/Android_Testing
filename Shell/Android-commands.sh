#!bin/bash

#dump当前页面xml树
adb shell uiautomator dump
#dump某个应用的系统信息
adb shell dumpsys meminfo com.suning.mobile.ebuy | grep " Dalvik Heap" | awk '{print $4}'

#点击函数
click(){
local index=1
[ -n "$2" ] && index=$2
adb shell input tap \
$(
adb shell "uiautomator dump --compressed && cat /sdcard/window_dump.xml" \
| sed 's#<node#^<node>#g' \
| awk 'BEGIN{RS="^"}{print $0}' \
| grep "$1"  \
| sed  -n "$index"p \
| awk 'BEGIN{FS=",|\\[|\\]"}{print ($2+$5)/2,($3+$6)/2}' 
)
}

#点击某个按钮或文字，进入详情页
click '苏宁服务5588'
#返回按钮， adb shell input keyevent <keycode>
# http://www.511yj.com/eyuyan-adb-shel.html
adb shell input keyevent 4

for i in $(seq 20);do click '5588';sleep 2; adb shell input keyevent 4; sleep 2; \
adb shell dumpsys meminfo com.suning.mobile.ebuy | grep "Dalvik Heap" | awk '{print $4}';sleep 1;done \
| gnuplot -e "set title 'memory curve'; set ylabel 'Mem(Kb)';set xlabel 'times'; set terminal dumb;plot '<cat' using 1 with line title 'memory'"


