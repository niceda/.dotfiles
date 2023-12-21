vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
local codelldb_adapter = {
	type = "server",
	port = "${port}",
	executable = {
		command = mason_path .. "bin/codelldb",
		args = { "--port", "${port}" },
	},
}

local opts = {
	tools = { -- rust-tools options

		-- how to execute terminal commands
		-- options right now: termopen / quickfix / toggleterm / vimux
		executor = require("rust-tools.executors").termopen,

		runnables = {
			use_telescope = true,
		},

		-- callback to execute once rust-analyzer is done initializing the workspace
		-- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
		on_initialized = function()
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
				pattern = { "*.rs" },
				callback = function()
					local _, _ = pcall(vim.lsp.codelens.refresh)
				end,
			})
		end,

		-- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
		reload_workspace_from_cargo_toml = true,

		-- These apply to the default RustSetInlayHints command
		inlay_hints = {
			-- automatically set inlay hints (type hints)
			-- default: true
			auto = true,

			-- Only show inlay hints for the current line
			only_current_line = false,

			-- whether to show parameter hints with the inlay hints or not
			-- default: true
			show_parameter_hints = true,

			-- prefix for parameter hints
			-- default: "<-"
			parameter_hints_prefix = "<- ",

			-- prefix for all the other hints (type, chaining)
			-- default: "=>"
			other_hints_prefix = "=> ",

			-- whether to align to the length of the longest line in the file
			max_len_align = false,

			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,

			-- whether to align to the extreme right or not
			right_align = false,

			-- padding from the right if right_align is true
			right_align_padding = 7,

			-- The color of the hints
			highlight = "Comment",
		},

		-- options same as lsp hover / vim.lsp.util.open_floating_preview()
		hover_actions = {

			-- the border that is used for the hover window
			-- see vim.api.nvim_open_win()
			border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			},

			-- Maximal width of the hover window. Nil means no max.
			max_width = nil,

			-- Maximal height of the hover window. Nil means no max.
			max_height = nil,

			-- whether the hover action window gets automatically focused
			-- default: false
			auto_focus = false,
		},

		-- settings for showing the crate graph based on graphviz and the dot
		-- command
		crate_graph = {
			-- Backend used for displaying the graph
			-- see: https://graphviz.org/docs/outputs/
			-- default: x11
			backend = "x11",
			-- where to store the output, nil for no output stored (relative
			-- path from pwd)
			-- default: nil
			output = nil,
			-- true for all crates.io and external crates, false only the local
			-- crates
			-- default: true
			full = true,

			-- List of backends found on: https://graphviz.org/docs/outputs/
			-- Is used for input validation and autocompletion
			-- Last updated: 2021-08-26
			enabled_graphviz_backends = {
				"bmp",
				"cgimage",
				"canon",
				"dot",
				"gv",
				"xdot",
				"xdot1.2",
				"xdot1.4",
				"eps",
				"exr",
				"fig",
				"gd",
				"gd2",
				"gif",
				"gtk",
				"ico",
				"cmap",
				"ismap",
				"imap",
				"cmapx",
				"imap_np",
				"cmapx_np",
				"jpg",
				"jpeg",
				"jpe",
				"jp2",
				"json",
				"json0",
				"dot_json",
				"xdot_json",
				"pdf",
				"pic",
				"pct",
				"pict",
				"plain",
				"plain-ext",
				"png",
				"pov",
				"ps",
				"ps2",
				"psd",
				"sgi",
				"svg",
				"svgz",
				"tga",
				"tiff",
				"tif",
				"tk",
				"vml",
				"vmlz",
				"wbmp",
				"webp",
				"xlib",
				"x11",
			},
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
	server = {
		-- standalone file support
		-- setting it to false may improve startup time
		standalone = true,
		on_attach = function(client, bufnr)
			require("lvim.lsp").common_on_attach(client, bufnr)
			local rt = require("rust-tools")
			vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
		end,

		capabilities = require("lvim.lsp").common_capabilities(),
		settings = {
			["rust-analyzer"] = {
				lens = {
					enable = true,
				},
				checkOnSave = {
					enable = true,
					command = "clippy",
				},
			},
		},
	}, -- rust-analyzer options

	-- debugging stuff
	dap = {
		adapter = codelldb_adapter,
	},
}

require("rust-tools").setup(opts)

-- CHANGED --
lvim.builtin.dap.on_config_done = function(dap)
	dap.adapters.codelldb = codelldb_adapter
	dap.configurations.rust = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	}
end

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
	c = {
		name = "Rust",
		a = { "<cmd>lua require('crates').update_all_crates()<cr>", "Update all crates" },
		A = { "<cmd>lua require('crates').upgrade_all_crates()<cr>", "Upgrade all crates" },
		c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
		d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
		D = { "<cmd>RustOpenExternalDocs<Cr>", "Open Docs" },
		f = { "<cmd>lua require('crates').show_features_popup()<cr>", "Show features" },
		m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
		o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
		p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
		r = { "<cmd>lua require('crates').reload()<cr>", "Reload" },
		-- r = { "<cmd>RustRunnables<Cr>", "Runnables" },
		R = {
			"<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
			"Reload Workspace",
		},
		s = { "<cmd>lua require('crates').show_popup()<cr>", "Show Popup" },
		t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
		u = { "<cmd>lua require('crates').update_crate()<cr>", "Update crate" },
		U = { "<cmd>lua require('crates').upgrade_crate()<cr>", "Upgrade crate" },
		v = { "<cmd>lua require('crates').show_versions_popup()<cr>", "Show versions" },
		V = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
	},
	r = { "<cmd>RustRunnables<Cr>", "Runnables" },
}

which_key.register(mappings, opts)
