---@class ProjectOptions
---@field manual_mode boolean
---@field detection_methods ("lsp" | "pattern")[]
---@field patterns string[]
---@field ignore_lsp string[]
---@field exclude_dirs string[]
---@field show_hidden boolean
---@field silent_chdir boolean
---@field scope_chdir "global" | "tab" | "win"
---@field datapath string

return {
  {
    "ahmedkhalf/project.nvim",
    ---@param opts ProjectOptions
    opts = function(_, opts)
      opts.manual_mode = true
      opts.detection_methods = { "pattern" }
      opts.silent_chdir = false
      opts.patterns = {
        ".git",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",
      }
      return opts
    end,
  },
}
