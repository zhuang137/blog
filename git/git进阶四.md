【跳坑指南-Git】<br>
###访问之前的文章:<br>
[git进阶一](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%B8%80.md)<br>
[git进阶二](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%BA%8C.md)<br>
[git进阶三](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%B8%89.md)<br>

--------
##本文主要讲解：
    note:1)patch打包以及使用！
         2)commit msg相关命令！
----
###patch打包以及使用
    A:老大，你上一节说用git reset --hard FETCH_HEAD,然后使用git pull同步服务器的代码。我辛辛苦苦搞了好久的代码
      就因为这句命令搞得不见了，我的所有付出付诸东流了。
    B:我曹，你搞毛线啊，你对这些git还不是很明白，你没保存自己重要的东西就是用肯定会出现问题的。这个命令上几节只说了它
      很牛逼，但是在git还没有真正熟练之前一定要谨慎使用。需要谨慎的地方就是现在你这种情况。
    A:奥，你为啥不早说啊，现在我还要重新搞代码，头大。。。
    B:我也是第一次写文章，哈哈，经验不足，教程中有任何错误指出来，一定要联系我啊。现在我来给你讲讲如何保存你的代码，做
      到万无一失，轻轻松松搞定复杂的提交。(话说你壮哥我以前入了好多坑，记得有一次提交提了也没提上去)
    A:那就麻烦老大了，有空给你发红包哈。
    B:红包我喜欢，到时候可以打赏我啊。恩，新浪微博我也会同步转发本篇文章的，哈哈(后期个人网站搭建起来会有支付宝打赏)
    A:别说废话了，开始吧
    B:恩恩，首先呢，就是如何把你的代码打包保存。其实打包保存很简单，就是把你修改的所有文件作为一次版本提交，然后使用
      命令git format-patch HEAD^就OK了。然后你会在当前目录生成一个.patch后缀的文件，这个文件一定要妥善保管好额。
      如果你要打包最近三次的提交也是OK的，就用HEAD~3就行了。
    A:老大，我现在有一个需求，就是只需要某一个commit id所对应的patch，这个该咋搞?
    B:刚才这个命令弄明白了没有，弄明白的话你就不会想想？
    A:老大，既然HEAD^可以打包最新的commit，那我把我需要打包的那个commit id搞为当前最新的commit不就行了
    B:我曹，聪明的很啊，其实就用回退命令回退到那个commit id就OK了，你就用git reset --hard commit-id，然后再
      用上面的命令
    A:那我还有一个需求，就是想把某个commit-id之后的所有提交，都打包
    B:首先呢，一个commit-id能打一个包，如果这个commit-id后有很多个提交版本，那么就会生成多个patch文件。你可以
      新建一个分支，git checkout -b patch-base-branch，然后git reset --hard commit-id。这个分支只是临时
      创建的名字随便起就行，然后回退之后作为对比分支。现在切回到主分支git checkout master,接着使用命令
```Bash
git format-patch -M patch-base-branch
```
-------
![image](https://github.com/zhuang137/blog/blob/master/picture/git4.gif "git4.gif")

    B:这条命令记住就行了。当然，还有其他途径，不过目前我只熟悉这个命令，对于我们的日常最够了。
-----
###commit msg相关命令
    A:老大，我提交的时候一般使用命令git commit，然后跳出来一个我不会用的编辑器让我修改msg，这个编辑器完全不会用
    B:我喜欢用vim，用git config --global core.editor vim就行了
    A:那我用gedit吧，vim完全不会用。
    B:用什么编辑器无所谓，都是习惯问题，我用vi习惯了，大概有一年没用过其他IDE了，代码都是手写的。(可能影响效率吧)
    （壮老大会在以后的教程中录制视频，让你们感触到vim的上手是有多简单，哈哈）
    A:老大，我现在有一个需求，但是我本地没搞好，一个需求搞了两个提交，能否把这两个合并为一个。
    B:恩，你这个需求提的好，当然是有办法的，也很简单。使用git rebase HEAD~2 -i，然后打开的页面你会发现帮助文档。
----
![image](https://github.com/zhuang137/blog/blob/master/picture/git4-2.gif "git4-2.gif")

    B:帮助文档是不是有很多个选项，我们常用的就是edit squash fixup这三个
    A：那这三个都干啥的？
    B:你自己看英文吧，小伙。这三个很重要，我讲了一个，还有两个，都很重要的，你自己百度一下吧
