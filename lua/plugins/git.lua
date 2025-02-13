return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },
  {
    "NeogitOrg/neogit",
    keys = {
      { "<leader>gg", "<cmd>:Neogit<cr>", desc = "Neogit" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    ---@param opts NeogitConfig
    opts = function(_, opts)
      ---@diagnostic disable-next-line: unused-local
      local neogit = require("neogit")

      opts.graph_style = "unicode"
      opts.git_services = {
        ["ittfs.avp.ru"] = "https://ittfs.avp.ru/tfs/DefaultCollection/${owner}/_git/${repo}/pullrequestcreate?sourceRef=${branch_name}&targetRef=${target}",
      }

      opts.integrations = {
        telescope = true,
        diffview = true,
      }

      opts.mappings = {
        finder = {
          ["<c-j>"] = "Next",
          ["<c-k>"] = "Previous",
        },
      }

      return opts
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = true,
  },
}
