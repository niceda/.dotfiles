if vim.g.vscode then
  vim.keymap.set({ "i", "n" }, "<esc><esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
  vim.keymap.set("n", "gr", [[<cmd>lua require('vscode').action('editor.action.referenceSearch.trigger')<cr>]])
end

require("config.commands")
require("config.lazy")
