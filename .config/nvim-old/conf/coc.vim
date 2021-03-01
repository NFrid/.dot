let g:coc_global_extensions = [
      \ 'coc-actions' ,
      \ 'coc-bibtex' ,
      \ 'coc-bootstrap-classname' ,
      \ 'coc-css' ,
      \ 'coc-cssmodules' ,
      \ 'coc-diagnostic' ,
      \ 'coc-docker' ,
      \ 'coc-docthis' ,
      \ 'coc-emmet' ,
      \ 'coc-emoji' ,
      \ 'coc-eslint' ,
      \ 'coc-explorer' ,
      \ "coc-f5" ,
      \ "coc-floaterm" ,
      \ 'coc-floatinput' ,
      \ 'coc-fzf-preview' ,
      \ 'coc-git' ,
      \ 'coc-html' ,
      \ 'coc-import-cost' ,
      \ 'coc-jedi' ,
      \ 'coc-json' ,
      \ 'coc-just-complete' ,
      \ 'coc-lists' ,
      \ 'coc-lua' ,
      \ 'coc-markdownlint' ,
      \ 'coc-marketplace' ,
      \ 'coc-pairs' ,
      \ 'coc-perl' ,
      \ 'coc-prettier' ,
      \ 'coc-pyright' ,
      \ 'coc-python' ,
      \ 'coc-rainbow-fart' ,
      \ 'coc-react-refactor' ,
      \ 'coc-sh' ,
      \ 'coc-snippets' ,
      \ 'coc-stylelint' ,
      \ 'coc-stylelintplus' ,
      \ 'coc-styled-components' ,
      \ 'coc-svg' ,
      \ 'coc-syntax' ,
      \ 'coc-tabnine' ,
      \ 'coc-texlab' ,
      \ 'coc-tslint-plugin' ,
      \ 'coc-tsserver' ,
      \ 'coc-vetur' ,
      \ 'coc-vimlsp' ,
      \ 'coc-xml' ,
      \ 'coc-yaml' ,
      \ 'coc-yank' ,
      \ ]


" Pum autocomplete control
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-c> to trigger completion.
inoremap <silent><expr> <C-Space> coc#refresh()
"
if exists('*complete_info')
  inoremap <expr> <cr>
        \ complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Show doc func
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
" autocmd CursorHold * silent call CocActionAsync('highlight')

" TODO: WTF IS THIS SHIT HOW IT WORKS
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json
        \ setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Mapping

" Diagnostic navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> <leader>cgd <Plug>(coc-definition)
nmap <silent> <leader>cgy <Plug>(coc-type-definition)
nmap <silent> <leader>cgi <Plug>(coc-implementation)
nmap <silent> <leader>cgr <Plug>(coc-references)

" Show documentation for word under cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming
nmap <leader>cr <Plug>(coc-rename)

" Formatting selected code
" xmap <leader>cf  <Plug>(coc-format-selected)
" nmap <leader>cf  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>cas  <Plug>(coc-codeaction-selected)
nmap <leader>cas  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>caa  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>cq  <Plug>(coc-fix-current)

" Run Prettier
nmap <leader>cp :CocCommand prettier.formatFile<CR>

" Restart CoC
nmap <leader>cc :CocRestart<CR>

" Errors
nmap <leader>cn <Plug>(coc-diagnostic-next-error)
nmap <leader>cN <Plug>(coc-diagnostic-prev-error)


" CocLists
nmap <leader>ll :CocList 
nmap <leader>l; :CocListResume<CR>
nmap <leader>ly :CocList yank<CR>
nmap <leader>lf :CocList floaterm<CR>
nmap <leader>lc :CocList commands<CR>
nmap <leader>la :CocList actions<CR>
nmap <leader>lb :CocList buffers<CR>
nmap <leader>ld :CocList diagnostic<CR>


" Explorer
nmap <silent> <leader>n :CocCommand explorer<CR>