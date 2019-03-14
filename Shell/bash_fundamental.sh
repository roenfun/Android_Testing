#!/bin/bash

#
# this script should not be run directly,
# instead you need to source it from your .bashrc,
# by adding this line:
# source 命令是在当前的shell环境下执行脚本 ，不会创建子shell; 
#source ./chdir.sh 或者 . ./chdir.sh 

demoFun(){
    echo "切换目录到：$work_dir"
    cd $work_dir
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

#传递参数 
# http://www.runoob.com/linux/linux-shell-passing-arguments.html
echo "--------------传递参数---------------"
#if(0 eq $#)
	echo "传递的参数总数是：$#, 参数总和：$*, 分别为：$0, $1, $2"
#fi

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

#字符串应用切片
