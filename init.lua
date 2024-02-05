-- init.lua

-- Setze dein Führungszeichen
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

require('configs.tree-sitter')
require('configs.lsp')
require('mappings')

-- Make line numbers default
vim.wo.number = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Set highlight on search
vim.o.hlsearch = true

-- TODO: checkme
-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Globale Einstellungen
vim.o.relativenumber = false
vim.o.syntax = 'enable'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.title = true
vim.o.encoding = 'utf-8'
vim.o.scrolloff = 3
vim.o.autoindent = true
vim.o.incsearch = true
vim.o.showmatch = true
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
vim.o.foldenable = false
vim.opt.colorcolumn = "81"
vim.o.winwidth = 81
vim.o.splitbelow = true
vim.o.splitright = true

-- Typescript-Unterstützung
vim.cmd('autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab')

-- Gemfile, Rakefile, etc.
-- TODO can this be removed
vim.cmd('au BufRead,BufNewFile Gemfile,Rakefile,config.ru,Guardfile,Capfile set ft=ruby')

-- AutoClose Konfiguration
vim.g.AutoClosePairs = {['('] = ')', ['{'] = '}', ['['] = ']', ['"'] = '"', ["'"] = "'", ['#{'] = '}'}
vim.g.AutoCloseProtectedRegions = {"Character"}

-- Everforest Farbschema Konfiguration
vim.cmd('set conceallevel=0')
vim.cmd('let g:vim_json_conceal=0')
vim.cmd('colorscheme everforest')

-- DeleteTrailingWhitespace Konfiguration
vim.g.DeleteTrailingWhitespace = 1
vim.g.DeleteTrailingWhitespace_Action = 'delete'

-- Fzf Vorschau-Fenster
vim.g.fzf_preview_window = {'hidden,right,50%,<70(up,40%)', 'ctrl-/'}

-- Autoread beim Fokuserhalt und Änderung der Datei im Hintergrund
vim.cmd('au CursorHold * checktime')
vim.cmd('au FocusGained * checktime')
