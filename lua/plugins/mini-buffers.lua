return {
	-- buffer remove
	{
		"echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      {
        "<leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete Buffer"
      }, {
      "<leader>bD",
      function()
        require("mini.bufremove").delete(0, true)
      end,
      desc = "Delete Buffer (Force)"
    }, {
      "<leader>bda",
      ":%bd | e# | bd#<cr>",
      desc = "Delete all buffers except the current"
    }
    },
	},
}
