return {
  {
    "haringsrob/nvim_context_vt",
    event = "BufRead",
    opts = {
      prefix = "",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem.filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true, -- You can set this to false if you want to see gitignored files as well
        hide_hidden = false, -- You might want to set this to false to see hidden files (files starting with .)
      }
    end,
  },
}
