-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = false

LazyVim.terminal.setup("zsh")

-- Set to false to disable auto format
vim.g.lazyvim_eslint_auto_format = true

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "IosevkaTerm Nerd Font Mono:h14"
end

opt.clipboard = "unnamedplus" -- Sync with system clipboard

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { { ".git", "lua" }, "cwd" }
