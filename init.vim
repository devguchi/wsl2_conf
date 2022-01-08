call plug#begin('~/.vim/plugged')

" Color Scheme plugins
Plug 'sjl/badwolf'
Plug 'lucasprag/simpleblack'
Plug 'jaredgorski/spacecamp'
Plug 'sainnhe/gruvbox-material'
Plug 'NLKNguyen/papercolor-theme'

" fzf Plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" ctag
Plug 'liuchengxu/vista.vim' "ctag
Plug 'majutsushi/tagbar' "outline

" quickfix
Plug 'thinca/vim-qfreplace'

" operator
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'

" statusbar
Plug 'itchyny/lightline.vim'

" html tag
Plug 'docunext/closetag.vim' "HTML tag
Plug 'mattn/emmet-vim'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mattn/vim-maketable'

" other Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'} "LSP
Plug 'editorconfig/editorconfig-vim' "lint
Plug 'simeji/winresizer' "画面サイズ調整
Plug 'ConradIrwin/vim-bracketed-paste' "copy時のpaste modeの自動調整
Plug 'tpope/vim-commentary' "comment
Plug 'thinca/vim-quickrun' "CODE自動実行
Plug 'yuttie/comfortable-motion.vim' "スムーススクロール
Plug 'vim-jp/vimdoc-ja' "ヘルプの日本語化
Plug 'markonm/traces.vim' "置換のプレビュー
Plug 'skanehira/translate.vim' "Google翻訳
Plug 'SirVer/ultisnips' " snipets
Plug 'vim-scripts/vim-auto-save'

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
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

"""""""""""""""""""
" Color Scheme
"""""""""""""""""""
" set t_Co=256
set background=dark
set termguicolors
" colorscheme badwolf
" colorscheme spacecamp
colorscheme simpleblack
" colorscheme gruvbox-material
" colorscheme PaperColor

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
nnoremap <leader><leader><leader> <C-^>
nnoremap <Esc><Esc> :nohlsearch<CR>
inoremap jj <Esc>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

" ToggleQuickfix
nnoremap <script> <silent> <leader>q :call ToggleQuickfix()<CR>
" ToggleRelativenumber
nnoremap <silent> <leader>n :call ToggleRelativenumber()<cr>

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

" fzf
nnoremap <leader>fb :CocCommand fzf-preview.Buffers<CR>
nnoremap <leader>fg :CocCommand fzf-preview.GitFiles<CR>
nnoremap <leader>fh :CocCommand fzf-preview.MruFiles<CR>
" nnoremap <leader>fh :CocCommand fzf-preview.ProjectMrwFiles<CR>
nnoremap <leader>ff :CocCommand fzf-preview.ProjectFiles<CR>

" operator-replace
nmap ,r <Plug>(operator-replace)

" formatの設定
nnoremap ,f :Format<CR>
nnoremap ,j :CocCommand prettier.formatFile<CR>
" nnoremap ,p :PhpFmt<CR>
" Formatting selected code.
xmap <leader>fs <Plug>(coc-format-selected)
nmap <leader>fs <Plug>(coc-format-selected)

" GoTo code navigation.
noremap go <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Mappings for CoCList
nnoremap <silent><nowait> ma  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> me  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> mc  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> mo  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> my  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> mj  :<C-u>CocNext<CR>
nnoremap <silent><nowait> mk  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> mp  :<C-u>CocListResume<CR>
nnoremap <silent><nowait> mb  :<C-u>CocList bookmark<cr>

" coc-diagnostic
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" coc-bookmark
nmap <leader>mm <Plug>(coc-bookmark-toggle)
nmap <leader>mj <Plug>(coc-bookmark-next)
nmap <leader>mk <Plug>(coc-bookmark-prev)
nmap <leader>ma <Plug>(coc-bookmark-annotate)

" coc-explorer
nnoremap <leader>e :CocCommand explorer<CR>

" Gitの設定
nnoremap [git] <Nop>
nmap <leader>g [git]
nnoremap [git]s :CocCommand fzf-preview.GitStatus<CR>
nnoremap [git]a :CocCommand fzf-preview.GitActions<CR>
nnoremap [git]l :CocCommand fzf-preview.GitLogs<CR>
nnoremap [git]r :CocCommand fzf-preview.GitBranches<CR>
nnoremap [git]b :G blame<CR>

" rg(grep)の設定
nnoremap <leader>r :CocCommand fzf-preview.ProjectGrep<space>

" tagbarの設定
nnoremap <leader>t :TagbarToggle<CR>

