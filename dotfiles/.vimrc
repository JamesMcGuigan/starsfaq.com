"" http://vimdoc.sourceforge.net/htmldoc/options.html

"" ***** VIM OPTIONS *****
syntax   on 
filetype plugin indent on              " load plugins based on filetype from ~/.vim/ftplugin/<filetype>.vim
autocmd  BufWinEnter * filetype detect " reload definitions on window switch
"set verbose=3

colorscheme evening
set nocompatible     " don't emulate borked features from vi
set number           " Show line numbers
set shell=bash
set visualbell t_vb= " don't beep, just flash
"set guioptions-=T   " Don't include toolbar
"set ttyfast         " yes I'm using a fast terminal
"set ttyscroll=0     " don't scroll TTY - its faster
set diffopt=iwhite,filler,context:1000



"" ***** FILE OPTIONS *****
"" http://vimdoc.sourceforge.net/htmldoc/usr_21.html#21.3 - 'files, :commandlines, @inputlines, %bufferlist, <registers, /search
set viminfo=%,!,'1000,f1,<500,:1000,@1000,/1000,h,n~/.viminfo
"set backupdir=/home/james/vimbackup
"set backup         " been having issues with vim deleting files randomly - so be paranoid
"set writebackup

au! BufWritePost .vimrc source %  " sources .vimrc on write


"" ***** PLUGIN OPTIONS - backup.vim - http://www.vim.org/scripts/script.php?script_id=1537 *****
"let g:backup_directory='.vimbackup'
"let g:backup_purge=10


"" ***** STATUS BAR OPTIONS ******
set showmode        " This option is used to show the actual mode of the editor that you are in.
set showmatch       " When a bracket is inserted, briefly jump to the matching one.
set showcmd         " show the commands being entered
set showfulltag     
set wildmenu        " command tab complextion in status bar
set laststatus=2    " when is status bar shown:  0=never, 1=only if mutliple windows, 2=always
set showtabline=2   " when is tabline shown:     0=never, 1=only if mutliple tabs,    2=always
set statusline=[%n]\ %<%f\ %h%w%m%r%=%10l,%-10(%c%V%)%P 


"" **** MOVEMENT OPTIONS *****
set scrolloff=2                " number of lines to keep above/below cursor
set virtualedit=all            " allow cursor where there is no char
set backspace=indent,eol,start " backspace can join lines
set iskeyword=$,@,48-57,192-255,_,-
"set matchpairs+=<:>            " allow % to jump between extra <> tags


"" ***** SEARCH OPTIONS *****
set wrapscan   " if the word is not found at the bottom of the file, it will try to search for it at the beginning.
set incsearch  " incremental search
set ignorecase " case insensitive search
set smartcase  " case sensive IF search contains uppercase chars
set gdefault   " default replace all matches  s///g  on search/replace
set magic      " treat . * ^ $ as regex symbols without escaping
"set hls       " highlight search results


"" ***** TAB / INDENT OPTIONS *****
"set cindent      " indent using C standards
"set autoindent   " base indent on previous line
"set smartindent  " autoindent on a new line - set by indent files
set tabstop=4     " size of a tab char
set softtabstop=4 " insert a mix of tabs and spaces
set shiftwidth=4  " number of spaces to use for autoindent
set expandtab     " don't Auto expand tabs to spaces
set textwidth=0   " linewidth to endless
set nowrap        " do not wrap lines

"" ***** STARTUP OPTIONS *****
set autoread                               " reload file when its changed remotely
"set viewdir=~/.vim/views                  " save current editing position 
"autocmd BufWinLeave *.js mkview           " save current editing position on exit
"autocmd BufWinEnter *.js silent loadview  " reload last editing position


"" ***** MAPPINGS *****
" prevent insert button from going into replace mode
imap <Insert> <ESC>a

"" Fix dodgy keyboard at work
map! <F2> /
map! <F3> *
map! <F4> -
map! <F5> +

