local cmd = require('utils').custom_user_command

local colorColumnValue = nil

cmd(
	"ToggleColorColumn",
	function()
		if colorColumnValue then
			colorColumnValue = nil
		else
			colorColumnValue = "80"
		end

		vim.cmd(("set colorcolumn=%s"):format(colorColumnValue or ""))
	end
)
