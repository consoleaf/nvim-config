return {
  -- {
  --   "nvimtools/none-ls.nvim",
  --   config = function(_, opts)
  --     local nls = require("null-ls")
  --     nls.builtins.formatting.prettier.with({
  --       lang = { "json" },
  --     })
  --     nls.setup(opts)
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
