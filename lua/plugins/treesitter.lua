local load_textobjects = false
return {
  -- Treesitter is a new parser generator tool that we can
  -- use in Neovim to power faster and more accurate
  -- syntax highlighting.
  { "windwp/nvim-ts-autotag" },
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          -- disable rtp plugin, as we only need its queries for mini.ai
          -- In case other textobject modules are enabled, we will load them
          -- once nvim-treesitter is loaded
          require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
          load_textobjects = true
        end,
      },
      { "nvim-treesitter/nvim-treesitter-context" },
    },
    cmd = { "TSUpdateSync" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>",      desc = "Decrement selection", mode = "x" },
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c_sharp",
        "cmake",
        "comment",
        "css",
        "csv",
        "diff",
        "dockerfile",
        "git_config",
        "gitcommit",
        "gitignore",
        "glimmer",
        "graphql",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "mermaid",
        "prisma",
        "python",
        "regex",
        "scss",
        "sql",
        "ssh_config",
        "terraform",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          -- init_selection = "<C-space>",
          node_incremental = "v",
          node_decremental = "V",
          -- scope_incremental = false
        },
      },
      --[[ autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
			}, ]]
      rainbow = { enable = true, extended_mode = true },
      languages = {
        handlebars = { "html", "hbs" },
      },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)

      if load_textobjects then
        -- PERF: no need to load the plugin, if we only need its queries for mini.ai
        if opts.textobjects then
          for _, mod in ipairs({
            "move",
            "select",
            "swap",
            "lsp_interop",
          }) do
            if opts.textobjects[mod] and opts.textobjects[mod].enable then
              local Loader = require("lazy.core.loader")
              Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
              local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
              require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
              break
            end
          end
        end
      end
    end,
  },
}
