#!/bin/bash

## ln软链接 ln -s 需要链接的文件位置及其名字 新的链接名
#ln -s /Users/chad/project/git/automation-merge.sh ./git-merge.sh

work_dir="/Users/chad/project/git/ios_ci"
#`chmod +x $0`
`chmod +x $work_dir`
echo "########work_dir is: $work_dir"

sleep 1

demoFun(){
    echo "切换目录到：$work_dir"
    cd $work_dir
}
demoFun

echo "########current dir is: $PWD"
curr_branch=`git status | grep "develop"` #管道符使用|,不能有空格
echo "########curr_branch is: $curr_branch"

if [[ ! -n "$curr_branch" ]]; then
	echo "#################### curr_branch is Not develop, checkout develop ####################"
	`git checkout develop>/dev/null`

fi
`git reset --hard head^ >/dev/null`
`git fetch>/dev/null`
echo "##############git pull origin develop"
`git pull origin develop`

echo "#################### merge develop into ci ####################"
`git checkout ci`
`git reset --hard head^`
`git fetch`
echo "###############git pull origin ci"
`git pull origin ci` 
`git merge develop`
`git push origin ci` 

echo "#################### checkout back to develop ####################"
`git checkout develop`
