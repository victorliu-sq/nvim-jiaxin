vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

-- map Up / Down / Left / Right
keymap.set("n", "<S-Left>", "5h", { noremap = true })
keymap.set("n", "<S-Right>", "5l", { noremap = true })
keymap.set("n", "<S-Up>", "5k", { noremap = true })
keymap.set("n", "<S-Down>", "5j", { noremap = true })

keymap.set("i", "<S-Left>", "<Esc>5hi", { noremap = true })
keymap.set("i", "<S-Right>", "<Esc>5li", { noremap = true })
keymap.set("i", "<S-Up>", "<Esc>5ki", { noremap = true })
keymap.set("i", "<S-Down>", "<Esc>5ji", { noremap = true })

keymap.set("v", "<S-Left>", "5h", { noremap = true })
keymap.set("v", "<S-Right>", "5l", { noremap = true })
keymap.set("v", "<S-Up>", "5k", { noremap = true })
keymap.set("v", "<S-Down>", "5j", { noremap = true })

-- make the current line appear at the quarter of the screen
keymap.set("n", "<Leader>qq", ':execute "normal! " . ((&lines / 4) . "H")<CR>', { noremap = true, silent = true })

keymap.set("n", "<Leader>qw", ':execute "normal! " . ((2 * &lines / 4) . "H")<CR>', { noremap = true, silent = true })

keymap.set("n", "<Leader>qe", ':execute "normal! " . ((3 * &lines / 4) . "H")<CR>', { noremap = true, silent = true })

-- split window
keymap.set("n", "<leader><Left>", "<C-w>h")
keymap.set("n", "<leader><Right>", "<C-w>l")
keymap.set("n", "<leader><Up>", "<C-w>k") -- make split windows equal width
keymap.set("n", "<leader><Down>", "<C-w>j") -- make split windows equal width
keymap.set("n", "<leader>=", ":vs<CR>") -- make split windows equal width
keymap.set("n", "<leader>+", ":sp<CR>") -- make split windows equal width
keymap.set("n", "<leader>-", ":close<CR>") -- close current split window
keymap.set("n", "<leader>n", ":wincmd =<CR>") -- make split windows equal width
keymap.set("n", "<leader>o", ":on<CR>") -- only keep current window

-- tab
keymap.set("n", "<leader>to", ":tabnew<CR>") --open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- double click
keymap.set("n", "<leader>w", "viw") -- selectcurrent word
keymap.set("n", "<leader>f", "V$%") -- selectcurrent function

----------------------
-- Plugin Keybinds
----------------------
-- vim-maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")

-- NvimTree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- E (expand_all) to expand the entire file tree starting from the root folder (workspace)
-- W (collapse_all) to close all open folders starting from the root folder
-- f (find) to open the interactive file search to which search filters can be applied
-- F to close the interactive search

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find symbols in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
