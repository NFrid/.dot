require('vutils')

Exe([[
  filetype plugin indent on
  syntax on
  set hidden
]], true)

Exe([[
  set formatoptions-=cro
  set smartindent
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  au BufRead,BufNewFile *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  set foldenable
  set foldlevel=99
  set foldmethod=indent
  set ignorecase
  set smartcase
  set mouse=a
  set clipboard=unnamed
]], true)

Exe([[
  set nospell spelllang=en_us,ru_yo
  set keymap=russian-jcukenwin
  set iminsert=0
  set imsearch=-1
]], true)

Exe([[
  set number
  set relativenumber
  set nowrap
  set noshowmode
  set signcolumn=yes
]], true)

Exe([[
  set list
  set listchars=tab:▸\ ,trail:⋅

  set cc=81
]], true)

Exe([[
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  if (has("termguicolors"))
    set termguicolors
  endif
]], true)

Exe([[
  set guifont=droidsansmono\ nerd\ font\ 11
  set guicursor+=a:blinkon1
]], true)

vim.g.vimsyn_embed = 'l'

-- Custom commands and stuff

Exe([[
  function! ToggleConceal() abort
    if &conceallevel ==# 2
      setlocal conceallevel=0
    else
      setlocal conceallevel=2
    endif
  endfunction
]], true)

Exe([[
  function! ToggleWrap() abort
    if &wrap ==# 'nowrap'
      setlocal wrap linebreak
      nnoremap <buffer> j gj
      nnoremap <buffer> k gk
    else
      setlocal nowrap
      nnoremap <buffer> j
      nnoremap <buffer> k
    endif
  endfunction
]], true)

Exe([[
  function! ToggleKeyMap() abort
    if &iminsert ==# ''
      setlocal iminsert=1
    else
      setlocal iminsert=0
    endif
  endfunction
]], true)

Cmd("autocmd BufReadPost *.zsh,.zshrc set filetype=sh")

-- mappings

vim.mapleader = ' '
vim.g.mapleader = ' '

Map('n', '<SPACE>', '<NOP>')
Map('n', '<tab>', '<CMD>bp<CR>')
Map('n', '<s-tab>', '<CMD>bn<CR>')

Map('n', 'gF', ':e <cfile><CR>')

-- Map('n', '<leader>w', ':w!<CR>')
Map('n', '<Leader>,', '<CMD>lua vim.o.hls = not vim.o.hls<CR>')
Map('n', 'Q', ':bd<CR>')
Map('n', '<leader>cd', ':cd %:h<CR>')

Map('n', '<leader>ve', ':e $MYVIMRC<CR>')
Map('n', '<leader>vs', ':so $MYVIMRC<CR>')

Map('n', '<A-l>', ':call ToggleKeyMap()<CR>')
Map('i', '<A-l>', '<C-^>')

Map('n', '<leader>ps', ':set spell!<CR>')
Map('n', '<leader>pc', ':call ToggleConceal()<CR>')
Map('n', '<leader>pw', ':call ToggleWrap()<CR>')

Map('', '<A-w>', '<C-w>')
Map('t', '<A-a>', '<C-\\><C-n>')

Map('n', '\\\\', '<Esc>/<++><Enter>"_c4l')

Cmd('inoremap <expr> <C-j>   pumvisible() ? "\\<C-n>" : "\\<C-j>"')
Cmd('inoremap <expr> <C-k>   pumvisible() ? "\\<C-p>" : "\\<C-k>"')
Cmd('inoremap <expr> <Tab>   pumvisible() ? "\\<C-n>" : "\\<Tab>"')
Cmd('inoremap <expr> <S-Tab> pumvisible() ? "\\<C-p>" : "\\<S-Tab>"')

-- Plugins & mixed plugin configs

require('plugins')

Exe([[
  hi def link rainbowcol1 DraculaGreen
  hi def link rainbowcol2 DraculaPink
  hi def link rainbowcol3 DraculaOrange
  hi def link rainbowcol4 DraculaPurple
  hi def link rainbowcol5 DraculaYellow
  hi def link rainbowcol6 DraculaCyan
  hi def link rainbowcol7 DraculaRed
]], true)