local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require 'telescope.config'.values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local colors = function(opts)
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "colors",
		finder = finders.new_table {
			results = { { "red", "#ff0000" }, { "green", "#00ff00" }, { "blue", "#0000ff" }, },
			entry_maker = function(entry)
				return {
					value = entry,
					display = entry[1],
					ordinal = entry[1],
				}
			end
		},
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
			end)
			return true
		end,
	}):find()
end
colors()
