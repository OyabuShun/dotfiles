set scrolloff=5
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" My Bundles here:
"
Bundle 'Valloric/YouCompleteMe'
Bundle 'neoclide/coc.nvim'
Bundle 'neoclide/coc-vimtex'
Bundle 'tyru/caw.vim'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'iamcco/mathjax-support-for-mkdp'
Bundle 'raingo/vim-matlab'
Bundle 'iamcco/markdown-preview.vim'
Bundle 'aklt/plantuml-syntax'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'richq/vim-cmake-completion'
Bundle 'scrooloose/nerdtree'
" Bundle 'scrooloose/syntastic'
Bundle 'lervag/vimtex'
Bundle 'airblade/vim-gitgutter'
Bundle 'deris/vim-shot-f'
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ

autocmd FileType python setlocal completeopt-=preview
map <C-e> :NERDTreeToggle<CR>

let g:vim_markdown_folding_disabled = 1

let g:plantuml_executable_script="~/dotfiles/scripts/plantuml.sh"
au FileType plantuml command! OpenUml :!google-chrome %

" coc.nvim settings
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" -- YouCompleteMe Plugin Configs --
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_echo_current_diagnostic = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_filetype_blacklist = {'tex':1, 'latex':1}
let g:ycm_filetype_whitelist = {'c':1, 'cpp':1, 'markdown':'1', 'matlab':'1'}
let g:ycm_key_invoke_completion = '<c-c>'
let g:ycm_key_list_previous_completion = [         '<c-k>']
let g:ycm_key_list_select_completion   = ['<tab>', '<c-j>']
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_show_diagnostic_ui = 1
let g:ycm_global_ycm_extra_conf = '~/dotfiles/configs/ycm/youcompleteme.conf.py'
let g:ycm_use_ultisnips_completer = 0

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

"NOTE: comments after Bundle command are not allowed..
"
" -- Standard Settings --
set guifont=Ubuntu\ Mono\ 13
set linespace=0
let                 &encoding = 'utf-8'
let &fileencoding = &encoding
let &ambiwidth = 'double'

set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト (2013-07-03 14:30 修正）

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set virtualedit=block
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>
inoremap ""  ""<left>
inoremap $$  $$<left>
inoremap ''  ''<left>
inoremap ()  ()<left>
inoremap <>  <><left>
inoremap []  []<left>
"
inoremap {<Enter> {}<Left><CR><ESC><S-o>

vnoremap :  :s/
vnoremap >  >gv
vnoremap <  <gvnoremap {}  {}<left>
nnoremap + <c-a>
nnoremap - <c-x>

 " バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

set nowritebackup
set nobackup
set noswapfile
set list                " 不可視文字の可視化
set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

inoremap <silent> jj <ESC>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n','g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

set clipboard=unnamedplus
" -- Syntax Highlighting ---------------------------------------
let g:solarized_termcolors = 16
let g:solarized_termtrans  =  1
let g:solarized_degrade    =  0
let g:solarized_bold       =  1
let g:solarized_italic     =  1
let g:solarized_underline  =  1
let g:solarized_contrast   = 'normal'
let g:solarized_visibility = 'normal'
syntax enable
" set background=light
set background=dark
colorscheme solarized
highlight MatchParen ctermbg=none
highlight LineNr     ctermbg=none

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" unicode symbols
let g:airline_symbols = {}
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_linecolumn_prefix = ''
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#readonly#enabled = 0
let g:airline_section_b =
      \ '%{airline#extensions#branch#get_head()}' .
      \ '%{""!=airline#extensions#branch#get_head()?("  " . g:airline_left_alt_sep . " "):""}' .
      \ '%t%( %M%)'
let g:airline_section_c = ''
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x =
      \ '%{strlen(&fileformat)?&fileformat:""}'.s:sep.
      \ '%{strlen(&fenc)?&fenc:&enc}'.s:sep.
      \ '%{strlen(&filetype)?&filetype:"no ft"}'
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline_inactive_collapse = 0
function! AirLineForce()
  let w:airline_render_left = 1
  let w:airline_render_right = 1
endfunction
" augroup AirLineForce
"   autocmd!
"   autocmd VimEnter * call add(g:airline_statusline_funcrefs, function('AirLineForce'))
" augroup END
let g:airline_theme='solarized'
set t_Co=16

let g:vimtex_compiler_latexmk = {
     \ 'background': 1,
     \ 'build_dir': '',
     \ 'continuous': 1,
     \ 'options': [
     \    '-pdfdvi',
     \    '-verbose',
     \    '-file-line-error',
     \    '-synctex=1',
     \    '-interaction=nonstopmode',
     \],
     \}

let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_quickfix_open_on_warning = 0

" Python formatter
let g:syntastic_python_checkers = ['flake8']
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 --aggressive --aggressive -')
endfunction

:command AutoPep8 call Autopep8()<CR>

" for tmux
set mouse=a
set ttymouse=sgr

" Git gutter
set updatetime=250

inoremap /**  /**<cr><left><left><bs><right><right><cr><bs>/<up>

let               &tabstop = 2
let &shiftwidth = &tabstop
set autoindent
set smartindent
set expandtab
set smarttab

autocmd BufRead,BufNewFile *.cmake        let &filetype = 'cmake'
autocmd BufRead,BufNewFile CMakeLists.txt let &filetype = 'cmake'
autocmd BufRead,BufNewFile *.launch       let &filetype = 'xml'
autocmd BufRead,BufNewFile *.urdf         let &filetype = 'xml'
autocmd BufRead,BufNewFile *.xacro        let &filetype = 'xml'
autocmd BufRead,BufNewFile .tmux.conf     let &filetype = 'tmux'

autocmd BufWritePre * :%s/\s\+$//ge

:command ReopenWinFile e ++enc=cp932
command! DeleteAnsi %s/<1b>\[[0-9;]*m//g$
