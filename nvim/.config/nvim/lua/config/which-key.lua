local wk = require("which-key")

wk.register({
  a = {
    name = "+A.I.", -- optional group name
    s = { "<cmd>Copilot suggestion<CR>", "Toggle Copilot Suggestion" }, -- create a binding with label
    r = { "<cmd>Copilot panel<CR>", "Toggle Copilot Panel" }, -- create a binding with label
    t = { "<cmd>Copilot toggle<CR>", "Toggle Copilot" }, -- create a binding with label
  },
}, { prefix = "<leader>" })
