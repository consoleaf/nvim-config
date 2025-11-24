local function make_binding(fn_name)
  return function()
    require("package-info")[fn_name]()
  end
end

return {
  {
    "vuki656/package-info.nvim",
    ft = "json",
    dependencies = "MunifTanjim/nui.nvim",
    opts = {
      autostart = true,
      package_manager = "yarn",
    },
    keys = {
      { "<leader>;", desc = "Package Info" },
      { "<leader>;s", make_binding("show"), desc = "Show package versions" },
      { "<leader>;h", make_binding("hide"), desc = "Hide package versions" },
      { "<leader>;t", make_binding("toggle"), desc = "Toggle package versions" },
      { "<leader>;u", make_binding("update"), desc = "Update package" },
      { "<leader>;d", make_binding("delete"), desc = "Delete package" },
      { "<leader>;a", make_binding("install"), desc = "Install package" },
      { "<leader>;c", make_binding("change"), desc = "Change version of package" },
      { "<leader>;;", "<cmd>Telescope package_info<CR>", desc = "Telescope package_info" },
    },
  },
}
