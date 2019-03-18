#!/bin/bash

echo "获取脚本执行参数：$0";
echo "获取第一个参数：$1";
echo "获取第二个参数：$2";
echo "获取参数的个数：$#";
echo "获取到的参数(str)：$*";
echo "获取到的参数(每一个参数都是一个str)：$@";
echo "获取当前进程的ID号(PID)：$$";

#作业
#获取登陆名总数
cat /etc/passwd | awk -F ':' 'BEGIN{count=0} {name[count]=$1;count++} END{for(i=0;i<NR;i++)print i+1,name[i]}'
#获取ip地址
curl icanhazip.com 

#读入文件，并逐个搜索符合条件的文案 grep awk sed
while read k;do 
echo $k; curl -s http://www.baidu.com/s?wd=$k
done < $path1 | grep -o "结果约[0-9,]*"

echo "werwe fdsaf+sdfg_" | awk -F '_| ' '{print $1,$2}'

echo "werwe fdsaf+sdfg_" | sed 's/we/she/g' |sed 's/+/|/g' #更改并同时备份
 #分割后第二个，从0开始
