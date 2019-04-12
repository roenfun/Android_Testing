# @Time : 2019-03-30
# @Author : Chad
# @File : server.py 
# @Software: PyCharm

import sys
import socket

serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = socket.gethostname()
port = 9999
serverSocket.bind((host, port))
serverSocket.listen(5)

while True:
    clientsocket, addr = serverSocket.accept()
    print("连接地址：%s" % str(addr))

    msg = "欢迎学习python socket知识\n\n"
    clientsocket.send(msg.encode('utf-8'))
    clientsocket.close()
