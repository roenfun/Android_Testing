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
	sleep 1
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


