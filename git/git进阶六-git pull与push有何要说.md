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

![image](https://github.com/zhuang137/blog/blob/master/picture/git6-1.gif)
<br>
      图中使用了命令git config branch.test.remote URL,这里的URL可以是https类似的地址，也可以是一个你的remote名字.
    你可以使用git remote -v查看一下你的remote name有几对儿（fetch跟push是一对儿）.图中的URL就是blog了.
      你如果想自己添加一些remote name，那就用git remote add xiaosan https:avav.com 这种形式去加，name可以随便起.
    地址有点邪恶了，千万别点开额，哈哈！然后图中还有一个merge以及rebase这个东西，我们运行了命令git config branch.test
    .merge refs/heads/master，这个东西是git pull中关键的东西，没有这个东西你当前分支更新不了；rebase其实可以选择，其
    实就是git pull --rebase的意思。
