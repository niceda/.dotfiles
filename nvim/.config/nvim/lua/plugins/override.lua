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
      { "<leader>/", false },
      { "<leader>t", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader><space>", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>ff", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>fF", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>fr", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>sg", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader>sG", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader>sw", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
      { "<leader>sW", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
      { "<leader>sw", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
      { "<leader>sW", Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
    },
  },
  -- comment
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
      config = {
        -- Languages that have a single comment style
        cpp = "// %s",
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
  },
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.completion = {
        -- completeopt = "menu,menuone,noinsert",
        completeopt = "menu,menuone,noselect",
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (root dir)", remap = true },
    },
  },
  {
    "williamboman/mason.nvim",
    keys = {
      { "<leader>cm", false },
      { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },
  {
    "stevearc/conform.nvim",
    keys = {
      { "<leader>cF", false },
      {
        "<leader>lF",
        function()
          require("conform").format({ formatters = { "injected" } })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    keys = {
      { "<leader>cv", false },
      { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
  },
  -- {
  --   "echasnovski/mini.bufremove",
  --   keys = {
  --     {
  --       "<leader>c",
  --       function()
  --         local bd = require("mini.bufremove").delete
  --         if vim.bo.modified then
  --           local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
  --           if choice == 1 then -- Yes
  --             vim.cmd.write()
  --             bd(0)
  --           elseif choice == 2 then -- No
  --             bd(0, true)
  --           end
  --         else
  --           bd(0)
  --         end
  --       end,
  --       desc = "Delete Buffer",
  --     },
  --   },
  -- },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   opts = {
  --     panel = {
  --       enabled = true,
  --       auto_refresh = false,
  --       keymap = {
  --         jump_prev = "[[",
  --         jump_next = "]]",
  --         accept = "<CR>",
  --         refresh = "gr",
  --         open = "<M-CR>",
  --       },
  --       layout = {
  --         position = "bottom", -- | top | left | right
  --         ratio = 0.4,
  --       },
  --     },
  --     -- suggestion = {
  --     --   enabled = true,
  --     --   auto_trigger = true,
  --     --   debounce = 75,
  --     --   keymap = {
  --     --     accept = "<c-l>",
  --     --     accept_word = false,
  --     --     accept_line = false,
  --     --     next = "<c-j>",
  --     --     prev = "<c-k>",
  --     --     dismiss = "<C-]>",
  --     --   },
  --     -- },
  --   },
  -- },
  {
    "simrat39/symbols-outline.nvim",
    keys = {
      { "<leader>cs", false },
      { "<leader>ls", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
    },
  },
}
