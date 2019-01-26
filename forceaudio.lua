local MusicID = 2561705325 --replace number with a sound id
local MusicPitch = 1
local MusicVolume = 100

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

local Music = Sound(game.Workspace,MusicID,MusicPitch,MusicVolume,true,false,true)
Music.Name = 'Music'


while true do
	swait()
	if(not Music or not Music.Parent)then
	print("deleted")
		local a = Music.TimePosition
		Music = Sound(game.Workspace,MusicID,MusicPitch,MusicVolume,true,false,true)
		Music.Name = 'Music'
		Music.TimePosition = a
	end
end
