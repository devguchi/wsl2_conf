call plug#begin()

" Color Scheme plugins
Plug 'lucasprag/simpleblack'
Plug 'jaredgorski/spacecamp'
Plug 'NLKNguyen/papercolor-theme'

" navigator
Plug 'christoomey/vim-tmux-navigator'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' "変更箇所の行番号にマーク表示

" editor 
Plug 'itchyny/lightline.vim' "statusbar
Plug 'kshenoy/vim-signature' "mark可視化
Plug 'markonm/traces.vim' "置換のプレビュー
Plug 'tpope/vim-commentary' "comment
Plug 'vim-scripts/vim-auto-save'
Plug 'SirVer/ultisnips' "snipets

" operator
Plug 'simeji/winresizer' "画面サイズ調整 (ctrl + e)
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'wellle/targets.vim'

" quickfix
Plug 'thinca/vim-qfreplace'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

" debug
" Plug 'mfussenegger/nvim-dap'
Plug 'puremourning/vimspector'

" html tag
Plug 'docunext/closetag.vim' "HTML tag
Plug 'mattn/emmet-vim'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mattn/vim-maketable'

" other Plugins
Plug 'editorconfig/editorconfig-vim' "lint
Plug 'ConradIrwin/vim-bracketed-paste' "copy時のpaste modeの自動調整
Plug 'thinca/vim-quickrun' "CODE自動実行
Plug 'vim-jp/vimdoc-ja' "ヘルプの日本語化
Plug 'skanehira/translate.vim' "Google翻訳
Plug 'antoinemadec/FixCursorHold.nvim' " CursorHoldのパフォーマンスを修正

" Language
Plug 'beanworks/vim-phpfmt'
call plug#end()

"""""""""""""""""""
" Basic Setting
"""""""""""""""""""
syntax on
let mapleader = "\<Space>"
set helplang=ja
set title
set number
set ambiwidth=double
set expandtab
set tabstop=2
set shiftwidth=2
set belloff=all
set softtabstop=0
set smartindent
set ttyfast
set noswapfile
set laststatus=2
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set shortmess+=c
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" F10でpasteモードのトグルになる
set pastetoggle=<F10>
nnoremap <F10> :set paste!<CR>:set paste?<CR>
" xで削除した時はヤンクしない
vnoremap x "_x
nnoremap x "_x
" 改行時の自動コメントアウトの無効化
set formatoptions-=ro
autocmd FileType * setlocal formatoptions-=ro
" yankのクリップボード連携
set clipboard=unnamed
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
set mouse=a

"""""""""""""""""""
" Color Scheme
"""""""""""""""""""
" set t_Co=256
set background=dark
set termguicolors
set cursorline
" colorscheme spacecamp
colorscheme PaperColor
" colorscheme simpleblack

highlight CursorLine guibg=#103259

if !has('gui_running')
  augroup opacity
    autocmd!
    autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none guibg=none
    autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none  guibg=none
    autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none guibg=none
    autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none guibg=none
    autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none guibg=none
  augroup END
endif

"""""""""""""""""""
" Python setting
"""""""""""""""""""
let g:python3_host_prog = system('echo -n $(which python3)')

""""""""""""""""""""""""""""""
" Keymap設定
""""""""""""""""""""""""""""""
nnoremap ; :
nnoremap : ;
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <leader>l $
nnoremap <leader>w :w<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
inoremap jj <Esc>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
nnoremap r <Plug>(operator-replace)
nnoremap <leader>r r
noremap <leader>s <Plug>(easymotion-overwin-f)

" 画面分割・タブページの設定
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H

" tab
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>

nnoremap th :<C-u>-tabm<CR>
nnoremap tl :<C-u>+tabm<CR>
nnoremap t0 :<C-u>0tabm<CR>

nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

" ToggleQuickfix
nnoremap <script> <silent> <leader>q :call ToggleQuickfix()<CR>
nnoremap <silent> <leader>n :call ToggleRelativenumber()<cr>

""""""""""""""""""""""""""""""
" autosave
""""""""""""""""""""""""""""""
let g:auto_save = 0  " enable AutoSave on Vim startup

""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""
nmap <leader>g [git]
nnoremap [git] <Nop>
nnoremap [git]l :G blame<CR>
nnoremap [git]d :Gdiffsplit<CR>
nnoremap [git]m :G mergetool<CR>

