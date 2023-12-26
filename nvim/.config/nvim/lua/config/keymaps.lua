-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- git
keymap("n", "<leader>gg", function()
  Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, {noremap = true, silent = true, desc = "Lazygit (cwd)" })
keymap("n", "<C-g>", function()
  Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, {noremap = true, silent = true, desc = "Lazygit (cwd)" })
keymap("n", "<leader>gG", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, {noremap = true, silent = true, desc = "Lazygit (root dir)" })

keymap("n", "gl", function()
  local float = vim.diagnostic.config().float

  if float then
    local config = type(float) == "table" and float or {}
    config.scope = "line"

    vim.diagnostic.open_float(config)
  end
end, { noremap = true, silent = true, desc = "Show line diagnostics" })

keymap("n", "<leader>r", ":call CompileRunGcc()<CR>", opts)
keymap("n", "Y", "y$", opts)
