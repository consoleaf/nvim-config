return {
  {
    "2kabhishek/co-author.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = { "CoAuthor" },
  },
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
      "folke/snacks.nvim",
    },
    ---@param opts NeogitConfig
    opts = function(_, opts)
      ---@diagnostic disable-next-line: unused-local
      local neogit = require("neogit")

      opts.graph_style = "unicode"
      opts.git_services = {
        ["ittfs.avp.ru"] = {
          tree = "https://ittfs.avp.ru/${owner}/${repo}/?version=GB${branch_name}&_a=contents",
          pull_request = "https://ittfs.avp.ru/${owner}/${repo}/pullrequestcreate?sourceRef=${branch_name}",
          commit = "https://ittfs.avp.ru/${owner}/${repo}/commit/${oid}",
        },
      }

      opts.integrations = {
        diffview = true,
        snacks = true,
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
