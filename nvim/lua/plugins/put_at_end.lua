local imap = require("utils").imap
return {
	"rareitems/put_at_end.nvim",
	lazy = false,
	config = function() imap("<C-p>", require("put_at_end").put_semicolon) end,
}
