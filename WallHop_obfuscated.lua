local _p=game:GetService("\080\108\097\121\101\114\115")
local _u=game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101")
local _r=game:GetService("\082\117\110\083\101\114\118\105\099\101")

local _pl=_p.LocalPlayer
local _c=_pl.Character or _pl.CharacterAdded:Wait()
local _h=_c:WaitForChild("\072\117\109\097\110\111\105\100")
local _rt=_c:WaitForChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")

local _sg=Instance.new("ScreenGui")
_sg.ResetOnSpawn=false
_sg.Parent=_pl:WaitForChild("\080\108\097\121\101\114\071\117\105")

local _b=Instance.new("TextButton")
_b.Size=UDim2.new(0,180,0,50)
_b.Position=UDim2.new(0.5,-90,0.9,-25)
_b.Text="\087\097\108\108\032\072\111\112\058\032\084\225\186\174\084" -- "Wall Hop: TẮT"
_b.TextColor3=Color3.new(1,1,1)
_b.Font=Enum.Font.SourceSansBold
_b.TextSize=20
_b.Parent=_sg

local _g=Instance.new("UIGradient")
_g.Color=ColorSequence.new{
	ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),
	ColorSequenceKeypoint.new(0.2,Color3.fromRGB(255,255,0)),
	ColorSequenceKeypoint.new(0.4,Color3.fromRGB(0,255,0)),
	ColorSequenceKeypoint.new(0.6,Color3.fromRGB(0,255,255)),
	ColorSequenceKeypoint.new(0.8,Color3.fromRGB(0,0,255)),
	ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,255))
}
_g.Rotation=0
_g.Parent=_b

_r.RenderStepped:Connect(function()
	_g.Rotation=(_g.Rotation+1)%360
end)

local _cr=Instance.new("UICorner")
_cr.CornerRadius=UDim.new(0,15)
_cr.Parent=_b

local _on=false
local _ok=true
local _ang=60
local _d=0.3

_b.MouseButton1Click:Connect(function()
	_on=not _on
	if _on then
		_b.Text="\087\097\108\108\032\072\111\112\058\032\066\225\186\172\084" -- "Wall Hop: BẬT"
	else
		_b.Text="\087\097\108\108\032\072\111\112\058\032\084\225\186\174\084" -- "Wall Hop: TẮT"
	end
end)

_u.JumpRequest:Connect(function()
	if _on and _h and _ok then
		_ok=false
		_h:ChangeState(Enum.HumanoidStateType.Jumping)
		task.delay(0.1,function()
			if _rt then
				_rt.CFrame=_rt.CFrame*CFrame.Angles(0,math.rad(_ang),0)
				task.wait(0.05)
				_rt.CFrame=_rt.CFrame*CFrame.Angles(0,math.rad(-_ang),0)
			end
		end)
		task.wait(_d)
		_ok=true
	end
end)