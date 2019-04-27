# @File : huogewozistudy.py 
# @Author : Chad
# @Time : 2019-04-23

'''
地址:
https://testerhome.com/topics/18877
'''

# 利用pip, 安装第三方模块requests, 描述你用什么方法来确认安装是成功的。
# pip3 install requests
# pip3 list | grep "requests"

# Binary,Octal,Decimal,Hex 进制
# 把2.918 转化为整形 decimal to integer, decimal模块
print(int(2.918))  # int("2.918".split('.')[0])
# 把10 进制数 18 转化为2进制数
print(bin(18))
print(oct(18))
print(hex(18))

# 用java 替换字符串：”Python is popular” 里面的Python，并 把java 变换成JAVA
print("Python is popular".replace("Python", "java".upper()))
# 把列表 [1, 2, 3,4 5,6,7,8]里面的2, 4, 6,8 打印出来
for i in [1, 2, 3, 4, 5, 6, 7, 8]:
    if 0 == i % 2:
        print(i)

# 创建一个字典，字典的key分别是name, sex, province , 修改原始province 的值 为新值”江苏”
dict1 = {"name": "Chad", "sex": "Male", "Province": "GuangXi"}
dict1["Province"] = "江苏"
print(dict1)

# Test_str=“Python was created in 1989, Python is using in AI, big data, IOT.” 按下列要求对上面文字做出处理。
# • 把上面文字中的所有大写转化为小写
# • 把这段话每个单词放到列表里面，不能包含空格。
# • 把列表最中间的一个单词打印出来。
Test_str = "Python was created in 1989, Python is using in AI, big data, IOT."
Test_str = Test_str.lower()
print(Test_str)
list1 = Test_str.replace(",", "").split(" ")
print("type of list1 is:", type(list1))
print(list1)
size = len(list1)
print("length of list1", size)
m = size % 2
print("m", m)
if m == 0:
    m = size / 2
    print("列表最中间的一个单词", list1[m])
else:
    m = int(size / 2)
    print("列表最中间的一个单词:", list1[m])

# 2.List1=[“python”, 5,6, 8], list2=[“python”,”5”, 6, 8,10], 对list1和list2做出如下处理：
# • 把上面2个list的内容合并成一个
listOne = ["python", 5, 6, 8]
ListTwo = ["python", "5", 6, 8, 10]
ListTwo.reverse()
print(listOne + ListTwo)
# • 利用set里面的方法，对合并后的list， 去除重复元素。最 后输出是还是list =“python”, 5,6, 8,”5”,10
print(set(ListTwo + listOne))


# 实现一个函数，要求对一个列表里面所有数字求和，如果里 面含有非数字的元素。直接跳过。比如[1,2,3] 输出是5， 如果 是[1,2,4,”a”] 输出是7。 并在另外一个包（目录）里面调用这个 函数
def listsum(mylist):
    sum = 0
    for i in mylist:
        if isinstance(i, int):
            sum += i
    print("数字求和:", sum)


listsum([1, 2.4, 5, "test"])


# 实现一个不定长参数的函数def flexible(aa, *args, **kwargs):，
# 把传入的参数和值打印出来。比如传入参数是
# flexible(aa, 2, 3, x = 4, y = 5, *[1, 2, 3], **{'a':1,'b': 2})
# 输出结果：(2, 3, 1, 2, 3)，{'a': 1, 'y': 5, 'b': 2, 'x': 4}

def flexible(aa, *args, **kwargs):
    print(aa)
    print(args)
    print(kwargs)


flexible(2, 3, x=4, y=5, *[1, 2, 3], **{'a': 1, 'b': 2})
# 面试题：*args, **kwargs 有什么作用
