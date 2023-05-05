-- if packer is not installed, it will go ahead and install it when we open up nvim
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

-- whenever we are saving some files, packer will automatically update any dependency we are missing
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- open packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- This line calls the startup function of the Packer package manager.
-- The startup function is used to configure Packer and define your plugins.
return packer.startup(function(use)
	-- The use function inside the anonymous function is used to define and include plugins in your Neovim configuration.
	-- use "plugin-author/plugin-name"
	use("wbthomason/packer.nvim")

	-- colorscheme
	use({ "projekt0n/github-nvim-theme" })
	-- use("bluz71/vim-nightfly-guicolors")

	-- tmux and split window
	use("szw/vim-maximizer")
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	-- plugins - replace with register
	use("vim-scripts/ReplaceWithRegister")

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope-ui-select.nvim" }) -- for showing lsp code actions

	-- autocomplete
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion => add lsp to autocompletion
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	--auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- scroll
	use("karb94/neoscroll.nvim")
	use("petertriho/nvim-scrollbar")

	-- toggle Term
	use("akinsho/toggleterm.nvim")

	-- The packer_bootstrap variable is typically set when you initially set up Packer and install its required plugins.
	-- It is used as a flag to indicate that the initial setup of Packer has been completed.
	if packer_bootstrap then
		-- The sync() function is responsible for ensuring that your plugin configuration is in sync with the actual installed plugins
		require("packer").sync()
	end
end)
