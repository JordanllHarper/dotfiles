local flutter_emulators = {
	android_mobile = 'emulator-5554',
	ios_mobile = '9058BA54-CF35-4B08-9FE9-B7AA0C86A256',
	android_tablet = 'emulator-5556',
	web = {
		device = 'chrome',
		port = 5000
	},
}

local android_main = {
	name = 'Android Main',
	target = 'lib/main.dart',
	device = flutter_emulators.android_mobile,
	dart_define = {
		API_URL = 'https://dev.example.com/api',
		IS_DEV = true,
	},
}


local ios_main = {
	name = 'iOS Main',
	target = 'lib/main.dart',
	device = flutter_emulators.ios_mobile,
	dart_define = {
		API_URL = 'https://dev.example.com/api',
		IS_DEV = true,
	},
}

local tablet_main = {
	name = 'Tablet Main',
	target = 'lib/main.dart',
	device = flutter_emulators.android_tablet,
	dart_define = {
		API_URL = 'https://dev.example.com/api',
		IS_DEV = true,
	},
}

local web_main = {
	name = 'Web Main',
	device = flutter_emulators.web.device,
	target = 'lib/main.dart',
	web_port = flutter_emulators.web.port
}
return {
	android_main,
	tablet_main,
	ios_main,
	web_main
}
