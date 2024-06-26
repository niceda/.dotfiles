-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- git
-- keymap("n", "<C-g>", function()
--   Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
-- end, { noremap = true, silent = true, desc = "Lazygit (cwd)" })
keymap("n", "<C-g>", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { noremap = true, silent = true, desc = "Lazygit (root dir)" })

-- lsp
keymap("n", "gl", function()
  local float = vim.diagnostic.config().float

  if float then
    local config = type(float) == "table" and float or {}
    config.scope = "line"

    vim.diagnostic.open_float(config)
  end
end, { noremap = true, silent = true, desc = "Show line diagnostics" })

vim.keymap.del("t", "<C-h>")
vim.keymap.del("t", "<C-j>")
vim.keymap.del("t", "<C-k>")
vim.keymap.del("t", "<C-l>")

-- Better paste and copy
-- remap "p" in visual mode to delete the highlighted text without overwriting your yanked/copied text, and then paste the content from the unnamed register.
keymap("v", "p", '"_dP', opts)
keymap("n", "Y", "y$", opts)

-- Copy whole file content to clipboard with C-c
keymap("n", "<C-c>", ":%y+<CR>", opts)

-- other
keymap("n", "<leader>r", ":call CompileRunGcc()<CR>", opts)
keymap("n", "<C-q>", ":call QuickFixToggle()<CR>", opts)
-- keymap("n", "<leader>L", "<cmd>Lazy<cr>", opts)

-- which-key
local wk = require("which-key")

-- copilot
wk.register({
  a = {
    name = "+A.I.", -- optional group name
    s = { "<cmd>Copilot suggestion<CR>", "Toggle Copilot Suggestion" }, -- create a binding with label
    r = { "<cmd>Copilot panel<CR>", "Toggle Copilot Panel" }, -- create a binding with label
    t = { "<cmd>Copilot toggle<CR>", "Toggle Copilot" }, -- create a binding with label
  },
}, { prefix = "<leader>" })
