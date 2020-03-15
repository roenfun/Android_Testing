sleep 10
jobs
bg 3
fg 3

sort -n | uniq -c | sort -n -r | head -1 

#find 查找文件
find /usr/ -name "nginx.conf"
chmod u+x test.sh

#curl 网路请求，-s 不会显示下载进度
curl -s https://testing-studio.com/
#-i 同时获取头信息, -I 仅返回头部信息
curl -i  https://www.baidu.com/

#查看端口
#-l 仅列出有在 Listen (监听) 的服務状态
netstat -tlnp
lsof | grep 9001; kill -9 pid

#ps查看进程，忽略大小写 -i，不显示匹配的行 -v，独立的行显示 -o 
ps -ef | grep nginx | grep -i -v grep

echo "----top-----"
:<<'

'
top -b -d 1 -n 20 -p 19912 

echo "----grep----"
:<<'
基本表达式(BRE)
^ 开头 $结尾 
[a-z] [0-9] 区间 
* 0个或多个
基本正则(BRE)与扩展正则的区别(ERE) ? 非贪婪匹配
+ 一个或者多个
() 分组
{} 范围约束
| 匹配多个表达式的任何一个
--line-buffere 动态刷新的文件中查找并输出匹配关键字的行,如 top，动态日志等
'
grep -o pattern file #把每个匹配的内容用独立的行显示

ehco "-------awk------"
:<<EOF
基本语法：awk 'pattern{action}'
awk 'BEGIN{}END{}' 开始和结束
EOF
ifconfig | awk 'BEGIN{FS=" "; a=0}{print $1; a=a+$2}END{print a}'

ehco "-------sed------"
#修改文件并先备份一下文件
sed -i.bak 's/hello/Hi' test.text
