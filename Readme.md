# Ertuil VIM 配置

版本： 0.0.1

最近重新配置了 VIM 的配置文件。删除了瞎 JB 配置的东西。并配置主要以 < space > 的一系列快捷键。
特此写下此防呆备忘录，方便在其他环境配置。

使用的插件有：

* Plugin 'VundleVim/Vundle.vim'
* Plugin 'The-NERD-tree'
* Plugin 'taglist.vim'
* Plugin 'AutoComplPop'
* Plugin 'Syntastic'
* Plugin 'The-NERD-Commenter'
* Plugin 'lrvick/Conque-Shell'
* Plugin 'vim-airline/vim-airline'
* Plugin 'vim-airline/vim-airline-themes'
* Plugin 'kien/ctrlp.vim'

## 安装

* git 将此仓库拖到本地 .vim 文件
* 使用如下命令安装 vundle `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* 在vim 中运行 :PluginInstall

## 快捷键使用 

| 快捷键 | 作用 |
| ------ | ---- |
| < space > + w | 保存文件 |
| < space > + q | 关闭缓存区 |
| < space > + o | 分页打开新文件 |
| < space > + p | 上翻页 |
| < space > + n | 下翻页 |
| < space > + j/k/h/l | 移动到上下左右窗口 |
| < space > + u + h/j/k/l | 上下左右调整窗口大小 | 
| < space > + s | 全局搜索，文件、图片等 |
| < space > + f | 文件管理 |
| < space > + v | 打开关闭显示行号 |
| < space > + m | 打开 Ertuil VIM 帮助文档 |

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
| <space>ga | git add * |
| <space>gc | git commit -m |
| <space>gg | git add * && git commit -m |
| <space>gm | git merge |
| <space>gp | git push |
| <space>gP | git pull |

## 插件快捷调用

| 快捷键 | 作用 |
| ------ | ---- |
| < space > + f | 打开关闭文件处理器 |
| < space > + t | 打开关闭 tlist 窗口 |
| < space > + e | 打开 debug 窗口 |
| < space > + r | 编译并且运行 |
| < space > + c | 注释和取消注释 |
| < space > + x | 新建窗口 打开终端 |
| < space > + X | 新建标签 打开终端 |
| < space > + a | 打开自动补全 |
| < space > + A | 关闭自动补全 |

## 标签相关

| 快捷键 | 作用 |
| ------ | ---- |
| < space > + j + e | 新标签打开文件 |
| < space > + j + c | 关闭标签 |
| < space > + j + o | 关闭其他标签 |
| < space > + j + n | 切换到上一个标签 |
| < space > + j + m | 切换到下一个标签 |

