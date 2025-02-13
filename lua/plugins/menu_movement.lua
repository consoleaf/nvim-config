---@alias TelescopeMapping table | string

---@class TelescopeOptionsExtensions

---@alias TelescopeOptionsPickers table<string,table>

---@class TelescopeOptionsDefaults
---@field layout_strategy string
---@field layout_config table
---@field create_layout function
---@field mappings? table<string, table<string, function | TelescopeMapping | false>>
---@field vimgrep_arguments table<string>

---@class TelescopeOptions
---@field defaults TelescopeOptionsDefaults
---@field pickers TelescopeOptionsPickers
---@field extensions TelescopeOptionsExtensions

return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping["<C-j>"] = cmp.mapping.select_next_item()
      opts.mapping["<C-k>"] = cmp.mapping.select_prev_item()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    ---@param opts TelescopeOptions
    opts = function(_, opts)
      local actions = require("telescope.actions")
      local mappings = require("telescope.mappings")
      mappings.default_mappings.i["<C-j>"] = actions.move_selection_next
      mappings.default_mappings.i["<C-k>"] = actions.move_selection_previous
      -- opts.defaults.mappings.i["<C-j>"] = actions.move_selection_next
      -- opts.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
      return opts
    end,
  },
  {
    "saghen/blink.cmp",
    ---@module 'blink'
    ---@param opts blink.cmp.Config
    opts = function(_, opts)
      opts.keymap["<C-j>"] = { "select_next" }
      opts.keymap["<C-k>"] = { "select_prev" }
    end,
  },
}
