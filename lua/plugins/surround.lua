---@class MiniSurroundOpts
---@field mappings table<string, string>
---@field search_method string
---@field custom_surroundings nil | table<string, MiniSurroundCustomSurround>
---@field highlight_duration number
---@field n_lines number
---@field respect_selection_type boolean
---@field silent boolean

---@class MiniSurroundCustomSurround
---@field input nil | function | table<'left' | 'right', string>
---@field output nil | function | table<'left' | 'right', string>

return {
  {
    "echasnovski/mini.surround",
    ---@param opts MiniSurroundOpts
    opts = function(_, opts)
      local ts_utils = require("nvim-treesitter.ts_utils")
      opts.custom_surroundings = {
        -- Use tree-sitter to search for function call
        s = {
          -- input = function()
          --   -- Use Treesitter to locate the cursor position within the string
          --   local node = ts_utils.get_node_at_cursor(0, true)
          --   if not node then
          --     return nil
          --   end
          --   local node_type = node:type()
          --   if node_type == "string" or node_type == "string_fragment" or node_type == "template_string" then
          --     return true
          --   end
          --   return nil
          -- end,
          output = function()
            return {
              left = "${",
              right = "}",
            }
            -- local node = ts_utils.get_node_at_cursor(0, true)
            -- if not node then
            --   return nil
            -- end
            -- local node_type = node:type()
            -- local is_jsy = vim.tbl_contains({
            --   "javascript",
            --   "javascriptreact",
            --   "typescript",
            --   "typescriptreact",
            -- }, vim.bo.filetype)
            --
            -- if is_jsy then
            --   local interpolation_surround = { left = "${", right = "}" }
            --   local bufnr = vim.api.nvim_get_current_buf()
            --   local start_row, start_col, end_row, end_col = vim.treesitter.get_node_range(node)
            --
            --   -- Function to replace quotes with backticks
            --   local function replace_quotes_with_backticks()
            --     local line = vim.api.nvim_buf_get_lines(bufnr, start_row, start_row + 1, false)[1]
            --     local new_line = line:sub(1, start_col)
            --       .. "`"
            --       .. line:sub(start_col + 2, end_col)
            --       .. "`"
            --       .. line:sub(end_col + 1)
            --     vim.api.nvim_buf_set_lines(bufnr, start_row, start_row + 1, false, { new_line })
            --   end
            --
            --   -- Apply transformation based on node type
            --   if node_type == "string" or node_type == "string_fragment" then
            --     replace_quotes_with_backticks()
            --     return interpolation_surround
            --   elseif node_type == "template_string" then
            --     return interpolation_surround
            --   else
            --     local lines = vim.api.nvim_buf_get_lines(bufnr, start_row, end_row + 1, false)
            --     lines[1] = lines[1]:sub(1, start_col) .. "`${" .. lines[1]:sub(start_col + 1)
            --     lines[#lines] = lines[#lines]:sub(1, end_col) .. "}`" .. lines[#lines]:sub(end_col + 1)
            --     vim.api.nvim_buf_set_lines(bufnr, start_row, end_row + 1, false, lines)
            --     return nil
            --   end
            -- end
          end,
        },
      }
    end,
  },
  -- {
  --   "kylechui/nvim-surround",
  --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   dependencies = { "folke/flash.nvim" },
  --   config = function()
  --     local nvim_surround = require("nvim-surround")
  --     nvim_surround.setup({
  --       surrounds = {
  --         ["s"] = {
  --           add = function()
  --             local ts_utils = require("nvim-treesitter.ts_utils")
  --             local cur = ts_utils.get_node_at_cursor(0, true)
  --             local language = vim.bo.filetype
  --             local is_jsy = (
  --               language == "javascript"
  --               or language == "javascriptreact"
  --               or language == "typescript"
  --               or language == "typescriptreact"
  --             )
  --
  --             if is_jsy then
  --               local cur_type = cur:type()
  --               local interpolation_surround = { { "${" }, { "}" } }
  --               if cur and (cur_type == "string" or cur_type == "string_fragment") then
  --                 vim.cmd.normal("csq`")
  --                 return interpolation_surround
  --               elseif cur and cur_type == "template_string" then
  --                 return interpolation_surround
  --               else
  --                 return { { "`${" }, { "}`" } }
  --               end
  --             end
  --           end,
  --         },
  --         ["F"] = {
  --           add = function()
  --             local func_name = vim.fn.input("Enter the function name: ")
  --             if #func_name > 0 then
  --               return { { "local " .. func_name .. " = function() " }, { " end" } }
  --             end
  --             return { { "function() " }, { " end" } }
  --           end,
  --           find = "local [%w_]+ = function%b().-end",
  --           delete = "^(local [%w_]+ = function%b())().-(end)()$",
  --           change = {
  --             target = "^local ([%w_]+)() = function%b().-()()$",
  --             replacement = function()
  --               return { { vim.fn.input("Enter the function name: ") }, { "" } }
  --             end,
  --           },
  --         },
  --       },
  --     })
  --   end,
  --   keys = {
  --     { "s", "<Plug>(nvim-surround-visual)", mode = { "x" }, desc = "surround visual" },
  --     { "S", "<Plug>(nvim-surround-visual-line)", mode = { "x" }, desc = "surround visual" },
  --   },
  -- },
}
