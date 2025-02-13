return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "graphql",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    -- opts = {
    -- servers = {
    -- graphql = {
    --   filetypes = { "graphql", "gql" },
    -- },
    --   },
    -- },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "graphql-language-service-cli",
      },
    },
  },
}