"map               <F9>             <ESC>:tabfirst<CR>
"map               <F10>            <ESC>:tabprevious<CR>
"map               <F11>            <ESC>:tabnext<CR>
"map               <F12>            <ESC>:tablast<CR>
"map               <C-w><PageDown>  <ESC>:tabnext<CR>
"map               <C-w><PageUp>    <ESC>:tabprevious<CR>
"map               <F7>             <ESC>:diffput<CR>
"map               <F8>             <ESC>:diffget<CR>
"nmap     <silent> <C-N>            <ESC>:call ToggleHLSearch()<CR>
"inoremap          <Tab>            <C-R>=Mosh_Tab_Or_Complete()<CR>

cabbr    splitt            tabnew
cabbr    splittab          tabnew
cabbr    Wq                wq
cabbr    Wqa               wqa

command! Stripwhitespace   %s/[ \t]\+$//
command! RunScript         !./%

"command! RestartApache     !~/www/bin/apachectl restart
"command! ApacheRestart     !~/www/bin/apachectl restart
"command! PerlWarnOn        !perl -p -i -e 's/PerlWarn Off/PerlWarn On/' ~/www/conf/vhost.conf
"command! PerlWarnOff       !perl -p -i -e 's/PerlWarn On/PerlWarn Off/' ~/www/conf/vhost.conf
"command! Cdtomcat     cd /tomcat 


command! Cdtrunk          cd /code/premierleague.com/trunk 
command! Cdwebmvcsite     cd /code/premierleague.com/trunk/app/webmvc/site/
command! Cdjcrroot        cd /code/premierleague.com/trunk/cms/cq/jcr_root 
command! Cdpremierleague  cd /jcr_root/apps/premierleague 
command! Cdcomponents     cd /jcr_root/apps/premierleague/components 
command! Cdcss            cd /jcr_root/etc/designs/premierleague/clientlibs/css 
command! Cdhtml           cd /jcr_root/etc/designs/premierleague/clientlibs/html 
command! Cdhtml           cd /jcr_root/etc/designs/premierleague/clientlibs/html 
command! Cdjs             cd /jcr_root/etc/designs/premierleague/clientlibs/js 
command! Cdtest           cd /jcr_root/etc/designs/premierleague/test
command! Cdft             cd /previous/ft-cms/ft-cmsWeb/src/main/webapp/media/js

command! W                w|!vlt ci % 
command! Wq               w|!vlt ci %|q

"" ***** PLUGIN OPTIONS *****
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"   " use omni-completion for tab completion
"let g:DirDoPattern  = "*"                            " http://www.vim.org/scripts/script.php?script_id=367
"let g:DirDoDir      = "./"
"let javaScript_fold = 1

let g:pydiction_location = '~/.vim/vimfiles/ftplugin/pydiction/complete-dict'

"" ***** FUNCTIONS *****
function! ToggleHLSearch()
    if &hls
        set nohls
    else
        set hls
    endif
endfunction

"" http://www.vim.org/tips/tip.php?tip_id=566
"function! Mosh_Tab_Or_Complete()
"    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"        return "\<C-N>"
"    else
"        return "\<Tab>"
"	endif
"endfunction

"" JavaScriptFold does not seem to work
function! JavaScriptFold() 
	setl foldmethod=syntax
	setl foldlevelstart=1
	syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

	function! FoldText()
		return substitute(getline(v:foldstart), '{.*', '{...}', '')
	endfunction
	setl foldtext=FoldText()
endfunction


"" ***** DICTIONARY OPTIONS *****
" set ctags file;  find -name '*.pm' -type f | ctags -a
"set tags=/home/jamesmcguigan/tags
"set dictionary+="./functions"
"set dictionary+="/usr/dict/words"
"set complete-=i " don't scan included files, it slows down perl auto-complete
     """

" Omni-complete settings - [CTRL-X][CTRL-O]
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
autocmd FileType c          set omnifunc=ccomplete#Complete
