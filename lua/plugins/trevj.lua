return {
  {
    "AckslD/nvim-trevJ.lua",
    event = "BufRead",
    keys = {
      {
        "<leader>j",
        function()
          require("trevj").format_at_cursor()
        end,
        desc = "TrevJ",
      },
    },
  },
}
