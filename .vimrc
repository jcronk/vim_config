set encoding=utf-8
call pathogen#infect()
set nocompatible
set cursorline
set wildmenu
" set t_Co=256
filetype plugin indent on
set bg=dark
" colorscheme darkbone
" colorscheme distinguished
" colorscheme wombat256
colorscheme jellybeans
if &term =~ '256color'
  set t_ut=
endif
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000
" colorscheme lucius
" LuciusBlackHighContrast
set mouse=n
set virtualedit=block
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_branch_prefix = ' '
let g:airline_readonly_symbol = ''
let g:airline_linecolumn_prefix = ' '
let g:airline_section_c = '[%n] %f%m'
set ttymouse=xterm2
set formatprg=par
syntax on
set hlsearch
set hidden
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
set backspace=indent,eol,start
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
nnoremap <silent> <F6> :Vexplore<CR>
nnoremap <silent> <F9> :Gstatus<CR>
set path+=$PWD/**
set pastetoggle=<F4>
set nrformats=
set scrollopt=ver,hor,jump
fun! ReformatXML()
  let l = line(".")
  let c = col(".")
  let _s = @/
  let current_filetype = &ft
  set ft=
  execute '%!tidy --input-xml true --preserve-entities yes --indent yes --input-encoding utf8 --indent-spaces 4 --wrap 0 --show-warnings 0  --quiet 1  2>/dev/null'
  if v:shell_error | throw 'XML Reformat failed' | endif
  %s/\v(xmlns)/\r    \1/ge
  let &ft=current_filetype
  call cursor(l,c)
  let @/ = _s
endfun
command Xerr execute '%!tidy --input-xml true --preserve-entities yes --indent yes --indent-spaces 4 --wrap 0 --show-errors 0 --show-warnings false'
command Scb set scrollbind!
command Cls let @/=""
command Xpp call ReformatXML()
set laststatus=2
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=[%n]
set statusline+=%#type#
set statusline+=%-40f\                          " file name
set statusline+=%#diffdelete#
set statusline+=[%H%M%R%W]%*\                     " flags
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
nmap <leader>b "_d
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
autocmd BufRead *AQS*.xml set eventignore=BufWritePre
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

fun! PerlStripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  let _s=@/
  let contents=getline(1,"$")
  if match(contents,"^__DATA__") >= 0
    0,/__DATA__/s/\s\+$//e
  else
    %s/\s\+$//e
  endif
  call cursor(l, c)
  let @/=_s
endfun
let g:netrw_browse_split = 3 " open files in new tab
let g:netrw_keepdir = 0 " keep current dir same as browsing dir
let g:netrw_liststyle = 1 " long file listing with size+timestamp
let g:netrw_sort_options = 'i' " sort case insensitive
autocmd BufWritePre *.xml,*.xsl :exe 'keepjumps call ReformatXML()'
autocmd BufWritePre *.xsl :exe 'keepjumps call StripTrailingWhitespaces()'
autocmd BufWritePre *.rb,*.pl,*.pm,*.t :exe 'keepjumps call PerlStripTrailingWhitespace()'
nnoremap <F2> :XPathSearchPrompt<CR>
let g:tagbar_type_xslt = {
  \ 'ctagstype' : 'xslt',
  \ 'kinds'     : [
    \ 'n:namedtemplate',
    \ 'm:matchedtemplate',
    \ 'a:applytemplate',
    \ 'c:calltemplate',
    \ 'v:variable',
    \ 'f:function',
    \ 'p:parameter',
    \ 'k:key'
  \ ],
  \ 'sort'     : 0,
 \ }
nnoremap <silent> <F8> :TagbarOpenAutoClose<CR>
