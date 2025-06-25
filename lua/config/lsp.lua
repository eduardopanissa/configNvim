local lspconfig = require("lspconfig")

lspconfig.pylsp.setup({
  on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }
    local keymap = vim.keymap.set

    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})
