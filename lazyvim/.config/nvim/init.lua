if vim.g.vscode then
  vim.keymap.set({ "i", "n" }, "<esc><esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
end

require("config.commands")
require("config.lazy")
