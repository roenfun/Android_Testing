#!/bin/bash

#`chmod +x /Users/chad/project/git/Android_Testing/Shell/bash_fundamental.sh`  #使脚本具有执行权限
a=`which python`
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
array=(1 2 3 4 5)
echo $array
echo ${array[@]} #打印所有数组
echo ${array[*]} #打印所有数组
echo ${#array[@]} #数组长度
echo ${#array[*]} #数组长度