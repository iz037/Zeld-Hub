setclipboard("https://discord.gg/FJFZMCu5JX")
wait(1)
local repo = "https://raw.githubusercontent.com/iz037/Zeld-Hub/main/Script/"
local function LoadScript(ScriptName)
	pcall(function()
		t = 0
		repeat
			local s, r = pcall(function()
				loadstring(game:HttpGet(repo .. ScriptName))()
			end)
			if not s then
				spawn(function()
					error(r)
				end)
			end
			t = t + 1
			wait(60)
		until getgenv().Executed or t >= 30
	end)
end
local Id = game.PlaceId
local GameId = game.GameId
local PlaceIds = {
	["RG"] = { 914010731 },
	["PTMEBGE"] = { 3411100258 },
	["TRSE"] = { 14795754298 },
	["Chaos"] = { 6441847031 },
    ["BaldeBall"] = {14732610803, 13772394625},
    ["FTZ"] = { 4954096313, 5096191125, 5941839954 },
    ["RT2"] = { 6299805723 },
    ["TB2"] = { 7305309231 },
}
if table.find(PlaceIds["TRSE"], GameId) then
	LoadScript("The%20Russian%20Sleep%20Experiment.lua")
end
elseif table.find(PlaceIds["RG"], Id) then -- RoGhoul
	LoadScript("RoGhoul.lua")
end
elseif table.find(PlaceIds["BaldeBall"], Id) then -- RoGhoul
	LoadScript("Blade%20Ball.lua")
end
elseif table.find(PlaceIds["Chaos"], Id) then -- RoGhoul
	LoadScript("Chaos.lua")
end
elseif table.find(PlaceIds["FTZ"], Id) then -- RoGhoul
	LoadScript("Field%20Trip%20Z.lua")
end
elseif table.find(PlaceIds["PTMEBGE"], Id) then -- RoGhoul
	LoadScript("prtty%20much%20evry%20bordr%20gam%20evr.lua")
end
elseif table.find(PlaceIds["RT2"], Id) then -- RoGhoul
	LoadScript("Restaurant%20Tycoon%202.lua")
end
elseif table.find(PlaceIds["TB2"], Id) then -- RoGhoul
	LoadScript("Taxi%20Boss.lua")
end
