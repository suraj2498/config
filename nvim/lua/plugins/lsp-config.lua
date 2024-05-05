-- :LspInfo gives you info about the current lsp connection to the current buffer
-- :h vim.lsp.buf give you the available actions for the lsp
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "gopls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>g", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, {})
    end,
  },
}
