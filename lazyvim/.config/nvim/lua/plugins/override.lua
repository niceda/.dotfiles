return {
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = {
  --     sources = { "filesystem", "buffers", "git_status" },
  --     open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
  --     filesystem = {
  --       filtered_items = {
  --         visible = false, -- when true, they will just be displayed differently than normal items
  --         hide_dotfiles = true,
  --         hide_gitignored = false,
  --         hide_hidden = true, -- only works on Windows for hidden files/directories
  --         hide_by_name = {
  --           --"node_modules"
  --         },
  --         hide_by_pattern = { -- uses glob style patterns
  --           --"*.meta",
  --           --"*/src/*/tsconfig.json",
  --         },
  --         always_show = { -- remains visible even if other settings would normally hide it
  --           --".gitignored",
  --         },
  --         always_show_by_pattern = { -- uses glob style patterns
  --           --".env*",
  --         },
  --         never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
  --           --".DS_Store",
  --           --"thumbs.db"
  --         },
  --         never_show_by_pattern = { -- uses glob style patterns
  --           --".null-ls_*",
  --         },
  --       },
  --       bind_to_cwd = false,
  --       follow_current_file = { enabled = false },
  --       use_libuv_file_watcher = true,
  --     },
  --     window = {
  --       mappings = {
  --         ["l"] = "open",
  --         ["h"] = "close_node",
  --         ["<space>"] = "none",
  --         ["Y"] = {
  --           function(state)
  --             local node = state.tree:get_node()
  --             local path = node:get_id()
  --             vim.fn.setreg("+", path, "c")
  --           end,
  --           desc = "Copy Path to Clipboard",
  --         },
  --         ["O"] = {
  --           function(state)
  --             require("lazy.util").open(state.tree:get_node().path, { system = true })
  --           end,
  --           desc = "Open with System Application",
  --         },
  --         ["P"] = { "toggle_preview", config = { use_float = false } },
  --       },
  --     },
  --     default_component_configs = {
  --       indent = {
  --         with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
  --         expander_collapsed = "",
  --         expander_expanded = "",
  --         expander_highlight = "NeoTreeExpander",
  --       },
  --       git_status = {
  --         symbols = {
  --           unstaged = "󰄱",
  --           staged = "󰱒",
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>r", function()
            vim.cmd.RustLsp("runnables")
          end, { desc = "Runnables (Rust)", buffer = bufnr })
        end,
      },
    },
  },
}
