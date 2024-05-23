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

-- comment
-- wk.register({
--   ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
-- }, { prefix = "<leader>" })
-- wk.register({
--   ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
-- }, { prefix = "<leader>", mode = "v" })
