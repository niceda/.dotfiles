if vim.g.vscode then
  vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
  vim.keymap.set("n", "gr", [[<cmd>lua require('vscode').action('editor.action.referenceSearch.trigger')<cr>]])
  vim.keymap.set("n", "gI", [[<cmd>lua require('vscode').action('editor.action.goToImplementation')<cr>]])
  vim.keymap.set("n", "gy", [[<cmd>lua require('vscode').action('editor.action.goToTypeDefinition')<cr>]])
end

require("config.commands")
require("config.lazy")
