call pathogen#infect()
set nocompatible
set cursorline
filetype plugin indent on
set t_Co=256
colorscheme distinguished
" colorscheme lucius
" LuciusBlackHighContrast
set mouse=n
set ttymouse=xterm2
syntax on
set hlsearch
set hidden
set formatprg=par
set autoread
set novisualbell
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set lbr
set ai
set si
set wrap
set number
let g:Perl_PerlTags = 'on'
set foldmethod=syntax
let perl_fold=1
let g:xml_syntax_folding=1
set foldlevel=3
set diffopt+=iwhite
augroup BEGIN
  au! BufRead,BufNewFile *.pl set iskeyword+=:
augroup END
augroup BEGIN
    au! BufRead,BufNewFile *.xsl source ~/.vim/ftplugin/xslhelper.vim
augroup END
augroup BEGIN
    au! BufRead,BufNewFile *.aqs set nowrap 
augroup END
augroup BEGIN
    au! BufRead,BufNewFile *.al3 set nowrap 
augroup END
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :tabn<CR>
set path+=$PWD/**
set pastetoggle=<F4>
set nrformats=
set scrollopt=ver,hor,jump
command Scb set scrollbind!
command Cls let @/=""
command Xpp %!reformat_xml
set laststatus=2
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
set statusline+=%{fugitive#statusline()}
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
nmap <C-Enter> <C-w><C-]><C-w>T
let s:default_path = escape(&path, '\ ') " store default value of 'path'
let ruby_operators = 1
let ruby_space_errors = 1
" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path
nnoremap <F5> :GundoToggle<CR>
