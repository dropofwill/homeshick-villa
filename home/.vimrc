" Use Vim settings, not compatible with legacy Vi
set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

" Commenting plugins
Plug 'tomtom/tcomment_vim'

" Vim repl for neovim
" Shougo broke everything in the next commit :(
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins', 'tag': '2.0'}
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'scalameta/coc-metals', {'for': 'scala', 'do': 'yarn install --frozen-lockfile'}

Plug 'mhinz/vim-startify'
Plug 'szw/vim-tags'

Plug 'jamessan/vim-gnupg'

" Syntax plugins
Plug 'reasonml-editor/vim-reason-plus'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'noprompt/vim-yardoc', { 'for': 'ruby' }
Plug 'glts/vim-texlog', { 'for': 'latex' }
Plug 'othree/yajs.vim', { 'for': 'js' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }
Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'vim-scripts/groovy.vim'
Plug 'rust-lang/rust.vim'
" Plug 'racer-rust/vim-racer'
" Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

" Github likns from blame
Plug 'ruanyl/vim-gh-line'

" Code formatting
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
Plug 'google/vim-glaive'

" Visual plugins
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'

" Functionality plugins
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'js'] }
Plug 'pangloss/vim-javascript', { 'for': 'js' }
Plug 'majutsushi/tagbar'
" Plug 'ervandew/supertab'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'editorconfig/editorconfig-vim'
Plug 'Konfekt/FastFold'
Plug 'janko-m/vim-test'

" Tim Pope's plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'

" Plug 'ensime/ensime-vim', { 'for': 'scala' }
" Plug 'scrooloose/syntastic'
" Plug 'gavocanov/vim-js-indent'
" Plug 'tpope/vim-dispatch'
" Plug 'farseer90718/vim-taskwarrior'
" Plug 'ton/vim-bufsurf'
" Plug 'rking/ag.vim'
" Plug 'bling/vim-bufferline'
" Plug 'airblade/vim-gitgutter'
" Plug 'sophacles/vim-processing', { 'for': '' }
" Plug 'jplaut/vim-arduino-ino', { 'for': 'c' }
" Plug 'mattn/emmet-vim', { 'for': 'js' }
Plug 'junegunn/goyo.vim'
call plug#end()

" After plug#end configure Glaive
call glaive#Install()
Glaive codefmt google_java_executable="google-java-format"


" Nice, compact default tab settings
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
" Show trailing whitespace and tabs
set list
" set nowrap
set breakindent
" Let me know when my lines are too damn long
set colorcolumn=80


" Backspace anything in insert mode
set backspace=indent,eol,start

autocmd FileType java setlocal omnifunc=javacomplete#Complete ts=4 sw=4 expandtab autoindent
autocmd FileType python setlocal ts=4 sw=4 expandtab autoindent
autocmd FileType xml setlocal ts=2 sw=2 expandtab autoindent

" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
"
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:javascript_enable_domhtmlcss = 1

set laststatus=2
set ttimeoutlen=0


" Interface settings
" set relativenumber  " Line numbers relative to cursor
" set number          " But ignore the current line
" set numberwidth=3   " How wide the line number column should be by default
set showcmd          " Show incomplete commands
set noerrorbells    " No dinging!
set scrolloff=4     " Pad lines vertically by 4
set hidden          " Hide buffers instead of yelling at me about it
set ruler           " Tells you the coords of the cursor in the status line
set wildmenu        " Tab complete vim commands
set wildmode=longest,list,full
" Better tab completion, esp. nice for buffer navigation
set wildchar=<Tab>
set laststatus=2    " Always show status line
let g:loaded_matchparen=1
"
" http://bit.ly/1GGgRd2
set completeopt=longest,menuone


" In many terminal emulators the mouse works just fine, so I enable it.
if has('mouse')
  set mouse=a
endif

" Code fold settings
set foldmethod=indent   " Create folds based on syntax highlighting
set foldlevelstart=20   " Arbitrary high number of folds open on load

" Search/Regex settings
nnoremap <leader><space> :noh<cr>
set gdefault    " Regex global by default
set incsearch   " Show matches as you type
set showmatch   " Visually flash matching brackets when typing
set hlsearch    " Highlight all search matches not just the current one
set spell       " Spell checker for Vim!
set linebreak   " Break lines by word when using wrap

" :Wrap command to force wrap mode
command! -nargs=* Wrap set wrap linebreak nolist


" vim-test config
let test#strategy = "basic"
let test#java#maven#executable = "mvn"


" File management
" set history=100
set undolevels=1000

" I don't like dealing with backups in the same directory
" set backupdir=~/.vim/tmp
set nobackup
set nowritebackup
set directory=~/.vim/tmp
set undodir=~/.vim/tmp
set noswapfile



" Copy/Paste settings
set copyindent
set pastetoggle=<f2>


" Misc. Settings
set ttyfast
set modelines=0

" Hide all the GUI
set guioptions=aem


" Make Y work as intended, despite not being y compatible
" Remap capital Y to yank (copy) to the end of a line
map Y y$

" Don't overwrite the paste register when pasting over something
" This lets you paste repeatedly, etc.
xnoremap p pgvy
xnoremap P Pgvy

" I don't use arrow keys so I remapped them to other things
" Open last Vim command
nnoremap <Right> :<Up>
" Open last search result
nnoremap <Left> /\v<Up>

" Bubble single lines, move a line up or down
nnoremap <Up> ddkP
nnoremap <Down> ddp

" Bubble multiple lines, do it with visual selections
vnoremap <Up> xkP`[V`]
vnoremap <Down> xp`[V`]

" TagBar Toggle support
nmap <Leader>t :TagbarToggle<CR>

