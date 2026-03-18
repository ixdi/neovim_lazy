# The sleepy Neovim starter

This is a basic, minimal-ish jump-off point for your Neovim journey utilizing native neovim pack for package management and breaking the config up into three main components:

- `init.lua`: This is the main entry point for the config. It should be as minimal as possible, and only require the `config` directory.
- `config`: This contains the most basic editor set-up, including plain Neovim options, keymaps, and some autocmds. This is the only directory that should be `require`d in `init.lua`
- `plugins`: Each of the .lua files in this directory should serve as a vim.pack plugin spec

## Quickstart

Simply start Neovim and be up and running! (This assumes you have cloned this repository to your home directory, e.g. `~/.config/nvim`)

vim.pack will handle the bootstrapping process on first launch. If you run into any issues, try closing Neovim and restarting it again after vim.pack has performed the intial bootstrap.

## Plugins

This configuration includes the following plugins organized by category:

### Completion & Autocompletion

- **blink.cmp** - High-performance autocompletion with fuzzy matching
- **LuaSnip** - Snippet engine for Neovim
- **friendly-snippets** - Collection of preconfigured snippets
- **nvim-autopairs** - Auto-close and manage bracket pairs
- **nvim-ts-autotag** - Auto-close and rename HTML/XML tags

### LSP & Code Intelligence

- **nvim-lspconfig** - Language Server Protocol configuration
- **mason.nvim** - Package manager for LSP servers, DAP, and linters
- **mason-lspconfig** - Bridge between mason and lspconfig
- **conform.nvim** - Code formatting framework
- **neogen** - Auto-generate annotations and documentation (jsDoc, EmmyLua, etc.)
- **ts-error-translator.nvim** - Translate TypeScript errors to readable messages

### UI & Statusline

- **bufferline.nvim** - Tab-like buffer navigation with icons
- **mini.bufremove** - Buffer deletion utility
- **lualine.nvim** - Fast and customizable statusline
- **copilot-lualine** - Copilot status indicator for lualine
- **nvim-navic** - Show code context/location in statusline
- **nvim-colorizer.lua** - Highlight color names and codes
- **indent-blankline.nvim** - Show indentation guides
- **mini.indentscope** - Active indent guide with animation
- **illuminate** - Highlight word references under cursor

### Navigation & File Management

- **nvim-tree.lua** - File explorer tree view
- **nvim-web-devicons** - Filetype icons
- **telescope.nvim** - Fuzzy finder for files, buffers, grep, and more
- **telescope-fzf-native.nvim** - FZF backend for Telescope
- **telescope-undo.nvim** - Undo history browser
- **telescope-ui-select.nvim** - UI select extension
- **bufferline.nvim** - Buffer navigation and display

### Git Integration

- **gitsigns.nvim** - Git signs, hunk navigation, and staging
- **lazygit.nvim** - Integrated lazygit terminal UI

### Search & Replace

- **spectre.nvim** - Search and replace across multiple files
- **vim-illuminate** - Auto-highlight references

### Editing & Text Objects

- **Comment.nvim** - Toggle comments with `gc` operator
- **todo-comments.nvim** - Highlight and search TODO/FIXME comments
- **mini.surround** - Add/delete/replace surrounding characters
- **multicursor.nvim** - Multiple cursor editing
- **yanky.nvim** - Enhanced yank history and paste management
- **early-retirement** - Auto-close unused buffers

### Treesitter & Syntax

- **nvim-treesitter** - Syntax highlighting, indentation, and incremental selection

### Terminal & Floating Windows

- **toggleterm.nvim** - Terminal management (toggle, float, horizontal, vertical)

### Markdown

- **live-preview.nvim** - Live markdown preview in browser
- **render-markdown.nvim** - Render markdown with treesitter in floating window

### Notifications & Clues

- **mini.notify** - Notification manager
- **mini.clue** - Show keymap hints and clues

### AI & Copilot

- **copilot.vim** - GitHub Copilot integration

### Themes

- **nordic.nvim** - Nord-based colorscheme

---

## Keymaps

### General Keymaps

