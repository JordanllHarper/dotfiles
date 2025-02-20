---@module "flutter-tools"

---@class FlutterUtilsConfig
---@field create_run_configurations fun(flavors : string[], user_opts : UserOpts?) : flutter.ProjectConfig[]
---@field emulators table<string, string>
---
---@type FlutterUtilsConfig
local M = {}


---@class UserOpts
---@field flavors string[] flavors supported
---@field emulators table<string, string>? list of platform and emulators
---@field config_callback fun(cfg: flutter.ProjectConfig) : flutter.ProjectConfig a callback to be run before registering the config
---@field generate_flavor_run_targets boolean? whether targets should be generated based on a flavor naming scheme. Defaults to False
--- E.g. having a flavor "dev" and setting this to true will create a target "lib/main_dev.dart"
---
---@field dart_define_from_file? string json file to source
---@field dart_define? {[string]: string}
---@field config_callback? fun(cfg: flutter.ProjectConfig) : flutter.ProjectConfig

---@param flavor string
---@return string
local function create_flavor_run_target(flavor)
	return ("lib/main_%s.dart"):format(flavor)
end

---@param user_opts UserOpts? any specific run configurations and device overrides
---@return flutter.ProjectConfig[]
function M.create_run_configuration(user_opts)
	local emulators = M.emulators
	if user_opts and user_opts.emulators ~= nil then
		emulators = user_opts.emulators
	end

	local flavors = M.flavors
	if user_opts and user_opts.flavors then
		flavors = user_opts.flavors
	end

	local configs = {}
	for _, flavor in pairs(flavors) do
		for name, device in pairs(emulators) do
			local target = "lib/main.dart"
			if user_opts and user_opts.generate_flavor_run_targets == true then
				target = create_flavor_run_target(flavor)
			end
			---@type flutter.ProjectConfig
			local config = {
				name = ("%s - %s"):format(flavor, name),
				flavor = flavor,
				target = target,
				device = device,
				dart_define_from_file = user_opts and user_opts.dart_define_from_file
			}

			if user_opts and user_opts.config_callback then
				config = user_opts.config_callback(config)
			end
			table.insert(configs, config)
		end
	end
	return configs
end

---@type table<string, string>
M.emulators = {
	android = "emulator-5554",
	ios     = "iPhone 15 Pro"
}

M.flavors = { "dev", "qa", "prod" }

return M
