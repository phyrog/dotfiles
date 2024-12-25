-- lazy.nvim

require("config.lazy")

-- General

local opt = vim.opt

opt.laststatus = 2
vim.cmd('filetype plugin on')
vim.cmd('filetype plugin indent on')

-- Display

opt.background = 'dark'
opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.ruler = true
opt.showcmd = true
opt.autoindent = true
opt.scrolloff = 7
opt.incsearch = true
opt.hlsearch = true
opt.cursorline = true

opt.errorbells = false
opt.visualbell = false

opt.wildmode = "longest:full,full"
opt.wildignorecase = true
opt.wildmenu = true

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- Input

opt.backspace = { 'indent', 'eol', 'start' }

-- Mappings

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Movement

map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Normal Mode

map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('n', '<c-j>', 'ddp')
map('n', '<c-k>', 'ddkP')

-- Terminal Mode

map('t', '<esc>', '<c-\\><c-n>')

-- Commentary VSCode
if vim.g.vscode ~= nil then
  map('',  'gc',  '<Plug>VSCodeCommentary')
  map('n', 'gc',  '<Plug>VSCodeCommentary')
  map('o', 'gc',  '<Plug>VSCodeCommentary')
  map('n', 'gcc', '<Plug>VSCodeCommentaryLine')
end

-- Theme
vim.cmd('colorscheme flexoki-dark')
