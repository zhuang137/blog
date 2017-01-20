【跳坑指南-Git】<br>
###访问之前的文章:<br>
[git进阶一](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%B8%80.md)<br>
[git进阶二](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%BA%8C.md)<br>
[git进阶三](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E4%B8%89.md)<br>
[git进阶四](https://github.com/zhuang137/blog/blob/master/git/git%E8%BF%9B%E9%98%B6%E5%9B%9B.md)<br>

--------
####哈哈，标题之前只有进阶num。这个东西本来就是彰显重点的，要好好利用，所以以后括号里会多出来点，方便以后查询
##本文主要讲解：
    note:1)git add命令
         2)对比git rm命令！
----
###git add 命令
    A:老大，听说你要讲git add，这命令有啥讲的
    B:你是不是现在看了前面几篇，感觉很简单是吧？现在提交没出过错了是吧。是不是感觉我出的这一系列git文章太简单？
      是不是感觉太Low,很多东西都能百度出来，我是多此一举？
    A:老虎发威了啊，这么多是不是。。说实话，git系列别写了，没啥意思，很多都能百度出来
    B:很多都能百度出来这句话我赞同，但是你感觉哪个博客上写的条理而且深入，况且我这git文章是打算出系列的。以后
      很多东西不用买书了，也不用等有需求再百度了，直接回头看我这文章就行。再者说了，学的多有好处的。说一句我自
      以为很对的话，“读一本书读十遍，不如读十本书”，这句话对技术性工作很实用，其他工作我就不清楚了，信不信由你。
     A:额，老大，你这git系列写完我也会看完的，因为我现在只看了你前四篇文章，感觉自己就成大神了。
     B:前几篇只是git的东西，后面会有关于girrit的东西，也就是repo，不过会git的话,repo你就不要放在眼里了，只要
       你坚持看我的每一篇，让你git运用自如。
     A:老大，期待，赶紧说今天的内容吧，扯淡的话太多。
     B:首先是git add 什么时候用，也就是commit之前，我们要把一些要提交的文件记录一下，不记录的就不提交了。我第
       一次使用git的时候，我记得很多人直接使用git add .（还有的人用git add *），这两个命令有什么区别呢？其实，
       这是纯粹的shell脚本。*是通配符，他会匹配当前目录下的所有文件，包括普通文件以及文件夹，也就是说，如果你删
       除了某些文件，你用git add *是无法添加进去的。但是git add .是可以的，因为他是把当前目录为对象add进去的。
       git比较智能，虽然你add *或者add .把很多都add进去了，但是它最后会处理一下，然后只add进去那些变动过的或者
       删除的文件。大家看下图
----
![image](https://github.com/zhuang137/blog/blob/master/picture/git5-1.gif)
----
    B:接下来我们将git add -u,这个u代表是update的意思。也就是说我们会add进去modified与deleted状态的文件
----
![image](https://github.com/zhuang137/blog/blob/master/picture/git5-2.gif)
----
    B:然后git add -A,A代表all的意思，包括modified、deleted、new file，也就是跟git add .一样。
    A:你讲了这么多，不就是git add .我们常用吗？太啰嗦了
    B:恩，有点啰嗦了，不过这条命令要慎用，你自己度量吧。
    A:慎用？那我真的使用git add .全部都添加进去了，那我有几个文件不需要也误add了怎么办，我总不能全部用git add
      一个一个add进去吧，文件万一一百万个，我干一年也干不完。
    B:你妹的，你工作的分支又弄了很多不干净的东西是吧，别把东京热add进去了小伙子。说了几遍了，一定要保证工作分支
      干净无杂。你的东京热能不能放到你自己的分支，放心，自己建的分支放再多MaoP也提交不到服务器。要是git add .之
      后发现只有一两个文件误add进去了，那你就用git reset HEAD fileName就OK了
----
![image](https://github.com/zhuang137/blog/blob/master/picture/git5-3.gif)
-----

:broken_heart，哈哈，东京热.av变成乱码了，这是我这边终端的原因，哈哈，不要在意这么多细节

-----
    A:恩，那不止一两个文件怎么办?
    B:兄弟，看多了伤身，搞那么多干毛线啊，要都被你弄服务器了，成千上万的同事都要流鼻血啊。现在只有一个办法，不会
      shell脚本就慢慢add吧，除非你用神器git reset --hard FETCH_HEAD，然后把工作分支弄干净，最后git add .一
      劳永逸。
    A:看来只能这样了，我顺便帮你总结一下你的废话。首先当前分支要干净，然后git add .或者git add -A，如果误把一两
      个文件add了，就用git reset HEAD fileName移除
    B:小伙子总结的不错
----
###对比git rm命令
    B:git rm <option> filePath，这条命令说的简单一点，就是rm <option> filePath与git add filePath的变种，也
      稍有不同。我目前主要用两个参数，-f以及--cached。-f也就是force，--cached就是删除git库缓存，但是没有删除文件,
      话不多说，直接看图
----
![image](https://github.com/zhuang137/blog/blob/master/picture/git5-4.gif)<br>
![image](https://github.com/zhuang137/blog/blob/master/picture/git5-5.gif)<br>
----
    A:老大，你刚才那个神器命令git reset --hard HEAD怎么变成HEAD了，不是FETCH_HEAD了。
    B：其实这两个都是指向某次提交的commit id的，只是FETCH_HEAD指向服务器那个commit id，HEAD指向的是我需要回退到
      的那个commit版本，你真正成为大神了，会运用自如的。因为我没讲过git目录深入研究，你可以百度一下，这个还是可以去
      网上看一下的。
    A:老大，这个git add命令以及git rm放一块讲原来是这原因啊，因为git rm封装了git add啊
    B:聪明，但是也做了一些其他处理，我们不必要再深究。不过，我可以稍微再提一点。在我们git add之前其实git仓库会立即对
      当前工作目录的变动信息做保存，你不信在add之前可以git diff查看一下。但是这个变动的保存只是临时的而已，git也并不
      认为这是我们真正重要的东西。除非我们使用git add以及git commit，才会真正保存。其实，我们从.git/index文件的变化
      就可以看出来。
----
![image](https://github.com/zhuang137/blog/blob/master/picture/git5-6.gif)
----
    A:奥，原来是这样啊，发明git的人太牛逼了。
    B:是的，但是我们要站在巨人肩膀上看问题，而且要看的更远，好好工作小伙。下一节我给你讲讲git pull相关命令，也是很重要
      的额，不要就会使用git pull去拉代码。
    
