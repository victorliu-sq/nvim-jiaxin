-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"sumneko_lua",
		"emmet_ls",
		"clangd", --C / C++
		"cmake", -- Cmake
		"dockerls", -- docker
		"docker_compose_language_service", -- docker_compose
		"golangci_lint_ls", -- go
		"gopls", -- go
		"quick_lint_js", -- JS
		"tsserver", -- JS
		"vtsls", -- JS
		"pylsp", -- Python
		"solang", -- Solidity
		"solc", -- Solidity
		"solidity-ls", -- Solidity
		"yamlls", -- Yaml
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js/solidity formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"gofumpt", -- replacement for go's formatter
		"goimports", -- another go's formatter
		"golangci-lint", -- linter for go
		"solhint", --linter for solidity
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})

