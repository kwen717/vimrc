# vimrc
kw's vimrc


# For Directory cpp_src/
$ ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ cpp_src 
$ mv tags cpp # or whatever 
# In Vim: 
set tags+=/my/path/to/tags/cpp 
