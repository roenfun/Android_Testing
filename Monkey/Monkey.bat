rem error:device offline -> upgrade adb
rem adb kill-server
rem adb start-server
rem adb remount
rem adb devices
rem adb shell
rem opendir failed ,permission denied -> su命令回车，手机同意root
rem cd data/data
rem -v behind --throttle 
adb shell monkey -p com.achievo.vipshop --throttle 500 -v 200 --pct-touch 80 --pct-motion 20 --ignore-crashes --ignore-timeouts --ignore-security-exception > E:\Project\git\Android_Testing\Monkey\log.txt
rem adb shell monkey -help
