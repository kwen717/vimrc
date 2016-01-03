kw's vimrc
=========

#Install
# Install ctags
$ sudo apt-get install exuberant-ctags
# Install taglist
Get taglist from 
    http://vim-taglist.sourceforge.net/
Unzip taglist and mv plugin/ doc/ to ~/.vim/
# Use F9 to check tag list
    map <f9> :Tlist<CR>

# c++ header src
## Use directory cpp_src/
$ ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ cpp_src 
$ mv tags cpp # or whatever 
## In Vim: 
set tags+=/my/path/to/tags/cpp 
