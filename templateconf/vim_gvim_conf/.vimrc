" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif

" If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.
" http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
" downloads for the colorschemes on vim.org

" Source a global configuration file if available
if filereadable("/etc/vim/gvimrc.local")
  source /etc/vim/gvimrc.local
endif

" ==== below is the customize by Arvin ======
" source ~/.vimrc # used this for reload the vimrc during vim is running.
" edit on 2018/07/10

"set guifont=Inconsolata\ 14
" highlight the search word when found.
set hlsearch
highlight Search term=reverse ctermbg=4 ctermfg=7

" Highlight current line
set cursorline

" 下面出現狀態列(命令列)
" below instrution can apear status line(command line) This is copy from anoth palce. 
" Therefore, I did not to figure out how it works actually.
set ls=3
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
highlight StatusLine ctermfg=blue ctermbg=white

" highlight the background color and 
highlight Normal guifg=white guibg=black
set background=dark

" 設定狀態列行數(命令列高度)
" set hight of the command line
set cmdheight=3

" :sp 開檔時, 上面會列出所有檔案
set wildmenu

" set line number
set number



" setting for cscope
if has("cscope")
"  :set cscopequickfix=s-,c-,d-,i-,t-,e-,f-
  if filereadable("cscope.out")
     cs add cscope.out
  endif  " end of filereadable("cscope.out")
endif " end of has("cscope")

" used quick key for map
" <C-\> c d e f g i o p q s t w

" create mapping table for cscope
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" open quick fix windows for the result of cscope search
nmap <C-\>q :set cscopequickfix=s-,c-,d-,i-,t-,e-<CR>
" close quick fix windows
nmap <C-\>w :set cscopequickfix=<CR>
" generate file - tags
map <C-\>o :!ctags -R --exclude=target_rootfs --exclude=*.html --exclude=.git --exclude=*.js .<CR><CR> 
            \:TlistUpdate<CR><CR>
" generate file - cscope.files  cscope.in.out  cscope.out  cscope.po.out
map <C-\>p :!find ./  -name "*.c" -o -name "*.h" -o -name "*.cpp" > cscope.files<CR>
            \:!cscope -Rbqk -i cscope.files<CR><CR>
            \:cs add cscope.out<CR>
            \:cs reset<CR><CR>