""""""""""""""""""""""""""""""
" Debug (Vimspector)
""""""""""""""""""""""""""""""
let g:vimspector_base_dir='/Users/dev/.local/share/nvim/plugged/vimspector'
let g:vimspector_install_gadgets = [ 'CodeLLDB' ]
nmap <leader>d [debug]
nmap [debug]t <Plug>VimspectorToggleBreakpoint
nmap [debug]b <Plug>VimspectorBreakpoints
nmap [debug]s <Plug>VimspectorContinue
nmap [debug]e <Plug>VimspectorStop
nmap [debug]r <Plug>VimspectorRestart
nmap [debug]v <Plug>VimspectorStepOver
nmap [debug]i <Plug>VimspectorStepInto
nmap [debug]u <Plug>VimspectorStepOut
nmap [debug]k <Plug>VimspectorUpFrame
nmap [debug]j <Plug>VimspectorDownFrame
nmap [debug]w <Plug>VimspectorBalloonEval
xmap [debug]w <Plug>VimspectorBalloonEval
nmap [debug]x <Plug>VimspectorReset

""""""""""""""""""""""""""""""
" Translate
""""""""""""""""""""""""""""""
let g:translate_source = "en"
let g:translate_target = "ja"
let g:translate_winsize = 10
let g:translate_popup_window = 1

""""""""""""""""""""""""""""""
" Golang
""""""""""""""""""""""""""""""
nmap <leader>go [go]
nnoremap [go] <Nop>
nnoremap [go]r :GoRun
nnoremap [go]e :GoErrCheck<CR>
nnoremap [go]d :GoDef<CR>

""""""""""""""""""""""""""""""
" grep => rg
""""""""""""""""""""""""""""""
if executable('rg')
    let &grepprg = 'rg --vimgrep --hidden'
    set grepformat=%f:%l:%c:%m
endif

""""""""""""""""""""""""""""""
" ToggleQuickfix
""""""""""""""""""""""""""""""
if exists('g:__QUICKFIX_TOGGLE__')
    finish
endif
let g:__QUICKFIX_TOGGLE__ = 1

function! ToggleQuickfix()
    let l:nr = winnr('$')
    cwindow
    let l:nr2 = winnr('$')
    if l:nr == l:nr2
        cclose
    endif
endfunction

""""""""""""""""""""""""""""""
" ToggleRelativenumber
""""""""""""""""""""""""""""""
function! ToggleRelativenumber() abort
  if &relativenumber == 1
     setlocal norelativenumber
  else
     setlocal relativenumber
  endif
endfunction

""""""""""""""""""""""""""""""
" カーソル位置・アンドゥの保存
""""""""""""""""""""""""""""""
augroup KeepLastPosition
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END

if has('persistent_undo')
  set undodir=./.vimundo,~/.vimundo
  augroup SaveUndoFile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif

""""""""""""""""""""""""""""""
" UltiSnipesの設定
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""""""""""""""""""""""""""""""
" lightlineの設定
""""""""""""""""""""""""""""""
let g:lightline = {
  \ 'colorscheme': 'PaperColor',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'coc' ]],
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'filename': 'LightlineFilename',
  \ },
  \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

set noshowmode

""""""""""""""""""""""""""""""
" coc-nvimの設定
""""""""""""""""""""""""""""""
" ポップアップウインドウのスクロール
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <PageDown> coc#float#has_scroll() ? coc#float#scroll(1) : "\<PageDown>"
  nnoremap <silent><nowait><expr> <PageUp> coc#float#has_scroll() ? coc#float#scroll(0) : "\<PageUp>"
  inoremap <silent><nowait><expr> <PageDwon> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <PageUp> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <PageDown> coc#float#has_scroll() ? coc#float#scroll(1) : "\<PageDown>"
  vnoremap <silent><nowait><expr> <PageUp> coc#float#has_scroll() ? coc#float#scroll(0) : "\<PageUp>"
endif

"code action (fix)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>cl  <Plug>(coc-codelens-action)

" GoTo code navigation.
" C-oで戻れる
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc-explorer
nnoremap <leader>e :CocCommand explorer<CR>

" Mappings for CoCList
nnoremap <silent><nowait> <leader><leader>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" fzf
nnoremap <space>o  :CocCommand fzf-preview.CocOutline<cr>
nnoremap <space>co :CocCommand fzf-preview.CommandPalette<CR> 
nnoremap <space>cl :CocList<cr>
nnoremap <leader>fg :CocCommand fzf-preview.ProjectGrep<space>
nnoremap <leader>fp :CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <leader>fb :CocCommand fzf-preview.Buffers<CR>
" fzf (git)
nnoremap [git]a :CocCommand fzf-preview.GitActions<CR>
nnoremap [git]f :CocCommand fzf-preview.GitFiles<CR>
nnoremap [git]h :CocCommand fzf-preview.GitLogs<CR>
nnoremap [git]s :CocCommand fzf-preview.GitStatus<CR>
nnoremap [git]b :CocCommand fzf-preview.GitBranches<CR>

" 以下よく分かっていない
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

