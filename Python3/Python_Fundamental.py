#!/usr/local/bin/python3
##!/Library/Frameworks/Python.framework/Versions/3.7/bin

from sys import stdout,argv,path

#查看版本
#python -V
#Python3.7 -V

#Mac安装Python3.x步骤
#Mac系统自带python路径为: /System/Library/Frameworks/Python.framework/Versions
#官网下载安装后的路径为：  /Library/Frameworks/Python.framework/Versions, 安装完毕后自动在.bash_profile文件里添加环境变量，也可以用brew install Python3 命令安装
#查看python命令的地址路径  which python3 ---> /usr/local/bin/python3

#-----------注释------
# 第一个注释
# 第二个注释
'''
第三注释
第四注释
'''
"""
第五注释
第六注释
"""
#--------------------

#--------------数据类型--------------
#多行语句连接符 在 [], {}, 或 () 中的多行语句，不需要使用反斜杠(\),使用反斜杠 \ 转义特殊字符
#变量在使用前都必须赋值
#到 Python3 中，把 True 和 False 定义成关键字了，但它们的值还是 1 和 0，它们可以和数字相加。
a = b = c = 1 + True
counter,miles = 100, 1000.0  # 整型变量 # 浮点型变量
name = "this " + \
        "is " + \
        "python3"
list = [ 'abcd', 786 , 2.23, 'runoob', 70.2, 'test', 'hello' ]; tinylist = [123, 'runoob'] #列表 array
list[0] = "改变数组元素值"; list[2:5] = [13, 14, 15]; list[2:3] = [] #将对应的元素值设置为 [] 

del c 						#del语句删除单个或多个对象

print(type(a),type(miles),isinstance(name, str)) #数据类型
print(a+b)
print(name, end=" ")		# 不换行输出
print(name[0:-1])           # 输出第一个到倒数第二个的所有字符
print(name[0])              # 输出字符串第一个字符
print(name[2:5])            # 输出从第三个开始到第五个的字符
print(name[2:])             # 输出从第三个开始的后的所有字符
print(name * 2)             # 输出字符串两次
print(name + '你好')        # 连接字符串

print('-------------list-----------------')
print (list)            # 输出完整列表
print (list[1:3])       # 从第二个开始输出到第三个元素
print (list[2:])        # 输出从第三个元素开始的所有元素
print(list[2:5:2])		#列表截取可以接收第三个参数，参数作用是截取的步长
print (tinylist * 2)    # 输出两次列表
print (list + tinylist) # 连接列表
 
print('------------------------------')
 
print('hello\nrunoob')      # 使用反斜杠(\)+n转义特殊字符
print(r'hello\nrunoob')     # 在字符串前面添加一个 r，表示原始字符串，不会发生转义, raw string

###数值运算
# 除法，得到一个浮点数; #除法，得到一个整数; #取余; #乘方
print(2/4);print(2//4);print(13%2);print(2**5)

input("\n\n按下 enter 键后退出。") #"\n\n"在结果输出前会输出两个新的空行。一旦用户按下 enter 键时，程序将退出
stdout.write('\n' + name + '\n-----\n') # 因为已经导入name成员，所以此处引用时不需要加sys.name