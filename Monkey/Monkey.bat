rem #######CI 配置##########
rem cd D:\CI\artifact
rem del testing-*
rem "D:\testing\GnuWin32\bin\wget" http:download\testing-release.apk
rem dir
rem adb install -r testing-release.apk
rem cd D:\workspace\TestingAT
rem set JAVA_HOME="D:\Sandbox\Java\jdk1.7.0_45"
rem mvn -Dtest=test.java test
rem ########## END #####################

rem error:device offline -> upgrade adb
rem adb kill-server
rem adb start-server
rem adb remount
rem adb devices
rem adb shell
rem opendir failed ,permission denied -> su命令回车，手机同意root
rem cd data/data
rem -v behind --throttle
@echo current directory
dir
@echo starting monkey...
rem adb shell monkey -p com.achievo.vipshop --pct-touch 50 --pct-motion 20 --pct-trackball 0 --pct-nav 0 --pct-majornav 10 --pct-appswitch 10 --pct-anyevent 10 -s 12867 -v --throttle 456 2000 --ignore-crashes --ignore-timeouts --ignore-security-exception > log.txt
adb shell monkey -p com.achievo.vipshop -s 12867 --throttle 456 -v 2000 --pct-touch 50 --pct-motion 20 --pct-trackball 0 --pct-nav 0 --pct-appswitch 10 --pct-anyevent 10 --ignore-crashes --ignore-timeouts --ignore-security-exception > log.txt

rem adb shell monkey -help
