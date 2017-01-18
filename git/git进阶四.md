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
    A:老大，你上一节说用git reset --hard FETCH_HEAD,然后使用git pull同步服务器的代码。我辛辛苦苦搞了好久的代码<br>
      就因为这句命令搞得不见了，我的所有付出付诸东流了。
    B:我曹，你搞毛线啊，你对这些git还不是很明白，你没保存自己重要的东西就是用肯定会出现问题的。这个命令上几节只说了它<br>
      很牛逼，但是在git还没有真正熟练之前一定要谨慎使用。需要谨慎的地方就是现在你这种情况。<br>
    A:奥，你为啥不早说啊，现在我还要重新搞代码，头大。。。
    B:我也是第一次写文章，哈哈，经验不足，教程中有任何错误指出来，一定要联系我啊。现在我来给你讲讲如何保存你的代码，做<br>
      到万无一失，轻轻松松搞定复杂的提交。(话说你壮哥我以前入了好多坑，记得有一次提交提了也没提上去)<br>
    A:那就麻烦老大了，有空给你发红包哈。
    B:红包我喜欢，到时候可以微博打赏我啊。恩，新浪微博我也会同步转发本篇文章的，哈哈
    A:别说废话了，开始吧
    
