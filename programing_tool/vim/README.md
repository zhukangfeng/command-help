# config vim
## install vim plugins
```
YouCompleteMe
ultisnips.git
vim-snippets.git
neocomplete.vim
auto-pairs
nerdtree
vim-latex-live-preview
vim-gitgutter
vim-signify
vim-fugitive
airline/vim-airline
airline/vim-airline-themes
indentLine
vim-colorschemes
```
## common usage
### replace
```vim
:34,.s/3/2/g
```
- 34说明从34行开始
- “,.”说明直到最后一行
- “/3”指定需要被替换的字符串
- “/2”目标结果字符串
- “/g”每一行所有匹配的都替换,如果不存在,则修改每一行的第一个”3”.
