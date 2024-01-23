-- init.lua

-- Setze dein Führungszeichen
vim.g.mapleader = " "

-- Initialisiere dein Plugin-Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

require('mappings')
require('config')

-- Globale Einstellungen
vim.o.number = true
vim.o.relativenumber = false
vim.o.syntax = 'enable'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.title = true
vim.o.encoding = 'utf-8'
vim.o.scrolloff = 3
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.showmode = true
vim.o.showcmd = true
vim.o.hidden = true
vim.o.wildmenu = true
vim.o.wildmode = 'list:longest'
vim.o.cursorline = true
vim.o.ttyfast = true
vim.o.ruler = true
vim.o.backspace = 'indent,eol,start'
vim.o.laststatus = 2
vim.o.number = true
vim.o.relativenumber = false
vim.o.undofile = true
vim.o.foldenable = false
vim.opt.colorcolumn = "81"
vim.o.winwidth = 81
vim.o.splitbelow = true
vim.o.splitright = true

-- Typescript-Unterstützung
vim.cmd('autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab')

-- Coc.nvim Konfiguration
vim.g.coc_global_extensions = {
    'coc-eslint',
    'coc-prettier',
    'coc-solargraph',
    'coc-tsserver',
    'coc-tslint',
    'coc-tslint-plugin',
    'coc-css',
    'coc-json',
    'coc-pyls',
    'coc-yaml',
    'coc-vetur'
}

-- Syntastic Konfiguration
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 0
vim.g.syntastic_mode_map = { passive_filetypes = {'html'} }

-- Gemfile, Rakefile, etc.
vim.cmd('au BufRead,BufNewFile Gemfile,Rakefile,config.ru,Guardfile,Capfile set ft=ruby')

-- Airline Konfiguration
vim.g.Powerline_symbols = 'fancy'
vim.g.airline_powerline_fonts = 1

-- AutoClose Konfiguration
vim.g.AutoClosePairs = {['('] = ')', ['{'] = '}', ['['] = ']', ['"'] = '"', ["'"] = "'", ['#{'] = '}'}
vim.g.AutoCloseProtectedRegions = {"Character"}

-- Everforest Farbschema Konfiguration
vim.cmd('set conceallevel=0')
vim.cmd('let g:vim_json_conceal=0')
vim.cmd('colorscheme everforest')
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.api.nvim_set_option('termguicolors', true)

vim.api.nvim_set_option('hlsearch', true)
vim.api.nvim_set_option('incsearch', true)


-- DeleteTrailingWhitespace Konfiguration
vim.g.DeleteTrailingWhitespace = 1
vim.g.DeleteTrailingWhitespace_Action = 'delete'

-- Fzf Vorschau-Fenster
vim.g.fzf_preview_window = {'hidden,right,50%,<70(up,40%)', 'ctrl-/'}

-- Autoread beim Fokuserhalt und Änderung der Datei im Hintergrund
vim.cmd('au CursorHold * checktime')
vim.cmd('au FocusGained * checktime')
