【跳坑指南-Git】<br>
###访问之前的文章:<br>
[git进阶一](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%B8%80.md)<br>
[git进阶二](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%BA%8C.md)<br>
[git进阶三](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%B8%89.md)<br>
[git进阶四](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E5%9B%9B.md)<br>
[git进阶五](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%BA%94-git%20add%20%E6%9C%89%E4%BD%95%E8%A6%81%E8%AF%B4.md)<br>

--------
###  之前的每一篇文章都是采取对话的形式写的，可能有利也有弊吧，以后更新的文章全部都用书面语句去写。一来清晰，思路明确，<br>
###能够立马学会很多，二来也为了以后自己查询方便。三嘛，锻炼自己的写文档能力。<br>
##本文主要讲解：
    note:1)git pull命令
         2)git push命令

----
###git pull命令
      这个是不是很简单，就是拉代码。但是有时候你直接用git pull拉代码肯定会遇到错误。然后错误提示你没有找到url。也就是
    说你拉代码肯定要从服务器拉取，然后这个服务器地址你需要指定。看下图
----

![image](https://github.com/zhuang137/blog/blob/master/picture/git6-1.gif)<br>
----
###---------------------------------------------------------------------------------------
      图中使用了命令git config branch.test.remote URL,这里的URL可以是https类似的地址，也可以是一个你的remote名字.
    你可以使用git remote -v查看一下你的remote name有几对儿（fetch跟push是一对儿）.图中的URL就是blog了.
    你如果想自己添加一些remote name，那就用git remote add xiaosan https:avav.com 这种形式去加，name可以随便起.
    地址有点邪恶了，千万别点开额，哈哈！然后图中还有一个merge以及rebase这个东西，我们运行了命令git config branch.test
    .merge refs/heads/master，这个东西是git pull中关键的东西，没有这个东西你当前分支更新不了；rebase其实可以选择，其
    实就是git pull --rebase的意思.
###git push命令
      刚才是在test分支上加了remote以及merge选项，现在我们随便搞一个提交，看一看能否直接提交到master分支。看下图
----

![image](https://github.com/zhuang137/blog/blob/master/picture/git6-2.gif)<br>
---
###-----------------------------------------------------------------------------------------
      git push blog HEAD:master这个命令中最关键的就是HEAD:master了。我们可以通过官方文档查看git push的字段，我也是
    在写文档的时候才去查看了官网看的，以前只知道用法，不知道内涵。
      HEAD其实就是最新的一次commit，冒号后面的master就是remote side的分支名称。也就是让最新的一次commit所代表的patch
    提交到远程的master分支。如果你本地仓库有三个自己的提交怎么办，有两种办法：1）把这三次提交变为一次提交。2）将HEAD改为
    对应的commitID,也就是git push blog ID:master就OK了