| Keymap             | Mode   | Description             |
| ------------------ | ------ | ----------------------- |
| `jj`               | Insert | Exit insert mode        |
| `<leader><leader>` | Normal | LSP hover               |
| `,w`               | Normal | Write/Save buffer       |
| `,qq`              | Normal | Quit                    |
| `,qa`              | Normal | Quit all                |
| `,m`               | Normal | Clear search highlights |
| `<leader>pu`       | Normal | Update plugins          |
| `<S-l>`            | Normal | Next buffer             |
| `<S-h>`            | Normal | Previous buffer         |
| `<`                | Visual | Decrease indent         |
| `>`                | Visual | Increase indent         |

### Diagnostics

| Keymap       | Mode   | Description                   |
| ------------ | ------ | ----------------------------- |
| `<leader>ee` | Normal | Show diagnostics under cursor |
| `<leader>en` | Normal | Next diagnostic               |
| `<leader>ep` | Normal | Previous diagnostic           |

### LSP

| Keymap  | Mode          | Description     |
| ------- | ------------- | --------------- |
| `gra`   | Normal/Visual | Code action     |
| `gri`   | Normal        | Implementation  |
| `grn`   | Normal        | Rename          |
| `grr`   | Normal        | References      |
| `grt`   | Normal        | Type definition |
| `gO`    | Normal        | Document symbol |
| `<C-s>` | Insert        | Signature help  |

### Telescope (Fuzzy Finder)

| Keymap      | Mode   | Description                    |
| ----------- | ------ | ------------------------------ |
| `f`         | Normal | Find files                     |
| `<Space>sh` | Normal | Search help                    |
| `<Space>sk` | Normal | Search keymaps                 |
| `<Space>ss` | Normal | Select Telescope command       |
| `<Space>sw` | Normal | Search current word            |
| `<Space>f`  | Normal | Live grep                      |
| `<Space>se` | Normal | Search diagnostics             |
| `<Space>l`  | Normal | Resume last search             |
| `<Space>u`  | Normal | Search recent files            |
| `<Space>b`  | Normal | Find buffers                   |
| `<Space>/`  | Normal | Fuzzy search in current buffer |
| `<Space>s/` | Normal | Live grep in open files        |
| `<Space>sn` | Normal | Search Neovim config files     |
| `<Space>z`  | Normal | Undo history                   |

### Buffer Management

| Keymap        | Mode   | Description                       |
| ------------- | ------ | --------------------------------- |
| `<leader>bd`  | Normal | Delete buffer                     |
| `<leader>bD`  | Normal | Delete buffer (force)             |
| `<leader>bda` | Normal | Delete all buffers except current |
| `<leader>bp`  | Normal | Toggle buffer pin                 |
| `<leader>bP`  | Normal | Delete non-pinned buffers         |

### File Explorer (nvim-tree)

| Keymap    | Mode          | Description      |
| --------- | ------------- | ---------------- |
| `ee`      | Normal        | Toggle nvim-tree |
| `,f`      | Normal        | Focus nvim-tree  |
| `<space>` | Normal (tree) | Open file        |
| `+`       | Normal (tree) | Vertical split   |
| `-`       | Normal (tree) | Horizontal split |
| `R`       | Normal (tree) | Reload tree      |

### Git (gitsigns)

| Keymap        | Mode     | Description             |
| ------------- | -------- | ----------------------- |
| `<leader>g`   | Normal   | Open LazyGit            |
| `]c`          | Normal   | Next git hunk           |
| `[c`          | Normal   | Previous git hunk       |
| `<leader>ghs` | Normal   | Stage hunk              |
| `<leader>ghr` | Normal   | Reset hunk              |
| `<leader>ghS` | Normal   | Stage buffer            |
| `<leader>ghu` | Normal   | Undo stage hunk         |
| `<leader>ghR` | Normal   | Reset buffer            |
| `<leader>ghp` | Normal   | Preview hunk            |
| `<leader>ghb` | Normal   | Blame line              |
| `<leader>gtb` | Normal   | Toggle line blame       |
| `<leader>ghd` | Normal   | Diff this               |
| `<leader>ghD` | Normal   | Diff this (previous)    |
| `<leader>gtd` | Normal   | Toggle deleted          |
| `gih`         | Operator | Select hunk text object |

