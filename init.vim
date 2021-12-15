"
" Welcome to my custom init.vim for 💎 Neovim 💎 (https://www.neovim.io)
"
" imariom (a.k.a Mário Alfredo Moiane)
" help: https://www.imariom.co.mz/init-vim
"       https://www.youtube.com/imariom/vim-life
"
" Version 0.0.1 created at 03 December 2021 last updated 03 December 2021
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path+=**                                             " Searches current directory recursively
let mapleader=" "
set encoding=UTF-8
set noerrorbells
set smartindent
set number relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=10
set backspace=indent,eol,start
set ruler
set incsearch
set clipboard=unnamedplus                                " Copy/paste between vim and other programs.
set expandtab                                            " Use spaces instead of tabs.
set smarttab                                             " Be smart using tabs ;)
set shiftwidth=4                                         " One tab == four spaces.
set tabstop=4                                            " One tab == four spaces.
syntax enable

set colorcolumn=79
hi ColorColumn ctermbg=0 guibg=darkgrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug for managing plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

    Plug 'vim-airline/vim-airline'                       " Statusline support
    Plug 'vim-airline/vim-airline-themes'                " Themes for the statusline
    Plug 'ryanoasis/vim-devicons'                        " Support for filetype glyphs (icons)
    Plug 'ap/vim-css-color'                              " Highlight colors (by name, hex, etc.)
    Plug 'morhetz/gruvbox'                               " Sorry and im sorry ( i just 💖 it )
    Plug 'NLKNguyen/papercolor-theme'                    " Best color theme for Go development 🤯😭
    
    Plug 'preservim/nerdtree'                            " File explorer
    Plug 'airblade/vim-gitgutter'                        " Git diff markers
    Plug 'Xuyuanp/nerdtree-git-plugin'                   " Git integration for NERDTree
    Plug 'ctrlpvim/ctrlp.vim'                            " Fuzzy file search

    Plug 'tpope/vim-commentary'                          " Comment support when editing files
    Plug 'jiangmiao/auto-pairs'                          " Auto pair parentheses, brackets, quotes, etc.

    Plug 'neoclide/coc.nvim', {'branch': 'release'}      " Inetllisense support
    Plug 'fatih/vim-go'                                  " Go development plugin for Vim

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Theming setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set background=dark

" Colorscheme (PaperColor or gruvbox)
colorscheme PaperColor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>K
map <Leader>tv <C-w>t<C-w>H

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline and Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

" air-line
let g:airline_powerline_fonts = 1

" air-line theme (papercolor or gruvbox)
let g:airline_theme='papercolor'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Show buffers currently open on top of the window
let g:airline#extensions#tabline#enabled=1

" Path formatter that airline should use
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Only show the buffer name
let g:airline#extensions#tabline#fnamemode=':t'

" Navigate forward, backward and close open buffers
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-q> :bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-dev icons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Hack_Nerd_Font_Mono:12

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Explorer using NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=30

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git gutter setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go definition and go info setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim default settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fatih/vim-go Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <silen disable vim-go :GoDef short cut (gd)
"nnoremap <silen this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yet Another TypeScript Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:yats_host_keyword = 1

set re=0

" Concealing Characters
let g:typescript_conceal_function             = "ƒ"
let g:typescript_conceal_null                 = "ø"
let g:typescript_conceal_undefined            = "¿"
let g:typescript_conceal_this                 = "@"
let g:typescript_conceal_return               = "⇚"
let g:typescript_conceal_prototype            = "¶"
let g:typescript_conceal_super                = "Ω"

" Make concealing to be optinal to toggle ON or OFF
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
