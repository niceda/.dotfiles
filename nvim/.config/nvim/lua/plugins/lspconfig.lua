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
}
