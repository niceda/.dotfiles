local Util = require("lazyvim.util")

return {
  {
    "Saecki/crates.nvim",
    keys = {
      -- { "<leader>cf", "<cmd>lua require('crates').show_features_popup()<cr>", desc = "Show features (Rust)" },
    },
  },
  {
    "neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["l"] = "open",
        },
      },
    },
  },
  {
    "nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      })
    end,
  },
  {
    "which-key.nvim",
    opts = {
      window = {
        border = "rounded",
      },
    },
  },
  {
    "telescope.nvim",
    opts = {
      defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
      },
    },
    keys = {
      { "<leader>/", Util.telescope("live_grep", { cwd = false }), desc = "Grep (root dir)" },
      { "<leader><space>", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>ff", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>fF", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fr", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
      { "<leader>sG", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader>sg", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader>sW", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
      { "<leader>sw", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
      { "<leader>sW", Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
      { "<leader>sw", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
    },
  },
}
