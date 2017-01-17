【跳坑指南-Git】<br>
###访问之前的文章:<br>
[git进阶一](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%B8%80.md)<br>
[git进阶二](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%BA%8C.md)<br>
##本文主要讲解两个知识点：
    1. 回退git版本提交
    2. patch补丁文件的应用

###回退git版本历史
    A:老板，在git进阶一中，你说要使用git reset --hard FETCH_HEAD,然后你在进阶二也说了，这是保证了本分支的代码与服务器<br>
      一致。能不能说一下回退的时候需要注意什么啊<br>
    B:你百度过没有，没有的话先百度一下<br>
    A:恩，百度过了(#兄弟，百度过了你还问个屁啊，打开网页又没认真看吧，还好有你壮哥写文章给你看)<br>
    B:你个笨蛋，百度过了还问我干屁。看你看文章的份上，我再给你细讲一回。<br>
```Bash
git reset --hard FETCH_HEAD
```
####回退到最后与服务器同步代码时的位置。如果你上次同步代码是10天前，那么你的代码就太老了。
```Bash
git reset --hard HEAD^10<br>
```
    B:纳尼，出错了，啥情况？这里我贴上gif图大家看一下
![image](https://github.com/zhuang137/blog/blob/master/picture/git3.gif "git3")<br>
    B:我擦，怎么出错了？你知道为啥出错吗？你帮我看一下出错的log
    A:HEAD^2或者HEAD^5这些都会出错，提示unknown revision or path not in the working tree，这意思不就是参数不正确吗？
    B：哈哈哈，其实这些出错我是故意的，为了让你印象深刻。其实这个^后面加上一个数字，一般来说1肯定不会出错，为啥大于2的时候会<br>
      出错呢，这个^加上数字，搭配起来就是回退到它的第一个父提交，后面数字的意义一会再讲，现在的问题是第一个父提交是什么东西。<br>
    A:不就是当前提交的第一个父亲吗？难道还有多个父亲？
    B:这里大家就别脑补了，哈哈。这里只是为了这样讲解而已。我给大家画个图片
    
