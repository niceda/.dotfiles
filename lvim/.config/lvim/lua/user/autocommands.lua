-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   pattern = { "*.json", "*.jsonc" },
--   command = "setlocal wrap",
-- })

-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   pattern = { "*.cpp", "*.h" },
--   command = "SymbolsOutline",
-- })
vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
	pattern = "Cargo.toml",
	callback = function()
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
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
