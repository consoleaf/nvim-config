return {
  -- {
  --   "mini.animate",
  --   opts = {
  --     cursor = {
  --       enable = false,
  --     },
  --     scroll = {
  --       enable = false,
  --     },
  --   },
  -- },
  {
    "mini.surround",
    opts = {
      n_lines = 100,
    },
  },
  {
    "nvim-mini/mini.splitjoin",
    version = "*",
    opts = { mappings = { toggle = "gS" } },
  },
  {
    "nvim-mini/mini.map",
    version = "*",
    event = "BufRead",
    keys = {
      {
        "<leader>mc",
        function()
          require("mini.map").close()
        end,
        desc = "Minimap close",
      },
      {
        "<leader>mf",
        function()
          require("mini.map").toggle_focus()
        end,
        desc = "Minimap toggle focus",
      },
      {
        "<leader>mo",
        function()
          require("mini.map").open()
        end,
        desc = "Minimap open",
      },
      {
        "<leader>mr",
        function()
          require("mini.map").refresh()
        end,
        desc = "Minimap refresh",
      },
      {
        "<leader>ms",
        function()
          require("mini.map").toggle_side()
        end,
        desc = "Minimap toggle side",
      },
      {
        "<leader>mm",
        function()
          require("mini.map").toggle()
        end,
        desc = "Minimap toggle",
      },
    },
  },
}
