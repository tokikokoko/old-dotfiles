"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> important setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
"==> dein
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required:
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	let s:toml_dir = expand('~/.config/nvim')
	call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
	call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> keymap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Space Key
let mapleader = "\<Space>"
" Space maps
noremap <Leader>nt :NERDTreeToggle<CR>
noremap <Leader>tbn :tabnew<CR>
noremap <Leader>tbc :tabclose<CR>
" Go to normal mode with <ESC> on terminal mode
tnoremap <Esc> <C-\><C-n>
" mappings when IM is Japanese
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>
" vを二回で行末まで選択
vnoremap v $h
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> setting
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
" 折り畳まない
set foldmethod=syntax
let perl_fold=1
set foldlevel=100
" キーマッピングとキーコードの遅延設定
set timeout timeoutlen=1000 ttimeoutlen=10
" スクロールする時に下が見えるようにする
set scrolloff=5
" エンコード, ファイルエンコード
set encoding=utf-8
set fileencoding=utf-8
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" インデントをshiftwidthの倍数に丸める
set shiftround
" 補完の際の大文字小文字の区別しない
set infercase
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライト表示
set hlsearch
" マウスモード有効
set mouse=a
" コマンドを画面最下部に表示する
set showcmd
" ◆や○文字が崩れる問題を解決"
set ambiwidth=double
" 相対行番号
set norelativenumber
" インタラクティブに文字列置換
set inccommand=split
" vimgrep後に自動でquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme
colorscheme pencil
" colorscheme PaperColor
set t_Co=256
set background=light
" let g:pencil_higher_contrast_ui = 1
" 行番号を表示
set number
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
" シンタックスハイライトの最大行数
set synmaxcol=300
" 全角スペースのハイライト
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> lightline
let g:lightline = {
      \ 'colorscheme': 'PaperColor_light',
      \	'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
"===> Minimap
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'
"===> jedi-vim
let g:jedi#force_py_version=3
" indentLine
" let g:indentLine_color_term = 100
" let g:indentLine_color_gui = '#FFFFFF'
" let g:indentLine_bgcolor_term = 100
" " let g:indentLine_bgcolor_gui = '#FF5FFF'
" let g:indentLine_setConceal = 0
" let g:indentLine_concealcursor = 'inc'
" let g:indentLine_conceallevel = 0
"===> ale
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_linters = {
	\ 'javascript': ['eslint'],
	\ 'ruby': ['rubocop'],
	\ 'sql': ['sqlint'],
\}
"===> fzf
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }
" keymap
noremap <C-e> :Files<CR>
noremap <C-x> :Buffers<CR>
noremap <Leader>fbl :BLines<CR>
"===> deoplete
let g:deoplete#enable_smart_case = 1
let b:deoplete_disable_auto_complete=1 
let g:deoplete_disable_auto_complete=1
" set sources
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> Language configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> HTML
autocmd FileType html,markdown setl tabstop=4 expandtab shiftwidth=2 softtabstop=2
"===> javascript
autocmd FileType javascript setl tabstop=4 expandtab shiftwidth=2 softtabstop=2
"===> Haskell
autocmd FileType haskell setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
"===> Python
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
"===> Rust
let $RUST_SRC_PATH = expand('~/dotfiles/rust/src')
let g:racer_cmd = '$HOME/.cargo/bin/racer'
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
"===> fish
" Set up :make to use fish for syntax checking.
" compiler fish
" Set this to have long lines wrap inside comments.
setlocal textwidth=79
