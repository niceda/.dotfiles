if vim.g.vscode then
  return {
    { "mini.animate", enabled = false },
    { "dashboard-nvim", enabled = false },
  }
end

return {
  { "dashboard-nvim", enabled = false },
}
