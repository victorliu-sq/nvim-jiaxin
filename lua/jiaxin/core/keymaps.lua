vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

-- split window
keymap.set("n", "<leader><Left>", "<C-w>h")
keymap.set("n", "<leader><Right>", "<C-w>l")
keymap.set("n", "<leader><Up>", "<C-w>k") -- make split windows equal width
keymap.set("n", "<leader><Down>", "<C-w>j") -- make split windows equal width
keymap.set("n", "<leader>=", ":vs<CR>") -- make split windows equal width
keymap.set("n", "<leader>+", ":sp<CR>") -- make split windows equal width
keymap.set("n", "<leader>-", ":close<CR>") -- close current split window

-- tab
keymap.set("n", "<leader>to", ":tabnew<CR>") --open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- double click

----------------------
-- Plugin Keybinds
----------------------
-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- NvimTree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find symbols in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
