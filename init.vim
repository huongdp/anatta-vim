if v:progname == 'vi'
  set noloadplugins
endif

let mapleader="\<Space>"
let maplocalleader="\\"


" Turn off most of the features of this plug-in; I really just want the folding.
let g:vim_markdown_override_foldtext=0
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_emphasis_multiline=0
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_frontmatter=1
let g:vim_markdown_new_list_item_indent=0

if filereadable('/usr/local/bin/python3')
  " Avoid search, speeding up start-up.
  let g:python3_host_prog='/usr/local/bin/python3'
endif

" Allow for per-machine overrides in ~/.vim/host/$HOSTNAME.vim and
" ~/.vim/vimrc.local.
let s:hostfile =
      \ $HOME .
      \ '/.vim/host/' .
      \ substitute(hostname(), "\\..*", '', '') .
      \ '.vim'
if filereadable(s:hostfile)
  execute 'source ' . s:hostfile
endif

let s:vimrc_local=$HOME . '/.vim/vimrc.local'
if filereadable(s:vimrc_local)
  execute 'source ' . s:vimrc_local
endif

if has('gui')
  " Turn off scrollbars. (Default on macOS is "egmrL").
  set guioptions-=L
  set guioptions-=R
  set guioptions-=b
  set guioptions-=l
  set guioptions-=r
endif

if &loadplugins
  if has('packages')
    packadd! coc.nvim
    packadd! deoplete.nvim
    packadd! editorconfig-vim
    packadd! fzf.vim
    packadd! goyo.vim
    packadd! nerdcommenter
    packadd! nerdtree
    packadd! nord-vim
    packadd! typescript-vim
    packadd! vim-abolish
    packadd! vim-fugitive
    packadd! vim-javascript
    packadd! vim-markdown
    packadd! vim-surround
  endif
endif

" Automatic, language-dependent indentation, syntax coloring and other
" functionality.
"
" Must come *after* the `:packadd!` calls above otherwise the contents of
" package "ftdetect" directories won't be evaluated.
filetype indent plugin on
syntax on

