return {
  { "AndreM222/copilot-lualine" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_next = "<M-j>",
            jump_prev = "<M-k>",
            accept = "<M-CR>",
            refresh = "<M-r>",
            open = "<M-o>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 150,
          keymap = {
            accept = "<M-CR>",
            accept_word = "<M-w>",
            accept_line = "<M-l>",
            next = "<M-j>",
            prev = "<M-k>",
            dismiss = "<M-d>",
          },
        },
        filetypes = {
          javascript = true, -- allow specific filetype
          typescript = true, -- allow specific filetype
          typescriptreact = true, -- allow specific filetype
          python = true,
          gitcommit = true,
          markdown = true,
          ["."] = false,           -- disable for all other filetypes and ignore default `filetypes`
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
        copilot_no_tab_map = true,
      })
    end,
    keys = {
      { "<leader>cp", "<Cmd>Copilot panel<cr>",     desc = "Copilot panel" },
      { "<M><cr>",    "<Plug>(copilot-accept)" },
      { "<M>w",       "<Plug>(copilot-accept-word)" },
      { "<M>l",       "<Plug>(copilot-accept-line)" },
      { "<M>s",       "<Plug>(copilot-suggest)" },
      { "<M>d",       "<Plug>(copilot-dismiss)" },
      { "<M>j",       "<Plug>(copilot-next)" },
      { "<M>k",       "<Plug>(copilot-previous)" },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = function()
      local prompts = require("CopilotChat.prompts")
      local select = require("CopilotChat.select")

      return {
        debug = false, -- Enable debug logging
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections

        system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
        model = "gpt-4", -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
        temperature = 0.1, -- GPT temperature

        question_header = "## User ", -- Header to use for user questions
        answer_header = "## Copilot ", -- Header to use for AI answers
        error_header = "## Error ", -- Header to use for errors
        separator = "───", -- Separator to use in chat

        show_folds = true, -- Shows folds for sections in chat
        show_help = true, -- Shows help message as virtual lines when waiting for user input
        auto_follow_cursor = true, -- Auto-follow cursor in chat
        auto_insert_mode = false, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
        clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
        highlight_selection = true, -- Highlight selection in the source buffer when in the chat window

        context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
        history_path = vim.fn.stdpath("data") .. "/copilotchat_history", -- Default path to stored history
        callback = nil, -- Callback to use when ask response is received

        -- default selection (visual or line)
        selection = function(source)
          return select.visual(source) or select.line(source)
        end,

        -- default prompts
        prompts = {
          Explain = {
            prompt = "/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.",
          },
          Review = {
            prompt = "/COPILOT_REVIEW Review the selected code.",
            callback = function(response, source)
              -- see config.lua for implementation
            end,
          },
          Fix = {
            prompt = "/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.",
          },
          Optimize = {
            prompt = "/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.",
          },
          Docs = {
            prompt = "/COPILOT_GENERATE Please add documentation comment for the selection.",
          },
          Tests = {
            prompt = "/COPILOT_GENERATE Please generate tests for my code.",
          },
          FixDiagnostic = {
            prompt = "Please assist with the following diagnostic issue in file:",
            selection = select.diagnostics,
          },
          Commit = {
            prompt =
            "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
            selection = select.gitdiff,
          },
          CommitStaged = {
            prompt =
            "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
            selection = function(source)
              return select.gitdiff(source, true)
            end,
          },
        },
      }
    end,

    -- default window options
    window = {
      layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace'
      width = 0.5,         -- fractional width of parent, or absolute width in columns when > 1
      height = 0.5,        -- fractional height of parent, or absolute height in rows when > 1
      -- Options below only apply to floating windows
      relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
      border = "single",   -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
      row = nil,           -- row position of the window, default is centered
      col = nil,           -- column position of the window, default is centered
      title = "Copilot Chat", -- title of chat window
      footer = nil,        -- footer of chat window
      zindex = 1,          -- determines if window is on top or below other floating windows
    },

    -- default mappings
    mappings = {
      complete = {
        detail = "Use @<Tab> or /<Tab> for options.",
        insert = "<Tab>",
      },
      close = {
        normal = "q",
        insert = "<C-c>",
      },
      reset = {
        normal = "<C-l>",
        insert = "<C-l>",
      },
      submit_prompt = {
        normal = "<CR>",
        insert = "<C-m>",
      },
      accept_diff = {
        normal = "<C-y>",
        insert = "<C-y>",
      },
      yank_diff = {
        normal = "gy",
      },
      show_diff = {
        normal = "gd",
      },
      show_system_prompt = {
        normal = "gp",
      },
      show_user_selection = {
        normal = "gs",
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  keys = {
    { "<leader>cpc",   "<Cmd>CopilotChatToggle<cr>",        desc = "Copilot chat panel" },
    { "<leader>cpe",   "<Cmd>CopilotChatExplain<cr>",       desc = "Copilot chat explain selected code" },
    { "<leader>cpr",   "<Cmd>CopilotChatReview<cr>",        desc = "Copilot chat review selected code" },
    { "<leader>cpf",   "<Cmd>CopilotChatFix<cr>",           desc = "Copilot chat fix selected code" },
    { "<leader>cpo",   "<Cmd>CopilotChatOptimize<cr>",      desc = "Copilot chat optimize selected code" },
    { "<leader>cpd",   "<Cmd>CopilotChatDocs<cr>",          desc = "Copilot chat generate docs for selected code" },
    { "<leader>cpt",   "<Cmd>CopilotChatTests<cr>",         desc = "Copilot chat generate test for selected code" },
    { "<leader>cpdi",  "<Cmd>CopilotChatFixDiagnostic<cr>", desc = "Copilot chat assists with issue" },
    { "<leader>cpco",  "<Cmd>CopilotChatCommitStaged<cr>",  desc = "Copilot chat commit staged" },
    { "<leader>cpcos", "<Cmd>CopilotChatCommit<cr>",        desc = "Copilot chat commit selected" },
  },
}
