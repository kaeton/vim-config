set nobackup autoindent ul=0 showmode report=1 notextauto showmatch suffixes='.log.aux.dvi.o.bak.swp'
set tabstop=8 noexpandtab smartindent smarttab
set wildmenu
set shiftwidth=4 expandtab smarttab
set nowrapscan
set winheight=5
set history=50
set laststatus=1
set ruler
set incsearch
set modeline
set nobomb
set nu
set title
set cursorline
map  :buffers
map  :bdelete 
map o _
" highlight CursorLine ctermbg=240
" highlight Comment ctermfg=50
inoremap  
let mapleader=" "
let conceallevel=0
let g:tex_conceal=''

" set fileencodings=euc-jp,japan,shift-jis,iso-2022-jp,cp932,utf-8,utf-16,ucs-2-internal,ucs-2
""set encoding=euc-jp
""set fileencodings=iso-2022-jp,euc-jp,cp932,utf-8,utf-16,ucs-2-internal,ucs-2
""set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,utf-16,ucs-2-internal,ucs-2
"set encoding=japan

" --------------------------------
"  neobundle
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" this bundle avoid json double quotation
NeoBundle 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

" plugin
" unite.vim
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" caw.vim
" comment out plugin
NeoBundle "tyru/caw.vim.git"
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

" undotree.vim
" This plugin make it easy to manage the undo command
"
" NeoBundle 'mbbill/undotree'
" nmap <Leader>u :UndotreeToggle<CR>
" let g:undotree_SetFocusWhenToggle = 1
" let g:undotree_WindowLayout = 'topleft'
" let g:undotree_SplitWidth = 35
" let g:undotree_diffAutoOpen = 1
" let g:undotree_diffpanelHeight = 25
" let g:undotree_RelativeTimestamp = 1
" let g:undotree_TreeNodeShape = '*'
" let g:undotree_HighlightChangedText = 1
" let g:undotree_HighlightSyntax = "UnderLined"

" vim-fugitive
" This plugin make to use git commands in vim editor
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'nvie/vim-flake8'

" this plugin shows syntax error
NeoBundle 'scrooloose/syntastic.git'
let g:syntastic_python_checkers = ["flake8"]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
highlight SyntasticError guibg=#2f0000

" this plugin can run program in editor
" short cut \ r
NeoBundle 'thinca/vim-quickrun'
set splitright
let g:quickrun_config = {'_': {'hook/time/enable': '1'},}

" easy motion plugin setting
NeoBundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_do_mapping = 0 "Disable default mappings
nmap s <Plug>(easymotion-s2)

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" for UTF-8
set ambiwidth=double
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,euc-jp,japan,shift-jis,iso-2022-jp,cp932,utf-16,ucs-2-internal,ucs-2
" for EUC
"set fileencoding=euc-jp
"set encoding=euc-jp
"set fileencodings=euc-jp,utf-8,japan,shift-jis,iso-2022-jp,cp932,utf-16,ucs-2-internal,ucs-2

"set termencoding=japan
set termencoding=utf-8

source ~/.vim/format.vim
let format_join_spaces = 2
let format_allow_over_tw = 1
map Q gq
"set formatoptions+=mM

let myscriptsfile = "~/.vim/myscripts.vim"

syntax on
set hlsearch
map  :noh:redr!
"hi Comment ctermfg=cyan

"hi Comment term=bold ctermfg=darkgreen
"hi Type term=none ctermfg=Cyan
"hi String term=bold ctermfg=darkyellow
"hi Number term=bold ctermfg=darkyellow
hi Statement term=bold cterm=bold ctermfg=8
hi Identifier term=bold cterm=bold ctermfg=Blue

filetype on
filetype indent on
filetype plugin on
let loaded_ruby_ftplugin = 1

let loaded_matchparen = 1

"for ruby
autocmd BufNewFile *.rb 0r ~/.vim/templates/rb.tpl

"for python
autocmd BufNewFile *.py 0r ~/.vim/templates/py.tpl

"for shellscript
autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.tpl

"for node.js
autocmd BufNewFile *.js 0r ~/.vim/templates/js.tpl

set noundofile

"insertモードから抜ける
inoremap <silent> lll <ESC>
inoremap <silent> hh <ESC>
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>

" 行頭・行末移動方向をキーの相対位置にあわせる
nnoremap 0 $ 
nnoremap 1 0 

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
" inoremap <C-h> <Delete>
inoremap <C-l> <Right>

" カーソル前の文字削除
" inoremap <silent> <C-h> <C-g>u<C-h>
" カーソル後の文字削除
inoremap <silent> <C-d> <Del>
" カーソルから行頭まで削除
inoremap <silent> <C-d>e <Esc>lc
" カーソルから行末まで削除
inoremap <silent> <C-d>0 <Esc>lc
" カーソルから行頭までヤンク
inoremap <silent> <C-y>e <Esc>ly<Insert>
" カーソルから行末までヤンク
inoremap <silent> <C-y>0 <Esc>ly<Insert>

"   " 引用符, 括弧の設定
"   inoremap { {}<Left>
"   inoremap [ []<Left>
"   inoremap ( ()<Left>
"   inoremap " ""<Left>
"   inoremap ' ''<Left>
"   inoremap <> <><Left>
let g:netrw_liststyle = 3
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
syntax on
" "set list lcs=tab:\|\
set background=dark
set clipboard+=unnamed
set backspace=indent,eol,start
"行頭へ
inoremap <silent> h<C-h> <C-r>=MyJumptoBol('　。、．，／！？「」')<CR>
"行末へ
inoremap <silent> l<C-l> <C-r>=MyJumptoEol('　。、．，／！？「」')<CR>

" if has("mouse")
"   set mouse=a
" endif

""""""""""""""""""""""""""""""
"sepが空でなければ、sepをセパレータとしてジャンプ。
"見つからなければ見かけの行頭へ。
"カーソル位置が見かけの行頭の場合は真の行頭へ。
""""""""""""""""""""""""""""""
function! MyJumptoBol(sep)
  if col('.') == 1
    call cursor(line('.')-1, col('$'))
    call cursor(line('.'), col('$'))
    return ''
  endif
  if matchend(strpart(getline('.'), 0, col('.')), '[[:blank:]]\+') >= col('.')-1
    silent exec 'normal! 0'
    return ''
  endif
  if a:sep != ''
    call search('[^'.a:sep.']\+', 'bW', line("."))
    if col('.') == 1
      silent exec 'normal! ^'
    endif
    return ''
  endif
  exec 'normal! ^'
  return ''
endfunction

""""""""""""""""""""""""""""""
"sepが空でなければ、sepをセパレータとしてジャンプ。
"見つからなければ行末へ。
""""""""""""""""""""""""""""""
function! MyJumptoEol(sep)
  if col('.') == col('$')
    silent exec 'normal! w'
    return ''
  endif

  if a:sep != ''
    let prevcol = col('.')
    call search('['.a:sep.']\+[^'.a:sep.']', 'eW', line("."))
    if col('.') != prevcol
      return ''
    endif
  endif
  call cursor(line('.'), col('$'))
  return ''
endfunction
