vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.expandtab = false

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "goimports", filetypes = { "go" } },
	{ command = "gofumpt", filetypes = { "go" } },
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })

local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("golangci_lint_ls", {
	on_init = require("lvim.lsp").common_on_init,
	capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("gopls", {
	on_attach = function(client, bufnr)
		require("lvim.lsp").common_on_attach(client, bufnr)
		local _, _ = pcall(vim.lsp.codelens.refresh)
	end,
	on_init = require("lvim.lsp").common_on_init,
	capabilities = require("lvim.lsp").common_capabilities(),
	settings = {
		gopls = {
			gofumpt = true, -- A stricter gofmt
			codelenses = {
				gc_details = true, -- Toggle the calculation of gc annotations
				generate = true, -- Runs go generate for a given directory
				regenerate_cgo = true, -- Regenerates cgo definitions
				test = true,
				tidy = true, -- Runs go mod tidy for a module
				upgrade_dependency = true, -- Upgrades a dependency in the go.mod file for a module
				vendor = true, -- Runs go mod vendor for a module
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			diagnosticsDelay = "300ms",
			symbolMatcher = "fuzzy",
			completeUnimported = true,
			staticcheck = true,
			matcher = "Fuzzy",
			deepCompletion = true,
			usePlaceholders = true, -- enables placeholders for function parameters or struct fields in completion responses
			analyses = {
				fieldalignment = true, -- find structs that would use less memory if their fields were sorted
				nilness = true, -- check for redundant or impossible nil comparisons
				shadow = true, -- check for possible unintended shadowing of variables
				unusedparams = true, -- check for unused parameters of functions
				unusedwrite = true, -- checks for unused writes, an instances of writes to struct fields and arrays that are never read
			},
		},
	},
})

local status_ok, gopher = pcall(require, "gopher")
if not status_ok then
	return
end

gopher.setup({
	commands = {
		go = "go",
		gomodifytags = "gomodifytags",
		gotests = "gotests",
		impl = "impl",
		iferr = "iferr",
	},
})

------------------------
-- Language Key Mappings
------------------------

------------------------
-- Dap
------------------------
local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
	return
end

dapgo.setup()

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	C = {
		name = "Go",
		i = { "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies" },
		f = { "<cmd>GoMod tidy<cr>", "Tidy" },
		a = { "<cmd>GoTestAdd<Cr>", "Add Test" },
		A = { "<cmd>GoTestsAll<Cr>", "Add All Tests" },
		e = { "<cmd>GoTestsExp<Cr>", "Add Exported Tests" },
		g = { "<cmd>GoGenerate<Cr>", "Go Generate" },
		G = { "<cmd>GoGenerate %<Cr>", "Go Generate File" },
		c = { "<cmd>GoCmt<Cr>", "Generate Comment" },
		t = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" },
	},
}

which_key.register(mappings, opts)
