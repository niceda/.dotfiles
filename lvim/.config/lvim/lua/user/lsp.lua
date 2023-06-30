vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd", "rust_analyzer" })
lvim.lsp.installer.setup.automatic_installation = {
  exclude = { "clangd" },
}
