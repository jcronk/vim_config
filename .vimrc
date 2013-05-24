set encoding=utf-8
call pathogen#infect()
set nocompatible
set cursorline
set t_Co=256
filetype plugin indent on
set bg=dark
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
set listchars=eol:⤦,tab:➟\ ,trail:☠
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
set incsearch
let g:Perl_PerlTags = 'on'
set foldmethod=syntax
let perl_fold=1
let g:xml_syntax_folding=1
set foldlevel=3
set diffopt+=iwhite
autocmd FileType xml,xslt setlocal shiftwidth=4 tabstop=4
augroup BEGIN
  au! BufRead,BufNewFile *.pl set iskeyword+=:
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
fun! ReformatXML()
  let l = line(".")
  let c = col(".")
  let _s = @/
  %!tidy --input-xml true --indent yes --indent-spaces 4 --wrap 0 2>/dev/null 
  %s/\v(xmlns)/\r    \1/ge
  call cursor(l,c)
  let @/ = _s
endfun
command Scb set scrollbind!
command Cls let @/=""
command Xpp call ReformatXML()
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

if exists("+showtabline")
     function MyTabLine()
         let s = ''
         let t = tabpagenr()
         let i = 1
         while i <= tabpagenr('$')
             let buflist = tabpagebuflist(i)
             let winnr = tabpagewinnr(i)
             let s .= '%' . i . 'T'
             let s .= (i == t ? '%1*' : '%2*')
             let s .= ' '
             let s .= i . ')'
             let s .= ' %*'
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
             let file = bufname(buflist[winnr - 1])
             let file = fnamemodify(file, ':p:t')
             if file == ''
                 let file = '[No Name]'
             endif
             let s .= file
             let i = i + 1
         endwhile
         let s .= '%T%#TabLineFill#%='
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
         return s
     endfunction
     set stal=2
     set tabline=%!MyTabLine()
endif

fun! StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  let _s=@/
  %s/\s\+$//e
  call cursor(l, c)
  let @/=_s
endfun

autocmd BufWritePre *.rb,*.pl,*.pm,*.t,*.xsl :exe 'keepjumps call StripTrailingWhitespaces()'
autocmd BufWritePre *.xml,*.xsl :exe 'keepjumps call ReformatXML()'
