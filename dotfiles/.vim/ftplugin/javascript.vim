command!  JavascriptLint    !jsl --nologo --conf /cygwin/home/`whoami`/jsl.conf --process %
map       <C-l>             <ESC>:JavascriptLint <CR>

map <C-L>   <ESC>:!/usr/local/bin/jsl.exe -conf C:\\cygwin\\home\\`whoami`\\.jsl.conf -process %<CR>
map <C-K>   <ESC>:.! ~/.vim/scripts/vim-debug-line-javascript.pl<CR>==
map <C-F>   <ESC>:.! ~/.vim/scripts/vim-for-loop-javascript.pl<CR>==
map <C-A-F> <ESC>:.! ~/.vim/scripts/vim-for-loop-javascript-reverse.pl<CR>==

