lvim.leader = "space"
lvim.keys = {
	insert_mode = {
		["jk"] = false,
		["kj"] = false,
		["jj"] = false,
		["<A-j>"] = false,
		["<A-k>"] = false,
		["<A-Up>"] = false,
		["<A-Down>"] = false,
		["<A-Left>"] = false,
		["<A-Right>"] = false,
	},

	normal_mode = {
		["<S-l>"] = false,
		["<S-h>"] = false,
		["<A-j>"] = false,
		["<A-k>"] = false,
		["Y"] = "y$",
		["<leader>r"] = ":call CompileRunGcc()<CR>",
		["]d"] = "<cmd>lua vim.diagnostic.goto_next()<cr>",
		["[d"] = "<cmd>lua vim.diagnostic.goto_prev()<cr>",
		["<C-g>"] = "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>",
	},

	visual_mode = {
		-- ["p"] = '"_dP',
	},
}

local opts = { noremap = true, silent = true }
-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")
local keymap = vim.keymap.set
keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)

lvim.builtin.which_key.mappings[";"] = nil
lvim.builtin.which_key.mappings["c"] = nil
-- lvim.builtin.which_key.mappings["L"] = nil

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" }
-- lvim.builtin.which_key.mappings["q"] = { '<cmd>lua require("user.functions").smart_quit()<CR>', "Quit" }
lvim.builtin.which_key.mappings["h"] = nil
lvim.builtin.which_key.mappings["<CR>"] = { "<cmd>nohlsearch<CR>", "No Highlight" }
lvim.builtin.which_key.mappings["a"] = {
	name = "A.I.",
	-- c = { "<cmd>ChatGPT<cr>", "ChatGPT" },
	-- a = { "<cmd>ChatGPTActAs<cr>", "Act As GPT" },
	-- e = { "<cmd>ChatGPTEditWithInstructions<cr>", "Edit GPT" },
	-- r = { "<cmd>ChatRunCustomCodeAction<cr>", "Code Action GPT" },
	s = { "<cmd>Copilot suggestion<cr>", "Toggle Copilot Suggestion" },
	p = { "<cmd>Copilot panel<cr>", "Toggle Copilot Panel" },
	t = { "<cmd>Copilot toggle<cr>", "Toggle Copilot" },
}
lvim.builtin.which_key.mappings["l"].o = { "<cmd>SymbolsOutline<cr>", "Outline" }
lvim.builtin.which_key.mappings["g"].g = { "<cmd>Neogit<cr>", "Neogit" }
lvim.builtin.which_key.mappings["\\"] = { "ggVGp<cr>", "Replace the entire text" }

-- FIXME
-- local function show_documentation()
--     local filetype = vim.bo.filetype
--     if vim.tbl_contains({ 'vim','help' }, filetype) then
--         vim.cmd('h '..vim.fn.expand('<cword>'))
--     elseif vim.tbl_contains({ 'man' }, filetype) then
--         vim.cmd('Man '..vim.fn.expand('<cword>'))
--     elseif vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
--         require('crates').show_popup()
--     else
--         vim.lsp.buf.hover()
--     end
-- end

-- vim.keymap.set('n', 'K', show_documentation, { silent = true })
