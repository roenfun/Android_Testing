#!bin/bash

#dump当前页面xml树
adb shell uiautomator dump
#dump某个应用的内存系统信息
adb shell dumpsys meminfo com.suning.mobile.ebuy | grep " Dalvik Heap" | awk '{print $4}'

# 通过MainActivity启动打开app
pkg=com.suning.mobile.ebuy;
open_app(){
    adb shell monkey -p "$pkg" -c android.intent.category.LAUNCHER 1 >/dev/null && sleep 3 || exit 1;
}

#查看当前的活动页面的activity
adb shell dumpsys activity | grep "mFocusedActivity"

#直接打开某个activity页面
#adb shell am start -n 应用的主包名/要打开的activity所在的包.要打开的activity的名称
adb shell am start -n com.suning.mobile.ebuy/com.suning.mobile.ebuy.search.ui.NewSearchResultActivity

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

#输入文本函数
input(){
adb shell input text 123
}

#滑动函数
swipe(){
width=$(adb shell wm size | grep -oE "[0-9]+" | head -1)
height=$(adb shell wm size | grep -oE "[0-9]+" | tail -1)
adb shell input swipe $(awk 'BEGIN{print '$width'*'$1'}') $(awk 'BEGIN{print '$width'*'$2'}')  $(awk 'BEGIN{print '$width'*'$3'}') $(awk 'BEGIN{print '$width'*'$4'}')  1000
}

#点击某个按钮或文字，进入详情页
click '苏宁服务5588'
#返回按钮， adb shell input keyevent <keycode>
# http://www.511yj.com/eyuyan-adb-shel.html
adb shell input keyevent 4

#循环点击页面统计相关内存信息并生成曲线图
for i in $(seq 20);do click '5588';sleep 2; adb shell input keyevent 4; sleep 2; \
adb shell dumpsys meminfo com.suning.mobile.ebuy | grep "Dalvik Heap" | awk '{print $4}';sleep 1;done \
| gnuplot -e "set title 'memory curve'; set ylabel 'Mem(Kb)';set xlabel 'times'; set terminal dumb;plot '<cat' using 1 with line title 'memory'"



