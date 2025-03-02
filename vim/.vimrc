" Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

" Settings
set autoread
set backspace=indent,eol,start
set clipboard=unnamedplus
set showtabline=2
set nocompatible
set scrolloff=10
set termguicolors
"" Preserve your sanity
set paste
set formatoptions-=cro
setlocal formatoptions-=cro
"" Lines
set number
"" Search
set ignorecase
set incsearch
"" Undo
set nobackup
set noswapfile
set undofile
set undodir=~/.vim/
"" Tabs
set expandtab
set shiftwidth=4
set tabstop=4
"" Wrapping
set wrap
"" Bell
set belloff=all
"" Splits
set splitbelow
set splitright

" Netrw
let g:netrw_banner = 0
let g:netrw_keepdir = 0
map <C-o> :Explore<CR>
map <C-p> :Rexplore<CR>

" Mappings
"" Jumps
map f %
"" Selection
map vi ViB
map va VaB
"" Macros
map m @
"" Splits
map <C-w>o :vs .<CR>
"" Misinputs
map <S-q> nop 
map ; :
map _ :
map + yyp
map - dd
"" Special
map <C-w>n :tabnew<CR>
map <C-w><Tab> :tabnext<CR>
map <C-w>p :tabprevious<CR>
map <C-a> ggVG

" Plugins
runtime ftplugin/man.vim
call plug#begin()
Plug 'akiicat/vim-github-theme'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()
"" Gutter
map <C-w>g :GitGutterToggle<CR>

" Colorscheme
colorscheme github_dark
hi Normal guibg=NONE
hi LineNr guibg=NONE
hi SignColumn guibg=NONE
hi GitGutterAdd guibg=NONE
hi markdownH1 guifg=#FA7970
hi markdownH1Delimiter guifg=#FA7970
hi markdownH2 guifg=#FAA356
hi markdownH2Delimiter guifg=#FAA356
hi markdownH3 guifg=#7CE38B
hi markdownH3Delimiter guifg=#7CE38B
hi markdownH4 guifg=#77BDFB
hi markdownH4Delimiter guifg=#77BDFB
hi markdownH5 guifg=#CEA5FB
hi markdownH5Delimiter guifg=#CEA5FB
hi markdownH6 guifg=#ECF2F8
hi markdownH6Delimiter guifg=#ECF2F8
hi Tabline guibg=NONE
hi TablineFill guibg=NONE
hi TablineSel guibg=NONE

" Tabline
set showtabline=1
set tabline=%!TabLine()
if exists("+showtabline")
    function! TabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')
            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%'
        let s .= (tabpagenr('$') > 1)
        return s
    endfunction
endif
