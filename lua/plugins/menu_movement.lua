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
      opts.defaults.mappings.i["<C-j>"] = actions.move_selection_next
      opts.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
      return opts
    end,
  },
}
