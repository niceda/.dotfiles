local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

-- Advanced pyright configuration
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "jsonls" })

local pyright_opts = {
	single_file_support = true,
	settings = {
		pyright = {
			disableLanguageServices = false,
			disableOrganizeImports = false,
		},
		python = {
			analysis = {
				autoImportCompletions = true,
				autoSearchPaths = true,
				diagnosticMode = "workspace", -- openFilesOnly, workspace
				typeCheckingMode = "off", -- off, basic, strict
				useLibraryCodeForTypes = true,
			},
		},
	},
}

require("lvim.lsp.manager").setup("pyright", pyright_opts)

-- setup formatting
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({ { name = "black" } })
-- lvim.format_on_save.pattern = { "*.py" }

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup { { command = "flake8", args = { "--ignore=E203,E501" }, filetypes = { "python" } } }

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

-- TODO
local mappings = {
	C = {
		name = "Python",
		c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
	},
}

which_key.register(mappings, opts)
