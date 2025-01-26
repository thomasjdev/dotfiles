local capabilities = require("blink.cmp").get_lsp_capabilities()

-- LSP Server config
require("lspconfig").cssls.setup({
  capabilities = capabilities,
  settings = {
    css = {
      lint = {
        emptyRules = "ignore",
        duplicateProperties = "warning",
      },
    },
    scss = {
      lint = {
        idSelector = "warning",
        zeroUnits = "warning",
        duplicateProperties = "warning",
        emptyRules = nil,
      },
      completion = {
        completePropertyWithSemicolon = true,
        triggerPropertyValueCompletion = true,
      },
    },
  },
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
})
require("lspconfig").ts_ls.setup({
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
})

require("lspconfig").html.setup({
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
})

require("lspconfig").stylelint_lsp.setup({
  filetypes = { "css", "scss" },
  root_dir = require("lspconfig").util.root_pattern("package.json", ".git"),
  settings = {
    stylelintplus = {
      -- see available options in stylelint-lsp documentation
    },
  },
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
})

require("lspconfig").terraformls.setup({})
