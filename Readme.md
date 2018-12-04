# Ertuil VIM 配置

版本： 2.0.3

最近重新配置了 VIM 的配置文件。删除了瞎 JB 配置的东西。并配置主要以 <SPC> 的一系列快捷键。
特此写下此防呆备忘录，方便在其他环境配置。

使用的插件有：

* Plugin 'VundleVim/Vundle.vim'
* Plugin 'The-NERD-tree'
* Plugin 'taglist.vim'
* Plugin 'AutoComplPop'
* Plugin 'haya14busa/incsearch.vim'
* Plugin 'Syntastic'
* Plugin 'The-NERD-Commenter'
* Plugin 'lrvick/Conque-Shell'
* Plugin 'vim-airline/vim-airline'
* Plugin 'vim-airline/vim-airline-themes'
* Plugin 'kien/ctrlp.vim'
* Plugin 'davidhalter/jedi-vim'

## 安装

* git 将此仓库拖到本地 .vim 文件
* 使用如下命令安装 vundle `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* 在vim 中运行 :PluginInstall

## 快捷键使用 

| 快捷键 | 作用 |
| ------ | ---- |
| <SPC> + w | 保存文件 |
| <SPC> + q | 关闭缓存区 |
| <SPC> + o | 分页打开新文件 |
| <SPC> + p | 上翻页 |
| <SPC> + n | 下翻页 |
| <SPC> + j/k/h/l | 移动到上下左右窗口 |
| <SPC> + u + h/j/k/l | 上下左右调整窗口大小 | 
| <SPC> + f | 文件搜索等 |
| <SPC> + d | 文件管理 |
| <SPC> + s | 查找 |
| <SPC> + v | 打开关闭显示行号 |
| <SPC> + m | 打开 Ertuil VIM 帮助文档 |

## 快速跳转相关

| 快捷键 | 作用 |
| ------ | ---- |
| < C-A > | 跳转到行头 |
| < C-E > | 跳转到行尾 |
| < C-K > | 从当前字符删除到行尾 |
| < C-U > | 从当前字符删除到行头 |

## git 相关

| 快捷键 | 作用 |
| ------ | ---- |
| <SPC>ga | git add * |
| <SPC>gc | git commit -m |
| <SPC>gg | git add * && git commit -m |
| <SPC>gm | git merge |
| <SPC>gp | git push |
| <SPC>gP | git pull |

## 插件快捷调用

| 快捷键 | 作用 |
| ------ | ---- |
| <SPC> + d | 打开关闭文件处理器 |
| <SPC> + t | 打开关闭 tlist 窗口 |
| <SPC> + e | 打开 debug 窗口 |
| <SPC> + r | 编译并且运行 |
| <SPC> + c | 注释和取消注释 |
| <SPC> + x | 新建窗口 打开终端 |
| <SPC> + X | 新建标签 打开终端 |
| <SPC> + a | 打开自动补全 |
| <SPC> + A | 关闭自动补全 |

注意：在终端下使用 <C-_> 作为功能键。

## 标签相关

| 快捷键 | 作用 |
| ------ | ---- |
| <SPC> + j + e | 新标签打开文件 |
| <SPC> + j + c | 关闭标签 |
| <SPC> + j + o | 关闭其他标签 |
| <SPC> + j + n | 切换到上一个标签 |
| <SPC> + j + m | 切换到下一个标签 |

