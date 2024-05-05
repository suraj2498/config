return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		require("Comment").setup({
      opleader = {
        line = '<C-/>',
        block = "<C-?>"
      }
    })
	end,
}
