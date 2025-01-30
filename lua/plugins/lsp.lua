-- LSP Configuration & Plugins
return {
  {
    -- Set up Mason before anything else
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        providers = {
          "mason.providers.registry-api",
          "mason.providers.client",
        },
        ui = {
          check_outdated_packages_on_open = true,
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    requires = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          --[[ "dockerfile-language-server dockerls",
					"ansible-language-server ansiblels",
					"bash-language-server bashls",
					"beautysh",
					"black",
					"commitlint",
					"cspell",
					"docker-compose-language-service docker_compose_language_service",
					"editorconfig-checker",
					"eslint-lsp eslint",
					"eslint_d",
					"html-lsp html",
					"jedi-language-server jedi_language_server",
					"json-lsp jsonls",
					"lua-language-server lua_ls",
					"markdown-oxide markdown_oxide",
					"markdownlint",
					"marksman",
					"markuplint",
					"prettier",
					"prettierd",
					"pydocstyle",
					"pyflakes",
					"python-lsp-server pylsp",
					"ruff",
					"rust-analyzer rust_analyzer",
					"semgrep",
					"shellcheck",
					"stylelint-lsp stylelint_lsp",
					"stylua",
					"tailwindcss-language-server tailwindcss",
					"terraform-ls terraformls",
					"typescript-language-server tsserver",
					"write-good",
					"yaml-language-server yamlls",
					"yamlfmt",
					"yapf", ]]
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      "j-hui/fidget.nvim",
      "folke/neodev.nvim",
      "RRethy/vim-illuminate",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Neodev setup before LSP config
      require("neodev").setup({
        {
          library = {
            enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
            -- these settings will be used for your Neovim config directory
            runtime = true, -- runtime path
            types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
            -- plugins = true, -- installed opt or start plugins in packpath
            -- you can also specify the list of plugins to make available as a workspace library
            plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim", "neotest" },
          },
          setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
          -- for your Neovim config directory, the config.library settings will be used as is
          -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
          -- for any other directory, config.library.enabled will be set to false
          override = function(root_dir, options) end,
          -- With lspconfig, Neodev will automatically setup your lua-language-server
          -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
          -- in your lsp start options
          lspconfig = true,
          -- much faster, but needs a recent built of lua-language-server
          -- needs lua-language-server >= 3.6.0
          pathStrict = true,
        },
      })

      -- Turn on LSP status information
      require("fidget").setup({
        text = {
          spinner = "pipe", -- animation shown when tasks are ongoing
          done = "🗸", -- character shown when all tasks are complete
          commenced = "Started", -- message shown when task starts
          completed = "Completed", -- message shown when task completes
        },
      })

      local icons = require("config").icons.diagnostics
      -- Set up cool signs for diagnostics
      local signs = {
        Error = icons.Error,
        Warn = icons.Warn,
        Hint = icons.Hint,
        Info = icons.Info,
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Diagnostic config
      local config = {
        virtual_text = false,
        signs = { active = signs },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }
      vim.diagnostic.config(config)

      -- This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(client, bufnr)
        local lsp_map = require("helpers.keys").lsp_map

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })

        lsp_map("<leader>ff", "<cmd>Format<cr>", bufnr, "Format")

        -- Attach and configure vim-illuminate
        require("illuminate").on_attach(client)

        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", { clear = false }),
            pattern = "<buffer>",
            callback = function()
              vim.lsp.buf.format({
                pattern = "<buffer>",
              })
            end,
          })
        end
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "<buffer>",
          -- Trim trailing whitespaces
          callback = function()
            -- Save cursor position to restore later
            local curpos = vim.api.nvim_win_get_cursor(0)
            -- Search and replace trailing whitespaces
            vim.cmd([[keeppatterns %s/\s\+$//e]])
            vim.api.nvim_win_set_cursor(0, curpos)
          end,
        })
        if client.server_capabilities.documentSymbolProvider then
          local navic = require("nvim-navic")
          navic.attach(client, bufnr)
        end
      end

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      require("lspconfig")["rust_analyzer"].setup({
        -- Server-specific settings. See `:help lspconfig-setup`
        settings = {
          ["rust-analyzer"] = {},
        },
      })

      -- Lua
      require("lspconfig")["lua_ls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            completion = { callSnippet = "Replace" },
            diagnostics = { globals = { "vim", "require" } },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
          },
        },
      })

      -- bashls
      require("lspconfig")["bashls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- Configure `ruff`.
      -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
      -- For the default config, along with instructions on how to customize the settings
      require("lspconfig")["ruff"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      require("lspconfig")["pylsp"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              black = {
                enabled = true,
                lineLength = 150, -- Black's line length
              },
              ruff = {
                enabled = true,                           -- Enable the plugin
                executable = "/home/scortes/miniconda3/bin/ruff", -- Custom path to ruff
                extendSelect = { "I" },                   -- Rules that are additionally used by ruff
                extendIgnore = { "C90" },                 -- Rules that are additionally ignored by ruff
                format = { "I" },                         -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
                severities = { ["D212"] = "I" },          -- Optional table of rules where a custom severity is desired
                unsafeFixes = false,                      -- Whether or not to offer unsafe fixes as code actions. Ignored with the "Fix All" action

                -- Rules that are ignored when a pyproject.toml or ruff.toml is present:
                lineLength = 150,                        -- Line length to pass to ruff checking and formatting
                exclude = { "__about__.py" },            -- Files to be excluded by ruff checking
                select = { "F" },                        -- Rules to be enabled by ruff
                ignore = { "D210" },                     -- Rules to be ignored by ruff
                perFileIgnores = { ["__init__.py"] = "CPY001" }, -- Rules that should be ignored for specific files
                preview = false,                         -- Whether to enable the preview style linting and formatting.
                targetVersion = "py310",                 -- The minimum python version to target (applies for both linting and formatting).
              },
              -- type checker
              -- auto-completion options
              jedi_completion = { fuzzy = true },
              pyflakes = { enabled = true },
              yapf = { enabled = true },

              -- DEACTIVATED
              pydocstyle = { enabled = false },
              pylsp_mypy = {
                enabled = false,
                report_progress = true,
                live_mode = false,
              },
              pyls_isort = { enabled = false },
              rope = { enabled = false },
              flake8 = {
                enabled = false,
                lineLength = 150, -- Black's line length
              },
              autopep8 = { enabled = false },
              -- linter options
              pylint = {
                enabled = false,
                executable = "pylint",
                format = { maxLineLength = 150 },
              },
              pycodestyle = { enabled = false },
            },
          },
        },
      })

      -- Stylelint
      require("lspconfig")["stylelint_lsp"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          stylelintplus = {
            -- see available options in stylelint-lsp documentation
          },
        },
        filetypes = { "css", "scss" },
      })

      -- tsserver
      require("lspconfig")["ts_ls"].setup({
        --[[ on_attach = function(client)
					-- Attach and configure vim-illuminate
					require("illuminate").on_attach(client)
					-- this is important, otherwise tsserver will format ts/js
					-- files which we *really* don't want.
					-- client.server_capabilities.documentFormattingProvider = false
				end, ]]
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        settings = {
          editor = { linkedEditing = true },
          --[[ typescript = {
						format = {
							indentSize = vim.o.shiftwidth,
							convertTabsToSpaces = vim.o.expandtab,
							tabSize = vim.o.tabstop,
						},
					},
					typescriptreact = {
						format = {
							indentSize = vim.o.shiftwidth,
							convertTabsToSpaces = vim.o.expandtab,
							tabSize = vim.o.tabstop,
						},
					},
					javascript = {
						format = {
							indentSize = vim.o.shiftwidth,
							convertTabsToSpaces = vim.o.expandtab,
							tabSize = vim.o.tabstop,
						},
					}, ]]
          handlebars = {},
          completions = { completeFunctionCalls = true },
        },
      })

      -- biome
      --[[ require("lspconfig")["biome"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {},
        filetypes = {
          "javascript",
          "javascript.jsx",
          "javascriptreact",
          "json",
          "jsonc",
          "mjs",
          "typescript",
          "typescript.tsx",
          "typescriptreact",
        },
      }) ]]

      -- eslint
      require("lspconfig")["eslint"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = "auto" },
          experimental = {
            -- allows to use flat config format
            useFlatConfig = true,
          },
        },
        filetypes = {
          "javascript",
          "javascriptreact",
          "mjs",
          "typescript",
          "typescript.tsx",
          "typescriptreact",
        },
      })

      -- Tailwindcss
      require("lspconfig")["tailwindcss"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {},
        filetypes = { "typescriptreact" },
      })

      -- MArksman
      require("lspconfig")["marksman"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {},
        filetypes = { "markdown", "md" },
      })

      --[[ require("lspconfig")["markdown_oxide"].setup({
        capabilities = capabilities, -- again, ensure that capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
        on_attach = on_attach,   -- configure your on attach config
      }) ]]

      -- jsonls
      require("lspconfig")["jsonls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {},
        filetypes = { "json", "jsonc" },
      })

      -- yamlls
      require("lspconfig")["yamlls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- html
      --[[ require("lspconfig")["html"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {},
        filetypes = { "html" },
      }) ]]

      -- dockerls
      require("lspconfig")["dockerls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- temmaformls
      require("lspconfig")["terraformls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- gherkin
      require("lspconfig")["cucumber_language_server"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "cucumber", "feature" },
      })

      -- emmber
      require("lspconfig")["ember"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "handlebars" },
      })
    end,
  },
}
