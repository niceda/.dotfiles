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
	},

	visual_mode = {
		-- ["p"] = '"_dP',
	},
}

local opts = { noremap = true, silent = true }
-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")
local keymap = vim.keymap.set
keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
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
