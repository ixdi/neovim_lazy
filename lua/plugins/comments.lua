return {
	-- Comments are integreated into neovim using the
	-- gc operator (Normal and Visual mode) to toggle comments.
	-- gcc for toggling comments in current line (basically a convenient gc_ remap).
	-- Also, of course, dot-repeat, [count] support, etc.
	{
		-- Finds and lists all of the TODO, HACK, BUG, etc comment
		-- in your project and loads them into a browsable list.
		"folke/todo-comments.nvim",
		cmd = { "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		config = true,
    -- stylua: ignore
    keys = {
      {
        "<leader>tcn",
        function() require("todo-comments").jump_next() end,
        desc = "Next todo comment"
      }, 
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" }
    },
	},
}
