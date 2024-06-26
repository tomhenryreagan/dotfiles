" TomHenry's VIM Configuration File

" GVIM only
if has("gui_running")
    "set background=dark
    set lines=58 columns=118
    set guioptions-=m "menu bar
    set guioptions-=T "toolbar
    set guioptions-=r "scrollbar
endif

" colorscheme ron

" Colors
syntax enable

" Spaces and Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in TAB when editing
set expandtab       " build TAB from spaces
set shiftwidth=4    " number of spaces per TAB 

" Folding
set foldmethod=indent

" UI Config
set number
set showcmd
" filetype indent on    " detect filetypes and use appropriate whitespacing
set wildmenu            " visual autocomplete of cmd menu
set lazyredraw          " less screen refreshing
set showmatch           " highlight matching [{()}]
set history=200
set ruler
set nowrap
set nocompatible
filetype plugin on

" Searching
set hlsearch        " highlight matches
set ignorecase      " case insensitive matching
set smartcase       " ...unless the search term contains capital letters

" Search for selected text, forward (*) or backwards (#)
vnoremap <silent> * :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
    \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
    \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gVzv:call setreg('"', old_reg, old_regtype)<CR>

" No annoying sounds
set noerrorbells
set novisualbell
set tm=500

" Saving
set hidden      " Prevent buffers from giving 'no write since last change'
set noconfirm   " Recklessly prevent messages about unsaved files

" ========Custom bindings======== "
" Open newline but do not enter insert mode
nnoremap oo o<esc>k
nnoremap OO O<esc>j

" Set leader to comma
let mapleader=","

" remap jk to escape
inoremap jk <esc>
inoremap <esc> <nop>

" remap space to clear highlights
nnoremap <space> :noh<return><esc>

" prevent arrow key nav
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Use H and L for beginning/end of line
" Think of these as strong h and l
nnoremap H 0
nnoremap L $
nnoremap dH ld0
nnoremap dL d$

" Wrap current word in double quotes, single quotes, paren, brackets, braces
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" To edit .vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>

" To source .vimrc
nnoremap <leader>sc :source $MYVIMRC<cr>

" Buffer manipulation
nnoremap <leader>t :edit 
nnoremap <leader>e :edit 
nnoremap <leader>T :enew<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>
nnoremap qq :bp <BAR> bd #<cr>

" Stop accidentally recording macros
nnoremap <leader>M q
nnoremap q <nop>

" Wrap current line with #-lines of same length
nnoremap <leader># 0i# <esc>$a #<esc>yypv$hr#yykPjjo<esc>

" Insert the current date after cursor (mm-dd-yyyy format)
nnoremap <leader>dt "=strftime("%m-%d-%Y")<CR>p
inoremap <leader>dt <C-R>=strftime("%m-%d-%Y")<CR>
nnoremap <leader>j "=strftime("%m-%d-%Y")<CR>p0i# <esc>$a #<esc>yypv$hr#yykPjjo<esc>


" ========Math commands======== "
" compute sum of first item on each select line, print result to console
vnoremap <leader>+= "ay:echo system("awk '{sum+= $1;} END {print sum;}'", getreg('a'))<CR>

" use ,b to set a constant value
vnoremap <leader>b "by
" use ,* to multiply select value by the b-register value
vnoremap <leader>* "adi<C-R>=MultVar(str2float(getreg('a')),str2float(getreg('b')))<CR><esc>
" use ,+ to add select value to b-register value
vnoremap <leader>+ "adi<C-R>=AddVar(str2float(getreg('a')),str2float(getreg('b')))<CR><esc>

" helper functions
function! AddVar(x, y)
    return a:x + a:y
endfunction
function! MultVar(x, y)
    return a:x * a:y
endfunction
function! JournalHeader()
        return "##############\n# " . strftime("%m-%d-%Y") . " #\n##############"
endfunction

" ========Plugins======== "
" Load plugins from lua/plugins.lua 
lua require('plugins')

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" vimwiki
let g:vimwiki_list = [{'path': '~/documents/journal', 'path_html': '~/documents/journal/jhtml/', 'ext': '.md'}]
nmap <leader>j :r ~/documents/journal/template.md<CR>gg"=JournalHeader()<C-M>p2j"gg

" vim-pencil
let g:pencil#wrapModeDefault = 'hard'
inoremap <leader>pt :PencilToggle<CR>
nnoremap <leader>pt :PencilToggle<CR>
augroup pencil
        autocmd!
        autocmd FileType markdown,mkd,md,tex call pencil#init({'wrap': 'hard'})
augroup END
