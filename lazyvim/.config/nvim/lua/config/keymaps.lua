-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local Util = require("lazyvim.util")
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- git
keymap("n", "<C-g>", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })

keymap("n", "<leader>gf", function()
  local git_path = vim.api.nvim_buf_get_name(0)
  LazyVim.lazygit({ cwd = LazyVim.root.git(), args = { "-f", vim.trim(git_path) } })
end, { desc = "Lazygit Current File History" })

-- keymap("n", "<leader>ge", function()
--   require("neo-tree.command").execute({
--     source = "git_status",
--     toggle = true,
--     dir = vim.uv.cwd(), -- FIXME:
--   })
-- end, { desc = "Git Explorer" })

keymap("n", "<leader>gn", function()
  require("neogit").open({ cwd = LazyVim.root.git() })
end, { desc = "Open Neogit Commit Page" })

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
-- copilot
local wk = require("which-key")
wk.add({
  {
    mode = { "n", "v" },
    { "<leader>as", "<cmd>Copilot suggestion<CR>", desc = "Toggle Copilot Suggestion" },
    { "<leader>ar", "<cmd>Copilot panel<CR>", desc = "Toggle Copilot Panel" },
    { "<leader>at", "<cmd>Copilot toggle<CR>", desc = "Toggle Copilot" },
  }
})
