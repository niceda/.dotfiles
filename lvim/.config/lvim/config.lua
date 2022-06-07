-- general
lvim.format_on_save = false
lvim.colorscheme = "onedarker"
lvim.log.level = "warn"

-- builtin
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.lsp.diagnostics.virtual_text = false
require("luasnip/loaders/from_vscode").load({ paths = { "~/.config/lvim/snippets" } })

require("user.plugins")
require("user.keymappings")
require("user.commands")
require("user.autocommands")
require("user.settings")
