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
          require("snacks.util").lsp.on(function(buf, client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "vtsls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
