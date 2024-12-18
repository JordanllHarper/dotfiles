-- "z" to comment visual regions/lines
-- e.g. "zz" for a whole line

return {
	"numToStr/Comment.nvim",
	opts = {
		opleader = {
			line = "<leader>z",
			block = "<leader>b",
		},
		toggler = {
			line = "<leader>zz",
			block = "<leader>bb",
		},
	},
}
