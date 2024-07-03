require('luasnip.session.snippet_collection').clear_snippets "dart"
local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node


local fmt = require "luasnip.extras.fmt".fmt
local fmta = require "luasnip.extras.fmt".fmta

ls.add_snippets("dart", {
	s("sca", fmt("return Scaffold(body: {});", { i(1) })),
	--[[


		Freezed model creation


	--]]
	s("freezed", fmt([[
	  @freezed
	  class {modelName} with _${modelName}{{
		  {} factory {modelName}( {{ {args} }} ) = _{modelName};{}
	  }}
      ]], {
		modelName = i(1, "ModelName"), i(2), args = i(3), i(0),
	}, {
		repeat_duplicates = true
	})),

	s("factory", fmt([[
	{} factory.{factoryName}({{ {args} }}){{
		{}
	}}
]], {
		i(1), factoryName = i(2), args = i(3), i(0),
	}, { repeat_duplicates = true })),
	--[[


		Cubit creation


	--]]
	s("cubit",
		fmt([[
	class {name}Cubit extends Cubit<{state}>{{

		{name}Cubit : super({args});
		{}

	}}]],
			{ name = i(1), state = i(2), args = i(3), i(0) },
			{ repeat_duplicates = true })),
	--[[
	

		Creating State


	--]]
	s("state", fmt([[
	  @freezed
	  class {stateName}State with _${stateName}State {{
		  const factory {stateName}State{factoryStep} = {stateName}State{factoryStepUpper};{}
	  }}
      ]], {
		stateName = i(1, "StateName"), factoryStep = i(2), factoryStepUpper = i(3), i(0),
	}, {
		repeat_duplicates = true
	})),

	s("stavar", fmt([[
	const factory {stateName}.{variant}({{ {args} }})= {stateName}{variantUpper};{}
]], {
		stateName = i(1), variant = i(2), args = i(3), variantUpper = i(4), i(0),
	}, { repeat_duplicates = true })),
	--[[


		Creating Variables


	--]]
	s({ trig = "fv", desc = "Create a final value" }, fmt("final {} = {};{}", { i(1), i(2), i(0) })),
	--
	s({ trig = "ff", desc = "Create a final field" }, fmt("final {} {};{}", { i(1), i(2), i(0) })),
	--
	s({ trig = "vv", desc = "Create a variable value" }, fmt("{} {} = {};{}", { i(1), i(2), i(3), i(0) })),
	--
	s({ trig = "vf", desc = "Create a variable field" }, fmt("{} {};{}", { i(1), i(2), i(0) })),
	--
	--
	-- 	s("sfw", fmta([[
	-- class (name) extends StatefulWidget {
	--
	-- 	(finish)
	--
	-- }
	-- ]], { name = i(1), finish = i(2) }, { delimiters = "()" })),
})
