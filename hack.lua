local ilist = Instance.new("Hint", game.CoreGui)
local data = game:HttpGet("https://raw.githubusercontent.com/iz037/Zeld-Hub/main/NgonNgu.lua", true)
local dict = string.split(string.sub(data, 2, #data - 1), ", ")
local blacklist = {}
local kcmap = {
	["a"] = 0x41,
	["b"] = 0x42,
	["c"] = 0x43,
	["d"] = 0x44,
	["e"] = 0x45,
	["f"] = 0x46,
	["g"] = 0x47,
	["h"] = 0x48,
	["i"] = 0x49,
	["j"] = 0x4A,
	["k"] = 0x4B,
	["l"] = 0x4C,
	["m"] = 0x4D,
	["n"] = 0x4E,
	["o"] = 0x4F,
	["p"] = 0x50,
	["q"] = 0x51,
	["r"] = 0x52,
	["s"] = 0x53,
	["t"] = 0x54,
	["u"] = 0x55,
	["v"] = 0x56,
	["w"] = 0x57,
	["x"] = 0x58,
	["y"] = 0x59,
	["z"] = 0x5A,
	["enter"] = 0x0D,
}
local typingspeed = 0.05
game.UserInputService.InputBegan:Connect(function(k, t)
    if t then return end
    if k.KeyCode == Enum.KeyCode.H then
        blacklist = {}
    end
    if k.KeyCode == Enum.KeyCode.V then
        if typingspeed > 0.01 then
            typingspeed = typingspeed - 0.01
        end
    end
    if k.KeyCode == Enum.KeyCode.B then
        typingspeed = typingspeed + 0.01
    end
end)
while task.wait() do
    pcall(function()
        ilist.Text = "Words left: "..#dict - #blacklist.." | Words used: "..#blacklist.." | WPM: "..math.floor(60 / (typingspeed * 5))
        local tframe = game.Players.LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.InfoFrameContainer.InfoFrame.TextFrame
        local tbox = game.Players.LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.Typebar.Typebox
        local modu = require(game.Players.LocalPlayer.PlayerScripts.ClientGameScript.Games:GetChildren()[2])
        if tbox.Visible then
            tbox.Text = ""
            local word = ""
            for _, letter in pairs(tframe:GetChildren()) do
                if letter:IsA("Frame") then
                    if letter.Visible then
                        word = word..letter.Letter.TextLabel.Text
                    end
                end
            end
            word = word:lower()
            local firstword
            for _, dictword in pairs(dict) do
                if string.find(dictword, word) and not table.find(blacklist, dictword) then
                    firstword = dictword
                    table.insert(blacklist, dictword)
                    break
                end
            end
            if firstword then
                local fakeword = ""
                for _, letter in pairs(string.split(firstword, "")) do
                    task.wait(typingspeed)
                    fakeword = fakeword..letter
                    tbox.Text = fakeword
                end
                modu:FireServer("TypingEvent", firstword, true)
                task.wait(.5)
            end
        end
   end)
en
