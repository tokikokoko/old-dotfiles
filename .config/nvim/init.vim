"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> important setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/dein.vim'
Plug 'Shougo/vimproc.vim'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'jonathanfilip/vim-lucius'
Plug 'jacoborus/tender.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/neomru.vim'
Plug 'wsdjeg/FlyGrep.vim'
Plug 'hecal3/vim-leader-guide'
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-tabpagecd'
Plug 'terryma/vim-multiple-cursors'
Plug 'mileszs/ack.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'cohama/lexima.vim'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
" fish
Plug 'dag/vim-fish', { 'for': 'fish' }
" toml
Plug 'cespare/vim-toml', { 'for': 'toml' }
" Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Ruby
" Need fastri, neovim, rcodetools gems
Plug 'uplus/deoplete-solargraph', { 'for': 'ruby' }
" Elixir
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
" Go
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" javascript
"" ES6
" Vue.js
Plug 'posva/vim-vue', { 'for': 'vue' }
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> keymap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Space Key
let mapleader = "\<Space>"
" Leader Dict
let g:lmap =  {}
" a
let g:lmap.a = { 'name': 'Application' }
" b
let g:lmap.b = { 'name': 'Buffer' }
" g
let g:lmap.g = { 'name': 'Grep' }
" f
let g:lmap.f = { 'name': 'Frequentry' }
let g:lmap.f.e = { 'name': 'Settings' }
" p
let g:lmap.p = { 'name': 'Project' }
" q
let g:lmap.q = { 'name': 'Quit' }
" t
let g:lmap.t = { 'name': 'Tab' }
" w
let g:lmap.w = { 'name': 'Window' }

"===> LeaderKey maps
"====> Application
noremap <Leader>an :Explore
let g:lmap.a.n = [':Explore', 'netrw']
noremap <Leader>at :terminal
let g:lmap.a.t = [':terminal', 'terminal']
"====> Tabs
noremap <Leader>tn :tabnew
let g:lmap.t.c = [':tabnew', 'create']
noremap <Leader>tc :tabclose
let g:lmap.t.d = [':tabclose', 'close']
noremap <Leader>tn :tabn
let g:lmap.t.n = [':tabn', 'next']
noremap <Leader>tp :tabp
let g:lmap.t.p = [':tabp', 'previous']

"====> Frequentry
" No highlight
noremap <Leader>fh :noh
let g:lmap.f.h = [':noh', 'No highlight']
" Open .vimrc
noremap <Leader>fed :e ~/.config/nvim/init.vim
let g:lmap.f.e.d = [':e ~/.config/nvim/init.vim', 'Open .vimrc']
" Reload setting
noremap <Leader>feR source ~/.config/nvim/init.vim
let g:lmap.f.e.R = ['source ~/.config/nvim/init.vim', 'Reload settings']
" Update buffer
noremap <Leader>fer :e!
let g:lmap.f.e.r = [':e!', 'Update buffer']

"====> Quit
noremap <Leader>qq :q
let g:lmap.q.q = [':q', 'Quit']
noremap <Leader>qq :a
let g:lmap.q.a = [':qa', 'Quit all']

"====> window
noremap <Leader>wd :close
let g:lmap.w.d = [':close', 'close']
noremap <Leader>wv :vs
let g:lmap.w.v = [':vs', 'vertical split']
noremap <Leader>ws :split
let g:lmap.w.s = [':split', 'horizontal split']
noremap <Leader>wh :wincmd h
let g:lmap.w.h = [':wincmd h', 'move left']
noremap <Leader>wj :wincmd j
let g:lmap.w.j = [':wincmd j', 'move down']
noremap <Leader>wk :wincmd k
let g:lmap.w.k = [':wincmd k', 'move up']
noremap <Leader>wl :wincmd l
let g:lmap.w.l = [':wincmd l', 'move left']

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
" timeout
set timeoutlen=10
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme
colorscheme tender
" colorscheme PaperColor
autocmd ColorScheme * highlight LineNr ctermfg=22 guifg=#ffe793
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
set background=dark

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
"===> deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 1
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#max_list = 200
let g:deoplete#enable_smart_case = 1

"===> lightline
let g:lightline = {
      \ 'colorscheme': 'tender',
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

"===> ale
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 1
let g:ale_linters = {
	\ 'ruby': ['rubocop'],
	\ 'sql': ['sqlint'],
\}
"===> ack
let g:ackprg = 'ag --nogroup --nocolor --column --vimgrep'
"===> fzf
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
"====> keymap
noremap <Leader>pf :Files
let g:lmap.p.f = [':Files', 'Project Files']
noremap <Leader>bb :Buffers
let g:lmap.b.b = [':Buffers', 'List']
noremap <Leader>gb :BLines
let g:lmap.g.b = [':BLines', 'Current Buffer']

"===> vim-leader-guide
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
let g:leaderGuide_hspace = 4
let g:leaderGuide_vertical = 0
let g:leaderGuide_sort_horizontal = 1
let g:leaderGuide_run_map_on_popup = 1

"===> deoplete
let g:deoplete#enable_smart_case = 1
let b:deoplete_disable_auto_complete=1 
let g:deoplete_disable_auto_complete=1
" go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

"===> indentLine
let g:indentLine_setColors = 0
let g:indentLine_color_term = 239

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> Language configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"===> fish
autocmd FileType fish setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
" Set up :make to use fish for syntax checking.
" compiler fish
" Set this to have long lines wrap inside comments.
setlocal textwidth=79
"===> Markdown
autocmd FileType markdown setl tabstop=2 expandtab shiftwidth=4 softtabstop=4
