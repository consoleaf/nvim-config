-- get from env
local token = os.getenv("LLMSERVICE_TOKEN")
local url = "https://llmservice.localhost"

return {
  {
    "huggingface/llm.nvim",
    opts = {
      api_token = token,
      backend = "openai",
      model = "deepseek-coder-6.7b-base",
      url = url,
      request_body = {
        parameters = {
          temperature = 0,
          max_new_tokens = 512,
        },
      },
      tls_skip_verify_insecure = true,
      accept_keymap = "<C-;>",
      dismiss_keymap = nil,
      debounce_ms = 300,
      context_window = 2048,
      fim = {
        enabled = false,
        prefix = "<fim_prefix>",
        middle = "<fim_middle>",
        suffix = "<fim_suffix>",
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
    },
    init = function()
      require("lib.codecompanion.fidget-spinner"):init()
    end,
    opts = {
      display = {
        inline = {
          layout = "buffer",
        },
        diff = {
          provider = "mini_diff",
        },
      },
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = "openai_compatible",
        },
        inline = {
          adapter = "concise_chat",
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "gr" },
              description = "Reject the suggested change",
            },
          },
        },
      },
      opts = {
        -- Set debug logging
        log_level = "DEBUG",
      },
      adapters = {
        openai_compatible = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = url,
              api_key = token,
            },
          })
        end,
        concise_chat = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            schema = {
              model = {
                default = "qwen2.5-coder-32B-instruct",
              },
            },
            env = {
              url = url,
              api_key = token,
            },
          })
        end,
      },
      prompt_library = {
        ["Generate a Commit Message"] = {
          description = "Generate a commit message",
          opts = {
            index = 10,
            is_default = true,
            is_slash_cmd = true,
            short_name = "commit",
            auto_submit = true,
            adapter = {
              name = "concise_chat",
            },
          },
          prompts = {
            {
              role = "user",
              content = function()
                return string.format(
                  [[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:

```diff
%s
```
]],
                  vim.fn.system("git diff --no-ext-diff --staged")
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
      },
    },
  },
}