" Use <C-n> and <C-p> to move through fzf search history
let g:fzf_history_dir = '~/.local/share/fzf-history'

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nmap <silent><C-p> :Files <CR>
nmap <silent><C-n> :Rg <CR>
nmap <silent><C-m> :Rg! <CR>

" Navigate up/down Denite lists with <C-k> and <C-j> respectively
" call denite#custom#map(
"       \ 'insert',
"       \ '<C-j>',
"       \ '<denite:move_to_next_line>',
"       \ 'noremap'
"       \)
"
" call denite#custom#map(
"       \ 'insert',
"       \ '<C-k>',
"       \ '<denite:move_to_previous_line>',
"       \ 'noremap'
"       \)
"
" " call denite#custom#alias('source', 'file/rec/git', 'file/rec')
" " call denite#custom#var('file/rec/git', 'command',
" "       \ ['git', 'ls-files', '-co', '--exclude-standard'])
"
" call denite#custom#var('file/rec/git', 'command',
" \ ['git', 'ls-files', '-co', '--exclude-standard'])
" call denite#custom#alias('source', 'file/rec/git', 'file/rec')
"
" " <C-p> to search git files if this is a repo or fallback to just recursively
" " searching the file tree
" nnoremap <silent> <C-p> :<C-u>Denite
" \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>
" nnoremap <silent> <C-p> :<C-u>Denite file/rec -mode=normal<CR>
"
" " <C-b> to search for open buffers by name
" nnoremap <silent> <C-b> :<C-u>Denite buffer -mode=normal<CR>
"
" " Search for buffers by word
" call denite#custom#var('grep', 'command', ['rg'])
" call denite#custom#var('grep', 'default_opts',
"       \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])
" set grepprg=rg\ --vimgrep
" set grepformat^=%f:%l:%c:%m
"
" nnoremap <leader>/ :Denite grep:. <CR>
" nnoremap <silent> <C-m> :DeniteCursorWord grep:. <CR>
"
" hi link deniteMatchedChar Special

" Deoplete config
set omnifunc=syntaxcomplete#Complete
" let g:deoplete#enable_at_startup = 0
" let g:deoplete#auto_completion_start_length = 2
" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = []
" let g:deoplete#file#enable_buffer_path = 1

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25


" Jump around brackets with tab as well
nnoremap <tab> %
vnoremap <tab> %

" Move screen lines not actual ones
nnoremap j gj
nnoremap k gk

" Set my leader to space except for x,i modes
map <Space> <Leader>
noremap <Leader>x i

" ; for faster commands
"nnoremap ; :
" Jump to new split with <space>w
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>e <C-w>s<C-w>j

" nnoremap <leader>E :Emmet

" if has('nvim')
"   " Move around window splits with ctrl movement keys
"   tnoremap <C-h> <C-\><C-n><C-w>h
"   tnoremap <C-j> <C-\><C-n><C-w>j
"   tnoremap <C-k> <C-\><C-n><C-w>k
"   tnoremap <C-l> <C-\><C-n><C-w>l
"
"   " When entering a NeoVim terminal window enter insert mode
"   autocmd BufWinEnter,WinEnter term://* startinsert
"   " When leaving a NeoVim terminal window enter normal mode
"   autocmd BufLeave term://* stopinsert
" endif

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Leader , or . (think < >) for previous/next buffer
map <leader>, :bp<CR>
map <leader>. :bn<CR>
map <leader>< :BufSurfBack<CR>
map <leader>> :BufSurfForward<CR>

" Exit insert mode with 'kj'
inoremap kj <Esc>

" Close a buffer without closing the window split
map <leader>v :bp<bar>sp<bar>bn<bar>bd<CR>
"
" Trim all trailing whitespace in the current buffer/file
command! Trim :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"
" Show where my cursor is with a horizontal line
set cursorline

" Ariline / Color config
set background=dark
set t_Co=256
let g:airline_theme='papercolor'
colorscheme PaperColor
hi SpellBad cterm=undercurl

command! Darkness :set background=dark
command! Lightness :set background=light

let iterm_profile = $ITERM_PROFILE
if iterm_profile == "Light"
    set background=light
else
    set background=dark
endif

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep=''
let g:airline_right_sep=''
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

let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_powerline_fonts = 1

" Show tabline for buffers when only one tab is being used
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#whitespace#trailing_format = 't[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'm[%s]'
let g:airline#extensions#whitespace#symbol = '•'
let g:airline#extensions#whitespace#mixed_indent_algo = 1

let g:python_host_prog = '/usr/local/var/pyenv/versions/2.7.10/bin/python'
let g:python3_host_prog = '/usr/local/var/pyenv/versions/3.6.6/bin/python'
let g:ycm_python_binary_path = '/usr/local/bin/python'
let g:ycm_filetype_blacklist = { 'gitcommit': 1 }

" Rust goto
" let g:racer_cmd = "~/.cargo/bin/racer"
" au FileType rust nmap gd <Plug>(rust-def)
" au FileType rust nmap gs <Plug>(rust-def-split)
" au FileType rust nmap gx <Plug>(rust-def-vertical)
" au FileType rust nmap <leader>gd <Plug>(rust-doc)


" scala-vim config
au BufRead,BufNewFile *.sbt set filetype=scala

" recipe markdeown
au BufRead,BufNewFile *.recipe set filetype=markdown

" Dockerfile filetype for anything that starts with Dockerfile
au BufRead,BufNewFile Dockerfile.* set filetype=dockerfile

function! TestNearestEnv(env)
  let $TEST_ENV = a:env
  TestNearest
endfunction

nmap <silent> <leader>s :call TestNearestEnv("d1")<CR>

" COC config
" :OR organizeImport
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
nnoremap <leader>im :call CocAction('Import')<CR>

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Resume latest coc list
nnoremap <silent> <space>r  :<C-u>CocAction<CR>

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
