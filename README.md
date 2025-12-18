# The sleepy Neovim starter

This is a basic, minimal-ish jump-off point for your Neovim journey utilizing [lazy.nvim](https://github.com/folke/lazy.nvim) for package management and breaking the config up into three main components:

- `core`: This contains the most basic editor set-up, including plain Neovim options, keymaps, and some bootstrapping for lazy.nvim
- `helpers`: Intended to house helper functions that may be `require`d elsewhere in the config
- `plugins`: Each of the .lua files in this directory should serve as a lazy.nvim plugin spec

## Quickstart

If you're on a Linux system with `stow` installed, you can run

```sh
stow .
```

and be up and running! (This assumes you have cloned this repository to your home directory, otherwise you will have to supply `stow` with some more flags)

lazy.nvim will handle the bootstrapping process on first launch. If you run into any issues, try closing Neovim and restarting it again after lazy.nvim has performed the intial bootstrap.

## Plugins

This configuration includes the following plugins organized by category:

### Code Completion & Snippets

| Plugin | Description |
|--------|-------------|
| [saghen/blink.cmp](https://github.com/saghen/blink.cmp) | Auto-completion plugin for Neovim, powered by Rust |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) |
| [ixdi/vim-snippets](https://github.com/ixdi/vim-snippets) |

### File Management & Navigation

| Plugin | Description |
|--------|-------------|
| [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy Finder |
| [debugloop/telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim) | Undo history navigation |
| [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon) | Quick file navigation |
| [ggandor/leap.nvim](https://github.com/ggandor/leap.nvim) | Fast navigation within buffer |

### LSP & Diagnostics

| Plugin | Description |
|--------|-------------|
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Main LSP Configuration |
| [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim) | Lua LSP configuration for Neovim |
| [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim) | LSP status updates |
| [dmmulroy/ts-error-translator.nvim](https://github.com/dmmulroy/ts-error-translator.nvim) | Better TypeScript error messages |

### Git Integration

| Plugin | Description |
|--------|-------------|
| [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs and hunk operations |
| [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | LazyGit integration |

### UI Enhancements

| Plugin | Description |
|--------|-------------|
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |
| [folke/noice.nvim](https://github.com/folke/noice.nvim) | Improved UI components |
| [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) | Notification manager |
| [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) | Improved UI elements |
| [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) | Dashboard/start screen |

### Editing Utilities

| Plugin | Description |
|--------|-------------|
| [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets and quotes |
| [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | Auto-close and rename HTML/XML tags |
| [echasnovski/mini.surround](https://github.com/echasnovski/mini.surround) | Surround text objects |
| [abecodes/tabout.nvim](https://github.com/abecodes/tabout.nvim) | Tab out of parentheses/quotes |
| [mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi) | Multiple cursors |
| [gpanders/nvim-parinfer](https://github.com/gpanders/nvim-parinfer) | Automatic parentheses balancing |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting framework |

### Language Specific

| Plugin | Description |
|--------|-------------|
| [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua) | Show color codes |
| [roobert/tailwindcss-colorizer-cmp.nvim](https://github.com/roobert/tailwindcss-colorizer-cmp.nvim) | Tailwind CSS colors in completion |

### Testing & Debugging

| Plugin | Description |
|--------|-------------|
| [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol |
| [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | DAP UI |
| [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | Virtual text for DAP |
| [nvim-neotest/neotest](https://github.com/nvim-neotest/neotest) | Test framework integration |

### Productivity

| Plugin | Description |
|--------|-------------|
| [folke/which-key.nvim](https://github.com/folke/which-key.nvim) | Key binding helper |
| [nvim-pack/nvim-spectre](https://github.com/nvim-pack/nvim-spectre) | Search/replace in multiple files |
| [ThePrimeagen/refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim) | Refactoring tools |
| [danymat/neogen](https://github.com/danymat/neogen) | Annotation generator |
| [michaelb/sniprun](https://github.com/michaelb/sniprun) | Run code snippets |
| [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate) | Highlight word instances |
| [chrisgrieser/nvim-early-retirement](https://github.com/chrisgrieser/nvim-early-retirement) | Auto-close unused buffers |
| [NMAC427/guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim) | Auto-detect indentation |

### Utilities

| Plugin | Description |
|--------|-------------|
| [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Terminal management |
| [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | TODO comment finder |
| [folke/persistence.nvim](https://github.com/folke/persistence.nvim) | Session management |
| [gbprod/yanky.nvim](https://github.com/gbprod/yanky.nvim) | Yank history management |
| [dstein64/vim-startuptime](https://github.com/dstein64/vim-startuptime) | Startup time measurement |
| [echasnovski/mini.bufremove](https://github.com/echasnovski/mini.bufremove) | Buffer removal |

## Short Keys

This configuration uses the following key bindings organized by functionality:

### Leader Key
- `<Space>` - The leader key for many custom mappings

### Navigation
- `ee` - Toggle Neo-Tree reveal
- `eb` - Neo-Tree buffers
- `es` - Neo-Tree document symbols
- `eg` - Neo-Tree git status
- `,f` - Neo-Tree reveal
- `f` - Leap forward (Leap.nvim)
- `F` - Leap backward (Leap.nvim)
- `]c`/`[c` - Navigate git hunks
- `]]`/`[[` - Navigate word references (Illuminate)
- `<C-e>` - Toggle Harpoon menu

### File Operations
- `f` - Find files (Telescope)
- `<leader>sh` - Search help tags (Telescope)
- `<leader>sk` - Search keymaps (Telescope)
- `<leader>ss` - Telescope built-in (Telescope)
- `<leader>sw` - Search current word (Telescope)
- `<leader>f` - Live grep search (Telescope)
- `<leader>se` - Search diagnostics (Telescope)
- `<leader>l` - Resume last search (Telescope)
- `<leader>u` - Search recent files (Telescope)
- `<leader>b` - Find existing buffers (Telescope)
- `<leader>/` - Fuzzy search in current buffer (Telescope)
- `<leader>s/` - Live grep in open files (Telescope)
- `<leader>sn` - Search Neovim configuration files (Telescope)
- `<leader>z` - Undo history (Telescope)

### LSP Functionality
- `<leader><leader>` - Hover information
- `<leader>rn` - Rename symbol
- `<leader>a` - Code action
- `<leader>r` - Go to references
- `<leader>i` - Go to implementation
- `<leader>d` - Go to definition
- `<leader>dd` - Go to declaration
- `gO` - Document symbols
- `gW` - Workspace symbols
- `<leader>dt` - Go to type definition
- `<leader>th` - Toggle inlay hints

### Git Operations
- `<leader>ghs` - Stage hunk
- `<leader>ghr` - Reset hunk
- `<leader>ghS` - Stage buffer
- `<leader>ghu` - Undo stage hunk
- `<leader>ghR` - Reset buffer
- `<leader>ghp` - Preview hunk
- `<leader>ghb` - Blame line
- `<leader>gtb` - Toggle current line blame
- `<leader>ghd` - Diff this
- `<leader>ghD` - Diff this (~)
- `<leader>gtd` - Toggle deleted
- `gih` - Select hunk
- `<leader>g` - Open LazyGit

### Buffer Management
- `<leader>bp` - Toggle buffer pin
- `<leader>bP` - Delete non-pinned buffers
- `<leader>bd` - Delete buffer
- `<leader>bD` - Force delete buffer
- `<leader>bda` - Delete all buffers except current

### Code Completion & Snippets
- `<C-space>` - Open completion menu/docs
- `<C-n>`/`<C-p>` or `Up`/`Down` - Select completion items
- `<C-e>` - Hide completion menu
- `<C-k>` - Toggle signature help

### Editing Utilities
- `sa` - Add surround
- `sd` - Delete surround
- `sf` - Find surround (right)
- `sF` - Find surround (left)
- `sh` - Highlight surround
- `sr` - Replace surround
- `sn` - Update surround lines
- `<C-Tab>` - Tab out of parentheses/quotes
- `<S-Tab>` - Backwards tab out of parentheses/quotes
- `C-n` - Start multi-cursor
- `n` - Find next (multi-cursor)
- `N` - Find previous (multi-cursor)
- `]` - Next (multi-cursor)
- `[` - Previous (multi-cursor)
- `q` - Skip region (multi-cursor)
- `Q` - Remove region (multi-cursor)

### Debugging
- `<leader>db` - Toggle breakpoint
- `<leader>dc` - Continue debugging
- `<leader>do` - Step over
- `<leader>di` - Step into
- `<leader>dO` - Step out
- `<leader>dq` - Terminate debugging
- `<leader>du` - Toggle DAP UI

### Testing
- `<leader>tvr` - Run Vitest
- `<leader>tvf` - Run Vitest file
- `<leader>tpr` - Run Playwright
- `<leader>tpf` - Run Playwright file

### Refactoring
- `<leader>rr` - Open refactoring menu
- `<leader>rp` - Print function call
- `<leader>rv` - Print variable
- `<leader>rc` - Cleanup print statements

### Terminal
- `<leader>tt` - Toggle terminal
- `<leader>tf` - Toggle floating terminal
- `<leader>th` - Toggle horizontal terminal
- `<leader>tv` - Toggle vertical terminal
- `<leader>tl` - Send current line to terminal
- `<leader>tv` - Send visual lines to terminal

### Productivity
- `<leader>fr` - Find and replace in files (Spectre)
- `<leader>cd` - Generate code documentation
- `<leader>run` - Run code snippets
- `<leader>ha` - Add file to Harpoon
- `<leader>hd` - Remove file from Harpoon
- `<leader>hl` - Open Harpoon list
- `<leader>hp` - Previous Harpoon file
- `<leader>hn` - Next Harpoon file
- `<leader>?` - Show buffer local keymaps (WhichKey)

### UI Controls
- `<S-Enter>` - Redirect command line (Noice)
- `<leader>nl` - Show last message (Noice)
- `<leader>nh` - Show message history (Noice)
- `<leader>na` - Show all messages (Noice)
- `<leader>nd` - Dismiss all messages (Noice)
- `<leader>un` - Dismiss all notifications

### Search & Replace
- `<leader>st` - Search TODO comments
- `<leader>sT` - Search TODO/FIX/FIXME comments
- `<leader>tcn` - Next TODO comment

### Session Management
- `<leader>qs` - Restore session
- `<leader>ql` - Restore last session
- `<leader>qd` - Don't save current session

### Clipboard & History
- `<leader>p` - Open yank history
- `<leader>yc` - Clear yank history
- `y` - Yank text
- `p` - Put yanked text after cursor
- `P` - Put yanked text before cursor
- `=p` - Put reindented after line
- `=P` - Put reindented before line
- `<M-p>` - Cycle forward through yank history
- `<M-n>` - Cycle backward through yank history

