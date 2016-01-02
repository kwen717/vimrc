#!/bin/bash
#
# @Author	:	Wen.Su
# 
# @Time		: 	2015/10
#
# @Desc		:	
# 				

cp ~/.vimrc ".vimrc.$(date)"
cp .vimrc ~/.vimrc
cp -r plugin/ ~/.vim/
# acp.vim
cp -r autoload/ ~/.vim/
cp -r doc/ ~/.vim/

