local imap = require("utils").imap
return {
	"rareitems/put_at_end.nvim",
	lazy = false,
	config = function()
		local at_end = require("put_at_end")
		imap("<C-s>", at_end.put_semicolon)
		imap("<C-a>", at_end.put_comma)
	end,
}
