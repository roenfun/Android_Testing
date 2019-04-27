# @File : basic.py
# @Author : Chad
# @Time : 2019-04-12
"""
基础语法使用，阅读python简明教程笔记
"""
# !/usr/local/bin/python3
# !/Library/Frameworks/Python.framework/Versions/3.7/bin

from sys import stdout, argv, path

# 查看版本
# python -V
# Python3.7 -V

'''
Mac安装Python3.x步骤
Mac系统自带python路径为: /System/Library/Frameworks/Python.framework/Versions
官网下载安装后的路径为：  /Library/Frameworks/Python.framework/Versions, 安装完毕后自动在.bash_profile文件里添加环境变量，也可以用brew install Python3 命令安装
查看python命令的地址路径  which python3 ---> /usr/local/bin/python3
pipenv安装目录：Users/chad.long/Library/Python/3.7/bin/pipenv
'''
# -----------注释------
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
# --------------------

if __name__ == '__main__':  #
    print('程序自身在运行')
else:
    print('我来自另一模块')

# --------------常量 数据类型--------------
print('########-------------常量 数据类型-----------------#########')

# 多行语句连接符 在 [], {}, 或 () 中的多行语句，不需要使用反斜杠(\),使用反斜杠 \ 转义特殊字符
# 变量在使用前都必须赋值
# 到 Python3 中，把 True 和 False 定义成关键字了，但它们的值还是 1 和 0，它们可以和数字相加。
a = b = c = 1 + True
counter, counter2, miles, mie = 100, 12345678901, 1000.04, 52.3E-2  # 整型变量 # 浮点型变量,52.3E-2 = 52.3 *1/10^-2,
grade = 0
s = '''this is first line;
this is the second line!'''
print("'''换行多行", s)
print("a = b = c =", a, b, c)
print("counter=, Long类型 counter2=", counter, counter2)
print("miles=", miles)
print("幂运算符mie=", mie)

# 换行连接符号 \，单引号和双引号一样的字符串,转义字符
name = "this " + \
       "is " + \
       'python3\'s book'
# 格式化变量为字符串 format
print("format 函数: 格式化变量conter2={0},name={1}".format(counter2, name))
print('{0:.3f}'.format(1.0 / 3))  # 除法
print('{0:_^11}'.format("hello"))
print('{name} wrote {book}'.format(name='Ronaldo', book='<A byte of Python>'))

