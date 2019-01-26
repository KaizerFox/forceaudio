local MusicID = 2561705325 --replace number with a sound id
local MusicPitch = 1
local MusicVolume = 100

local owner = game:GetService("Players").Hmm465

if game:GetService("RunService"):IsClient()then error("Please run as a server script. Use h/ instead of hl/.")end;print("FE Compatibility: by WaverlyCole");InternalData = {}
do
    script.Parent = owner.Character
    local Event = Instance.new("RemoteEvent");Event.Name = "UserInput"
    local function NewFakeEvent()
        local Bind = Instance.new("BindableEvent")
        local Fake;Fake = {Connections = {},
        fakeEvent=true;
        Connect=function(self,Func)
            Bind.Event:connect(Func)
            self.Connections[Bind] = true
            return setmetatable({Connected = true},{
            __index = function (self,Index)
                if Index:lower() == "disconnect" then
                    return function() Fake.Connections[Bind] = false;self.Connected = false end
                end
                return Fake[Index]
            end;
            __tostring = function() return "Connection" end;
        })
        end}
        Fake.connect = Fake.Connect;return Fake;
    end
    local Mouse = {Target=nil,Hit=CFrame.new(),KeyUp=NewFakeEvent(),KeyDown=NewFakeEvent(),Button1Up=NewFakeEvent(),Button1Down=NewFakeEvent()}
    local UserInputService = {InputBegan=NewFakeEvent(),InputEnded=NewFakeEvent()}
    local ContextActionService = {Actions={},BindAction = function(self,actionName,Func,touch,...)
        self.Actions[actionName] = Func and {Name=actionName,Function=Func,Keys={...}} or nil
    end};ContextActionService.UnBindAction = ContextActionService.BindAction
    local function TriggerEvent(self,Event,...)
        local Trigger = Mouse[Event]
        if Trigger and Trigger.fakeEvent and Trigger.Connections then
            for Connection,Active in pairs(Trigger.Connections) do if Active then Connection:Fire(...) end end
        end
    end
    Mouse.TrigEvent = TriggerEvent;UserInputService.TrigEvent = TriggerEvent
    Event.OnServerEvent:Connect(function(FiredBy,Input)
        if FiredBy.Name ~= owner.Name then return end
        if Input.MouseEvent then
            Mouse.Target = Input.Target;Mouse.Hit = Input.Hit
        else
            local Begin = Input.UserInputState == Enum.UserInputState.Begin
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then return Mouse:TrigEvent(Begin and "Button1Down" or "Button1Up") end
            for _,Action in pairs(ContextActionService.Actions) do
                for _,Key in pairs(Action.Keys) do if Key==Input.KeyCode then Action.Function(Action.Name,Input.UserInputState,Input) end end
            end
            Mouse:TrigEvent(Begin and "KeyDown" or "KeyUp",Input.KeyCode.Name:lower())
            UserInputService:TrigEvent(Begin and "InputBegan" or "InputEnded",Input,false)
        end
    end)
    InternalData["Mouse"] = Mouse;InternalData["ContextActionService"] = ContextActionService;InternalData["UserInputService"] = UserInputService
    Event.Parent = owner.Character
