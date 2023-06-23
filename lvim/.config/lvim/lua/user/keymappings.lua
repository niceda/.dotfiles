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
-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
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
