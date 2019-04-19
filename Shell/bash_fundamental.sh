#!/bin/bash

:<<EOF
多行注释
this script should not be run directly,
instead you need to source it from your .bashrc,
 by adding this line:
source 命令是在当前的shell环境下执行脚本 ，不会创建子shell; 
source ./chdir.sh 或者 . ./chdir.sh 
EOF

#后台执行请用 &
echo -e "OK! -e 开启转义换行 \n" # -e 开启转义 \c 不换行

echo "-------------函数--------"
demoFun(){
    echo "切换目录到：$work_dir"
    cd $work_dir

    if [ $# -ge 10 ];then
    	echo "参数总数大于等于10，第十个为：${10}"
    else
    	echo "参数总数小于10，第1个为：$1"
    fi	
}
demoFun

#`chmod +x /Users/chad/project/git/Android_Testing/Shell/bash_fundamental.sh`  #使脚本具有执行权限
a=`which python` #等效于: $(which python)
echo $a

#注释
your_name="R 罗纳尔多" #双引号可以引用变量
my_name='欧文 $your_name'
my_name1="欧文 ${your_name} _suff"
echo ${your_name}
echo $my_name
echo $my_name1

#预定义变量
variabl=$PWD #$USER $ENV
echo $variabl

#运算符加减乘除
# echo ${array[3]} + ${array[4]}
val=$(expr 99 + 100) #语法很严格
add=1;add2=3;trueT=true
chu=`awk 'BEGIN{print 2/3}'`

echo ${val}
echo "add+add2=$((add=add+add2))"
echo "trueT is: $trueT"
echo "2*4=$((2*4))"
echo $? #判断上一命令是true或false
echo $chu

#数组
echo "--------------数组---------------"
array=(1 "2" 3 4 5)
echo $array
array[1]="改变数组第二个元素的值"
echo ${array[-1]} #$array[4] 不一样，要注意
echo ${array[@]} #打印所有数组
echo ${array[*]} #打印所有数组
echo ${#array[@]} #数组长度length
echo ${#array[*]} #数组长度size

#循环---------------
#http://www.runoob.com/linux/linux-shell-process-control.html
echo "--------------循环---------------"
for((i=0;i<${#array[@]};i++))
do
echo "log---: for循环数组是：$i"
if [ ${array[i]} -eq 1 ]; then
	echo "元素为1，跳出循环"
	sleep 1 #停止运行1秒
	break
fi	
done

for x in ${array[@]}; do
	echo "log---: for循环数组另一种用法是：$x"
done

# for y in `ls`; do
# 	echo "log---: for循环数组遍历ls命令是：$y"
# done

my=0
while [[ $my -lt 3 ]]; do
	echo "log---: while循环是：$my"
	let "my++" # ((my=my+1))
done

path1="/Users/chad/project/git/Android_Testing/Shell/baidu.keyword"
while read x; do 
	echo "while循环文件内容是：$x" #>> $path1 #重定向
done < $path1
# 循环---------End------

#传递参数 
# http://www.runoob.com/linux/linux-shell-passing-arguments.html
echo "--------------if语句，注意语法 传递参数---------------"
if [ $my -eq $# ]
then
	echo "传递的参数总数是：$#, 参数总和：$*, 分别为：$0, $1, $2"
elif [ $my -gt $# ]
then	
	echo "$my 大于 $#"
else
	echo "都不是，请检查"
fi

echo "werwe fdsaf+sdfg_" | awk -F '_| ' '{print $1,$2}'
echo -e "1|2|3|4\n5|6\n7" | awk -F '|' 'BEGIN{a=0} {print $2; a=a+$2} END{print a}'
echo "werwe fdsaf+sdfg_" | sed 's/we/she/g' |sed 's/+/|/g' #更改并同时备份
 #分割后第二个，从0开始

while true; do
	read -p "请输入内容:\n" var_q
	if [[ ${var_q} == "quit" ]]; then
		break
	else
		#awk引用变量需要\"去转义
		echo "输入的内容是：$var_q"
		echo "$(($var_q+$var_q))"
		echo "$(($var_q-$var_q))"
		echo "$(($var_q*$var_q))"
		echo "$(($var_q/$var_q))" #整除去掉小数
		echo `awk "BEGIN{print \"$var_q\" / \"$var_q\"}"`
	fi
done

#读入文件，并逐个搜索符合条件的文案 grep awk sed
# http://www.runoob.com/linux/linux-comm-awk.html
# while read k;do 
# echo $k; curl -s http://www.baidu.com/s?wd=$k
# done < $path1 | grep -o "结果约[0-9,]*"

#字符串应用切片
a=2;b=3
while read a b; do [ $a -gt $b ] && echo "b>a" || echo "a<b"; done

curl -s https://testing-studio.com/ \
| grep href | grep -o "http[^\"']*" \
| while read line;do curl -s -I $line | grep 200 && echo 200 $line || echo ERR $line; done

curl https://testerhome.com | grep -o 'http://[a-zA-Z0-9\.\-]*'

awk  '$9~/500/' nginx.log
awk  '$9!~/200/' nginx.log #不包含200的
awk -F " "  '$9!~/200/{print $9}' nginx.log | sort | uniq -c
awk -F " "  '$9!~/200/{print $7}' nginx.log |sed -E 's/[0-9]{3,}/_d_/g' | sort -r | uniq -c
awk -F " "  '$9!~/200/{print $7}' nginx.log |sed -E 's/[0-9]*/_d_/g' | sort -r | uniq -c

grep 'http://[a-zA-Z0-9\.\]*' nginx.log | awk -F " " '{print $0}' | uniq -c | sort -c | head -1

#找出访问量最高的页面地址
#求/topics/nnn接口的平均响应时间（最后一列为响应时间）
awk '$7~/\/topics\/[0-9].*/' nginx.log | head
grep -o 'http[s]://[a-zA-Z0-9\.\]*' nginx.log | awk -F " " '{print $0}'|sort -n | uniq -c | sort -n -r | head -1
grep '\/topics\/n.*' nginx.log | awk '{a=(NF-1);b=+$a;print $a}END{printf "average of response time is: %.3f\n", (b/NR)}'

curl -s https://testing-studio.com -v 
seq 10 | grep -v '[1-3]'
seq 10 |awk '/^5$/'
seq 10 |awk '/[5-9]/'
seq 20 |awk '/15/,/19/'
echo '1|2#3.4' | awk -F '#|_|\\.\\|' '{print $1}'

#获取当前界面的所有内容
adb shell "uiautomator dump --compress  && cat /sdcard/window_dump.xml"

#点击当前页面的坐标

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

for name in 我的 订单  首页 ;do click $name;done

adb shell input tap $(adb shell "uiautomator dump --compress  && cat /sdcard/window_dump.xml" | sed 's/<node/^<node>/g' | awk 'BEGIN{RS="^"}{print $0}' | grep '往内容提供者添加数' | awk 'BEGIN{FS=",|\\[|\\]"}{print ($2+($5-$2)/2),($3+($6-$3)/2)}')


#https://testerhome.com/api/v3/topics.json
#把里面的每个帖子的信息，都拆分为独立的一行
curl -s https://testerhome.com/api/v3/topics.json |sed 's#{"topics":\[##g' |sed 's#]}##g' \
| awk 'BEGIN{RS="}},"}{print $0}' |awk '{if($0!="")print $0}' \
| sed 's/$/}}/g' \
| awk '{if(NR%2==0){printf $0 "\n\n"}else{printf "%s：",$0}}' \
| sed 's/,{"id":/{"id":/g'

curl -s https://testerhome.com/api/v3/topics.json \
| sed -e "s#{\"topics\"\:\[{##" -e "s#}]}##" -e "s#},{#~#g" \
| awk -v RS="~" '$0!~/\n/{print "{" $0 "}"}'

#查看端口
netstat -tlnp

#打印所有的连接到shell服务器的学员数，以ip为准
netstat -tnp | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -nr |wc -l
#查看有多少个ip连接入来
netstat -tn | awk '{print $5}' | sort | awk -F: '{print $1}' | sort | uniq -c | sort -rn | wc -l

op -b -d 1 -n 20 -p 19912 | grep --line-buffere | awk '{cpu+=$9;mem+=$10}{print "cpu:" cpu/NR, "mem:" mem/NR }'