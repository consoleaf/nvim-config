return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        virtual_lines = true,
      },
      servers = {
        vtsls = {
          on_attach = function(client, buffer)
            require("twoslash-queries").attach(client, buffer)
          end,
        },
      },
    },
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    ---@param opts OptsVirtualLines
    opts = function(_, opts)
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = true,
      })
      return opts
    end,
  },
  {
    "marilari88/twoslash-queries.nvim",
    opts = {
      multi_line = true,
      highlight = "Type",
    },
    keys = {
      { "gCi", "<cmd>TwoslashQueriesInspect<CR>", desc = "Twoslash inspect" },
      { "gCr", "<cmd>TwoslashQueriesRemove<CR>", desc = "Twoslash remove" },
    },
  },
}
