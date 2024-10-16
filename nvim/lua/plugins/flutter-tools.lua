return {
	'akinsho/flutter-tools.nvim',
	dev = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'stevearc/dressing.nvim',
			enabled = false,
			opts = {
				input = {
					enabled = false
				}
			}
		},
		'rcarriga/nvim-notify',
	},
	config = function()
		require 'plugins.config.flutter-tools'
	end
}
