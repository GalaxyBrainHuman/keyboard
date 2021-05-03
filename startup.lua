-- video explanation is HERE: https://www.youtube.com/watch?v=Arn8ExQ2Gjg
-- get luamacros HERE: http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794
-- plug in your 2nd keyboard, load this script into LUAmacros, and press the triangle PLAY button.
-- Then, press any key on that keyboard to assign logical name ('MACROS') to macro keyboard
clear() --clear the console from last run
local keyboardIdentifier = '187CC39A'



--You need to get the identifier code for the keyboard with name "MACROS"
--This appears about halfway through the SystemID item and looks like 1BB382AF or some other alphanumeric combo.
-- It's usually 7 or 8 characters long.
--Once you have this identifier, replace the value of keyboardIdentifier with it

--Don't ask for keyboard assignment help if the user has manually entered a keyboard identifier
if keyboardIdentifier == '0000AAA' then
	lmc_assign_keyboard('MACROS');
else lmc_device_set_name('MACROS', keyboardIdentifier);
end
--This lists connected keyboards
dev = lmc_get_devices()
for key,value in pairs(dev) do
	print(key..':')
	for key2,value2 in pairs(value) do print('  '..key2..' = '..value2) end
end
print('You need to get the identifier code for the keyboard with name "MACROS"')
print('Then replace the first 0000AAA value in the code with it. This will prevent having to manually identify keyboard every time.')
-- Hide window to tray to keep taskbar tidy
lmc.minimizeToTray = true
--lmc_minimize()

--Start Script
sendToAHK = function (key)
	--print('It was assigned string:    ' .. key)
	local file = io.open("C:\\AHK\\2nd-keyboard\\LUAMACROS\\keypressed.txt", "w") -- writing this string to a text file on disk is probably NOT the best method. Feel free to program something better!
	--If you didn't put your AutoHotKey scripts into C:/AHK, Make sure to substitute the path that leads to your own "keypressed.txt" file, using the double backslashes.
	--print("we are inside the text file")
	file:write(key)
	file:flush() --"flush" means "save." Lol.
	file:close()
	lmc_send_keys('{F24}')  -- This presses F24. Using the F24 key to trigger AutoHotKey is probably NOT the best method. Feel free to program something better!
end

local config = {
	[45]  = "insert",
	[36]  = "home",
	[33]  = "pageup",
	[46]  = "delete",
	[35]  = "end",
	[34]  = "pagedown",
	[27]  = "escape",
	[112] = "F1",
	[113] = "F2",
	[114] = "F3",
	[115] = "F4",
	[116] = "F5",
	[117] = "F6",
	[118] = "F7",
	[119] = "F8",
	[120] = "F9",
	[121] = "F10",
	[122] = "F11",
	[123] = "F12",
	[8]   = "backspace",
	[220] = "backslash",
	[13]  = "enter",
	[16]  = "rShift",
	[17]  = "rCtrl",
	[38]  = "up",
	[37]  = "left",
	[40]  = "down",
	[39]  = "right",
	[32]  = "space",
	[186] = "semicolon",
	[222] = "singlequote",
	-- [190] = "period",
	-- [191] = "slash",
	-- [188] = "comma",
	-- [219] = "leftbracket",
	-- [221] = "rightbracket",
	-- [189] = "minus",
	-- [187] = "equals",
	-- [96]  = "num0",
	-- [97]  = "num1",
	-- [98]  = "num2",
	-- [99]  = "num3",
	-- [100] = "num4",
	-- [101] = "num5",
	-- [102] = "num6",
	-- [103] = "num7",
	-- [104] = "num8",
	-- [105] = "num9",
	
	-- [106] = "numMult",
	-- [107] = "numPlus",
	-- [108] = "numEnter", --sometimes this is different, check your keyboard
	-- [109] = "numMinus",
	-- [110] = "numDelete",
	-- [111] = "numDiv",
	-- [144] = "numLock", --probably it is best to avoid this key. I keep numlock ON, or it has unexpected effects
	
	-- [192] = "`",  --this is the tilde key just before the number row
	-- [9]   = "tab",
	-- [20]  = "capslock",
	[18]  = "alt",
	
	
	[string.byte('Q')] = "q",
	[string.byte('W')] = "w",
	[string.byte('E')] = "e",
	[string.byte('R')] = "r",
	[string.byte('T')] = "t",
	[string.byte('Y')] = "y",
	[string.byte('U')] = "u",
	[string.byte('I')] = "i",
	[string.byte('O')] = "o",
	[string.byte('P')] = "p",
	[string.byte('A')] = "a",
	[string.byte('S')] = "s",
	[string.byte('D')] = "d",
	[string.byte('F')] = "f",
	[string.byte('G')] = "g",
	[string.byte('H')] = "h",
	[string.byte('J')] = "j",
	[string.byte('K')] = "k",
	[string.byte('L')] = "l",
	[string.byte('Z')] = "z",
	[string.byte('X')] = "x",
	[string.byte('C')] = "c",
	[string.byte('V')] = "v",
	[string.byte('B')] = "b",
	[string.byte('N')] = "n",
	[string.byte('M')] = "m",
	
	[string.byte('0')] = "0",
	[string.byte('1')] = "1",
	[string.byte('2')] = "2",
	[string.byte('3')] = "3",
	[string.byte('4')] = "4",
	[string.byte('5')] = "5",
	[string.byte('6')] = "6",
	[string.byte('7')] = "7",
	[string.byte('8')] = "8",
	[string.byte('9')] = "9",
	
	--[255] = "printscreen" --these keys do not work
}

