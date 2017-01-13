【跳坑指南-Git】
本篇是给使用过git的人进阶用的，没有使用过git pull, git push, git remote的人请绕过，看了也没啥用(话说的太直接了，哈哈)。
 
Git pull 就是从服务器下载更新，git push就是把自己的提交推送到服务器上。虽然两个命令很简单，但是其中还会有很多人遇到麻烦。
不明白其中的原由，出错了也摸不着头脑。当然我也是进过坑的。

场景一：
 
A：老板，我已经提交代码了，但是git服务器一直提示can’t merge。

老板：你提交前用git pull拉取更新了吗？

A：我拉了    #说这三个字的同学不在少数啊。哈哈

老板：你确定你拉了？用的git pull && git push命令吗？中间没有sleep几十秒？

A：我没有做其他操作，没有停留，拉了之后直接提的 （#没拿卫生纸吗？哥们）

老板：奥，我来帮你看看

老板都操作了这些：
![image](https://github.com/zhuang137/blog/blob/master/picture/git_push_error1.png)

图中红色标注的部分就是命令以及输出，为了防止看不清，我再写一下
 
    1）git log -n2|grep "commit"|tail -n1|cut -d " " -f2&& cat .git/FETCH_HEAD
    2）查看输出的两行中，commit id是否一样。图中的两个commit id只要不一样，肯定是会出错的，要么就是confilict
       要么就是can’t merge
    3) 小A啊，你重新提吧，先把你的这次提交保存一下，可以用format-patch，只要保存下来就行了。然后用git reset 
       --hard FETCH_HEAD && git pull，然后再重新加你的代码吧。
#在这里我多说一句，建议用git format-patch保存成patch文件,另外建议使用vim编辑器提交代码(刚开始可能不习惯，之后你会爱上vim的)

场景二：

A：老板，我为啥拉代码老是失败

老板：失败你妹 啊，用git remote -v看一下你的URL配置了没有，然后看看我的URL跟你的一样不一样

A：我跟你的一样啊老板，我曹了，这是什么情况

老板：具体报的什么错误，怎么失败了？

A：这个路径的文件error了。。。。

老板：我曹，你以后能不能自己创建一个分支放你自己的代码啊，工作的那个分支别鸡巴的当成你自己的版本了。
     继续git reset --hard FETCH_HEAD. #没有拉取代码权限的就忽略了
 
上面两个场景真的很重要，因为我也曾经这样过。总结一下上述的命令，其中最重要的就是一个命令git reset --hard FETCH_HEAD，
这行代码是无敌的，会把你的代码回退到上次正确的代码的地方。

另外就是场景一中的第一步，这个命令太长了
git log -n2|grep "commit"|tail -n1|cut -d " " -f2&& cat .git/FETCH_HEAD
 
不懂shell的同学可以了解一下管道命令（‘|’）以及cut grep这些命令常用的操作很简单的
 
不想了解的童鞋我简单讲解一下这条命令是做什么用的
 
git log -n2查看最近的两次提交，然后我们要对比第二次提交的commit id与FETCH_HEAD所指向的commit id，如果两次一样，则代表，
你的这次提交是基于git pull之后的，是正确的。如果不一样，则要继续git pull了
