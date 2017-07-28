"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => important setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug - vim Plug manager
" https://github.com/junegunn/vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
" theme
Plug 'NLKNguyen/papercolor-theme'
Plug 'jonathanfilip/vim-lucius'
Plug 'cocopon/iceberg.vim'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" general
Plug 'kassio/neoterm'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'severin-lemaignan/vim-minimap'
" syntax
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
" fish
Plug 'dag/vim-fish'
" markdown
Plug 'plasticboy/vim-markdown'
" python
Plug 'davidhalter/jedi-vim', { 'for':  'python' }
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
" インデント有効化
filetype plugin indent on
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
" theme
colorscheme iceberg
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
" => vim-minimap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => jedi-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#force_py_version=3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ファイルを開いたときにはチェックしない
let g:syntastic_check_on_open=0
" 保存時にチェックする
let g:syntastic_check_on_save=1
" wqではチェックしない
let g:syntastic_check_on_wq = 0
" エラーが有ったら直接locationlistを開く
let g:syntastic_auto_loc_list=1
" ESLintを使う
let g:syntastic_javascript_checkers = ['eslint']
" flake8を使う
let g:syntastic_python_checkers = ["flake8"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType html,markdown setl tabstop=4 expandtab shiftwidth=2 softtabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType javascript setl tabstop=4 expandtab shiftwidth=2 softtabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fish
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up :make to use fish for syntax checking.
compiler fish
" Set this to have long lines wrap inside comments.
setlocal textwidth=79