" GOの設定
nnoremap [go] <Nop>
nmap     <leader>go [go]
nnoremap [go]r :GoRun
nnoremap [go]e :GoErrCheck<CR>
nnoremap [go]d :GoDef<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

""""""""""""""""""""""""""""""
" clipboard setting for windows10(WSL2) 
""""""""""""""""""""""""""""""
if system('uname -a | grep microsoft') != ''
  augroup myYank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe', @")
  augroup END
endif"

""""""""""""""""""""""""""""""
" autosave
""""""""""""""""""""""""""""""
let g:auto_save = 0  " enable AutoSave on Vim startup

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
nnoremap <leader>sn :UltiSnipsEdit<cr>

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
  \   'gitbranch': 'fugitive#head',
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
" Vim-goの設定
""""""""""""""""""""""""""""""
let g:go_bin_path = $GOBIN
let g:go_highlight_types = 0
let g:go_highlight_operators = 0
let g:syntastic_go_checkers = ['go', 'golint']
filetype plugin indent on

""""""""""""""""""""""""""""""
" coc.nvimの設定
""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden
" floating windowの透明度？
set pumblend=10

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

""""""""""""""""""""""""""""""
" fzf-previewの設定
""""""""""""""""""""""""""""""
let g:fzf_preview_command = 'bat --theme=gruvbox --color=always --plain {-1}'
" Commands used for current file lines
let g:fzf_preview_lines_command = 'bat --theme=gruvbox --color=always --plain --number'
" floating window size ratio
let g:fzf_preview_floating_window_rate = 0.9
" fzf window position settings
let g:fzf_preview_direct_window_option = ''
" fzf command default options
let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap' }
" Add fzf quit mapping
let g:fzf_preview_quit_map = 1
" jump to the buffers by default, when possible
let g:fzf_preview_buffers_jump = 0
" g:fzf_binary_preview_command is executed if this command succeeds, and g:fzf_preview_command is executed if it fails
let g:fzf_preview_if_binary_command = '[[ "$(file --mime {})" =~ binary ]]'
" Commands used for binary file
let g:fzf_binary_preview_command = 'echo "{} is a binary file"'
" Commands used to get the file list from project
let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"' " Installed ripgrep
" Commands used to get the file list from git repository
let g:fzf_preview_git_files_command = 'git ls-files --exclude-standard'
" Commands used to get the file list from current directory
let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'
" Commands used to get the git status file list
let g:fzf_preview_git_status_command = 'git -c color.status=always status --short --untracked-files=all'
" Commands used for git status preview.
let g:fzf_preview_git_status_preview_command =  "[[ $(git diff --cached -- {-1}) != \"\" ]] && git diff --cached --color=always -- {-1} || " .
\ "[[ $(git diff -- {-1}) != \"\" ]] && git diff --color=always -- {-1} || " .
\ g:fzf_preview_command
" Commands used for project grep
let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading --color=always'
" MRU and MRW cache directory
let g:fzf_preview_cache_directory = expand('~/.cache/vim/fzf_preview')
" If this value is not 0, disable mru and mrw
let g:fzf_preview_disable_mru = 0
" Limit of the number of files to be saved by mru
let g:fzf_preview_mru_limit = 1000
" Cache directory for mru and mrw
let g:fzf_preview_cache_directory = expand('~/.cache/vim/fzf_preview')
" Specify the color of fzf
let g:fzf_preview_fzf_color_option = ''
" Use as fzf preview-window option
let g:fzf_preview_fzf_preview_window_option = ''
" let g:fzf_preview_fzf_preview_window_option = 'up:30%'
" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1
" devicons character width
let g:fzf_preview_dev_icon_prefix_string_length = 3
" Devicons can make fzf-preview slow when the number of results is high
" By default icons are disable when number of results is higher that 5000
let g:fzf_preview_dev_icons_limit = 5000

augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#initialized call s:fzf_preview_settings()
augroup END

function! s:fzf_preview_settings() abort
  let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
  let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
endfunction

"""""""""""""""""""
" PHP Settings
"""""""""""""""""""
" vim-phpfmtが動かないので臨時対応
nnoremap ,p :!phpcbf --standard=PSR2 %<cr>

let g:phpfmt_autosave = 0
" A standard type: PEAR, PHPCS, PSR1, PSR2, Squiz and Zend
let g:phpfmt_standard = 'PSR2'
" Or your own defined source of standard (absolute or relative path):
" let g:phpfmt_standard = '/path/to/custom/standard.xml'

" for sora
nnoremap <leader>sora :%s/@/@\/sales-app/g
