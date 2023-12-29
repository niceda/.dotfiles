return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  { "LunarVim/lunar.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lunar",
    },
  }
}
