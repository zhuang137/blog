【跳坑指南-Git】<br>
###访问之前的文章:<br>
[git进阶一](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%B8%80.md)<br>
[git进阶二](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%BA%8C.md)<br>
##本文主要讲解git回退：
    note:1)前两节不懂得别继续看下去了，真的。<br>
         2)回退大神可以跳过去本节了<br>
###回退git版本历史
    A:老板，在git进阶一中，你说要使用git reset --hard FETCH_HEAD,然后你在进阶二也说了，这是保证了本分支的代码与服务器
      一致。能不能说一下回退的时候需要注意什么啊
    B:你百度过没有，没有的话先百度一下
    A:恩，百度过了(#兄弟，百度过了你还问个屁啊，打开网页又没认真看吧，还好有你壮哥写文章给你看)
    B:你个笨蛋，百度过了还问我干屁。看你看文章的份上，我再给你细讲一回。
```Bash
git reset --hard FETCH_HEAD
```
#####回退到最后与服务器同步代码时的位置。如果你上次同步代码是10天前，那么你的代码就太老了。
```Bash
git reset --hard HEAD^10
```
    B:纳尼，出错了，啥情况？这里我贴上gif图大家看一下
![image](https://github.com/zhuang137/blog/blob/master/picture/git3.gif "git3")
----------
    B:我擦，怎么出错了？你知道为啥出错吗？你帮我看一下出错的log
    A:HEAD^2或者HEAD^5这些都会出错，提示unknown revision or path not in the working tree，这意思不就是参数不正确吗？
    B：哈哈哈，其实这些出错我是故意的，为了让你印象深刻。其实这个^后面加上一个数字，一般来说1肯定不会出错，为啥大于2的时候会
      出错呢，这个^加上数字，搭配起来就是回退到它的第几个父提交。现在的问题是父提交是什么东西。
    A:难道还有多个父亲？
    B:这里大家就别脑补了，哈哈。这里只是为了这样讲解而已。我在这里用一个简单的例子将一下吧
`开始讲解了啊，不懂一定要百度，别问我了啊，哈哈，会自己解决问题的童鞋才是好孩子`
----------
    B:比如有三个分支，a 、b 、c都是基于master分支创建的，然后现在假定a b c全部merge到master分支上
----------
```Bash
git merge a b c
```
----------
    B:现在merge之后会生成一个merge的commit，也就是说这次merge相当于一次提交。然后这次提交至少不就有三个父亲a b c吗，
     master可是祖先额，这里我们说的是有直接关系的。
    A:额，懂了。
    B:现在最后一次提交有三个父亲了，我们就可以使用git reset --hard HEAD^3，哪个是第三个父提交呢。我目前认为跟时间点
     有关系(知道的童鞋一定要微博@我活着发邮件1040882146@qq.com额，谢谢喽，微博二维码见文章底部)
    A:哇塞，学习了，好牛逼啊
    B:牛逼不敢当啊，下一个命令就是`git reset --hard HEAD~3`。哈哈，理解了上面的讲述就简单多了。这条命令首先会找到当
     前提交的第一个父提交,然后确定父提交是在哪个merge之前的分支上，比如说是b分支吧。我们想象一下，a分支的第一个提交与
     当前最新提交在一条线上，然后这条线上有很多个提交，我们现在这条回退命令就是在这条线上回退三次。哈哈，`git reset 
     --hard HEAD^^^与git reset --hard HEAD~3`是一样的。
    A:我曹，我记住了。
    B：一定要记住了，过几天考考你。忘了的话就画个圈圈扣你工资
    A:老大，我要忘了，我就给你发红包(#我曹，发红包我喜欢)
----------
![image](https://github.com/zhuang137/blog/blob/master/picture/xinlang.jpg)
