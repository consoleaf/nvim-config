return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "thenbe/neotest-playwright",
      dependencies = "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-playwright").adapter({
            options = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
            },
          }),
        },
      })
    end,
  },
  {
    "consoleaf/nvim-coverage",
    version = "*",
    config = function()
      require("coverage").setup({
        auto_reload = true,
      })

      -- automatically load the coverage signs when opening a file
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = { "*.ts" }, -- any file extension you're interested in
        callback = function()
          -- place (show) the signs immediately after loading
          require("coverage").load(true)
        end,
      })
    end,
  },
}
