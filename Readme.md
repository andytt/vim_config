# Ertuil VIM 配置

版本： 0.0.1

最近重新配置了 VIM 的配置文件。删除了瞎 JB 配置的东西。并配置主要以 <space> 的一系列快捷键。
特此写下此防呆备忘录，方便在其他环境配置。

使用的插件有：

* Plugin 'VundleVim/Vundle.vim'
* Plugin 'The-NERD-tree'
* Plugin 'taglist.vim'
* Plugin 'AutoComplPop'
* Plugin 'Syntastic'

## 安装

git 将此仓库拖到本地 .vim 文件夹，而后将.vim 文件夹中的 .vimrc 文件软连接到 ~/.vimrc 即可。

## 快捷键使用 

| 快捷键 | 作用 |
| ------ | ---- |
| <space>+s | 保存文件 |
| <space>+q | 关闭缓存区 |
| <space>+j/k/h/l | 移动到上下左右窗口 |
| <space>+w | 切换到下一个窗口 |
| <space>+w+h/j/k/l | 上下左右调整窗口大小 | 
| <space>+f | 打开关闭文件处理器 |
| <space>+t | 打开关闭 tlist 窗口 |
| <space>+e | 打开 debug 窗口 |
| <space>+r | 编译并且运行 |
| <space>+c | 注释和取消注释 |

## 标签相关

| 快捷键 | 作用 |
| ------ | ---- |
| <space>+g+e | 新标签打开文件 |
| <space>+g+c | 关闭标签 |
| <space>+g+o | 关闭其他标签 |
| <space>+g+n | 切换到上一个标签 |
| <space>+g+m | 切换到下一个标签 |
| <space>+g+<num> | 切换第 num 个标签 |
