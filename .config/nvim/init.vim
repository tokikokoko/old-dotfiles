"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => important setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug - vim plugin manager
" https://github.com/junegunn/vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'jonathanfilip/vim-lucius'
Plug 'kassio/neoterm'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim', { 'for':  'python' }
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => keymap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Space Key
let mapleader = "\<Space>"
" Space maps
noremap <Leader>nt :NERDTreeToggle<CR>
" Go to normal mode with <ESC> on terminal mode
tnoremap <Esc> <C-\><C-n>
" mappings when IM is Japanese
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" シンタックス有効化
syntax on
" 文字コードをUTF-9に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" vimの無名レジスタとOSクリップボードの連携
set clipboard=unnamed
" キーマッピングとキーコードの遅延設定
set timeout timeoutlen=1000 ttimeoutlen=10

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" テーマ
colorscheme lucius
set background=dark
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソル移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => jedi-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#force_py_version=3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers = ["flake8"]


