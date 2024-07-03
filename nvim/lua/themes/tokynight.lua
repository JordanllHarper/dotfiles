return {
	-- Theme inspired by Atom
	'folke/tokyonight.nvim',
	config = function()
		require('tokyonight').setup({
			style = "night",
			on_highlights = function(highlights)
				highlights.CursorLineNr = {
					fg = "#9d7cd8",
				}

				highlights.LineNr = {
					fg = "#41a6b5",
				}
			end
		})
	end,
	lazy = false,
	priority = 1000,
}
