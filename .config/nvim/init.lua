require('vutils')

vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.foldenable = false

vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
Cmd('au BufRead,BufNewFile *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4')

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamed'

vim.opt.spell = false
vim.opt.spelllang = 'en_us,ru_yo'
vim.opt.keymap = 'russian-jcukenwin'
vim.opt.iminsert = 0
vim.opt.imsearch = -1

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.signcolumn = 'no'
vim.opt.cursorline = true

vim.opt.list = true
vim.opt.listchars = { trail = '⋅' }
vim.opt.cc = '81'

vim.opt.termguicolors = true

vim.g.vimsyn_embed = 'l'

vim.mapleader = ' '
vim.g.mapleader = ' '

-- Custom commands and stuff

Format = function()
  vim.api.nvim_command(":w")

  local formatCmds = {
    lua = 'lua-format --indent-width=2 --spaces-inside-table-braces -i',
    go = 'gofmt -w',
    javascript = 'prettier -w --loglevel error',
    typescript = 'prettier -w --loglevel error',
    javascriptreact = 'prettier -w --loglevel error',
    typescriptreact = 'prettier -w --loglevel error',
    json = 'prettier -w --loglevel error',
    css = 'prettier -w --loglevel error',
    scss = 'prettier -w --loglevel error',
    cmake = 'cmake-format -i',
    c = 'clang-format -style=file -i',
    cpp = 'clang-format -style=file -i',
    markdown = 'prettier -w --prose-wrap always --loglevel error',
    python = 'black -q'
  }

  local cmd = formatCmds[vim.bo.filetype] or 'sed -i -e "s/\\s\\+$//"'
  local f = io.popen(cmd .. ' "' .. vim.api.nvim_buf_get_name("%") .. '" 2>&1')
  print(f:read('*all'))
  f:close()
  vim.api.nvim_command("let tmp = winsaveview()")
  vim.api.nvim_command("e!")
  vim.api.nvim_command("call winrestview(tmp)")
  vim.api.nvim_command("IndentBlanklineRefresh")
end

Map('n', '<leader>F', ':lua Format()<CR>')

ToggleConceal = function()
  if vim.wo.conceallevel == 2 then
    vim.wo.conceallevel = 0
  else
    vim.wo.conceallevel = 2
  end
end

Map('n', '<leader>pc', ':lua ToggleConceal()<CR>')

ToggleWrap = function()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.api.nvim_buf_del_keymap(0, 'n', 'j')
    vim.api.nvim_buf_del_keymap(0, 'n', 'k')
  else
    vim.wo.wrap = true
    BMap('n', 'j', 'gj')
    BMap('n', 'k', 'gk')
  end
end

Map('n', '<leader>pw', ':lua ToggleWrap()<CR>')

ToggleKeyMap = function()
  if vim.bo.iminsert == 0 then
    vim.bo.iminsert = 1
  else
    vim.bo.iminsert = 0
  end
end

Map('n', '<A-l>', ':lua ToggleKeyMap()<CR>')
Map('i', '<A-l>', '<C-^>')

ToggleRelNums = function()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
  end
end

Map('n', '<leader>pr', ':lua ToggleRelNums()<CR>')

Cmd("au BufReadPost *.zsh,.zshrc set filetype=sh")
Cmd("au BufReadPost *.fish set filetype=fish")
Cmd("au BufReadPost *.conf set filetype=config")

Cmd("command! W :w!")

-- mappings

Map('n', '<SPACE>', '<NOP>')

Map('n', '<tab>', '<CMD>bn<CR>')
Map('n', '<s-tab>', '<CMD>bp<CR>')

Map('n', '<C-h>', '<CMD>bp<CR>')
Map('n', '<C-l>', '<CMD>bn<CR>')
Map('n', '<C-j>', '<CMD>tabn<CR>')
Map('n', '<C-k>', '<CMD>tabp<CR>')

Map('n', 'gF', ':e <cfile><CR>')

Map('n', '<leader>w', ':w!<CR>')
Map('n', '<Leader>?', '<CMD>lua vim.opt.hls = not vim.opt.hls<CR>')
Map('n', '<Leader>/', ':nohlsearch<CR>')
Map('n', 'Q', ':bd<CR>')
Map('n', '<leader>cd', ':cd %:h<CR>')
Map('n', '<leader>cp', ':let @+ = expand("%:p:h")<CR>')

Map('n', '>', '>>')
Map('n', '<', '<<')

Map('n', '<leader>vv', ':e $MYVIMRC<CR>')

Map('n', '<leader>ps', ':set spell!<CR>')

if vim.env.TMUX == nil then Map('n', '<A-a>', ':silent !$TERM & disown<CR>') end

Map('', '<A-w>', '<C-w>')
Map('t', '<A-a>', '<C-\\><C-n>')

Map('n', '\\\\', '<Esc>/<++><Enter>"_c4l')

Map('n', 'cd', ':cd ')

Cmd('inoremap <expr> <C-j>   pumvisible() ? "\\<C-n>" : "\\<C-j>"')
Cmd('inoremap <expr> <C-k>   pumvisible() ? "\\<C-p>" : "\\<C-k>"')
Cmd('inoremap <expr> <Tab>   pumvisible() ? "\\<C-n>" : "\\<Tab>"')
Cmd('inoremap <expr> <S-Tab> pumvisible() ? "\\<C-p>" : "\\<S-Tab>"')

-- Plugins & mixed plugin configs

require('plugins')
