"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> important setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/vimproc.vim'
Plug 'roxma/vim-hug-neovim-rpc'
" color scheme
Plug 'srcery-colors/srcery-vim'
Plug 'jacoborus/tender.vim'
Plug 'kaicataldo/material.vim'
" General
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/neomru.vim'
Plug 'kana/vim-tabpagecd'
Plug 'mileszs/ack.vim'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" LSP
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" completion framework
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" fish
Plug 'dag/vim-fish', { 'for': 'fish' }
" toml
Plug 'cespare/vim-toml', { 'for': 'toml' }
" JSON
Plug 'elzr/vim-json', { 'for': 'json' }
" CSV
Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }
" Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Ruby
" Need fastri, neovim, rcodetools gems
" Elixir
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
" Go
" Plug 'fatih/vim-go', { 'for': 'go' }
" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" javascript
"" ES6
" Vue.js
Plug 'posva/vim-vue', { 'for': 'vue' }
" Typescript
Plug 'leafgarland/typescript-vim'
" OCaml
if executable('opam')
	Plug '$HOME/.opam/default/share/merlin/vim', { 'for': 'ocaml' }
	Plug 'copy/deoplete-ocaml', { 'for': 'ocaml' }
end
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> dein
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Required:
" let s:dein_dir = expand('~/.cache/dein')
" let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" if dein#load_state(s:dein_dir)
" 	call dein#begin(s:dein_dir)
" 	let s:toml_dir = expand('~/.config/nvim')
" 	call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
" 	call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
" 	call dein#add('autozimu/LanguageClient-neovim', {
" 	\ 'rev': 'next',
" 	\ 'build': 'bash install.sh',
" 	\ })
" 	call dein#end()
" 	call dein#save_state()
" endif
" 
" if dein#check_install()
"   call dein#install()
" endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jq
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
	if 0 == a:0
		let l:arg = "."
	else
		let l:arg = a:1
	endif
	execute "%! jq \"" . l:arg . "\""
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> keymap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Space Key
let mapleader="\<Space>"

"===> LeaderKey maps
"====> Command mode
nnoremap <Leader><Space> :
nnoremap <Leader>; :Commands<CR>

"====> Application
nnoremap <Leader>an :Explore<CR>
nnoremap <Leader>at :terminal<CR>

"====> Buffer
nnoremap <Leader>bb :Buffers<CR>

"====> Tabs
nnoremap <Leader>tc :tabnew<CR>
nnoremap <Leader>td :tabclose<CR>
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>

"====> Frequentry
" No highlight
nnoremap <Leader>fh :noh<CR>
" Open .vimrc
nnoremap <Leader>fed :e ~/.config/nvim/init.vim<CR>
" Reload setting
nnoremap <Leader>feR :source ~/.config/nvim/init.vim<CR>
" Update buffer
nnoremap <Leader>fer :checkt<CR>

"====> Grep
" Ag
nnoremap <Leader>ga :Ag<CR>
" Ack
nnoremap <Leader>gg :<C-u>Ack<Space>
" FZF
nnoremap <Leader>gb :BLines<CR>
" RIPGREP
nnoremap <Leader>gr :Rg<CR>
" History
nnoremap <Leader>gh :History:<CR>

"====> Language
" LSP Menu
nnoremap <Leader>lm :call LanguageClient_contextMenu()<CR>
nnoremap <Leader>ld :call LanguageClient#textDocument_definition()<CR>
" nnoremap <Leader>ld <C-]>
nnoremap <Leader>ll :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <Leader>lr :call :call LanguageClient#textDocument_rename()<CR>
nnoremap <Leader>lx :call LanguageClient#textDocument_references()<CR>

"====> Projectile
nnoremap <Leader>pf :Files<CR>

"====> Quit
nnoremap <Leader>qq :q<CR>
nnoremap <Leader>qq :qa<CR>

"====> window
nnoremap <Leader>wd :close<CR>
nnoremap <Leader>wv :vs<CR>
nnoremap <Leader>ws :split<CR>
nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wl :wincmd l<CR>

"===> Common maps
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
" undotreeを利用する
nnoremap u g-
nnoremap <C-r> g+
" Go to normal mode with <ESC> on terminal mode
tnoremap <Esc> <C-\><C-n>

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
set clipboard+=unnamedplus
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
" timeout
set timeoutlen=10
" add filetype
au BufNewFile,BufRead *.csv setf csv
" default shell
set shell=/usr/bin/fish
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme
set background=dark
colorscheme material
let g:material_theme_style = 'dark'
" autocmd ColorScheme * highlight LineNr ctermfg=22 guifg=#ffe793
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
" 行番号を表示
set number
" 編集行をハイライト
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
" Leaderキーのタイムアウト設定
set notimeout
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
"===> ncm
" " enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" " IMPORTANTE: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
" imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
" imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")
" inoremap <c-c> <ESC>
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"===> lightline
let g:lightline = {
	\ 'colorscheme': 'material_vim',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename' ] ],
	\ },
	\ 'component_function': {
	\   'gitbranch': 'fugitive#head'
	\ },
	\ }

"===> ale
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 1
let g:ale_linters = {
			\ 'ruby': ['rubocop'],
			\ 'sql': ['sqlint'],
			\ 'ocaml': ['merlin']
			\}
"===> ack
let g:ackprg = 'ag --nogroup --nocolor --column --vimgrep'
" nnoremap ;      :<C-u>Ack<Space>
"===> fzf
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~25%' }

"===> deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" let b:deoplete_disable_auto_complete=1 
let g:deoplete#complete_method = "complete"
" no delay before completion
let g:deoplete#auto_complete_delay = 0
" other completion sources suggested to disable
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around', 'member', 'tag']

"===> indentLine
let g:indentLine_setColors = 0
let g:indentLine_color_term = 220

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> Language configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> LSP
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
	\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
	\ 'go': ['go-langserver', '-gocodecompletion'],
	\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
	\ 'typescript': ['javascript-typescript-stdio'],
	\ 'python': ['/usr/local/bin/pyls'],
	\ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
	\ }
"===> HTML
autocmd FileType html setl tabstop=4 expandtab shiftwidth=2 softtabstop=2
"===> Javascript
autocmd FileType javascript setl tabstop=4 expandtab shiftwidth=2 softtabstop=2
"===> Vue
autocmd FileType vue syntax sync fromstart
"===> Haskell
autocmd FileType haskell setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
"===> Python
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
"===> Ruby
autocmd FileType ruby setl tabstop=4 expandtab shiftwidth=2 softtabstop=2
"===> Elixir
autocmd FileType elixir setl tabstop=4 expandtab shiftwidth=2 softtabstop=2
"===> Go
autocmd FileType go setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
"===> Rust
let $RUST_SRC_PATH = expand('~/dotfiles/rust/src')
let g:racer_cmd = '$HOME/.cargo/bin/racer'
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
"===> YAML
autocmd FileType yaml setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
"===> fish
autocmd FileType fish setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
" Set up :make to use fish for syntax checking.
" compiler fish
" Set this to have long lines wrap inside comments.
setlocal textwidth=79
"===> Markdown
autocmd FileType markdown setl tabstop=2 expandtab shiftwidth=4 softtabstop=4
"===> Makefile
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif
