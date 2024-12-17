local cmp = require("cmp")
local lspkind = require("lspkind")
local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

local mappings = cmp.mapping.preset.insert({
	["<C-n>"] = cmp.mapping.select_next_item(),
	["<C-p>"] = cmp.mapping.select_prev_item(),
	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-h>"] = cmp.mapping.complete({}),
	["<C-l>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Insert,
		select = true,
	}),
	["CR"] = {},
})

local snippet = {
	expand = function(args)
		ls.lsp_expand(args.body)
	end,
}
local formatting = {
	fields = { "abbr", "kind", "menu" },
	expandable_indicator = true,
	format = lspkind.cmp_format(),
}

---@param sources table?
---@return cmp.ConfigSchema
local function getConfig(sources)
	return {
		preselect = cmp.PreselectMode.Item,
		formatting = formatting,
		snippet = snippet,
		mapping = mappings,
		sources = sources or {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "crates" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "nvim_lsp_document_symbol" },
		},
	}
end

local default = getConfig()

cmp.setup(default)

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "nvim_lsp_document_symbol" },
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

local markdownConfig = getConfig({
	{
		name = "spell",
		option = {
			keep_all_entries = false,
			preselect_correct_word = true,
			enable_in_context = function()
				return true
			end,
		},
	},
	{ name = "nvim_lsp" },
	{ name = "luasnip" },
})

cmp.setup.filetype("markdown", markdownConfig)
