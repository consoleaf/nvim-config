local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  {
    "folke/noice.nvim",
    opts = function(opts)
      if opts.routes == nil then
        opts.routes = {}
      end
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "inlayHint failed with message",
        },
        opts = { skip = true },
      })
      return opts
    end,
  },
  { "kosayoda/nvim-lightbulb" },
  { "chrisgrieser/nvim-rulebook" },
  {
    "felpafel/inlay-hint.nvim",
    enabled = false,
    dev = true,
    dir = "~/projects/third-party/inlay-hint.nvim",
    event = "LspAttach",
    config = function()
      require("inlay-hint").setup({
        virt_text_pos = "inline",
        display_callback = function(line_hints, options, bufnr)
          -- if options.virt_text_pos == "inline" then

          local lhint = {}
          local rhints = {}
          for _, hint in pairs(line_hints) do
            local text = ""
            local label = hint.label
            if type(label) == "string" then
              text = label
            else
              for _, part in ipairs(label) do
                text = text .. part.value
              end
            end
            if hint.kind == 1 or hint.kind == nil then
              if string.find(text, "[<>]") then
                text = text:gsub("^:%s*", "")
              else
                if hint.paddingLeft then
                  text = " " .. text
                end
                if hint.paddingRight then
                  text = text .. " "
                end
              end
            else
              text = text:gsub(":$", "")
            end
            if hint.kind == 2 then
              text = "󰏪 " .. text .. ": "
            end
            if (hint.kind == 1 or hint.kind == nil) and string.find(text, "[<>]") then
              rhints[#rhints + 1] = text
            else
              lhint[#lhint + 1] = { text = text, col = hint.position.character }
            end
          end

          if #rhints > 0 then
            lhint[#lhint + 1] = { text = table.concat(rhints, ","), col = 0, virt_text_pos = "eol" }
          end

          return lhint
        end,
      })
    end,
  },
  -- {
  --   "OlegGulevskyy/better-ts-errors.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim" },
  --   config = {
  --     keymaps = {
  --       toggle = "<leader>dd", -- default '<leader>dd'
  --       go_to_definition = "<leader>dx", -- default '<leader>dx'
  --     },
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        virtual_lines = true,
      },
      servers = {
        cssls = {
          capabilities = capabilities,
        },
        vtsls = {
          on_attach = function(client, buffer)
            require("twoslash-queries").attach(client, buffer)
          end,
          -- settings = {
          --   complete_function_calls = false,
          --   vtsls = { autoUseWorkspaceTsdk = true },
          --   typescript = {
          --     suggest = {
          --       completeFunctionCalls = false,
          --     },
          --   },
          --   javascript = {
          --     suggest = {
          --       completeFunctionCalls = false,
          --     },
          --   },
          -- },
          -- root_dir = function()
          --   local lazyvimRoot = require("lazyvim.util.root")
          --   return lazyvimRoot.git()
          -- end,
        },
        cssmodules_ls = {
          init_options = {
            camelCase = false,
          },
        },
        css_variables = {
          root_markers = { ".git", "yarn.lock" },
          settings = {
            cssVariables = {
              lookupFiles = {
                "**/*.less",
                "**/*.scss",
                "**/*.sass",
                "**/*.css",
                "node_modules/@ngi/theme/src/theme.css",
              },
            },
          },
        },
      },
    },
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    ---@param opts OptsVirtualLines
    opts = function(_, opts)
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = true,
      })
      return opts
    end,
  },
  {
    "marilari88/twoslash-queries.nvim",
    opts = {
      multi_line = true,
      highlight = "Type",
    },
    keys = {
      { "gCi", "<cmd>TwoslashQueriesInspect<CR>", desc = "Twoslash inspect" },
      { "<leader>^", "<cmd>TwoslashQueriesInspect<CR>", desc = "Twoslash inspect" },
      { "gCr", "<cmd>TwoslashQueriesRemove<CR>", desc = "Twoslash remove" },
    },
  },
  {
    "mhanberg/output-panel.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("output_panel").setup({
        max_buffer_size = 5000, -- default
      })
    end,
    cmd = { "OutputPanel" },
    keys = {
      {
        "<leader>o",
        vim.cmd.OutputPanel,
        mode = "n",
        desc = "Toggle the output panel",
      },
    },
  },
}