### Comments

| Keymap        | Mode          | Description                          |
| ------------- | ------------- | ------------------------------------ |
| `gc`          | Normal/Visual | Toggle line comment (operator)       |
| `gcc`         | Normal        | Toggle comment on current line       |
| `gb`          | Normal/Visual | Toggle block comment (operator)      |
| `gbc`         | Normal        | Toggle block comment on current line |
| `gco`         | Normal        | Add comment below                    |
| `gcO`         | Normal        | Add comment above                    |
| `gcA`         | Normal        | Add comment at end of line           |
| `<leader>tcn` | Normal        | Next TODO comment                    |
| `<leader>st`  | Normal        | Search TODOs via Telescope           |
| `<leader>sT`  | Normal        | Search TODO/FIX/FIXME via Telescope  |
| `<leader>cd`  | Normal        | Generate documentation (Neogen)      |

### Surround (mini.surround)

| Keymap | Mode          | Description              |
| ------ | ------------- | ------------------------ |
| `sa`   | Normal/Visual | Add surrounding          |
| `sd`   | Normal        | Delete surrounding       |
| `sr`   | Normal        | Replace surrounding      |
| `sf`   | Normal        | Find surrounding (right) |
| `sF`   | Normal        | Find surrounding (left)  |
| `sh`   | Normal        | Highlight surrounding    |
| `sn`   | Normal        | Update n_lines           |

### Multicursor

| Keymap             | Mode          | Description                  |
| ------------------ | ------------- | ---------------------------- |
| `<leader><up>`     | Normal/Visual | Add cursor above             |
| `<leader><down>`   | Normal/Visual | Add cursor below             |
| `<leader><C-up>`   | Normal/Visual | Skip cursor above            |
| `<leader><C-down>` | Normal/Visual | Skip cursor below            |
| `<C-n>`            | Normal/Visual | Add cursor to next match     |
| `<C-k>`            | Normal/Visual | Skip next match              |
| `<C-S-n>`          | Normal/Visual | Add cursor to previous match |
| `<C-S-k>`          | Normal/Visual | Skip previous match          |
| `<C-a>`            | Normal/Visual | Add cursors to all matches   |
| `<C-q>`            | Normal/Visual | Toggle cursors               |
| `<C-leftmouse>`    | Normal        | Add/remove cursor with click |

### Yanky (Yank History)

| Keymap       | Mode          | Description                     |
| ------------ | ------------- | ------------------------------- |
| `p`          | Normal/Visual | Put after (charwise)            |
| `P`          | Normal/Visual | Put before (charwise)           |
| `<m-p>`      | Normal        | Previous yank entry             |
| `<m-n>`      | Normal        | Next yank entry                 |
| `<c-p>`      | Normal        | Put after with reindent         |
| `=P`         | Normal        | Put before with reindent        |
| `<leader>p`  | Normal        | Open yank history (Telescope)   |
| `<leader>yc` | Normal        | Clear yank history              |
| `y`          | Normal/Visual | Yank (preserve cursor position) |

### Terminal (toggleterm)

| Keymap       | Mode   | Description                |
| ------------ | ------ | -------------------------- |
| `<leader>tt` | Normal | Toggle terminal            |
| `<leader>tf` | Normal | Toggle floating terminal   |
| `<leader>th` | Normal | Toggle horizontal terminal |
| `<leader>tv` | Normal | Toggle vertical terminal   |

### Markdown

| Keymap       | Mode   | Description            |
| ------------ | ------ | ---------------------- |
| `<leader>md` | Normal | Start live preview     |
| `<leader>mv` | Normal | Toggle markdown render |

### Notifications

| Keymap       | Mode   | Description               |
| ------------ | ------ | ------------------------- |
| `<leader>nh` | Normal | Show notification history |
| `<leader>na` | Normal | Show all notifications    |

### Search & Replace

| Keymap      | Mode   | Description                |
| ----------- | ------ | -------------------------- |
| `<Space>fr` | Normal | Replace in files (Spectre) |