print('########-------------运算符与表达式-----------------#########')
print(3 ** 4)  # 乘方
print(-13 // 4)  # 整除
print(-13.5 % 2.5)  # 取模
print(2 << 2)  # 左移 2为10，左移得到 1000 = 8
print(11 >> 1)  # 右移 11为1011，右移得到 101 = 5
print(5 & 3)  # 以下4个是位运算符
print(5 | 3)
print(5 ^ 3)
print(~5)
print(not True)
print(False and True)
print(False or True)

print('########-------------list列表-----------------#########')

list1 = ['abcd', 786, 2.23, 'runoob', 70.2, 'test', 'hello']
tinyList = [123, 'runoob']  # 列表 array
list1[0] = "改变数组元素值"
list1[2:5] = [13, 14, 15]
list1[2:3] = []  # 将对应的元素值设置为 []
del list1[1]
del c  # del语句删除单个或多个对象

print(type(a), type(miles), isinstance(name, str))  # 数据类型
print(a + b)
print(name, end=" ")  # 不换行输出
print(name[0:-1])  # 输出第一个到倒数第二个的所有字符
print(name[0])  # 输出字符串第一个字符
print(name[2:5])  # 输出从第三个开始到第五个的字符
print(name[2:])  # 输出从第三个开始的后的所有字符
print(name * 2)  # 输出字符串两次
print(name + '你好')  # 连接字符串

print(list1)  # 输出完整列表
print(list1[1:3])  # 从第二个开始输出到第三个元素
print(list1[2:])  # 输出从第三个元素开始的所有元素
print(list1[2:5:2])  # 列表截取可以接收第三个参数，参数作用是截取的步长
print(tinyList * 2)  # 输出两次列表
print(list1 + tinyList)  # 连接列表

'''
元组与列表类似，不同之处在于元组的元素不能修改
'''
print('########-------------tuple元组-----------------#########')
tuple1 = ("tuple1", "tuple2", 12345678)
tuple2 = (90, 168.138)
tuple3 = tuple1 + tuple2
print("tuple1 of type is:", type(tuple1))
print("type1[0] is:", tuple1[0])
print("length of tuple3 is:", len(tuple3), ",max value is:", max(tuple2), ",将列表转换为元组:", tuple(tuple3))
print("tuple3 *2 is:", tuple3 * 2)

"""
字典
1）不允许同一个键出现两次
2）键必须不可变，所以可以用数字，字符串或元组充当，而用列表就不行
# del dict1['name'] # 删除键 'Name'
# dict1.clear()     # 清空字典
# del dict1         # 删除字典
# #print(dict1)
"""
print('########-------------dictionary字典-----------------#########')
dict1 = {"name": "Chad", "grad3": "pThree", "age": 30, "country": "China"}
dict1["name"] = "Roanldo"
dict1['grad3'] = 'Seenior'
print("字典的name is:", dict1["name"], ",字典的age is：", dict1.get('age'))
print("字典的长度是：", len(dict1), "字典的字符串列表：", str(dict1))
print("name 是否在字典里：", 'name' in dict1)
# dict1.pop("age")

# 遍历字典
print("########## 循环与条件 if var1: #########")
for x in dict1.keys():
    if "Age" in dict1:
        print("value of country key is:", dict1.get(x))
    elif dict1.get(x) == 30:
        print("value age key is:", dict1.get(x))
        break
    else:
        print("条件语句都没命中:")

    print("key对应的值是：", x, ":", dict1.get(x))

listLength = len(list1)
print("list数组是：", list1)
while listLength > 0:
    listLength = listLength - 1
    print("用while遍历list数组是：", listLength, "is:", list1[listLength - 1])
else:
    print("while 循环语句已经结束了，跳出来！！")

it = iter(dict1)
for x in it:
    pass
    print("iterator 遍历z; key对应的值是：", x, ":", dict1.get(x))

print("########## 循环与条件 if var1: END ！！！！#########")

'''
集合（set）是一个无序的不重复元素序列
注意：创建一个空集合必须用 set() 而不是 { }，因为 { } 
'''
print('########-------------set集合-----------------#########')
collection = {1, 2, 3, 4, 'apple', 'orange', 'apple', 'pear', 'orange', 'banana', 'tomato'}
collection2 = set((1, 2, 3, "apple", "Runoob", "Taobao"))  # 最多只能有一个元素
print(collection)
print(collection2)
print("name 是否在集合里：", 'orange' in collection)
print("collection-collection2: ", collection - collection2)  # 集合a中包含而集合b中不包含的元素
print("collection | collection2: ", collection | collection2)  # 集合a或b中包含的所有元素
print("collection & collection2: ", collection & collection2)  # 集合a和b中都包含了的元素
print("collection ^ collection2: ", collection ^ collection2)  # 不同时包含于a和b的元素

print('hello', end=';')  # 关键字end可以用于将结果输出到同一行
print('hello\nrunoob')  # 使用反斜杠(\)+n转义特殊字符
print(r'hello\nrunoob')  # 在字符串前面添加一个 r，表示原始字符串，不会发生转义, raw string

# ##算术运算数值运算
# 除法，得到一个浮点数; #除法，得到一个整数; #取余; #乘方
print(2 / 4);
print(2 // 4);
print(13 % 2);
print(2 ** 5)

# 类定义 函数定义等等
print("########## 类定义 函数定义等等 ##########")


class People:
    # 定义基本属性
    name = ''
    age = 0
    # 定义私有属性,私有属性在类外部无法直接进行访问，两个下划线开头，声明该属性为私有
    __weight = 0

    # 定义构造方法
    def __init__(self, name, age, weight):
        self.name = name
        self.age = age
        self.__weight = weight

    def speak(self):
        print("%s 说: 我 %d 岁。" % (self.name, self.age))


# 单继承示例
class Student(People):
    global grade  # 全域变量，全局变量

    def __init__(self, names, age, weight, grades=4):  # grade默认参数,必须写在最后面，不能位于没有默认值的参数前面
        # 调用父类的构造函数
        People.__init__(self, names, age, weight)
        self.grade = grades

    # 覆写父类的方法
    def speak(self, *vartuple):  # 函数定义
        print("%s 说: 我 %d 岁了，我在读 %d 年级" % (self.name, self.age, self.grade))
        # print("%s说: 我 %d 岁了，我在读 %d 年级", self.name,self.age,self.grade)
        for var in vartuple:
            print("遍历不定长参数，可变参数...：", var)
        print("不定长参数：", vartuple)


s = Student('ken', 10, 60, 3)
s.speak("Ronaldo", 43)  # *vartuple不定长参数，加了两个星号 ** 的参数会以字典的形式导入。

# 匿名函数  lambda [arg1 [,arg2,.....argn]]:expression
sum1 = lambda arg1, arg2: arg1 + arg2
# 调用sum函数
print("匿名函数lambda相加后的值为 : ", sum1(10, 20))

print("全局变量grade的值从0变为：", grade)

input("\n\n按下 enter 键后退出。")  # 键盘输入 "\n\n"在结果输出前会输出两个新的空行。一旦用户按下 enter 键时，程序将退出
stdout.write('\n' + name + '\n-----\n')  # 因为已经导入name成员，所以此处引用时不需要加sys.name
guess = int(input("请输入一个数字，一定要是数字。。。"))
