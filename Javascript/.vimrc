:set number " Display line numbers on the left side
:set encoding=UTF-8
:set ls=2 " This makes Vim show a status line even when only one window is shown
:filetype plugin on " This line enables loading the plugin files for specific file types
:set tabstop=2 " Set tabstop to tell vim how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide.
:set expandtab " When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
:set softtabstop=2 " Set softtabstop to control how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces.
:set shiftwidth=2 " Set shiftwidth to control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation. 
" :setlocal foldmethod=indent " Set folding method
" FOLDING--------------------------------------
:set foldmethod=syntax "syntax highlighting items specify folds
:set foldcolumn=1 "defines 1 col at window left, to indicate folding
:let javaScript_fold=1 "activate folding by JS syntax
:set foldlevelstart=99 "start file with all folds opened
"----------------------------------------------
:set t_Co=256 " makes Vim use 256 colors
:set nowrap " Don't Wrap lines!
":colorscheme molokai "Set colorScheme
:set nocp " This changes the values of a LOT of options, enabling features which are not Vi compatible but really really nice
:set clipboard=unnamed
:set clipboard=unnamedplus
:set autoindent " Automatic indentation
:set cindent " This turns on C style indentation
:set si " Smart indent
:syntax enable " syntax highlighting
:set showmatch " Show matching brackets
:set hlsearch " Highlight in search
:set ignorecase " Ignore case in search
:set noswapfile " Avoid swap files
:set mouse=a " Mouse Integration
:set cursorline " Highlight current line

" auto complete for ( , " , ' , [ , { 
" :inoremap        (  ()<Left>
" :inoremap        "  ""<Left>
" :inoremap        `  ``<Left>
" :inoremap        '  ''<Left>
" :inoremap        [  []<Left>
" :inoremap      {  {}<Left>

" auto comment and uncooment with F6 and F7 key
:autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
:autocmd FileType sh,ruby,python   let b:comment_leader = '# '
:autocmd FileType vim   let b:comment_leader = '" '

:noremap <silent> #6 :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR> " commenting line with F6
:noremap <silent> #7 :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR> " uncommenting line with F7

:noremap <silent> #3 :tabprevious<CR> " switch to previous tab with F3
:noremap <silent> #4 :tabnext<CR> " switch to next tab with F2
:map <F8> :setlocal spell! spelllang=en_us<CR> " check spelling with F8
:set pastetoggle=<F2> " Paste mode toggle with F2 Pastemode disable auto-indent and bracket auto-compelation and it helps you to paste code fro elsewhere .


" plugins
" autocomplpop setting
" :set omnifunc=syntaxcomplete " This is necessary for acp plugin
":let g:acp_behaviorKeywordLength = 1 "  Length of keyword characters before the cursor, which are needed to attempt keyword completion

" airline plugin setting
:let g:airline_theme= "luna" "set airline plugin theme
:let g:airline#extensions#tabline#enabled = 1 " showing tabs 
:let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

"vim-airline-clock 
" :let g:airline#extensions#clock#format = '%c'

" NERDTree plugin setting

"toggle showing NERDTree with F9
:map <F9> :NERDTreeToggle<CR> 

"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open file in new tab with ctrl + t
:let NERDTreeMapOpenInTab='<c-t>'

"indentLine 
:let g:indentLine_char = '.'

" vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/rakr/vim-one.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/Shougo/vimshell.vim.git'
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/skywind3000/asyncrun.vim.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'frazrepo/vim-rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/vim-easy-align'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'taglist.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'nikvdp/ejs-syntax'
" Plugin 'othree/yajs.vim'
" Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'moll/vim-node'
Plugin 'christoomey/vim-system-copy'
call vundle#end()            " required
filetype plugin indent on    " required

" ۲۴ bit true colors
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.:qio/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1

    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >

    if (has("termguicolors"))
        set termguicolors
    endif
endif

" scary colorscheme
:let g:srcery_italic = 1
:let g:srcery_bold = 1
:let g:srcery_transparent_background = 0
:let g:srcery_underline = 1
:let g:srcery_undercurl = 1
:let g:srcery_inverse = 1
:let g:srcery_inverse_matches = 1
:let g:srcery_inverse_match_paren = 1
:let g:srcery_dim_lisp_paren = 1
:color srcery
:colorscheme srcery

" show qss file ighlighting like css files 
au BufRead,BufNewFile *.qss set filetype=css

"easy Align------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"----------------------------------------------------------
"call pylint
":autocmd FileType python :map <F10> :AsyncRun pylint ./%<CR><CR>
":map <F12> :bw!<CR> 
"asyncrun.vim
:let g:asyncrun_open = 8
:let $PYTHONUNBUFFERED=1
:autocmd FileType python :noremap <F5> :AsyncRun -raw python % <CR> 
:autocmd FileType sh  :noremap <F5> :AsyncRun bash % <CR> 
"ALE-------------------------------------------------------------
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
" let g:ale_completion_enabled = 1
let g:rainbow_active = 1
au BufNewFile,BufRead *.ejs set filetype=html
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" let g:ale_set_highlights = 0
let g:ale_set_highlights=0
nmap <F4> <Plug>(ale_fix)
" let g:jsx_ext_required = 1

"coc Configures-----------------------------------------------
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
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
