local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'clangd',
  'lua_ls',
})

-- fix Undefined global variable vim
lsp.nvim_workspace()

lsp.setup()
