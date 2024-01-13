return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  { "LunarVim/lunar.nvim" },

  { url = "git@github.com:LunarVim/primer.nvim.git" },
  { url = "git@github.com:ChristianChiarulli/onedark.nvim.git" },
  { "Mofiqul/vscode.nvim" },
  -- {
  --   "catppuccin/nvim",
  -- name = "catppuccin",
  -- opts = {
  --   flavour = "mocha",
  --   term_colors = true,
  --   color_overrides = {
  --     mocha = {
  --       base = "#000000",
  --       mantle = "#000000",
  --       crust = "#000000",
  --     },
  --   },
  -- },
  -- },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
