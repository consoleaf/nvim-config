return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        virtual_lines = true,
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
}