-- define callback for whole device
lmc_set_handler('MACROS', function(button, direction)
	--Ignoring upstrokes ensures keystrokes are not registered twice, but activates faster than ignoring downstrokes. It also allows press and hold behaviour
	if (direction == 0) then return end -- ignore key upstrokes.
	if type(config[button]) == "string" then
		--print(' ')
		--print('Your key ID number is:   ' .. button)
		print('It was assigned string:    ' .. config[button])
		if config[button] == "q" then
			lmc_spawn([["C:\Program Files (x86)\Origin\Origin.exe"]])
		end
		if config[button] == "w" then
			lmc_spawn([[""]])
		end
		if config[button] == "e" then
			lmc_spawn([[C:\Users\bherman\luamacros.exe]])
		end
		if config[button] == "r" then
			lmc_spawn([[C:\Users\bherman\run.exe]])
		end
		if config[button] == "t" then
			lmc_spawn([[C:\Users\bherman\anaconda3\python.exe C:\Users\bherman\anaconda3\cwp.py C:\Users\bherman\anaconda3 C:\Users\bherman\anaconda3\python.exe C:\Users\bherman\anaconda3\Scripts\jupyter-notebook-script.py "%USERPROFILE%/"]])
		end
		if config[button] == "y" then
			lmc_spawn([[C:\Program Files\Rockstar Games\Launcher\LauncherPatcher.exe]])
		end
		if config[button] == "u" then
			lmc_spawn([[C:\Program Files (x86)\WACUP\wacup.exe]])
		end
		if config[button] == "i" then
			lmc_spawn([[C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe]])
		end
		if config[button] == "o" then
			lmc_spawn([[C:\Users\bherman\AppData\Local\Programs\Python\Python38\python.exe]])
		end
		if config[button] == "p" then
			lmc_spawn([[C:\Users\bherman\AppData\Local\MEGAsync\MEGAsync.exe]])
		end
		if config[button] == "a" then
			lmc_spawn([[C:\Users\bherman\AppData\Roaming\Emby-Server\system\EmbyServer.exe]])
		end
		if config[button] == "s" then
			lmc_spawn([[C:\Users\bherman\AppData\Local\Programs\signal-desktop\Signal.exe]])
		end
		if config[button] == "d" then
			lmc_spawn([[C:\Users\bherman\discord.exe]])
		end
		if config[button] == "f" then
			lmc_spawn([[C:\Program Files\Mozilla Firefox\firefox.exe]])
		end
		if config[button] == "g" then
			lmc_spawn([[C:\Users\bherman\AppData\Roaming\Twitch Studio\Bin\TwitchStudio.exe]])
		end
		if config[button] == "h" then
			lmc_spawn("calc")
		end
		if config[button] == "j" then
			lmc_spawn([[]])
		end
		if config[button] == "k" then
			lmc_spawn([[C:\\Program Files\\Docker\\Docker\\Docker Desktop.exe]])
		end
		if config[button] == "l" then
			lmc_spawn([[C:\Users\bherman\AppData\Roaming\Twitch Studio\Bin\TwitchStudio.exe]])
		end
		if config[button] == "z" then
			lmc_spawn("cmd")
		end
		if config[button] == "x" then
			lmc_spawn("C:\\Users\\bherman\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe")
		end
		if config[button] == "c" then
			lmc_spawn("C:\\Users\\bherman\\AppData\\Roaming\\RetroArch\\retroarch.exe")
		end
		if config[button] == "v" then
			lmc_spawn("C:\\Program Files (x86)\\Steam\\Steam.exe")
		end
		if config[button] == "alt" then
			lmc_spawn("copy.ps1")
		end
		if config[button] == "space" then
			lmc_spawn("C:\\Program Files\\Everything\\Everything.exe")
		end
		if config[button] == "b" then
			lmc_spawn("C:\\Program Files (x86)\\Battle.net\\Battle.net Launcher.exe")
		end
		if config[button] == "n" then
			lmc_spawn("C:\\Windows\\system32\\SnippingTool.exe")
		end
		if config[button] == "m" then
			lmc_spawn([[C:\Program Files (x86)\foobar2000\foobar2000.exe]])
		end
	else
		print(' ')
		print('Not yet assigned: ' .. button)
	end
end)
