local opt = vim.opt -- for conciseness

-- swap files
opt.swapfile = false

-- line numbers
opt.number = true

-- true color support
opt.termguicolors = true

-- tab & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "light"
opt.signcolumn = "yes"

-- backspace
-- opt.backspace = "indent, eol, start"

-- clipboard (force nvim to use system clipboard)
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- make - part of the word
opt.iskeyword:append("-")