end
RealGame = game;game = setmetatable({},{
    __index = function (self,Index)
        local Sandbox = function (Thing)
            if Thing:IsA("Player") then
                local RealPlayer = Thing
                return setmetatable({},{
                    __index = function (self,Index)
                        local Type = type(RealPlayer[Index])
                        if Type == "function" then
                            if Index:lower() == "getmouse" or Index:lower() == "mouse" then
                                return function (self)return InternalData["Mouse"] end
                            end
                            return function (self,...)return RealPlayer[Index](RealPlayer,...) end
                        end
                        return RealPlayer[Index]
                    end;
                    __tostring = function(self) return RealPlayer.Name end
                })
            end
        end
        if RealGame[Index] then
            local Type = type(RealGame[Index])
            if Type == "function" then
                if Index:lower() == "getservice" or Index:lower() == "service" then
                    return function (self,Service)
                        local FakeServices = {
                            ["players"] = function()
                                return setmetatable({},{
                                    __index = function (self2,Index2)
                                        local RealService = RealGame:GetService(Service)
                                        local Type2 = type(Index2)
                                        if Type2 == "function" then
                                            return function (self,...) return RealService[Index2](RealService,...)end
                                        else
                                            if Index2:lower() == "localplayer" then return Sandbox(owner) end
                                            return RealService[Index2]
                                        end
                                    end;
                                    __tostring = function(self) return RealGame:GetService(Service).Name end
                                })
                            end;
                            ["contextactionservice"] = function() return InternalData["ContextActionService"] end;
                            ["userinputservice"] = function() return InternalData["UserInputService"] end;
                            ["runservice"] = function()
                                return setmetatable({},{
                                    __index = function(self2,Index2)
                                        local RealService = RealGame:GetService(Service)
                                        local Type2 = type(Index2)
                                        if Type2 == "function" then
                                            return function (self,...) return RealService[Index2](RealService,...) end
                                        else
                                            local RunServices = {
                                                ["bindtorenderstep"] = function() return function (self,Name,Priority,Function) return RealGame:GetService("RunService").Stepped:Connect(Function) end end;
                                                ["renderstepped"] = function() return RealService["Stepped"] end
                                            }
                                            if RunServices[Index2:lower()] then return RunServices[Index2:lower()]() end
                                            return RealService[Index2]
                                        end
                                    end
                                })
                            end
                        }
                        if FakeServices[Service:lower()] then return FakeServices[Service:lower()]() end
                        return RealGame:GetService(Service)
                    end
                end
                return function (self,...) return RealGame[Index](RealGame,...) end
            else
                if game:GetService(Index) then return game:GetService(Index) end
                return RealGame[Index]
            end
        end
        return nil
    end
});Game = game;owner = game:GetService("Players").LocalPlayer;script = Instance.new("Script");print("Complete! Running...")

print("forcing audio")

local IN = Instance.new

local Frame_Speed = 60

local ArtificialHB = IN("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"

script:WaitForChild("Heartbeat")

local tf = 0
local allowframeloss = false
local tossremainder = false
local lastframe = tick()
local frame = 1/Frame_Speed
ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function swait(num)
	if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 0, num do
			ArtificialHB.Event:wait()
		end
	end
end

local S = setmetatable({},{__index = function(s,i) return game:service(i) end})
local Plrs = S.Players
local Plr = Plrs.LocalPlayer
local Char = Plr.Character

function Sound(parent,id,pitch,volume,looped,effect,autoPlay)
	local Sound = IN("Sound")
	Sound.SoundId = "rbxassetid://".. tostring(id or 0)
	Sound.Pitch = pitch or 1
	Sound.Volume = volume or 1
	Sound.Looped = looped or false
	if(autoPlay)then
		coroutine.wrap(function()
			repeat wait() until Sound.IsLoaded
			Sound.Playing = autoPlay or false
		end)()
	end
	if(not looped and effect)then
		Sound.Ended:connect(function()
			Sound.Volume = 0
			Sound:destroy()
		end)
	elseif(effect)then
		warn("Sound can't be looped and a sound effect!")
	end
	Sound.Parent =parent or Torso
	return Sound
end

local ma = math.random(1,3)	
if ma == 1 then Music.Parent = game:GetService("SoundService") end
if ma == 2 then Music.Parent = game:GetService("Chat") end
if ma == 3 then Music.Parent = game:GetService("ReplicatedStorage") end
			
Music = Sound(Music.Parent,MusicID,MusicPitch,MusicVolume,true,false,true)
Music.Name = 'Music'


while true do
	swait()
	if(not Music or not Music.Parent)then
	local ma = math.random(1,3)	
	if ma == 1 then Music.Parent = game:GetService("SoundService") end
	if ma == 2 then Music.Parent = game:GetService("Chat") end
	if ma == 3 then Music.Parent = game:GetService("ReplicatedStorage") end
	
	print("deleted")
		local a = Music.TimePosition
		Music = Sound(Music.Parent,MusicID,MusicPitch,MusicVolume,true,false,true)
		Music.Name = 'Music'
		Music.TimePosition = a
	end
end
