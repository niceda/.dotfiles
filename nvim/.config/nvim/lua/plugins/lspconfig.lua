return {
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
          { "<leader>r", "<cmd>RustRunnables<Cr>", desc = "Runnables (Rust)" },
          { "<leader>dr", false },
          { "<leader>cd", "<cmd>RustDebuggables<cr>", desc = "Run Debuggables (Rust)" },
          { "<leader>cp", "<cmd>RustParentModule<Cr>", desc = "Parent Module (Rust)" },
        },
      },
    },
  },
  -- init = function()
    -- local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable a keymap
    -- keys[#keys + 1] = { "K", false }
    -- change a keymap
    -- keys[#keys + 1] = { "K", "<cmd>lua vim.lsp.buf.hover()<cr>" }
    -- keys[#keys + 1] = { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>" }
    -- keys[#keys + 1] = { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>" }
    -- keys[#keys + 1] = { "gr", "<cmd>lua vim.lsp.buf.references()<cr>" }
    -- keys[#keys + 1] = { "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>" }
    -- keys[#keys + 1] = { "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>" }
  -- end,
}
