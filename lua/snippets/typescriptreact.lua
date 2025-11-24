local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local i = ls.insert_node
local t = ls.text_node
local events = require("luasnip.util.events")

local function ensure_import(what, from, test)
  local bufnr = vim.api.nvim_get_current_buf()

  -- schedule the check to run after LuaSnip updates the buffer
  vim.schedule(function()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for _, line in ipairs(lines) do
      if line:match(test) then
        return
      end
    end
    vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { ("import %s from %q;"):format(what, from), "" })
  end)
end

return {
  s("ulc", {
    -- f(function()
    --   ensure_import("{ useLocalization }", "@ngi/locale-react", "useLocalization")
    --   return ""
    -- end),
    f(function()
      return "const { l } = useLocalization"
    end),
    i(0, "()"),
  }, {
    -- runs once after snippet expansion
    callbacks = {
      [-1] = {
        [events.pre_expand] = function()
          ensure_import("{ useLocalization }", "@ngi/locale-react", "useLocalization")
        end,
      },
    },
  }),
  s("larl", {
    -- f(function()
    --   ensure_import("{ Link as RouterLink }", "react-router-dom", "RouterLink")
    --   return ""
    -- end),
    t('<Link as={RouterLink} to={"'),
    i(1, "path"),
    t('"}>'),
    i(0, "Link text"),
    t("</Link>"),
  }, {
    -- runs once after snippet expansion
    post_expand = function()
      ensure_import("{ Link as RouterLink }", "react-router-dom", "RouterLink")
    end,
  }),
}
