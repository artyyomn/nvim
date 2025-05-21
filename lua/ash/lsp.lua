local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        spacing = 4,
      },
      signs = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded", 
        source = "always",
      },
    })

    -- Show diagnostic popup on hover
    vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]

    -- Keybindings for navigating diagnostics
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end,
})

