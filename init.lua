-- init.lua

-- Setze dein Führungszeichen
vim.g.mapleader = " "

-- Initialisiere dein Plugin-Manager
vim.cmd [[packadd packer.nvim]]

-- Plugins mit Packer verwalten
require('packer').startup(function()
    use {'Townk/vim-autoclose'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'neoclide/coc.nvim', branch = 'release'}
    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
    use {'junegunn/fzf.vim'}
    use {'ggreer/the_silver_searcher'}
    use {'autozimu/LanguageClient-neovim', branch = 'next', run = 'bash install.sh'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-endwise'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-surround'}
    use {'mattn/emmet-vim'}
    use {'Yggdroot/indentLine'}
    use {'nvim-lualine/lualine.nvim'}
    use {'nvim-tree/nvim-web-devicons'}
    use {'vim-scripts/DeleteTrailingWhitespace'}
    use {'alvan/vim-closetag'}
    use {'rakr/vim-one'}
    use {'sainnhe/everforest'}
    use {'RRethy/nvim-base16'}
    use {'fatih/vim-go', run = ':GoUpdateBinaries'}
    use {'jgdavey/vim-blockle'}
    use {'kchmck/vim-coffee-script'}
    use {'HerringtonDarkholme/yats.vim'}
    use {'tpope/vim-markdown'}
    use {'leafOfTree/vim-vue-plugin'}
    use {'tpope/vim-rails'}
end)

-- Konfigurationen
require('mappings')
require('config')

-- Globale Einstellungen
vim.o.number = true
vim.o.relativenumber = false
vim.o.syntax = 'enable'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
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

-- Golang Konfiguration
vim.g.go_fmt_command = 'goimports'
vim.g.go_highlight_structs = 1
vim.g.go_highlight_format_strings = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_functions_calls = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_build_constraints = 1
vim.g.syntastic_go_checkers = {'go', 'govet', 'errcheck'}

-- Gemfile, Rakefile, etc.
vim.cmd('au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby')

-- Airline Konfiguration
vim.g.Powerline_symbols = 'fancy'
vim.g.airline_powerline_fonts = 1

-- AutoClose Konfiguration
vim.g.AutoClosePairs = {['('] = ')', ['{'] = '}', ['['] = ']', ['"'] = '"', ["'"] = "'", ['#{'] = '}'}
vim.g.AutoCloseProtectedRegions = {"Character"}

-- Everforest Farbschema Konfiguration
vim.g.everforest_background = 'medium'
vim.cmd('colorscheme everforest')

-- DeleteTrailingWhitespace Konfiguration
vim.g.DeleteTrailingWhitespace = 1
vim.g.DeleteTrailingWhitespace_Action = 'delete'

-- Fzf Vorschau-Fenster
vim.g.fzf_preview_window = {'hidden,right,50%,<70(up,40%)', 'ctrl-/'}

-- Sucheinstellungen
vim.cmd('set hlsearch')
vim.cmd('set incsearch')

-- Autoread beim Fokuserhalt und Änderung der Datei im Hintergrund
vim.cmd('au CursorHold * checktime')
vim.cmd('au FocusGained * checktime')

-- Vimrc automatisch neu laden, wenn es bearbeitet wird
vim.cmd('autocmd! bufwritepost .init.vim source %')
vim.cmd('autocmd! bufwritepost init.vim source %')
