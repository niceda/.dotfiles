return {
  {
    "lvimuser/lsp-inlayhints.nvim",
    ft = { "python", "go", "json" },
    opts = {
      debug_mode = true,
    },
    config = function(_, options)
      vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = "LspAttach_inlayhints",
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })
      require("lsp-inlayhints").setup(options)
      -- define key map for toggle inlay hints: require('lsp-inlayhints').toggle()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>uh",
        "<cmd>lua require('lsp-inlayhints').toggle()<CR>",
        { noremap = true, silent = true, desc = "Toggle Inlay Hints" }
      )
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          keys = {
            { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
        },
        rust_analyzer = {
          keys = {
            --   { "<leader>dr", false },
            --
            --   { "<leader>r", "<cmd>RustRunnables<Cr>", desc = "Runnables (Rust)" },
            --   { "<leader>ca", "<cmd>lua require('crates').update_all_crates()<cr>", desc = "Update all crates" },
            --   { "<leader>cA", "<cmd>lua require('crates').upgrade_all_crates()<cr>", desc = "Upgrade all crates" },
            --   { "<leader>cc", "<cmd>RustOpenCargo<Cr>", desc = "Open Cargo" },
            --   { "<leader>cd", "<cmd>RustDebuggables<Cr>", desc = "Debuggables" },
            --   { "<leader>cD", "<cmd>RustOpenExternalDocs<Cr>", desc = "Open Docs" },
            --   { "<leader>cf", "<cmd>lua require('crates').show_features_popup()<cr>", desc = "Show features" },
            --   { "<leader>cm", "<cmd>RustExpandMacro<Cr>", desc = "Expand Macro" },
            --   { "<leader>co", "<cmd>RustOpenExternalDocs<Cr>", desc = "Open External Docs" },
            --   { "<leader>cp", "<cmd>RustParentModule<Cr>", desc = "Parent Module" },
            --   { "<leader>cr", "<cmd>lua require('crates').reload()<cr>", desc = "Reload" },
            --   {
            --     "<leader>cR",
            --     "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
            --     desc = "Reload Workspace",
            --   },
            --   { "<leader>cs", "<cmd>lua require('crates').show_popup()<cr>", desc = "Show Popup" },
            --   { "<leader>ct", "<cmd>lua _CARGO_TEST()<cr>", desc = "Cargo Test" },
            --   { "<leader>cu", "<cmd>lua require('crates').update_crate()<cr>", desc = "Update crate" },
            --   { "<leader>cU", "<cmd>lua require('crates').upgrade_crate()<cr>", desc = "Upgrade crate" },
            --   { "<leader>cv", "<cmd>lua require('crates').show_versions_popup()<cr>", desc = "Show versions" },
            --   { "<leader>cV", "<cmd>RustViewCrateGraph<Cr>", desc = "View Crate Graph" },
            { "<leader>ca", "<cmd>lua require('crates').update_all_crates()<cr>", desc = "Update all crates" },
            { "<leader>cA", "<cmd>lua require('crates').upgrade_all_crates()<cr>", desc = "Upgrade all crates" },
            { "<leader>cf", "<cmd>lua require('crates').show_features_popup()<cr>", desc = "Show features" },
            { "<leader>cr", "<cmd>lua require('crates').reload()<cr>", desc = "Reload" },
            { "<leader>cs", "<cmd>lua require('crates').show_popup()<cr>", desc = "Show Popup" },
            { "<leader>cu", "<cmd>lua require('crates').update_crate()<cr>", desc = "Update crate" },
            { "<leader>cU", "<cmd>lua require('crates').upgrade_crate()<cr>", desc = "Upgrade crate" },
            { "<leader>cv", "<cmd>lua require('crates').show_versions_popup()<cr>", desc = "Show versions" },
          },
        },
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "gd", false }
      keys[#keys + 1] = { "gD", false }
      keys[#keys + 1] = { "gr", false }
      keys[#keys + 1] = { "gI", false }
      -- keys[#keys + 1] = { "<c-k>", false }
      keys[#keys + 1] = { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition" }
      keys[#keys + 1] = { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto Declaration" }
      keys[#keys + 1] = { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", "Goto references" }
      keys[#keys + 1] = { "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto Implementation" }
      -- keys[#keys + 1] = {"gS", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "show signature help" }

      keys[#keys + 1] = { "<leader>cl", false }
      keys[#keys + 1] = { "<leader>ca", false }
      keys[#keys + 1] = { "<leader>cc", false }
      keys[#keys + 1] = { "<leader>cC", false }
      keys[#keys + 1] = { "<leader>cA", false }
      keys[#keys + 1] = { "<leader>cr", false }
      keys[#keys + 1] = { "<leader>ll", "<cmd>LspInfo<cr>", desc = "Lsp Info" }
      keys[#keys + 1] =
        { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
      keys[#keys + 1] =
        { "<leader>lc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" }, has = "codeLens" }
      keys[#keys + 1] = {
        "<leader>lC",
        vim.lsp.codelens.refresh,
        desc = "Refresh & Display Codelens",
        mode = { "n" },
        has = "codeLens",
      }
      keys[#keys + 1] = {
        "<leader>lA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        desc = "Source Action",
        has = "codeAction",
      }
      if require("lazyvim.util").has("inc-rename.nvim") then
        keys[#keys + 1] = {
          "<leader>lr",
          function()
            local inc_rename = require("inc_rename")
            return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
          end,
          expr = true,
          desc = "Rename",
          has = "rename",
        }
      else
        keys[#keys + 1] = { "<leader>lr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
      end
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
          vim.keymap.set("n", "<leader>ct", function()
            vim.cmd.RustLsp("testables")
          end, { desc = "Cargo Test", buffer = bufnr })
          vim.keymap.set("n", "<leader>cc", function()
            vim.cmd.RustLsp("openCargo")
          end, { desc = "Open Cargo", buffer = bufnr })
          vim.keymap.set("n", "<leader>cp", function()
            vim.cmd.RustLsp("parentModule")
          end, { desc = "Parent Module", buffer = bufnr })
          vim.keymap.set("n", "<leader>cd", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust debuggables", buffer = bufnr })
          vim.keymap.set("n", "<leader>cm", function()
            vim.cmd.RustLsp("expandMacro")
          end, { desc = "Expand Macro", buffer = bufnr })
          vim.keymap.set("n", "<leader>cV", function()
            vim.cmd.RustLsp({ "crateGraph", "[backend]", "[output]" })
          end, { desc = "View Crate Graph", buffer = bufnr })
          -- vim.keymap.set("n", "<leader>ca", function() require("crates").update_all_crates() end, { desc = "Update all crates", buffer = bufnr })
          -- vim.keymap.set("n", "<leader>cA", function() require("crates").upgrade_all_crates() end, { desc = "Upgrade all crates", buffer = bufnr })
          -- vim.keymap.set("n", "<leader>cf", function() require("crates").show_features_popup() end, { desc = "Show features", buffer = bufnr })
          -- vim.keymap.set("n", "<leader>cr", function() require("crates").reload() end, { desc = "Reload", buffer = bufnr })
          -- vim.keymap.set("n", "<leader>cs", function() require("crates").show_popup() end, { desc = "Show Popup", buffer = bufnr })
          -- vim.keymap.set("n", "<leader>cu", function() require("crates").update_crate() end, { desc = "Update crate", buffer = bufnr })
          -- vim.keymap.set("n", "<leader>cU", function() require("crates").upgrade_crate() end, { desc = "Upgrade crate", buffer = bufnr })
          -- vim.keymap.set("n", "<leader>cv", function() require("crates").show_versions_popup() end, { desc = "Show versions", buffer = bufnr })
        end,
      },
    },
  },
  {
    "Saecki/crates.nvim",
    keys = {
      { "<leader>ca", "<cmd>lua require('crates').update_all_crates()<cr>", desc = "Update all crates" },
      { "<leader>cA", "<cmd>lua require('crates').upgrade_all_crates()<cr>", desc = "Upgrade all crates" },
      { "<leader>cf", "<cmd>lua require('crates').show_features_popup()<cr>", desc = "Show features" },
      { "<leader>cr", "<cmd>lua require('crates').reload()<cr>", desc = "Reload" },
      { "<leader>cs", "<cmd>lua require('crates').show_popup()<cr>", desc = "Show Popup" },
      { "<leader>cu", "<cmd>lua require('crates').update_crate()<cr>", desc = "Update crate" },
      { "<leader>cU", "<cmd>lua require('crates').upgrade_crate()<cr>", desc = "Upgrade crate" },
      { "<leader>cv", "<cmd>lua require('crates').show_versions_popup()<cr>", desc = "Show versions" },
    },
  },
}
