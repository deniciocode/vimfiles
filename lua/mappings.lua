-- Word Search
vim.keymap.set('n', '<leader>a', ':Ag<CR>')

-- File search
vim.keymap.set('n', '<leader>fb', ':Buffer<cr>')
vim.keymap.set('n', '<leader>ff', ':FZF<cr>')
vim.keymap.set('n', '<leader>fg', ':GFiles<cr>')
vim.keymap.set('n', '<c-o>', ':GFiles<cr>')
vim.keymap.set('n', '<leader>fw', ':Ag <c-r><c-w>')

-- Disable arrow keys
vim.keymap.set('n', '<Left>', ':echoe "Use h"<CR>')
vim.keymap.set('n', '<Right>', ':echoe "Use l"<CR>')
vim.keymap.set('n', '<Up>', ':echoe "Use k"<CR>')
vim.keymap.set('n', '<Down>', ':echoe "Use j"<CR>"')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')

-- TODO remove me if we can do this via lsp
vim.keymap.set("n", "<leader>rr", ":!rubocop %<CR>")
vim.keymap.set("n", "<leader>re", ":!rubocop -a %<CR>", {silent = true})
vim.keymap.set("n", "<leader>ra", ":!rubocop -A %<CR>", {silent = true})

-- Searching
vim.keymap.set('n', '<leader>h' ,':noh<CR>')
vim.keymap.set('n', '/', '/\\c', { noremap = true })
vim.keymap.set('v', '/', '/\\c', { noremap = true })

-- Opens Rspec directly or VSplit
vim.keymap.set('n', '<C-A><C-A>', ':A<CR>')
vim.keymap.set('n', '<C-A><C-V>', ':AV<CR>')

-- Center screen when scrolling search results
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- New Tab
vim.keymap.set('n', '<leader>t', ':tabnew<CR>')

-- Open Explor
vim.keymap.set('n', '<leader>e', ':Explor<CR>')
vim.keymap.set('n', ';', ':')

-- vim.keymap.set('t', '<Esc>', '<C-\><C-n>')

-- key mapping for window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Switch between buffers
vim.keymap.set('n', '<tab>', ':bn<CR>')
vim.keymap.set('n', '<S-tab>', ':bp<CR>')

-- Autocomplete
-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300
local keyset = vim.keymap.set

function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate NOTE:
-- There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {
  silent = true, noremap = true, expr = true, replace_keycodes = false
}
