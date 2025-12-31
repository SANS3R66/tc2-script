local a={cache={}}do do local function __modImpl()











































































































































































































































































































































































































































































































































































































































local b=(cloneref(game:GetService"Players"))
local c=(cloneref(game:GetService"RunService"))
local d=(cloneref(game:GetService"ReplicatedStorage"))
local e=(cloneref(game:GetService"ReplicatedFirst"))

local f={}

local g=false



f.getPlayers=function()
return b
end

f.getRunService=function()
return c
end

f.getReplicatedStorage=function()
return d
end



f.getLocalPlayer=function()
local h=b.LocalPlayer
if not h then

h=b.PlayerAdded:Wait()
end

return h
end

f.getWeapons=function()
return d:FindFirstChild"Weapons"
end


f.getMap=function()
return(workspace:FindFirstChild"Map")
end

f.getMapIgnores=function()
return(f.getMap():FindFirstChild"Ignore")
end

f.getMapBlockBullets=function()
return(f.getMapIgnores():FindFirstChild"BlockBullets")
end

f.getMapNoBuild=function()
return(f.getMapIgnores():FindFirstChild"NoBuild")
end

f.getMapClips=function()
return(f.getMap():FindFirstChild"Clips")
end

f.getMapTriggersHurt=function()
return(f.getMapIgnores():FindFirstChild"trigger_hurt")
end

f.getMapProjectileClips=function()
return(f.getMap().Geometry:FindFirstChild"ProjectileClips")
end


f.getDoctorChangeTarget=function()
local h=f.getLocalPlayer().Character

if not h then

return
else
local i=h:FindFirstChild"Doctor"
if not i then
return
else
local j=(i:FindFirstChild"ChangeValue")
if not j then
return
else
return j
end
end
end
end

f.findNil=function(h,i)
for j,k in next,getnilinstances()do
if k.ClassName==i and k.Name==h then
return k
end
end

return
end


f.shared_breakedAnticheat=function()
return getgenv().tc2_anticheat_breaker==true
end

f.isBypassed=function()
return f.shared_breakedAnticheat()or g
end

f.getModuleAnticheatHash=function()
return"4cb5e36a088b4905dfaa379ac2ed6ac6937ce50a5d4790f90157c75c984aec106b4059e62ec61f324848fde5a2107983"
end

f.getNewLoaderHash=function()
return"2f40fd8aff0a80c48b2aad5816e9c1f0b895056ed1880c88467d22b5723bf9675793cf602b32f2d4560851f1f092c6d4"
end

f.getAnticheatModule=function()
return f.findNil("Module","ModuleScript")
end

f.getNewLoaderScript=function()
return e:FindFirstChild"NewLoader"
end



f.setBypassed=function(h)
g=h
end



f.checkAnticheatHash=function()



local h=f.getNewLoaderScript()
if h then
return getscripthash(h)==f.getNewLoaderHash()
else
warn"there's no NewLoader in ReplicatedFirst. uh"
return false
end









end

f.destroyIfExists=function(h)
if h then
h:Destroy()
end
end

f.clearIfExists=function(h)
if h then
h:ClearAllChildren()
end
end

f.parentToIfExists=function(h,i)
if h and i then
h.Parent=i
end
end

f.noCollisionIfExists=function(h)
if h then
h.CanCollide=false
h.CanTouch=false
h.CanQuery=false
end
end

return f end function a.a()local b=a.cache.a if not b then b={c=__modImpl()}a.cache.a=b end return b.c end end do local function __modImpl()






local b="8.0"


local c=cloneref or function(c)
return c
end

local d={
Theme={
Syntax={
Text=Color3.fromRGB(204,204,204),
Background=Color3.fromRGB(20,20,20),
Selection=Color3.fromRGB(255,255,255),
SelectionBack=Color3.fromRGB(102,161,255),
Operator=Color3.fromRGB(204,204,204),
Number=Color3.fromRGB(255,198,0),
String=Color3.fromRGB(172,240,148),
Comment=Color3.fromRGB(102,102,102),
Keyword=Color3.fromRGB(248,109,124),
BuiltIn=Color3.fromRGB(132,214,247),
LocalMethod=Color3.fromRGB(253,251,172),
LocalProperty=Color3.fromRGB(97,161,241),
Nil=Color3.fromRGB(255,198,0),
Bool=Color3.fromRGB(255,198,0),
Function=Color3.fromRGB(248,109,124),
Local=Color3.fromRGB(248,109,124),
Self=Color3.fromRGB(248,109,124),
FunctionName=Color3.fromRGB(253,251,172),
Bracket=Color3.fromRGB(204,204,204)
},
}
}


local e=setmetatable({},{
__index=function(e,f)
local g=game:GetService(f)
return c(g)
end,
})

local f={
StartAndEnd={
Enum.UserInputType.MouseButton1,
Enum.UserInputType.Touch
},
Movement={
Enum.UserInputType.MouseMovement,
Enum.UserInputType.Touch
}
}

local g=Instance.new"Frame"


local h=e.Players
local i=e.UserInputService
local j=e.RunService
local k=e.TweenService

local l=h.LocalPlayer
local m=l:GetMouse()

local function Merge(n,o)
for p,q in next,o do
n[p]=q
end
return n
end

local function InputTypeAllowed(n,o)
local p=n.UserInputType
return table.find(f[o],p)
end

local n={}

n.CheckMouseInGui=function(o)
if o==nil then return false end
local p=o.AbsolutePosition
local q=o.AbsoluteSize

return m.X>=p.X and m.X<p.X+q.X and m.Y>=p.Y and m.Y<p.Y+q.Y
end

n.Signal=(function()
local o={}

local p=function(p)
local q=table.find(p.Signal.Connections,p)
if q then table.remove(p.Signal.Connections,q)end
end

o.Connect=function(q,r)
if type(r)~="function"then error"Attempt to connect a non-function"end
local s={
Signal=q,
Func=r,
Disconnect=p
}
q.Connections[#q.Connections+1]=s
return s
end

o.Fire=function(q,...)
for r,s in next,q.Connections do
xpcall(coroutine.wrap(s.Func),function(t)warn(t.."\n"..debug.traceback())end,...)
end
end

local q={
__index=o,
__tostring=function(q)
return"Signal: "..tostring(#q.Connections).." Connections"
end
}

local function new()
local r={}
r.Connections={}

return setmetatable(r,q)
end

return{new=new}
end)()

local o=function(o,p)
local q=Instance.new(o)
for r,s in next,p do
q[r]=s
end
return q
end

n.CreateArrow=function(p,q,r)
local s=q
local t=o("Frame",{
BackgroundTransparency=1,
Name="Arrow",
Size=UDim2.new(0,p,0,p)
})
if r=="up"then
for u=1,q do
o("Frame",{
BackgroundColor3=Color3.new(0.8627450980392157,0.8627450980392157,0.8627450980392157),
BorderSizePixel=0,
Position=UDim2.new(0,math.floor(p/2)-(u-1),0,math.floor(p/2)+u-math.floor(s/2)-1),
Size=UDim2.new(0,u+(u-1),0,1),
Parent=t
})
end
return t
elseif r=="down"then
for u=1,q do
o("Frame",{
BackgroundColor3=Color3.new(0.8627450980392157,0.8627450980392157,0.8627450980392157),
BorderSizePixel=0,
Position=UDim2.new(0,math.floor(p/2)-(u-1),0,math.floor(p/2)-u+math.floor(s/2)+1),
Size=UDim2.new(0,u+(u-1),0,1),
Parent=t
})
end
return t
elseif r=="left"then
for u=1,q do
o("Frame",{
BackgroundColor3=Color3.new(0.8627450980392157,0.8627450980392157,0.8627450980392157),
BorderSizePixel=0,
Position=UDim2.new(0,math.floor(p/2)+u-math.floor(s/2)-1,0,math.floor(p/2)-(u-1)),
Size=UDim2.new(0,1,0,u+(u-1)),
Parent=t
})
end
return t
elseif r=="right"then
for u=1,q do
o("Frame",{
BackgroundColor3=Color3.new(0.8627450980392157,0.8627450980392157,0.8627450980392157),
BorderSizePixel=0,
Position=UDim2.new(0,math.floor(p/2)-u+math.floor(s/2)+1,0,math.floor(p/2)-(u-1)),
Size=UDim2.new(0,1,0,u+(u-1)),
Parent=t
})
end
return t
end
error""
end

n.FastWait=(function(p)
task.wait(p)
end)

n.ScrollBar=(function()
local p={}
local q=n.CheckMouseInGui
local r=n.CreateArrow

local function drawThumb(s)
local t=s.TotalSpace
local u=s.VisibleSpace
local v=s.GuiElems.ScrollThumb
local w=s.GuiElems.ScrollThumbFrame

if not(s:CanScrollUp()or s:CanScrollDown())then
v.Visible=false
else
v.Visible=true
end

if s.Horizontal then
v.Size=UDim2.new(u/t,0,1,0)
if v.AbsoluteSize.X<10 then
v.Size=UDim2.new(0,10,1,0)
end
local x=w.AbsoluteSize.X
local y=v.AbsoluteSize.X
v.Position=UDim2.new(s:GetScrollPercent()*(x-y)/x,0,0,0)
else
v.Size=UDim2.new(1,0,u/t,0)
if v.AbsoluteSize.Y<10 then
v.Size=UDim2.new(1,0,0,10)
end
local x=w.AbsoluteSize.Y
local y=v.AbsoluteSize.Y
v.Position=UDim2.new(0,0,s:GetScrollPercent()*(x-y)/x,0)
end
end

local function createFrame(s)
local t=o("Frame",{Style=0,Active=true,AnchorPoint=Vector2.new(0,0),BackgroundColor3=Color3.new(0.35294118523598,0.35294118523598,0.35294118523598),BackgroundTransparency=0,BorderColor3=Color3.new(0.10588236153126,0.16470588743687,0.20784315466881),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1,-10,0,0),Rotation=0,Selectable=false,Size=UDim2.new(0,10,1,0),SizeConstraint=0,Visible=true,ZIndex=1,Name="ScrollBar",})
local u
local v

if s.Horizontal then
t.Size=UDim2.new(1,0,0,10)
u=o("ImageButton",{
Parent=t,
Name="Left",
Size=UDim2.new(0,10,0,10),
BackgroundTransparency=1,
BorderSizePixel=0,
AutoButtonColor=false
})
r(10,4,"left").Parent=u
v=o("ImageButton",{
Parent=t,
Name="Right",
Position=UDim2.new(1,-10,0,0),
Size=UDim2.new(0,10,0,10),
BackgroundTransparency=1,
BorderSizePixel=0,
AutoButtonColor=false
})
r(10,4,"right").Parent=v
else
t.Size=UDim2.new(0,10,1,0)
u=o("ImageButton",{
Parent=t,
Name="Up",
Size=UDim2.new(0,10,0,10),
BackgroundTransparency=1,
BorderSizePixel=0,
AutoButtonColor=false
})
r(10,4,"up").Parent=u
v=o("ImageButton",{
Parent=t,
Name="Down",
Position=UDim2.new(0,0,1,-10),
Size=UDim2.new(0,10,0,10),
BackgroundTransparency=1,
BorderSizePixel=0,
AutoButtonColor=false
})
r(10,4,"down").Parent=v
end

local w=o("Frame",{
BackgroundTransparency=1,
Parent=t
})
if s.Horizontal then
w.Position=UDim2.new(0,10,0,0)
w.Size=UDim2.new(1,-20,1,0)
else
w.Position=UDim2.new(0,0,0,10)
w.Size=UDim2.new(1,0,1,-20)
end

local x=o("Frame",{
BackgroundColor3=Color3.new(0.47058823529411764,0.47058823529411764,0.47058823529411764),
BorderSizePixel=0,
Parent=w
})

local y=o("Frame",{
BackgroundTransparency=1,
Name="Markers",
Size=UDim2.new(1,0,1,0),
Parent=w
})

local z=false
local A=false
local B=false

u.InputBegan:Connect(function(C)
if InputTypeAllowed(C,"Movement")and not z and s:CanScrollUp()then u.BackgroundTransparency=0.8 end
if not InputTypeAllowed(C,"StartAndEnd")or not s:CanScrollUp()then return end
z=true
u.BackgroundTransparency=0.5
if s:CanScrollUp()then
s:ScrollUp()
s.Scrolled:Fire()
end
local D=tick()
local E
E=i.InputEnded:Connect(function(F)
if not InputTypeAllowed(F,"StartAndEnd")then return end
E:Disconnect()
if q(u)and s:CanScrollUp()then u.BackgroundTransparency=0.8 else u.BackgroundTransparency=1 end
z=false
end)
while z do
if tick()-D>=0.3 and s:CanScrollUp()then
s:ScrollUp()
s.Scrolled:Fire()
end
wait()
end
end)
u.InputEnded:Connect(function(C)
if InputTypeAllowed(C,"Movement")and not z then u.BackgroundTransparency=1 end
end)
v.InputBegan:Connect(function(C)
if InputTypeAllowed(C,"Movement")and not z and s:CanScrollDown()then v.BackgroundTransparency=0.8 end
if not InputTypeAllowed(C,"StartAndEnd")or not s:CanScrollDown()then return end
z=true
v.BackgroundTransparency=0.5
if s:CanScrollDown()then
s:ScrollDown()
s.Scrolled:Fire()
end
local D=tick()
local E
E=i.InputEnded:Connect(function(F)
if not InputTypeAllowed(F,"StartAndEnd")then return end
E:Disconnect()
if q(v)and s:CanScrollDown()then v.BackgroundTransparency=0.8 else v.BackgroundTransparency=1 end
z=false
end)
while z do
if tick()-D>=0.3 and s:CanScrollDown()then
s:ScrollDown()
s.Scrolled:Fire()
end
wait()
end
end)
v.InputEnded:Connect(function(C)
if InputTypeAllowed(C,"Movement")and not z then v.BackgroundTransparency=1 end
end)

x.InputBegan:Connect(function(C)
if InputTypeAllowed(C,"Movement")and not A then
x.BackgroundTransparency=0.2
x.BackgroundColor3=s.ThumbSelectColor
end
if not InputTypeAllowed(C,"StartAndEnd")then return end

local D=s.Horizontal and"X"or"Y"
local E

z=false
B=false
A=true
x.BackgroundTransparency=0
local F=m[D]-x.AbsolutePosition[D]
local G
local H
G=i.InputEnded:Connect(function(I)
if not InputTypeAllowed(I,"StartAndEnd")then return end
G:Disconnect()
if H then H:Disconnect()end
if q(x)then
x.BackgroundTransparency=0.2
else
x.BackgroundTransparency=0
x.BackgroundColor3=s.ThumbColor
end
A=false
end)
s:Update()

H=i.InputChanged:Connect(function(I)
if InputTypeAllowed(I,"Movement")and A and G.Connected then
local J=w.AbsoluteSize[D]-x.AbsoluteSize[D]
local K=m[D]-w.AbsolutePosition[D]-F
if K>J then
K=J
elseif K<0 then
K=0
end
if E~=K then
E=K
s:ScrollTo(math.floor(0.5+K/J*(s.TotalSpace-s.VisibleSpace)))
end
wait()
end
end)
end)
x.InputEnded:Connect(function(C)
if InputTypeAllowed(C,"Movement")and not A then
x.BackgroundTransparency=0
x.BackgroundColor3=s.ThumbColor
end
end)
w.InputBegan:Connect(function(C)
if not InputTypeAllowed(C,"StartAndEnd")or q(x)then return end

local D=s.Horizontal and"X"or"Y"
local E=0
if m[D]>=x.AbsolutePosition[D]+x.AbsoluteSize[D]then
E=1
end

local function doTick()
local F=s.VisibleSpace-1
if E==0 and m[D]<x.AbsolutePosition[D]then
s:ScrollTo(s.Index-F)
elseif E==1 and m[D]>=x.AbsolutePosition[D]+x.AbsoluteSize[D]then
s:ScrollTo(s.Index+F)
end
end

A=false
B=true
doTick()
local F=tick()
local G
G=i.InputEnded:Connect(function(H)
if not InputTypeAllowed(H,"StartAndEnd")then return end
G:Disconnect()
B=false
end)
while B do
if tick()-F>=0.3 and q(w)then
doTick()
end
wait()
end
end)

t.MouseWheelForward:Connect(function()
s:ScrollTo(s.Index-s.WheelIncrement)
end)

t.MouseWheelBackward:Connect(function()
s:ScrollTo(s.Index+s.WheelIncrement)
end)

s.GuiElems.ScrollThumb=x
s.GuiElems.ScrollThumbFrame=w
s.GuiElems.Button1=u
s.GuiElems.Button2=v
s.GuiElems.MarkerFrame=y

return t
end

p.Update=function(s,t)
local u=s.TotalSpace
local v=s.VisibleSpace
local w=s.GuiElems.Button1
local x=s.GuiElems.Button2

s.Index=math.clamp(s.Index,0,math.max(0,u-v))

if s.LastTotalSpace~=s.TotalSpace then
s.LastTotalSpace=s.TotalSpace
s:UpdateMarkers()
end

if s:CanScrollUp()then
for y,z in pairs(w.Arrow:GetChildren())do
z.BackgroundTransparency=0
end
else
w.BackgroundTransparency=1
for y,z in pairs(w.Arrow:GetChildren())do
z.BackgroundTransparency=0.5
end
end
if s:CanScrollDown()then
for y,z in pairs(x.Arrow:GetChildren())do
z.BackgroundTransparency=0
end
else
x.BackgroundTransparency=1
for y,z in pairs(x.Arrow:GetChildren())do
z.BackgroundTransparency=0.5
end
end

drawThumb(s)
end

p.UpdateMarkers=function(s)
local t=s.GuiElems.MarkerFrame
t:ClearAllChildren()

for u,v in pairs(s.Markers)do
if u<s.TotalSpace then
o("Frame",{
BackgroundTransparency=0,
BackgroundColor3=v,
BorderSizePixel=0,
Position=s.Horizontal and UDim2.new(u/s.TotalSpace,0,1,-6)or UDim2.new(1,-6,u/s.TotalSpace,0),
Size=s.Horizontal and UDim2.new(0,1,0,6)or UDim2.new(0,6,0,1),
Name="Marker"..tostring(u),
Parent=t
})
end
end
end

p.AddMarker=function(s,t,u)
s.Markers[t]=u or Color3.new(0,0,0)
end
p.ScrollTo=function(s,t,u)
s.Index=t
s:Update()
if not u then
s.Scrolled:Fire()
end
end
p.ScrollUp=function(s)
s.Index=s.Index-s.Increment
s:Update()
end
p.ScrollDown=function(s)
s.Index=s.Index+s.Increment
s:Update()
end
p.CanScrollUp=function(s)
return s.Index>0
end
p.CanScrollDown=function(s)
return s.Index+s.VisibleSpace<s.TotalSpace
end
p.GetScrollPercent=function(s)
return s.Index/(s.TotalSpace-s.VisibleSpace)
end
p.SetScrollPercent=function(s,t)
s.Index=math.floor(t*(s.TotalSpace-s.VisibleSpace))
s:Update()
end

p.Texture=function(s,t)
s.ThumbColor=t.ThumbColor or Color3.new(0,0,0)
s.ThumbSelectColor=t.ThumbSelectColor or Color3.new(0,0,0)
s.GuiElems.ScrollThumb.BackgroundColor3=t.ThumbColor or Color3.new(0,0,0)
s.Gui.BackgroundColor3=t.FrameColor or Color3.new(0,0,0)
s.GuiElems.Button1.BackgroundColor3=t.ButtonColor or Color3.new(0,0,0)
s.GuiElems.Button2.BackgroundColor3=t.ButtonColor or Color3.new(0,0,0)
for u,v in pairs(s.GuiElems.Button1.Arrow:GetChildren())do
v.BackgroundColor3=t.ArrowColor or Color3.new(0,0,0)
end
for u,v in pairs(s.GuiElems.Button2.Arrow:GetChildren())do
v.BackgroundColor3=t.ArrowColor or Color3.new(0,0,0)
end
end

p.SetScrollFrame=function(s,t)
if s.ScrollUpEvent then
s.ScrollUpEvent:Disconnect()
s.ScrollUpEvent=nil
end
if s.ScrollDownEvent then
s.ScrollDownEvent:Disconnect()
s.ScrollDownEvent=nil
end
s.ScrollUpEvent=t.MouseWheelForward:Connect(function()s:ScrollTo(s.Index-s.WheelIncrement)end)
s.ScrollDownEvent=t.MouseWheelBackward:Connect(function()s:ScrollTo(s.Index+s.WheelIncrement)end)
end

local s={}
s.__index=p

local function new(t)
local u=setmetatable({
Index=0,
VisibleSpace=0,
TotalSpace=0,
Increment=1,
WheelIncrement=1,
Markers={},
GuiElems={},
Horizontal=t,
LastTotalSpace=0,
Scrolled=n.Signal.new()
},s)
u.Gui=createFrame(u)
u:Texture{
ThumbColor=Color3.fromRGB(60,60,60),
ThumbSelectColor=Color3.fromRGB(75,75,75),
ArrowColor=Color3.new(1,1,1),
FrameColor=Color3.fromRGB(40,40,40),
ButtonColor=Color3.fromRGB(75,75,75)
}
return u
end

return{new=new}
end)()

n.CodeFrame=(function()
local p={}

local q={
[1]="String",
[2]="String",
[3]="String",
[4]="Comment",
[5]="Operator",
[6]="Number",
[7]="Keyword",
[8]="BuiltIn",
[9]="LocalMethod",
[10]="LocalProperty",
[11]="Nil",
[12]="Bool",
[13]="Function",
[14]="Local",
[15]="Self",
[16]="FunctionName",
[17]="Bracket"
}

local r={
["nil"]=11,
["true"]=12,
["false"]=12,
["function"]=13,
["local"]=14,self=
15
}

local s={
["and"]=true,
["break"]=true,
["do"]=true,
["else"]=true,
["elseif"]=true,
["end"]=true,
["false"]=true,
["for"]=true,
["function"]=true,
["if"]=true,
["in"]=true,
["local"]=true,
["nil"]=true,
["not"]=true,
["or"]=true,
["repeat"]=true,
["return"]=true,
["then"]=true,
["true"]=true,
["until"]=true,
["while"]=true,plugin=
true
}

local t={delay=
true,elapsedTime=
true,require=
true,spawn=
true,tick=
true,time=
true,typeof=
true,UserSettings=
true,wait=
true,warn=
true,game=
true,shared=
true,script=
true,workspace=
true,assert=
true,collectgarbage=
true,error=
true,getfenv=
true,getmetatable=
true,ipairs=
true,loadstring=
true,newproxy=
true,next=
true,pairs=
true,pcall=
true,print=
true,rawequal=
true,rawget=
true,rawset=
true,select=
true,setfenv=
true,setmetatable=
true,tonumber=
true,tostring=
true,type=
true,unpack=
true,xpcall=
true,_G=
true,_VERSION=
true,coroutine=
true,debug=
true,math=
true,os=
true,string=
true,table=
true,bit32=
true,utf8=
true,Axes=
true,BrickColor=
true,CFrame=
true,Color3=
true,ColorSequence=
true,ColorSequenceKeypoint=
true,DockWidgetPluginGuiInfo=
true,Enum=
true,Faces=
true,Instance=
true,NumberRange=
true,NumberSequence=
true,NumberSequenceKeypoint=
true,PathWaypoint=
true,PhysicalProperties=
true,Random=
true,Ray=
true,Rect=
true,Region3=
true,Region3int16=
true,TweenInfo=
true,UDim=
true,UDim2=
true,Vector2=
true,Vector2int16=
true,Vector3=
true,Vector3int16=
true,Drawing=


true,syn=
true,crypt=
true,cache=
true,bit=
true,readfile=



true,writefile=
true,isfile=
true,appendfile=
true,listfiles=
true,loadfile=
true,isfolder=
true,makefolder=
true,delfolder=
true,delfile=
true,setclipboard=


true,setfflag=
true,getnamecallmethod=
true,isluau=
true,setnonreplicatedproperty=
true,getspecialinfo=
true,saveinstance=
true,rconsoleprint=



true,rconsoleinfo=
true,rconsolewarn=
true,rconsoleerr=
true,rconsoleclear=
true,rconsolename=
true,rconsoleinput=
true,rconsoleinputasync=
true,printconsole=
true,checkcaller=



true,islclosure=
true,iscclosure=
true,dumpstring=
true,decompile=
true,hookfunction=


true,newcclosure=
true,isrbxactive=


true,keypress=
true,keyrelease=
true,mouse1click=

true,mouse1press=
true,mouse1release=
true,mouse2click=

true,mouse2press=
true,mouse2release=
true,mousescroll=

true,mousemoveabs=
true,mousemoverel=
true,getrawmetatable=


true,setrawmetatable=
true,setreadonly=
true,isreadonly=
true,getsenv=


true,getcallingscript=
true,getgenv=


true,getrenv=
true,getreg=
true,getgc=
true,getinstances=
true,getnilinstances=
true,getscripts=
true,getloadedmodules=
true,getconnections=
true,firesignal=
true,fireclickdetector=
true,firetouchinterest=
true,fireproximityprompt=
true
}

local u=false

local v={
["'"]="&apos;",
["\""]="&quot;",
["<"]="&lt;",
[">"]="&gt;",
["&"]="&amp;"
}

local w="\205"
local x=(" %s%s "):format(w,w)

local y={
[("[^%s] %s"):format(w,w)]=0,
[(" %s%s"):format(w,w)]=-1,
[("%s%s "):format(w,w)]=2,
[("%s [^%s]"):format(w,w)]=1,
}

local z={}

local function initBuiltIn()
local A=getfenv()
local B=type
local C=tostring
for D,E in next,t do
local F=A[D]
if B(F)=="table"then
local G={}
for H,I in next,F do
G[H]=true
end
t[D]=G
end
end

local D={}
local E=Enum:GetEnums()
for F=1,#E do
D[C(E[F])]=true
end
t.Enum=D

u=true
end

local function setupEditBox(A)
local B=A.GuiElems.EditBox

B.Focused:Connect(function()
A:ConnectEditBoxEvent()
A.Editing=true
end)

B.FocusLost:Connect(function()
A:DisconnectEditBoxEvent()
A.Editing=false
end)

B:GetPropertyChangedSignal"Text":Connect(function()
local C=B.Text
if#C==0 or A.EditBoxCopying then return end

C=C:gsub("\t","    ")

B.Text=""
A:AppendText(C)
end)

end

local function setupMouseSelection(A)
local B=A.GuiElems.LinesFrame
local C=A.Lines

B.InputBegan:Connect(function(D)
if InputTypeAllowed(D,"StartAndEnd")then
local E,F=math.ceil(A.FontSize/2),A.FontSize

local G=m.X-B.AbsolutePosition.X
local H=m.Y-B.AbsolutePosition.Y
local I=math.round(G/E)+A.ViewX
local J=math.floor(H/F)+A.ViewY

local K,L,M
local N,O=0,0
J=math.min(#C-1,J)
local P=C[J+1]or""
I=math.min(#P,I+A:TabAdjust(I,J))

A.SelectionRange={{-1,-1},{-1,-1}}
A:MoveCursor(I,J)
A.FloatCursorX=I

local function updateSelection()
local Q=m.X-B.AbsolutePosition.X
local R=m.Y-B.AbsolutePosition.Y
local S=math.max(0,math.round(Q/E)+A.ViewX)
local T=math.max(0,math.floor(R/F)+A.ViewY)

T=math.min(#C-1,T)
local U=C[T+1]or""
S=math.min(#U,S+A:TabAdjust(S,T))

if T<J or(T==J and S<I)then
A.SelectionRange={{S,T},{I,J}}
else
A.SelectionRange={{I,J},{S,T}}
end

A:MoveCursor(S,T)
A.FloatCursorX=S
A:Refresh()
end

K=i.InputEnded:Connect(function(Q)
if InputTypeAllowed(Q,"StartAndEnd")then
K:Disconnect()
L:Disconnect()
M:Disconnect()
A:SetCopyableSelection()

end
end)

L=i.InputChanged:Connect(function(Q)
if InputTypeAllowed(Q,"Movement")then
local R=m.Y-B.AbsolutePosition.Y
local S=m.Y-B.AbsolutePosition.Y-B.AbsoluteSize.Y
local T=m.X-B.AbsolutePosition.X
local U=m.X-B.AbsolutePosition.X-B.AbsoluteSize.X
N=0
O=0
if S>0 then
N=math.floor(S*0.05)+1
elseif R<0 then
N=math.ceil(R*0.05)-1
end
if U>0 then
O=math.floor(U*0.05)+1
elseif T<0 then
O=math.ceil(T*0.05)-1
end
updateSelection()
end
end)

M=j.RenderStepped:Connect(function()
if N~=0 or O~=0 then
A:ScrollDelta(O,N)
updateSelection()
end
end)

A:Refresh()
end
end)
end

function p.MakeEditorFrame(A)
local B=Instance.new'TextButton'
B.BackgroundTransparency=1
B.TextTransparency=1
B.BackgroundColor3=Color3.fromRGB(40,40,40);
B.BorderSizePixel=0;
B.Size=UDim2.fromOffset(100,100);
B.Visible=true;
local C={}

local D=Instance.new"Frame"
D.Name="Lines"
D.BackgroundTransparency=1
D.Size=UDim2.new(1,0,1,0)
D.ClipsDescendants=true
D.Parent=B

local E=Instance.new"TextLabel"
E.Name="LineNumbers"
E.BackgroundTransparency=1
E.FontFace=A.FontFace
E.TextXAlignment=Enum.TextXAlignment.Right
E.TextYAlignment=Enum.TextYAlignment.Top
E.ClipsDescendants=true
E.RichText=true
E.Parent=B

g.Name="Cursor"
g.BackgroundColor3=Color3.fromRGB(220,220,220)
g.BorderSizePixel=0
g.Parent=B

local F=Instance.new"TextBox"
F.Name="EditBox"
F.MultiLine=true
F.Visible=false
F.Parent=B
F.TextSize=A.FontSize
F.FontFace=A.FontFace

z.Invis=k:Create(g,TweenInfo.new(0,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{BackgroundTransparency=1})
z.Vis=k:Create(g,TweenInfo.new(0,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{BackgroundTransparency=0})

local G=Instance.new'Frame'
G.BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945);G.BorderSizePixel=0;G.Name="ScrollCorner";G.Position=UDim2.new(1,-10,1,-10);G.Size=UDim2.new(0,10,0,10);G.Visible=false;

C.ScrollCorner=G
C.LinesFrame=D
C.LineNumbersLabel=E
C.Cursor=g
C.EditBox=F
C.ScrollCorner.Parent=B

D.InputBegan:Connect(function(H)
if InputTypeAllowed(H,"StartAndEnd")then
A:SetEditing(true,H)
end
end)

A.Frame=B
A.Gui=B
A.GuiElems=C
setupEditBox(A)
setupMouseSelection(A)

return B
end

p.GetSelectionText=function(A)
if not A:IsValidRange()then return""end

local B=A.SelectionRange
local C,D=B[1][1],B[1][2]
local E,F=B[2][1],B[2][2]
local G=F-D
local H=A.Lines

if not H[D+1]or not H[F+1]then return""end

if G==0 then
return A:ConvertText(H[D+1]:sub(C+1,E),false)
end

local I=H[D+1]:sub(C+1)
local J=H[F+1]:sub(1,E)

local K=I.."\n"
for L=D+1,F-1 do
K=K..H[L+1].."\n"
end
K=K..J

return A:ConvertText(K,false)
end

p.SetCopyableSelection=function(A)
local B=A:GetSelectionText()
local C=A.GuiElems.EditBox

A.EditBoxCopying=true
C.Text=B
C.SelectionStart=1
C.CursorPosition=#C.Text+1
A.EditBoxCopying=false
end

p.ConnectEditBoxEvent=function(A)
if A.EditBoxEvent then
A.EditBoxEvent:Disconnect()
end

A.EditBoxEvent=i.InputBegan:Connect(function(B)
if B.UserInputType~=Enum.UserInputType.Keyboard then return end

local C=Enum.KeyCode
local D=B.KeyCode

local function setupMove(E,F)
local G,H
G=i.InputEnded:Connect(function(I)
if I.KeyCode~=E then return end
G:Disconnect()
H=true
end)
F()
n.FastWait(0.5)
while not H do
F()
n.FastWait(0.03)
end
end

if D==C.Down then
setupMove(C.Down,function()
A.CursorX=A.FloatCursorX
A.CursorY=A.CursorY+1
A:UpdateCursor()
A:JumpToCursor()
end)
elseif D==C.Up then
setupMove(C.Up,function()
A.CursorX=A.FloatCursorX
A.CursorY=A.CursorY-1
A:UpdateCursor()
A:JumpToCursor()
end)
elseif D==C.Left then
setupMove(C.Left,function()
local E=A.Lines[A.CursorY+1]or""
A.CursorX=A.CursorX-1-(E:sub(A.CursorX-3,A.CursorX)==x and 3 or 0)
if A.CursorX<0 then
A.CursorY=A.CursorY-1
local F=A.Lines[A.CursorY+1]or""
A.CursorX=#F
end
A.FloatCursorX=A.CursorX
A:UpdateCursor()
A:JumpToCursor()
end)
elseif D==C.Right then
setupMove(C.Right,function()
local E=A.Lines[A.CursorY+1]or""
A.CursorX=A.CursorX+1+(E:sub(A.CursorX+1,A.CursorX+4)==x and 3 or 0)
if A.CursorX>#E then
A.CursorY=A.CursorY+1
A.CursorX=0
end
A.FloatCursorX=A.CursorX
A:UpdateCursor()
A:JumpToCursor()
end)
elseif D==C.Backspace then
setupMove(C.Backspace,function()
local E,F
if A:IsValidRange()then
E=A.SelectionRange[1]
F=A.SelectionRange[2]
else
F={A.CursorX,A.CursorY}
end

if not E then
local G=A.Lines[A.CursorY+1]or""
A.CursorX=A.CursorX-1-(G:sub(A.CursorX-3,A.CursorX)==x and 3 or 0)
if A.CursorX<0 then
A.CursorY=A.CursorY-1
local H=A.Lines[A.CursorY+1]or""
A.CursorX=#H
end
A.FloatCursorX=A.CursorX
A:UpdateCursor()

E=E or{A.CursorX,A.CursorY}
end

A:DeleteRange({E,F},false,true)
A:ResetSelection(true)
A:JumpToCursor()
end)
elseif D==C.Delete then
setupMove(C.Delete,function()
local E,F
if A:IsValidRange()then
E=A.SelectionRange[1]
F=A.SelectionRange[2]
else
E={A.CursorX,A.CursorY}
end

if not F then
local G=A.Lines[A.CursorY+1]or""
local H=A.CursorX+1+(G:sub(A.CursorX+1,A.CursorX+4)==x and 3 or 0)
local I=A.CursorY
if H>#G then
I=I+1
H=0
end
A:UpdateCursor()

F=F or{H,I}
end

A:DeleteRange({E,F},false,true)
A:ResetSelection(true)
A:JumpToCursor()
end)
elseif i:IsKeyDown(Enum.KeyCode.LeftControl)then
if D==C.A then
A.SelectionRange={{0,5},{#A.Lines[#A.Lines],#A.Lines-1}}
A:SetCopyableSelection()
A:Refresh()
end
end
end)
end

p.DisconnectEditBoxEvent=function(A)
if A.EditBoxEvent then
A.EditBoxEvent:Disconnect()
g.BackgroundTransparency=1
p.CursorAnim(A,false)
end
end

p.ResetSelection=function(A,B)
A.SelectionRange={{-1,-1},{-1,-1}}
if not B then A:Refresh()end
end

p.IsValidRange=function(A,B)
local C=B or A.SelectionRange
local D,E=C[1][1],C[1][2]
local F,G=C[2][1],C[2][2]

if D==-1 or(D==F and E==G)then return false end

return true
end

p.DeleteRange=function(A,B,C,D)
B=B or A.SelectionRange
if not A:IsValidRange(B)then return end

local E=A.Lines
local F,G=B[1][1],B[1][2]
local H,I=B[2][1],B[2][2]
local J=I-G

if not E[G+1]or not E[I+1]then return end

local K=E[G+1]:sub(1,F)
local L=E[I+1]:sub(H+1)
E[G+1]=K..L

local M=table.remove
for N=1,J do
M(E,G+2)
end

if B==A.SelectionRange then A.SelectionRange={{-1,-1},{-1,-1}}end
if D then
A.CursorX=F
A.CursorY=G
A:UpdateCursor()
end

if not C then
A:ProcessTextChange()
end
end

p.AppendText=function(A,B)
A:DeleteRange(nil,true,true)
local C,D,E=A.Lines,A.CursorX,A.CursorY
local F=C[E+1]
local G=F:sub(1,D)
local H=F:sub(D+1)

B=B:gsub("\r\n","\n")
B=A:ConvertText(B,true)

local I=B:split"\n"
local J=table.insert

for K=1,#I do
local L=E+K
if K>1 then J(C,L,"")end

local M=I[K]
local N=(K==1 and G or"")
local O=(K==#I and H or"")

C[L]=N..M..O
end

if#I>1 then D=0 end

A:ProcessTextChange()
A.CursorX=D+#I[#I]
A.CursorY=E+#I-1
A:UpdateCursor()
end

p.ScrollDelta=function(A,B,C)
A.ScrollV:ScrollTo(A.ScrollV.Index+C)
A.ScrollH:ScrollTo(A.ScrollH.Index+B)
end


p.TabAdjust=function(A,B,C)
local D=A.Lines
local E=D[C+1]
B=B+1

if E then
local F=E:sub(B-1,B-1)
local G=E:sub(B,B)
local H=E:sub(B+1,B+1)
local I=(#F>0 and F or" ")..(#G>0 and G or" ")..(#H>0 and H or" ")

for J,K in pairs(y)do
if I:find(J)then
return K
end
end
end
return 0
end

p.SetEditing=function(A,B,C)
if C then
A:UpdateCursor(C)
end

if B then
if A.Editable then
A.GuiElems.EditBox.Text=""
A.GuiElems.EditBox:CaptureFocus()
end
else
A.GuiElems.EditBox:ReleaseFocus()
end
end

p.CursorAnim=function(A,B)
local C=A.GuiElems.Cursor
local D=tick()
A.LastAnimTime=D

if not B then return end

z.Invis:Cancel()
z.Vis:Cancel()
C.BackgroundTransparency=0

coroutine.wrap(function()
while A.Editable do
n.FastWait(0.5)
if A.LastAnimTime~=D then return end
z.Invis:Play()
n.FastWait(0.5)
if A.LastAnimTime~=D then return end
z.Vis:Play()

end
end)()
end

p.MoveCursor=function(A,B,C)
A.CursorX=B
A.CursorY=C
A:UpdateCursor()
A:JumpToCursor()
end

p.JumpToCursor=function(A)
A:Refresh()
end

p.UpdateCursor=function(A,B)
local C=A.GuiElems.LinesFrame
local D=A.GuiElems.Cursor
local E=math.max(0,C.AbsoluteSize.X)
local F=math.max(0,C.AbsoluteSize.Y)
local G=math.ceil(F/A.FontSize)
local H=math.ceil(E/math.ceil(A.FontSize/2))
local I,J=A.ViewX,A.ViewY
local K=tostring(#A.Lines)
local L=math.ceil(A.FontSize/2)
local M=#K*L+4*L

if B then
local N=A.GuiElems.LinesFrame
local O,P=N.AbsolutePosition.X,N.AbsolutePosition.Y
local Q,R=B.Position.X,B.Position.Y
local S,T=math.ceil(A.FontSize/2),A.FontSize

A.CursorX=A.ViewX+math.round((Q-O)/S)
A.CursorY=A.ViewY+math.floor((R-P)/T)
end

local N,O=A.CursorX,A.CursorY

local P=A.Lines[O+1]or""
if N>#P then N=#P
elseif N<0 then N=0 end

if O>=#A.Lines then
O=math.max(0,#A.Lines-1)
elseif O<0 then
O=0
end

N=N+A:TabAdjust(N,O)


A.CursorX=N
A.CursorY=O

local Q=(N>=I)and(O>=J)and(N<=I+H)and(O<=J+G)
if Q then
local R=(N-I)
local S=(O-J)
D.Position=UDim2.new(0,M+R*math.ceil(A.FontSize/2)-1,0,S*A.FontSize)
D.Size=UDim2.new(0,1,0,A.FontSize+2)
D.Visible=true
A:CursorAnim(true)
else
D.Visible=false
end
end

p.MapNewLines=function(A)
local B={}
local C=1
local D=A.Text
local E=string.find
local F=1

local G=E(D,"\n",F,true)
while G do
B[C]=G
C=C+1
F=G+1
G=E(D,"\n",F,true)
end

A.NewLines=B
end

p.PreHighlight=function(A)
local B=A.Text:gsub("\\\\","  ")
local C=#B
local D={}
local E={}
local F={}
local G=string.find
local H=string.sub
A.ColoredLines={}

local function findAll(I,J,K,L)
local M=#D+1
local N=1
local O,P,Q=G(I,J,N,L)
while O do
D[M]=O
E[O]=K
if Q then
F[O]=Q
end

M=M+1
N=P+1
O,P,Q=G(I,J,N,L)
end
end

findAll(B,'"',1,true)
findAll(B,"'",2,true)
findAll(B,"%[(=*)%[",3)
findAll(B,"--",4,true)
table.sort(D)

local I=A.NewLines
local J=0
local K=0
local L=0
local M={}

for N=1,#D do
local O=D[N]
if O<=L then continue end

local P=O
local Q=E[O]
if Q==1 then
P=G(B,'"',O+1,true)
while P and H(B,P-1,P-1)=="\\"do
P=G(B,'"',P+1,true)
end
if not P then P=C end
elseif Q==2 then
P=G(B,"'",O+1,true)
while P and H(B,P-1,P-1)=="\\"do
P=G(B,"'",P+1,true)
end
if not P then P=C end
elseif Q==3 then
_,P=G(B,"]"..F[O].."]",O+1,true)
if not P then P=C end
elseif Q==4 then
local R=E[O+2]

if R==3 then
_,P=G(B,"]"..F[O+2].."]",O+1,true)
if not P then P=C end
else
P=G(B,"\n",O+1,true)or C
end
end

while O>K do
J=J+1

K=I[J]or C+1
end
while true do
local R=M[J]
if not R then
R={}
M[J]=R
end
R[O]={Q,P}


if P>K then
J=J+1
K=I[J]or C+1
else
break
end
end

L=P

end
A.PreHighlights=M


end

p.HighlightLine=function(A,B)
local C=A.ColoredLines[B]
if C then return C end

local D=string.sub
local E=string.find
local F=string.match
local G={}
local H=A.PreHighlights[B]or{}
local I=A.Lines[B]or""
local J=0
local K=0
local L
local M=false
local N=0
local O=A.NewLines[B-1]or 0

local P={}
for Q,R in next,H do
local S=Q-O
if S<1 then
K=R[1]
J=R[2]-O

else
P[S]={R[1],R[2]-O}
end
end

for Q=1,#I do
if Q<=J then
G[Q]=K
continue
end

local R=P[Q]
if R then
K=R[1]
J=R[2]
G[Q]=K
M=false
L=nil
N=0
else
local S=D(I,Q,Q)
if E(S,"[%a_]")then
local T=F(I,"[%a%d_]+",Q)
local U=(s[T]and 7)or(t[T]and 8)

J=Q+#T-1

if U~=7 then
if M then
local V=L and t[L]
U=(V and type(V)=="table"and V[T]and 8)or 10
end

if U~=8 then local
V, W, X=E(I,"^%s*([%({\"'])",J+1)
if V then
U=(N>0 and X=="("and 16)or 9
N=0
end
end
else
U=r[T]or U
N=(T=="function"and 1 or 0)
end

L=T
M=false
if N>0 then N=1 end

if U then
K=U
G[Q]=K
else
K=nil
end
elseif E(S,"%p")then
local T=(S==".")
local U=T and E(D(I,Q+1,Q+1),"%d")
G[Q]=(U and 6 or 5)

if not U then
local V=T and F(I,"%.%.?%.?",Q)
if V and#V>1 then
K=5
J=Q+#V-1
M=false
L=nil
N=0
else
if T then
if M then
L=nil
else
M=true
end
else
M=false
L=nil
end

N=((T or S==":")and N==1 and 2)or 0
end
end
elseif E(S,"%d")then local
T, U=E(I,"%x+",Q)
local V=D(I,U,U+1)
if(V=="e+"or V=="e-")and E(D(I,U+2,U+2),"%d")then
U=U+1
end
K=6
J=U
G[Q]=6
M=false
L=nil
N=0
else
G[Q]=K local
T, U=E(I,"%s+",Q)
if U then
J=U
end
end
end
end

A.ColoredLines[B]=G
return G
end

p.Refresh=function(A)
local B=A.Frame.Lines
local C=math.max(0,B.AbsoluteSize.X)
local D=math.max(0,B.AbsoluteSize.Y)
local E=math.ceil(D/A.FontSize)
local F=math.ceil(C/math.ceil(A.FontSize/2))
local G=string.gsub
local H=string.sub

local I,J=A.ViewX,A.ViewY

local K=""

for L=1,E do
local M=A.LineFrames[L]
if not M then
M=Instance.new"Frame"
M.Name="Line"
M.Position=UDim2.new(0,0,0,(L-1)*A.FontSize)
M.Size=UDim2.new(1,0,0,A.FontSize)
M.BorderSizePixel=0
M.BackgroundTransparency=1

local N=Instance.new"Frame"
N.Name="SelectionHighlight"
N.BorderSizePixel=0
N.BackgroundColor3=d.Theme.Syntax.SelectionBack
N.Parent=M
N.BackgroundTransparency=0.7

local O=Instance.new"TextLabel"
O.Name="Label"
O.BackgroundTransparency=1
O.FontFace=A.FontFace
O.TextSize=A.FontSize
O.Size=UDim2.new(1,0,0,A.FontSize)
O.RichText=true
O.TextXAlignment=Enum.TextXAlignment.Left
O.TextColor3=A.Colors.Text
O.ZIndex=2
O.Parent=M

M.Parent=B
A.LineFrames[L]=M
end

local N=J+L
local O=A.Lines[N]or""
local P=""
local Q=A:HighlightLine(N)
local R=I+1

local S=A.RichTemplates
local T=S.Text local U=
S.Selection
local V=Q[R]
local W=S[q[V] ]or T


local X=A.SelectionRange
local Y=X[1]
local Z=X[2]local
_=N-1

if _>=Y[2]and _<=Z[2]then
local aa=math.ceil(A.FontSize/2)
local ab=(_==Y[2]and Y[1]or 0)-I
local ac=(_==Z[2]and Z[1]-ab-I or F+I)

M.SelectionHighlight.Position=UDim2.new(0,ab*aa,0,0)
M.SelectionHighlight.Size=UDim2.new(0,ac*aa,1,0)
M.SelectionHighlight.Visible=true
else
M.SelectionHighlight.Visible=false
end

for aa=2,F do
local ab=I+aa
local ac=Q[ab]

if ac~=V then
local ad=S[q[ac] ]or T

if ad~=W then
local ae=G(H(O,R,ab-1),"['\"<>&]",v)
P=P..(W~=T and(W..ae.."</font>")or ae)
R=ab
W=ad
end
V=ac
end
end

local aa=G(H(O,R,I+F),"['\"<>&]",v)

if#aa>0 then
P=P..(W~=T and(W..aa.."</font>")or aa)
end

if A.Lines[N]then
K=K..(N-1==A.CursorY and('<b>'..N.."</b>\n")or N.."\n")
end

M.Label.Text=P
end

for aa=E+1,#A.LineFrames do
A.LineFrames[aa]:Destroy()
A.LineFrames[aa]=nil
end

A.Frame.LineNumbers.Text=K
A:UpdateCursor()


end

p.UpdateView=function(aa)
local ab=tostring(#aa.Lines)
local ac=math.ceil(aa.FontSize/2)
local ad=#ab*ac+4*ac

local ae=aa.Frame.Lines
local A=ae.AbsoluteSize.X
local B=ae.AbsoluteSize.Y
local C=math.ceil(B/aa.FontSize)
local D=aa.MaxTextCols*ac
local E=aa.ScrollV
local F=aa.ScrollH

E.VisibleSpace=C
E.TotalSpace=#aa.Lines+1
F.VisibleSpace=math.ceil(A/ac)
F.TotalSpace=aa.MaxTextCols+1

E.Gui.Visible=#aa.Lines+1>C
F.Gui.Visible=D>A

local G=aa.FrameOffsets
aa.FrameOffsets=Vector2.new(E.Gui.Visible and-10 or 0,F.Gui.Visible and-10 or 0)
if G~=aa.FrameOffsets then
aa:UpdateView()
else
E:ScrollTo(aa.ViewY,true)
F:ScrollTo(aa.ViewX,true)

if E.Gui.Visible and F.Gui.Visible then
E.Gui.Size=UDim2.new(0,10,1,-10)
F.Gui.Size=UDim2.new(1,-10,0,10)
aa.GuiElems.ScrollCorner.Visible=true
else
E.Gui.Size=UDim2.new(0,10,1,0)
F.Gui.Size=UDim2.new(1,0,0,10)
aa.GuiElems.ScrollCorner.Visible=false
end

aa.ViewY=E.Index
aa.ViewX=F.Index
aa.Frame.Lines.Position=UDim2.new(0,ad,0,0)
aa.Frame.Lines.Size=UDim2.new(1,-ad+G.X,1,G.Y)
aa.Frame.LineNumbers.Position=UDim2.new(0,ac,0,0)
aa.Frame.LineNumbers.Size=UDim2.new(0,#ab*ac,1,G.Y)
aa.Frame.LineNumbers.TextSize=aa.FontSize
end
end

p.ProcessTextChange=function(aa)
local ab=0
local ac=aa.Lines

for ad=1,#ac do
local ae=#ac[ad]
if ae>ab then
ab=ae
end
end

aa.MaxTextCols=ab
aa:UpdateView()
aa.Text=table.concat(aa.Lines,"\n")
aa:MapNewLines()
aa:PreHighlight()
aa:Refresh()

end

p.ConvertText=function(aa,ab,ac)
if ac then
local ad=ab:gsub("\t","    ")
return ad:gsub("\t",(" %s%s "):format(w,w))
else
return ab:gsub((" %s%s "):format(w,w),"\t")
end
end

p.GetText=function(aa)
local ab=table.concat(aa.Lines,"\n")
return aa:ConvertText(ab,false)
end

p.SetText=function(aa,ab)
ab=aa:ConvertText(ab,true)
local ac=aa.Lines
table.clear(ac)
local ad=1

for ae in ab:gmatch"([^\n\r]*)[\n\r]?"do
ac[ad]=ae
ad=ad+1
end

aa:ProcessTextChange()
end

p.ClearText=function(aa)
local ab=aa:ConvertText('',true)
local ac=aa.Lines
table.clear(ac)
local ad=1

for ae in ab:gmatch"([^\n\r]*)[\n\r]?"do
ac[ad]=ae
ad=ad+1
end

aa:ProcessTextChange()
end

p.CompileText=function(aa)
local ab=pcall(function()
local ab=table.concat(aa.Lines,"\n")
local ac=aa:ConvertText(ab,false)
loadstring(ac)()
end)

return ab
end

p.ReturnErrors=function(aa)
local ab,ac=pcall(function()
local ab=table.concat(aa.Lines,"\n")
local ac=aa:ConvertText(ab,false)
loadstring(ac)()
end)

return not ab and ac or nil
end

p.GetVersion=function(aa)
return b
end

p.MakeRichTemplates=function(aa)
local ab=math.floor
local ac={}

for ad,ae in pairs(aa.Colors)do
ac[ad]=('<font color="rgb(%s,%s,%s)">'):format(ab(ae.r*255),ab(ae.g*255),ab(ae.b*255))
end

aa.RichTemplates=ac
end

p.ApplyTheme=function(aa)
local ab=d.Theme.Syntax
aa.Colors=ab
aa.Frame.LineNumbers.TextColor3=ab.Text
aa.Frame.BackgroundColor3=ab.Background
end

local aa={__index=p}

local function new(ab)
ab=ab or{}
if not u then initBuiltIn()end

local ac=n.ScrollBar.new()
local ad=n.ScrollBar.new(true)
ad.Gui.Position=UDim2.new(0,0,1,-10)

local ae={
FontFace=Font.fromEnum(Enum.Font.Code),
FontSize=14,
ViewX=0,
ViewY=0,
Colors=d.Theme.Syntax,
ColoredLines={},
Lines={""},
LineFrames={},
Editable=true,
Editing=false,
CursorX=0,
CursorY=0,
FloatCursorX=0,
Text="",
PreHighlights={},
SelectionRange={{-1,-1},{-1,-1}},
NewLines={},
FrameOffsets=Vector2.new(0,0),
MaxTextCols=0,
ScrollV=ac,
ScrollH=ad
}

local A=Merge(ae,ab)
local B=setmetatable(A,aa)

p.SetTextMultiplier=(function(C)
B.FontSize=C
end)
p.GetTextMultiplier=(function()
return B.FontSize
end)

ac.WheelIncrement=3
ad.Increment=2
ad.WheelIncrement=7

ac.Scrolled:Connect(function()
B.ViewY=ac.Index
B:Refresh()
end)

ad.Scrolled:Connect(function()
B.ViewX=ad.Index
B:Refresh()
end)

B:MakeEditorFrame(B)
B:MakeRichTemplates()
B:ApplyTheme()
ac:SetScrollFrame(B.Frame.Lines)
ac.Gui.Parent=B.Frame
ad.Gui.Parent=B.Frame

B:UpdateView()
B:SetText(A.Text)

B.Frame:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
B:UpdateView()
B:Refresh()
end)

return B
end

return{new=new}
end)()

return n end function a.b()local aa=a.cache.b if not aa then aa={c=__modImpl()}a.cache.b=aa end return aa.c end end do local function __modImpl()
local aa={
Services={},
OnInitConnections={}
}






local ab=get_hidden_gui or gethui
local ac=cloneref or function(ac)
return ac
end


local ad=aa.Services
setmetatable(ad,{
__index=function(ae,b)
local c=game:GetService(b)
return ac(c)
end,
})


local ae=ad.CoreGui


local b

function aa.AddOnInit(c,d)
local e=c.OnInitConnections
table.insert(e,d)
end

function aa.CallOnInitConnections(c,d,...)
local e=c.OnInitConnections
b=d

for f,g in next,e do
g(b,...)
end
end

function aa.SetProperties(c,d,e)
for f,g in next,e do
pcall(function()
d[f]=g
end)
end
end

function aa.NewClass(c,d,e)
e=e or{}
d.__index=d
return setmetatable(e,d)
end

function aa.CheckConfig(c,d,e,f,g)
if not d then return end

for h,i in next,e do
if d[h]~=nil then continue end


if g then
if table.find(g,h)then continue end
end


if f then
i=i()
end


d[h]=i
end

return d
end

function aa.ResolveUIParent(c)
local d=b.PlayerGui
local e=b.Debug

local f={
[1]=function()
local f=ab()
if f.Parent==ae then return end

return f
end,
[2]=function()
return ae
end,
[3]=function()
return d
end
}

local g=b:CreateInstance"ScreenGui"


for h,i in next,f do

local j,k=pcall(i)
if not j or not k then continue end


local l=pcall(function()
g.Parent=k
end)
if not l then continue end

if e then
b:Warn(`Step: {h} was chosen as the parent!: {k}`)
end

return k
end


b:Warn"The ReGui container does not have a parent defined"

return nil
end

function aa.GetChildOfClass(c,d,e)
local f=d:FindFirstChildOfClass(e)


if not f then
f=b:CreateInstance(e,d)
end

return f
end

function aa.CheckAssetUrl(c,d)

if tonumber(d)then
return`rbxassetid://{d}`
end
return d
end

function aa.SetPadding(c,d,e)
if not d then return end

c:SetProperties(d,{
PaddingBottom=e,
PaddingLeft=e,
PaddingRight=e,
PaddingTop=e
})
end

return aa end function a.c()local aa=a.cache.c if not aa then aa={c=__modImpl()}a.cache.c=aa end return aa.c end end do local function __modImpl()










local aa=a.c()
local ab={
DefaultTweenInfo=TweenInfo.new(0.08),
}

local ac=aa.Services
local ad=ac.TweenService









function ab.Tween(ae,b)
local c=ae.DefaultTweenInfo


local d=b.Object
local e=b.NoAnimation
local f=b.Tweeninfo or c
local g=b.EndProperties
local h=b.StartProperties
local i=b.Completed


if h then
aa:SetProperties(d,h)
end


if e then
aa:SetProperties(d,g)


if i then
i()
end
return
end


local j
for k,l in next,g do
local m={
[k]=l
}


local n,o=pcall(function()
return ad:Create(d,f,m)
end)


if not n then
aa:SetProperties(d,m)
continue
end


if not j then
j=o
end

o:Play()
end


if i then
if j then
j.Completed:Connect(i)
else
i()
end
end

return j
end







function ab.Animate(ae,b)
local c=b.NoAnimation
local d=b.Objects
local e=b.Tweeninfo
local f=b.Completed

local g


for h,i in next,d do
local j=ae:Tween{
NoAnimation=c,
Object=h,
Tweeninfo=e,
EndProperties=i
}

if not g then
g=j
end
end


if f then
g.Completed:Connect(f)
end

return g
end











function ab.HeaderCollapseToggle(ae,b)

aa:CheckConfig(b,{
Rotations={
Open=90,
Closed=0
}
})


local c=b.Toggle
local d=b.NoAnimation
local e=b.Rotations
local f=b.Collapsed
local g=b.Tweeninfo

local h=f and e.Closed or e.Open


ae:Tween{
Tweeninfo=g,
NoAnimation=d,
Object=c,
EndProperties={
Rotation=h,
}
}
end


















function ab.HeaderCollapse(ae,b)

local c=b.Tweeninfo
local d=b.Collapsed
local e=b.ClosedSize
local f=b.OpenSize
local g=b.Toggle
local h=b.Resize
local i=b.Hide
local j=b.NoAnimation
local k=b.NoAutomaticSize
local l=b.IconRotations
local m=b.Completed


if not k then
h.AutomaticSize=Enum.AutomaticSize.None
end
if not d then
i.Visible=true
end


ae:HeaderCollapseToggle{
Tweeninfo=c,
Collapsed=d,
NoAnimation=j,
Toggle=g,
Rotations=l
}

local n=ae:Tween{
Tweeninfo=c,
NoAnimation=j,
Object=h,
StartProperties={
Size=d and f or e
},
EndProperties={
Size=d and e or f
},
Completed=function()
i.Visible=not d


if m then
m()
end


if d then return end
if k then return end


h.Size=UDim2.fromScale(1,0)
h.AutomaticSize=Enum.AutomaticSize.Y
end,
}

return n
end

return ab end function a.d()local aa=a.cache.d if not aa then aa={c=__modImpl()}a.cache.d=aa end return aa.c end end do local function __modImpl()















local aa={}
aa.__index=aa

local ab=a.c()

function aa.Fire(ac,...)
local ad=ac:GetConnections()
if#ad<=0 then return end

for ae,b in next,ad do
b(...)
end
end
function aa.GetConnections(ac)
local ad=ac.Connections
return ad
end
function aa.Connect(ac,ad)
local ae=ac:GetConnections()
table.insert(ae,ad)
end
function aa.DisconnectConnections(ac)
local ad=ac:GetConnections()
table.clear(ad)
end

function aa.NewSignal(ac)
return ab:NewClass(aa,{
Connections={}
})
end

return aa end function a.e()local aa=a.cache.e if not aa then aa={c=__modImpl()}a.cache.e=aa end return aa.c end end do local function __modImpl()
return function(aa)

local ab=aa:Window{
Title="Configuration saving",
Size=UDim2.fromOffset(300,200)
}

local ac=ab:Row()
local ad

ac:Button{
Text="Dump Ini",
Callback=function()
print(aa:DumpIni(true))
end,
}
ac:Button{
Text="Save Ini",
Callback=function()
ad=aa:DumpIni(true)
end,
}
ac:Button{
Text="Load Ini",
Callback=function()
if not ad then
warn"No save data!"
return
end

aa:LoadIni(ad,true)
end,
}

ab:Separator()
ab:SliderInt{
IniFlag="MySlider",
Value=5,
Minimum=1,
Maximum=32,
}
ab:Checkbox{
IniFlag="MyCheckbox",
Value=true,
}
ab:InputText{
IniFlag="MyInput",
Value="Hello world!"
}
ab:Keybind{
IniFlag="MyKeybind",
Label="Keybind (w/ Q & Left-Click blacklist)",
KeyBlacklist={
Enum.UserInputType.MouseButton1,
Enum.KeyCode.Q
}
}


local ae=aa:TabsWindow{
Title="Tabs window!",
Visible=false,
Size=UDim2.fromOffset(300,200)
}

for b,c in{"Avocado","Broccoli","Cucumber"}do
local d=ae:CreateTab{Name=c}
d:Label{
Text=`This is the {c} tab!`
}
end


local b=aa.Elements:Label{
Parent=aa.Container.Windows,
Visible=false,
UiPadding=UDim.new(0,8),
CornerRadius=UDim.new(0,2),
Position=UDim2.fromOffset(10,10),
Size=UDim2.fromOffset(250,50),
Border=true,
BorderThickness=1,
BorderColor=aa.Accent.Gray,
BackgroundTransparency=0.4,
BackgroundColor3=aa.Accent.Black,
}

game:GetService"RunService".RenderStepped:Connect(function(c)
local d=math.round(1/c)
local e=DateTime.now():FormatLocalTime("dddd h:mm:ss A","en-us")

local f=`ReGui {aa:GetVersion()}\n`
f..=`FPS: {d}\n`
f..=`The time is {e}`

b.Text=f
end)


local c=aa:Window{
Title="Dear ReGui Demo",
Size=UDim2.new(0,400,0,300),


NoScroll=true
}:Center()


local d=c:MenuBar()


local e=d:MenuItem{
Text="Menu"
}
e:Selectable{
Text="New"
}
e:Selectable{
Text="Open"
}
e:Selectable{
Text="Save"
}
e:Selectable{
Text="Save as"
}
e:Selectable{
Text="Exit",
Callback=function()
c:Close()
end,
}


local f=d:MenuItem{
Text="Examples"
}
f:Selectable{
Text="Print hello world",
Callback=function()
print"Hello world!"
end,
}
f:Selectable{
Text="Tabs window",
Callback=function()
ae:ToggleVisibility()
end,
}
f:Selectable{
Text="Configuration saving",
Callback=function()
ab:ToggleVisibility()
end,
}
f:Selectable{
Text="Watermark",
Callback=function()
b.Visible=not b.Visible
end,
}

c:Label{
Text=`Dear ReGui says hello! ({aa:GetVersion()})`
}



local g=c:ScrollingCanvas{
Fill=true,
UiPadding=UDim.new(0,0)
}


local h=g:CollapsingHeader{
Title="Help"
}
h:Separator{
Text="ABOUT THIS DEMO:"
}
h:BulletText{
Rows={
"Sections below are demonstrating many aspects of the library.",
}
}
h:Separator{
Text="PROGRAMMER GUIDE:"
}
h:BulletText{
Rows={
"See example FAQ, examples, and documentation at https://depso.gitbook.io/regui",
}
}
h:Indent():BulletText{
Rows={
"See example applications in the /demo folder.",
}
}


local i=g:CollapsingHeader{
Title="Configuration"
}

local j=i:TreeNode{
Title="Backend Flags"
}
j:Checkbox{Label="ReGui:IsMobileDevice",Disabled=true,Value=aa:IsMobileDevice()}
j:Checkbox{Label="ReGui:IsConsoleDevice",Disabled=true,Value=aa:IsConsoleDevice()}

local k=i:TreeNode{
Title="Style"
}
k:Combo{
Selected="DarkTheme",
Label="Colors",
Items=aa.ThemeConfigs,
Callback=function(l,m)
c:SetTheme(m)
end,
}

local l=g:CollapsingHeader{
Title="Window options"
}:Table{
MaxColumns=3
}:NextRow()

local m={
NoResize=false,
NoTitleBar=false,
NoClose=false,
NoCollapse=false,

OpenOnDoubleClick=true,
NoBringToFrontOnFocus=false,
NoMove=false,
NoSelect=false,
NoScrollBar=false,
NoBackground=false
}

for n,o in pairs(m)do
local p=l:NextColumn()

p:Checkbox{
Value=o,
Label=n,
Callback=function(q,r)
c:UpdateConfig{
[n]=r
}
end,
}
end

local n=g:CollapsingHeader{
Title="Widgets"
}

local o={
"Basic",
"Tooltips",
"Tree Nodes",
"Collapsing Headers",
"Bullets",
"Text",
"Images",
"Videos",
"Combo",
"Tabs",
"Plot widgets",
"Multi-component Widgets",
"Progress Bars",
"Picker Widgets",
"Code editor",
"Console",
"List layout",


"Indent",
"Viewport",
"Keybinds",
"Input",
"Text Input",
}

local p={Basic=
function(p)

p:Separator{Text="General"}

local q=p:Row()
local r=q:Label{
Text="Thanks for clicking me!",
Visible=false,
LayoutOrder=2
}
q:Button{
Callback=function()
r.Visible=not r.Visible
end,
}

p:Checkbox()

local s=p:Row()
s:Radiobox{Label="radio a"}
s:Radiobox{Label="radio b"}
s:Radiobox{Label="radio c"}

local t=p:Row()
for u=1,7 do
local v=u/7.0
t:Button{
Text="Click",
BackgroundColor3=Color3.fromHSV(v,0.6,0.6)
}
end

local u=p:Button{
Text="Tooltip"
}

aa:SetItemTooltip(u,function(v)
v:Label{
Text="I am a tooltip"
}
end)


p:Separator{Text="Inputs"}

p:InputText{
Value="Hello world!"
}
p:InputText{
Placeholder="Enter text here",
Label="Input text (w/ hint)",
Value=""
}
p:InputInt{
Value=50,
}
p:InputInt{
Label="Input Int (w/ limit)",
Value=5,
Maximum=10,
Minimum=1
}


p:Separator{Text="Drags"}

p:DragInt()

p:DragInt{
Maximum=100,
Minimum=0,
Label="Drag Int 0..100",
Format="%d%%"
}

p:DragFloat{
Maximum=1,
Minimum=0,
Value=0.5
}


p:Separator{Text="Sliders"}

p:SliderInt{
Format="%.d/%s",
Value=5,
Minimum=1,
Maximum=32,
ReadOnly=false,
}:SetValue(8)

p:SliderInt{
Label="Slider Int (w/ snap)",
Value=1,
Minimum=1,
Maximum=8,
Type="Snap"
}

p:SliderFloat{
Label="Slider Float",
Minimum=0.0,
Maximum=1.0,
Format="Ratio = %.3f"
}

p:SliderFloat{
Label="Slider Angle",
Minimum=-360,
Maximum=360,
Format="%.f deg"
}

p:SliderEnum{
Items={"Fire","Earth","Air","Water"},
Value=2,
}

p:SliderEnum{
Items={"Fire","Earth","Air","Water"},
Value=2,
Disabled=true,
Label="Disabled Enum"
}

p:SliderProgress{
Label="Progress Slider",
Value=8,
Minimum=1,
Maximum=32,
}


p:Separator{Text="Selectors/Pickers"}

p:InputColor3{
Value=aa.Accent.Light,
Label="Color 1",

}

p:SliderColor3{
Value=aa.Accent.Light,
Label="Color 2"
}

p:InputCFrame{
Value=CFrame.new(1,1,1),
Minimum=CFrame.new(0,0,0),
Maximum=CFrame.new(200,100,50),
Label="CFrame 1",

}

p:SliderCFrame{
Value=CFrame.new(1,1,1),
Minimum=CFrame.new(0,0,0),
Maximum=CFrame.new(200,100,50),
Label="CFrame 2"
}

p:Combo{
Selected=1,
Items={
"AAAA",
"BBBB",
"CCCC",
"DDDD",
"EEEE",
"FFFF",
"GGGG",
"HHHH",
"IIIIIII",
"JJJJ",
"KKKKKKK"
}
}
end,Tooltips=
function(p)

p:Separator{Text="General"}


local q=p:Button{
Text="Basic",
Size=UDim2.fromScale(1,0)
}
aa:SetItemTooltip(q,function(r)
r:Label{
Text="I am a tooltip"
}
end)


local r=p:Button{
Text="Fancy",
Size=UDim2.fromScale(1,0)
}
aa:SetItemTooltip(r,function(s)
s:Label{
Text="I am a fancy tooltip"
}
s:Image{
Image=18395893036
}

local t=s:Label()
while wait()do
t.Text=`Sin(time) = {math.sin(tick())}`
end
end)


local s=p:Button{
Text="Double tooltip",
Size=UDim2.fromScale(1,0)
}
for t=1,3 do
aa:SetItemTooltip(s,function(u)
u:Label{
Text=`I am tooltip {t}`
}
end)
end
end,Videos=
function(p)
local q=p:VideoPlayer{
Video=5608327482,
Looped=true,
Ratio=1.7777777777777777,
RatioAspectType=Enum.AspectType.FitWithinMaxSize,
RatioAxis=Enum.DominantAxis.Width,
Size=UDim2.fromScale(1,1)
}
q:Play()

local s=p:Row{
Expanded=true
}
s:Button{
Text="Pause",
Callback=function()
q:Pause()
end,
}
s:Button{
Text="Play",
Callback=function()
q:Play()
end,
}


if not q.IsLoaded then
q.Loaded:Wait()
end

local t=s:SliderInt{
Format="%.f",
Value=0,
Minimum=0,
Maximum=q.TimeLength,
Callback=function(t,u)
q.TimePosition=u
end,
}

game:GetService"RunService".RenderStepped:Connect(function(u)
t:SetValue(q.TimePosition)
end)
end,
["Tree Nodes"]=function(p)
for q=1,5 do
local s=p:TreeNode{
Title=`Child {q}`,
Collapsed=q~=1
}

local t=s:Row()
t:Label{Text="Blah blah"}
t:SmallButton{Text="Button"}
end

p:TreeNode{
Title=`With icon & NoArrow`,
NoArrow=true,
Icon=aa.Icons.Image,
}
end,
["Collapsing Headers"]=function(p)
local q

p:Checkbox{
Value=true,
Label="Show 2nd header",
Callback=function(s,t)
if q then
q:SetVisible(t)
end
end,
}
p:Checkbox{
Value=true,
Label="2nd has arrow",
Callback=function(s,t)
if q then
q:SetArrowVisible(t)
end
end,
}

local s=p:CollapsingHeader{
Title="Header",
}
for t=1,5 do
s:Label{Text=`Some content {t}`}
end

q=p:CollapsingHeader{
Title="Second Header",
}

for t=1,5 do
q:Label{Text=`More content {t}`}
end
end,Bullets=
function(p)
p:BulletText{
Rows={
"Bullet point 1",
"Bullet point 2\nOn multiple lines",
}
}

p:TreeNode():BulletText{
Rows={"Another bullet point"}
}

p:Bullet():Label{
Text="Bullet point 3 (two calls)"
}

p:Bullet():SmallButton()
end,Text=
function(p)
local q=p:TreeNode{Title="Colorful Text"}
q:Label{
TextColor3=Color3.fromRGB(255,0,255),
Text="Pink",
NoTheme=true
}
q:Label{
TextColor3=Color3.fromRGB(255,255,0),
Text="Yellow",
NoTheme=true
}
q:Label{
TextColor3=Color3.fromRGB(59,59,59),
Text="Disabled",
NoTheme=true
}

local s=p:TreeNode{Title="Word Wrapping"}
s:Label{
Text=[[This text should automatically wrap on the edge of the window. The current implementation for text wrapping follows simple rules suitable for English and possibly other languages.]],
TextWrapped=true
}

local t

s:SliderInt{
Label="Wrap width",
Value=400,
Minimum=20,
Maximum=600,
Callback=function(u,v)
if not t then return end
t.Size=UDim2.fromOffset(v,0)
end,
}

s:Label{Text="Test paragraph:"}
t=s:Label{
Text=[[The lazy dog is a good dog. This paragraph should fit. Testing a 1 character word. The quick brown fox jumps over the lazy dog.]],
TextWrapped=true,
Border=true,
BorderColor=Color3.fromRGB(255,255,0),
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.fromOffset(400,0)
}
end,Images=
function(p)
p:Label{
TextWrapped=true,
Text="Below we are displaying the icons (which are the ones builtin to ReGui in this demo). Hover the texture for a zoomed view!"
}
p:Label{
TextWrapped=true,
Text=`There is a total of {aa:GetDictSize(aa.Icons)} icons in this demo!`
}

local q=p:List{
Border=true
}

local s
local t


aa:SetItemTooltip(q,function(u)
s=u:Label()
t=u:Image{
Size=UDim2.fromOffset(50,50)
}
end)

for u,v in aa.Icons do

local w=q:Image{
Image=v,
Size=UDim2.fromOffset(30,30)
}

aa:DetectHover(w,{
MouseEnter=true,
OnInput=function()
s.Text=u
t.Image=v
end,
})
end
end,Tabs=
function(p)

local q=p:TreeNode{Title="Basic"}
local s=q:TabSelector()

local t={"Avocado","Broccoli","Cucumber"}
for u,v in next,t do
s:CreateTab{Name=v}:Label{
Text=`This is the {v} tab!\nblah blah blah blah blah`
}
end


local u=p:TreeNode{Title="Advanced & Close Button"}
local v=u:TabSelector()

local w={"Artichoke","Beetroot","Celery","Daikon"}

for x,y in next,w do
local z=v:CreateTab{
Name=y,
Closeable=true
}

z:Label{
Text=`This is the {y} tab!\nblah blah blah blah blah`
}
end

u:Button{
Text="Add tab",
Callback=function()
v:CreateTab{
Closeable=true
}:Label{
Text="I am an odd tab."
}
end,
}
end,
["Plot widgets"]=function(p)
local q=p:PlotHistogram{
Points={0.6,0.1,1.0,0.5,0.92,0.1,0.2}
}

p:Button{
Text="Generate new graph",
Callback=function()
local u={}

for v=1,math.random(5,10)do
table.insert(u,math.random(1,10))
end

q:PlotGraph(u)
end,
}
end,
["Multi-component Widgets"]=function(p)
p:Separator{Text="2-wide"}

p:InputInt2{
Value={10,50},
Minimum={0,0},
Maximum={20,100},
Callback=function(q,u)
print("1:",u[1],"2:",u[2])
end,
}
p:SliderInt2()
p:SliderFloat2()
p:DragInt2()
p:DragFloat2()

p:Separator{Text="3-wide"}

p:InputInt3()
p:SliderInt3()
p:SliderFloat3()
p:DragInt3()
p:DragFloat3()

p:Separator{Text="4-wide"}

p:InputInt4()
p:SliderInt4()
p:SliderFloat4()
p:DragInt4()
p:DragFloat4()
end,
["Progress Bars"]=function(p)
local q=p:ProgressBar{
Label="Loading...",
Value=80
}

spawn(function()
local u=0
while wait(0.02)do
u+=1
q:SetPercentage(u%100)
end
end)
end,
["Picker Widgets"]=function(p)

p:Separator{Text="Color pickers"}
p:DragColor3{
Value=aa.Accent.Light
}
p:SliderColor3{
Value=aa.Accent.Red
}
p:InputColor3{
Value=aa.Accent.Green
}


p:Separator{Text="CFrame pickers"}
p:DragCFrame{
Value=CFrame.new(1,1,1),
Minimum=CFrame.new(0,0,0),
Maximum=CFrame.new(200,100,50),
}
p:SliderCFrame()
p:InputCFrame()
end,
["Code editor"]=function(p)
p:CodeEditor{
Text=[[print("Hello from ReGui's editor!")]],
Editable=true
}
end,Console=
function(p)

local q=p:TreeNode{Title="Basic"}
local u=q:Console{
ReadOnly=true,
AutoScroll=true,
MaxLines=50
}


local v=p:TreeNode{Title="Advanced & RichText"}
local w=v:Console{
ReadOnly=true,
AutoScroll=true,
RichText=true,
MaxLines=50
}


local x=p:TreeNode{Title="Editor"}
x:Console{
Value="print('Hello world!')",
LineNumbers=true
}

coroutine.wrap(function()
while wait()do
local y=DateTime.now():FormatLocalTime("h:mm:ss A","en-us")

w:AppendText(
`<font color="rgb(240, 40, 10)">[Random]</font>`,
math.random()
)
u:AppendText(
`[{y}] Hello world!`
)
end
end)()
end,Combo=
function(p)
p:Combo{
WidthFitPreview=true,
Label="WidthFitPreview",
Selected=1,
Items={
"AAAAAAAAAAAA",
"BBBBBBBB",
"CCCCC",
"DDD",
},
}

p:Separator{Text="One-liner variants"}

p:Combo{
Label="Combo 1 (array)",
Selected=1,
Items={
"AAAA",
"BBBB",
"CCCC",
"DDDD",
"EEEE",
"FFFF",
"GGGG",
"HHHH",
"IIIIIII",
"JJJJ",
"KKKKKKK"
}
}
p:Combo{
Label="Combo 1 (dict)",
Selected="AAA",
Items={
AAA="Apple",
BBB="Banana",
CCC="Orange",
},
Callback=print,
}
p:Combo{
Label="Combo 2 (function)",
Selected=1,
GetItems=function()
return{
"aaa",
"bbb",
"ccc",
}
end,
}
end,Indent=
function(p)
p:Label{Text="This is not indented"}

local q=p:Indent{Offset=30}
q:Label{Text="This is indented by 30 pixels"}

local u=q:Indent{Offset=30}
u:Label{Text="This is indented by 30 more pixels"}
end,Viewport=
function(p)
local q=aa:InsertPrefab"R15 Rig"

local u=p:Viewport{
Size=UDim2.new(1,0,0,200),
Clone=true,
Model=q,
}


local v=u.Model
v:PivotTo(CFrame.new(0,-2.5,-5))


local w=game:GetService"RunService"
w.RenderStepped:Connect(function(x)
local y=CFrame.Angles(0,math.rad(30*x),0)
local z=v:GetPivot()*y

v:PivotTo(z)
end)
end,
["List layout"]=function(p)
local q=p:List()

for u=1,10 do
q:Button{Text=`Resize the window! {u}`}
end
end,Keybinds=
function(p)
local q=p:Checkbox{
Value=true
}

p:Keybind{
Label="Toggle checkbox",

IgnoreGameProcessed=false,
OnKeybindSet=function(u,v)
warn("[OnKeybindSet] .Value ->",v)
end,
Callback=function(u,v)
print(v)
q:Toggle()
end,
}

p:Keybind{
Label="Keybind (w/ Q & Left-Click blacklist)",
KeyBlacklist={
Enum.UserInputType.MouseButton1,
Enum.KeyCode.Q
}
}

p:Keybind{
Label="Toggle UI visibility",
Value=Enum.KeyCode.E,
Callback=function()



c:ToggleVisibility()
end,
}
end,Input=
function(p)
p:InputText{Label="One Line Text"}
p:InputTextMultiline{Label="Multiline Text"}
p:InputInt{Label="Input int"}
end,
["Text Input"]=function(p)

local q=p:TreeNode{Title="Multiline"}
q:InputTextMultiline{
Size=UDim2.new(1,0,0,117),
Value=[[/*The Pentium FOOF bug, shorthand for FO OF C7 C8,
    the hexadecimal encoding of one offending instruction,
    more formally, the invalid operand with locked CMPXCHG8B
    instruction bug, is a design flaw in the majority of
    Intel Pentium, Pentium MMX, and Pentium OverDrive
    processors (all in the P5 microarchitecture).#
    */]]
}
end,
}

for q,u in o do
local v=n:TreeNode{
Title=u
}
local w=p[u]

if w then
task.spawn(w,v)
end
end


local q=g:CollapsingHeader{
Title="Popups & child windows"
}


local u=q:TreeNode{Title="Popups"}
local v=u:Row()

local w=v:Label{
Text="<None>",
LayoutOrder=2
}

v:Button{
Text="Select..",
Callback=function(x)
local y={"Bream","Haddock","Mackerel","Pollock","Tilefish"}

local z=u:PopupCanvas{
RelativeTo=x,
MaxSizeX=200,
}

z:Separator{Text="Aquarium"}

for A,B in y do
z:Selectable{
Text=B,
Callback=function(C)
w.Text=B
z:ClosePopup()
end,
}
end
end,
}


local x=q:TreeNode{Title="Child windows"}
local y=x:Window{
Size=UDim2.fromOffset(300,200),
NoMove=true,
NoClose=true,
NoCollapse=true,
NoResize=true
}

y:Label{Text="Hello, world!"}
y:Button{Text="Save"}
y:InputText{Label="string"}
y:SliderFloat{Label="float",Minimum=0.0,Maximum=1.0}


local z=q:TreeNode{Title="Modals"}
z:Label{
Text="Modal windows are like popups but the user cannot close them by clicking outside.",
TextWrapped=true
}

z:Button{
Text="Delete..",
Callback=function()
local A=z:PopupModal{
Title="Delete?"
}

A:Label{
Text="All those beautiful files will be deleted.\nThis operation cannot be undone!",
TextWrapped=true
}
A:Separator()

A:Checkbox{
Value=false,
Label="Don't ask me next time"
}

local B=A:Row{
Expanded=true
}
B:Button{
Text="Okay",
Callback=function()
A:ClosePopup()
end,
}
B:Button{
Text="Cancel",
Callback=function()
A:ClosePopup()
end,
}
end,
}

z:Button{
Text="Stacked modals..",
Callback=function()

local A=z:PopupModal{
Title="Stacked 1"
}

A:Label{
Text=`Hello from Stacked The First\nUsing Theme["ModalWindowDimBg"] behind it.`,
TextWrapped=true
}
A:Combo{
Items={"aaaa","bbbb","cccc","dddd","eeee"}
}
A:DragColor3{
Value=Color3.fromRGB(102,178,0)
}

A:Button{
Text="Add another modal..",
Callback=function()

local B=z:PopupModal{
Title="Stacked 2"
}

B:Label{
Text="Hello from Stacked The Second!",
TextWrapped=true
}

B:DragColor3{
Value=Color3.fromRGB(102,178,0)
}

B:Button{
Text="Close",
Callback=function()
B:ClosePopup()
end,
}
end,
}

A:Button{
Text="Close",
Callback=function()
A:ClosePopup()
end,
}
end,
}


local A=g:CollapsingHeader{
Title="Tables & Columns"
}
local B=A:TreeNode{
Title="Basic"
}

local C=B:Table()
for D=1,3 do
local E=C:Row()
for F=1,3 do
local G=E:Column()
for H=1,4 do
G:Label{Text=`Row {H} Column {F}`}
end
end
end


local D=A:TreeNode{
Title="Borders, background"
}

local E=D:Table{
RowBackground=true,
Border=true,
MaxColumns=3
}

for F=1,5 do
local G=E:NextRow()
for H=1,3 do
local I=G:NextColumn()
I:Label{Text=`Hello {H},{F}`}
end
end


local F=A:TreeNode{
Title="With headers"
}

local G=F:Table{
Border=true,
RowBackground=true,
MaxColumns=3
}

local H={"One","Two","Three"}

for I=1,7 do
if I==1 then
v=G:HeaderRow()
else
v=G:Row()
end

for J,K in H do
if I==1 then
local L=v:Column()
L:Label{Text=K}
continue
end

local L=v:NextColumn()
L:Label{Text=`Hello {J},{I}`}
end
end
end end function a.f()local aa=a.cache.f if not aa then aa={c=__modImpl()}a.cache.f=aa end return aa.c end end do local function __modImpl()
return{
Dot="rbxasset://textures/whiteCircle.png",
Arrow="rbxasset://textures/ui/AvatarContextMenu_Arrow.png",
Close="rbxasset://textures/loading/cancelButton.png",
Checkmark="rbxasset://textures/ui/Lobby/Buttons/nine_slice_button.png",
Cat="rbxassetid://16211812161",
Script="rbxassetid://11570895459",
Settings="rbxassetid://9743465390",
Info="rbxassetid://18754976792",
Move="rbxassetid://6710235139",
Roblox="rbxassetid://7414445494",
Warning="rbxassetid://11745872910",
Audio="rbxassetid://302250236",
Shop="rbxassetid://6473525198",
CharacterDance="rbxassetid://11932783331",
Pants="rbxassetid://10098755331",
Home="rbxassetid://4034483344",
Robux="rbxassetid://5986143282",
Badge="rbxassetid://16170504068",
SpawnLocation="rbxassetid://6400507398",
Sword="rbxassetid://7485051715",
Clover="rbxassetid://11999300014",
Star="rbxassetid://3057073083",
Code="rbxassetid://11348555035",
Paw="rbxassetid://13001190533",
Shield="rbxassetid://7461510428",
Shield2="rbxassetid://7169354142",
File="rbxassetid://7276823330",
Book="rbxassetid://16061686835",
Location="rbxassetid://13549782519",
Puzzle="rbxassetid://8898417863",
Discord="rbxassetid://84828491431270",
Premium="rbxassetid://6487178625",
Friend="rbxassetid://10885655986",
User="rbxassetid://18854794412",
Duplicate="rbxassetid://11833749507",
ChatBox="rbxassetid://15839118471",
ChatBox2="rbxassetid://15839116089",
Devices="rbxassetid://4458812712",
Weight="rbxassetid://9855685269",
Image="rbxassetid://123311808092347",
Profile="rbxassetid://13585614795",
Admin="rbxassetid://11656483170",
PaintBrush="rbxassetid://12111879608",
Speed="rbxassetid://12641434961",
NoConnection="rbxassetid://9795340967",
Connection="rbxassetid://119759670842477",
Globe="rbxassetid://18870359747",
Box="rbxassetid://140217940575618",
Crown="rbxassetid://18826490498",
Control="rbxassetid://18979524646",
Send="rbxassetid://18940312887",
FastForward="rbxassetid://112963221295680",
Pause="rbxassetid://109949100737970",
Reload="rbxassetid://11570018242",
Joystick="rbxassetid://18749336354",
Controller="rbxassetid://11894535915",
Lock="rbxassetid://17783082088",
Calculator="rbxassetid://85861816563977",
Sun="rbxassetid://13492317832",
Moon="rbxassetid://8498174594",
Prohibited="rbxassetid://5248916036",
Flag="rbxassetid://251346532",
Website="rbxassetid://98455290625865",
Telegram="rbxassetid://115860270107061",
MusicNote="rbxassetid://18187351229",
Music="rbxassetid://253830398",
Headphones="rbxassetid://1311321471",
Phone="rbxassetid://8411963035",
Smartphone="rbxassetid://14040313879",
Desktop="rbxassetid://3120635703",
Desktop2="rbxassetid://4728059490",
Laptop="rbxassetid://4728059725",
Server="rbxassetid://9692125126",
Wedge="rbxassetid://9086583059",
Drill="rbxassetid://11959189471",
Character="rbxassetid://13285102351",
}end function a.g()local aa=a.cache.g if not aa then aa={c=__modImpl()}a.cache.g=aa end return aa.c end end do local function __modImpl()
return{

Light=Color3.fromRGB(50,150,250),
Dark=Color3.fromRGB(30,66,115),
ExtraDark=Color3.fromRGB(28,39,53),
White=Color3.fromRGB(240,240,240),
Gray=Color3.fromRGB(172,171,175),
Black=Color3.fromRGB(15,19,24),
Yellow=Color3.fromRGB(230,180,0),
Orange=Color3.fromRGB(230,150,0),
Green=Color3.fromRGB(130,188,91),
Red=Color3.fromRGB(255,69,69),


ImGui={
Light=Color3.fromRGB(66,150,250),
Dark=Color3.fromRGB(41,74,122),
Black=Color3.fromRGB(15,15,15),
Gray=Color3.fromRGB(36,36,36)
}
}end function a.h()local aa=a.cache.h if not aa then aa={c=__modImpl()}a.cache.h=aa end return aa.c end end do local function __modImpl()




local aa=a.h()
local ab={}

ab.DarkTheme={
Values={
AnimationTweenInfo=TweenInfo.new(0.08),
TextFont=Font.fromEnum(Enum.Font.RobotoMono),
TextSize=14,
Text=aa.White,
TextDisabled=aa.Gray,
ErrorText=aa.Red,

FrameBg=aa.Dark,
FrameBgTransparency=0.4,
FrameBgActive=aa.Light,
FrameBgTransparencyActive=0.4,
FrameRounding=UDim.new(0,0),


SliderGrab=aa.Light,
ButtonsBg=aa.Light,
CollapsingHeaderBg=aa.Light,
CollapsingHeaderText=aa.White,
CheckMark=aa.Light,
ResizeGrab=aa.Light,
HeaderBg=aa.Gray,
HeaderBgTransparency=0.7,
HistogramBar=aa.Yellow,
ProgressBar=aa.Yellow,
RegionBg=aa.Dark,
RegionBgTransparency=0.1,
Separator=aa.Gray,
SeparatorTransparency=0.5,
ConsoleLineNumbers=aa.White,
LabelPaddingTop=UDim.new(0,0),
LabelPaddingBottom=UDim.new(0,0),
MenuBar=aa.ExtraDark,
MenuBarTransparency=0.1,
PopupCanvas=aa.Black,


TabTextPaddingTop=UDim.new(0,3),
TabTextPaddingBottom=UDim.new(0,8),
TabText=aa.Gray,
TabBg=aa.Dark,
TabTextActive=aa.White,
TabBgActive=aa.Light,
TabsBarBg=Color3.fromRGB(36,36,36),
TabsBarBgTransparency=1,
TabPagePadding=UDim.new(0,8),


ModalWindowDimBg=Color3.fromRGB(230,230,230),
ModalWindowDimTweenInfo=TweenInfo.new(0.2),

WindowBg=aa.Black,
WindowBgTransparency=0.05,

Border=aa.Gray,
BorderTransparency=0.8,
BorderTransparencyActive=0.5,

Title=aa.White,
TitleAlign=Enum.TextXAlignment.Left,
TitleBarBg=aa.Black,
TitleBarTransparency=0,
TitleActive=aa.White,
TitleBarBgActive=aa.Dark,
TitleBarTransparencyActive=0.05,
TitleBarBgCollapsed=Color3.fromRGB(0,0,0),
TitleBarTransparencyCollapsed=0.6,
}
}
ab.LightTheme={
BaseTheme=ab.DarkTheme,
Values={
Text=aa.Black,
TextFont=Font.fromEnum(Enum.Font.Ubuntu),
TextSize=14,

FrameBg=aa.Gray,
FrameBgTransparency=0.4,
FrameBgActive=aa.Light,
FrameBgTransparencyActive=0.6,

SliderGrab=aa.Light,
ButtonsBg=aa.Light,
CollapsingHeaderText=aa.Black,
Separator=aa.Black,
ConsoleLineNumbers=aa.Yellow,
MenuBar=Color3.fromRGB(219,219,219),
PopupCanvas=aa.White,

TabText=aa.Black,
TabTextActive=aa.Black,

WindowBg=aa.White,
Border=aa.Gray,
ResizeGrab=aa.Gray,

Title=aa.Black,
TitleAlign=Enum.TextXAlignment.Center,
TitleBarBg=aa.Gray,
TitleActive=aa.Black,
TitleBarBgActive=Color3.fromRGB(186,186,186),
TitleBarBgCollapsed=aa.Gray
}
}
ab.ImGui={
BaseTheme=ab.DarkTheme,
Values={
AnimationTweenInfo=TweenInfo.new(0),
Text=Color3.fromRGB(255,255,255),

FrameBg=aa.ImGui.Dark,
FrameBgTransparency=0.4,
FrameBgActive=aa.ImGui.Light,
FrameBgTransparencyActive=0.5,
FrameRounding=UDim.new(0,0),

ButtonsBg=aa.ImGui.Light,
CollapsingHeaderBg=aa.ImGui.Light,
CollapsingHeaderText=aa.White,
CheckMark=aa.ImGui.Light,
ResizeGrab=aa.ImGui.Light,
MenuBar=aa.ImGui.Gray,
MenuBarTransparency=0,
PopupCanvas=aa.ImGui.Black,

TabText=aa.Gray,
TabBg=aa.ImGui.Dark,
TabTextActive=aa.White,
TabBgActive=aa.ImGui.Light,

WindowBg=aa.ImGui.Black,
WindowBgTransparency=0.05,
Border=aa.Gray,
BorderTransparency=0.7,
BorderTransparencyActive=0.4,

Title=aa.White,
TitleBarBg=aa.ImGui.Black,
TitleBarTransparency=0,
TitleBarBgActive=aa.ImGui.Dark,
TitleBarTransparencyActive=0,
}
}

return ab end function a.i()local aa=a.cache.i if not aa then aa={c=__modImpl()}a.cache.i=aa end return aa.c end end do local function __modImpl()













local aa=a.c()
local ab

aa:AddOnInit(function(ad)
ab=ad
end)

return{
{
Properties={"Center"},
Callback=function(ad,ae,b)
local c=ae.Position
aa:SetProperties(ae,{
Position=UDim2.new(
b:find"X"and 0.5 or c.X.Scale,
c.X.Offset,
b:find"Y"and 0.5 or c.Y.Scale,
c.Y.Offset
),
AnchorPoint=Vector2.new(
b:find"X"and 0.5 or 0,
b:find"Y"and 0.5 or 0
)
})
end,
},
{
Properties={"ElementStyle"},
Callback=function(ad,ae,b)
ab:ApplyStyle(ae,b)
end,
},
{
Properties={"ColorTag"},
Callback=function(ad,ae,b)
local c=ad.Class
local d=ad.WindowClass
local f=c.NoAutoTheme


if not d then return end
if f then return end

ab:UpdateColors{
Object=ae,
Tag=b,
NoAnimation=true,
Theme=d.Theme,
}
end,
},
{
Properties={"Animation"},
Callback=function(ad,ae,b)

local c=ad.Class.NoAnimation
if c then return end

ab:SetAnimation(ae,b)
end,
},
{
Properties={"Image"},
Callback=function(ad,ae,b)
local c=ad.WindowClass
ae.Image=aa:CheckAssetUrl(b)
ab:DynamicImageTag(ae,b,c)
end,
},
{
Properties={"Icon","IconSize","IconRotation","IconPadding"},
Callback=function(ad,ae,b)

local c=ae:FindFirstChild("Icon",true)
if not c then
ab:Warn("No icon for",ae)
return
end


local d=ad.Class
aa:CheckConfig(d,{
Icon="",
IconSize=UDim2.fromScale(1,1),
IconRotation=0,
IconPadding=UDim2.new(0,2)
})


local f=c.Parent:FindFirstChild"UIPadding"
aa:SetPadding(f,d.IconPadding)


local g=d.Icon
g=aa:CheckAssetUrl(g)


local h=ad.WindowClass
ab:DynamicImageTag(c,g,h)
aa:SetProperties(c,{
Visible=c~="",
Image=aa:CheckAssetUrl(g),
Size=d.IconSize,
Rotation=d.IconRotation
})
end,
},
{
Properties={"BorderThickness","Border","BorderColor"},
Callback=function(ad,ae,b)
local c=ad.Class
local d=c.Border==true

aa:CheckConfig(c,{
BorderTransparency=ad:GetThemeKey"BorderTransparencyActive",
BorderColor=ad:GetThemeKey"Border",
BorderThickness=1,
BorderStrokeMode=Enum.ApplyStrokeMode.Border,
})


local f=aa:GetChildOfClass(ae,"UIStroke")
aa:SetProperties(f,{
Transparency=c.BorderTransparency,
Thickness=c.BorderThickness,
Color=c.BorderColor,
ApplyStrokeMode=c.BorderStrokeMode,
Enabled=d
})
end,
},
{
Properties={"Ratio"},
Callback=function(ad,ae,b)
local c=ad.Class

aa:CheckConfig(c,{
Ratio=1.3333333333333333,
RatioAxis=Enum.DominantAxis.Height,
RatioAspectType=Enum.AspectType.ScaleWithParentSize
})


local d=c.Ratio
local f=c.RatioAxis
local g=c.RatioAspectType

local h=aa:GetChildOfClass(ae,"UIAspectRatioConstraint")
aa:SetProperties(h,{
DominantAxis=f,
AspectType=g,
AspectRatio=d
})
end,
},
{
Properties={"FlexMode"},
Callback=function(ad,ae,b)
local c=aa:GetChildOfClass(ae,"UIFlexItem")
c.FlexMode=b
end,
},
{

Properties={"CornerRadius"},
Callback=function(ad,ae,b)
local c=aa:GetChildOfClass(ae,"UICorner")
c.CornerRadius=b
end,
},
{
Properties={"Fill"},
Callback=function(ad,ae,b)
if b~=true then return end

local c=ad.Class
aa:CheckConfig(c,{
Size=UDim2.fromScale(1,1),
UIFlexMode=Enum.UIFlexMode.Fill,
AutomaticSize=Enum.AutomaticSize.None
})


local d=aa:GetChildOfClass(ae,"UIFlexItem")
d.FlexMode=c.UIFlexMode

ae.Size=c.Size
ae.AutomaticSize=c.AutomaticSize
end,
},
{
Properties={"Label"},
Callback=function(ad,ae,b)
local c=ad.Class

local d=ae:FindFirstChild"Label"
if not d then return end

d.Text=tostring(b)

function c.SetLabel(f,g)
d.Text=g
return f
end
end,
},
{
Properties={"NoGradient"},
WindowProperties={"NoGradients"},
Callback=function(ad,ae,b)
local c=ae:FindFirstChildOfClass"UIGradient"
if not c then return end

c.Enabled=b
end,
},
{
Properties={
"UiPadding",
"PaddingBottom",
"PaddingTop",
"PaddingRight",
"PaddingTop"
},
Callback=function(ad,ae,b)
b=b or 0


if typeof(b)=="number"then
b=UDim.new(0,b)
end

local c=ad.Class

local d=c.UiPadding
if d then
aa:CheckConfig(c,{
PaddingBottom=b,
PaddingLeft=b,
PaddingRight=b,
PaddingTop=b,
})
end

local f=aa:GetChildOfClass(ae,"UIPadding")
aa:SetProperties(f,{
PaddingBottom=c.PaddingBottom,
PaddingLeft=c.PaddingLeft,
PaddingRight=c.PaddingRight,
PaddingTop=c.PaddingTop,
})
end,
},
{
Properties={"Callback"},
Callback=function(ad,ae)
local b=ad.Class

function b.SetCallback(c,d)
c.Callback=d
return c
end
function b.FireCallback(c,d)
c.Callback(ae)
return c
end
end,
},
{
Properties={"Value"},
Callback=function(ad,ae)
local b=ad.Class
aa:CheckConfig(b,{
GetValue=function(c)
return b.Value
end,
})
end
}
}end function a.j()local aa=a.cache.j if not aa then aa={c=__modImpl()}a.cache.j=aa end return aa.c end end do local function __modImpl()

local aa={}

aa.Coloring={MenuBar=
{
BackgroundColor3="MenuBar",
BackgroundTransparency="MenuBarTransparency",
},FrameRounding=
{
CornerRadius="FrameRounding"
},PopupCanvas=
{
BackgroundColor3="PopupCanvas"
},ModalWindowDim=
{
BackgroundColor3="ModalWindowDimBg"
},Selectable=
"Button",MenuButton=
"Button",Separator=
{
BackgroundColor3="Separator",
BackgroundTransparency="SeparatorTransparency",
},Region=
{
BackgroundColor3="RegionBg",
BackgroundTransparency="RegionBgTransparency",
},Label=
{
TextColor3="Text",
FontFace="TextFont",
TextSize="TextSize",
},ImageFollowsText=
{
ImageColor3="Text",
},ConsoleLineNumbers=
{
TextColor3="ConsoleLineNumbers",
FontFace="TextFont",
TextSize="TextSize",
},ConsoleText=
"Label",LabelDisabled=
{
TextColor3="TextDisabled",
FontFace="TextFont",
TextSize="TextSize",
},Plot=
{
BackgroundColor3="HistogramBar",
},Header=
{
BackgroundColor3="HeaderBg",
BackgroundTransparency="HeaderBgTransparency",
},WindowTitle=
{
TextXAlignment="TitleAlign",
FontFace="TextFont",
TextSize="TextSize",
},TitleBar=
{
BackgroundColor3="TitleBarBgActive"
},Window=
{
BackgroundColor3="WindowBg",
BackgroundTransparency="WindowBgTransparency"
},TitleBarBgCollapsed=
{
BackgroundColor3="TitleBarBgCollapsed",
BackgroundTransparency="TitleBarTransparencyCollapsed"
},TitleBarBgActive=
{
BackgroundColor3="TitleBarBgActive",
BackgroundTransparency="TitleBarTransparencyActive"
},TitleBarBg=
{
BackgroundColor3="TitleBarBg",
BackgroundTransparency="TitleBarTransparency"
},TabsBar=
{
BackgroundColor3="TabsBarBg",
BackgroundTransparency="TabsBarBgTransparency",
},Border=
{
Color="Border",
Transparency="BorderTransparency"
},ResizeGrab=
{
TextColor3="ResizeGrab"
},BorderActive=
{
Transparency="BorderTransparencyActive"
},Frame=
{
BackgroundColor3="FrameBg",
BackgroundTransparency="FrameBgTransparency",
TextColor3="Text",
FontFace="TextFont",
TextSize="TextSize",
},FrameActive=
{
BackgroundColor3="FrameBgActive",
BackgroundTransparency="FrameBgTransparencyActive"
},SliderGrab=
{
BackgroundColor3="SliderGrab"
},Button=
{
BackgroundColor3="ButtonsBg",
TextColor3="Text",
FontFace="TextFont",
TextSize="TextSize",
},CollapsingHeader=
{
FontFace="TextFont",
TextSize="TextSize",
TextColor3="CollapsingHeaderText",
BackgroundColor3="CollapsingHeaderBg",
},Checkbox=
{
BackgroundColor3="FrameBg",
},CheckMark=
{
ImageColor3="CheckMark",
BackgroundColor3="CheckMark",
},RadioButton=
{
BackgroundColor3="ButtonsBg",
TextColor3="Text",
FontFace="TextFont",
TextSize="TextSize"
}
}

aa.Styles={
RadioButton={
Animation="RadioButtons",
CornerRadius=UDim.new(1,0),
},
Button={
Animation="Buttons"
},
CollapsingHeader={
Animation="Buttons"
},
TreeNode={
Animation="TransparentButtons"
},
TransparentButton={
Animation="TransparentButtons"
}
}

aa.Animations={Invisible=
{
Connections={
MouseEnter={
Visible=true,
},
MouseLeave={
Visible=false,
}
},
Init="MouseLeave"
},Buttons=
{
Connections={
MouseEnter={
BackgroundTransparency=0.3,
},
MouseLeave={
BackgroundTransparency=0.7,
}
},
Init="MouseLeave"
},TextButtons=
{
Connections={
MouseEnter={
TextTransparency=0.3,
},
MouseLeave={
TextTransparency=0.7,
}
},
Init="MouseLeave"
},TransparentButtons=
{
Connections={
MouseEnter={
BackgroundTransparency=0.3,
},
MouseLeave={
BackgroundTransparency=1,
}
},
Init="MouseLeave"
},RadioButtons=
{
Connections={
MouseEnter={
BackgroundTransparency=0.5,
},
MouseLeave={
BackgroundTransparency=1,
}
},
Init="MouseLeave"
},Inputs=
{
Connections={
MouseEnter={
BackgroundTransparency=0,
},
MouseLeave={
BackgroundTransparency=0.5,
},
},
Init="MouseLeave"
},Plots=
{
Connections={
MouseEnter={
BackgroundTransparency=0.3,
},
MouseLeave={
BackgroundTransparency=0,
},
},
Init="MouseLeave"
},Border=
{
Connections={
Selected={
Transparency=0,
Thickness=1
},
Deselected={
Transparency=0.7,
Thickness=1
}
},
Init="Selected"
},
}

return aa end function a.k()local aa=a.cache.k if not aa then aa={c=__modImpl()}a.cache.k=aa end return aa.c end end do local function __modImpl()

















local aa={

Version="1.4.6",
Author="Depso",
License="MIT",
Repository="https://github.com/depthso/Dear-ReGui/",


Debug=false,
PrefabsId=71968920594655,
DefaultTitle="ReGui",
ContainerName="ReGui",
DoubleClickThreshold=0.3,
TooltipOffset=15,
IniToSave={
"Value"
},
ClassIgnored={
"Visible",
"Text"
},


Container=nil,
Prefabs=nil,
FocusedWindow=nil,
HasTouchScreen=false,


Services=nil,
Elements={},


_FlagCache={},
_ErrorCache={},
Windows={},
ActiveTooltips={},
IniSettings={},
AnimationConnections={}
}


local ab=a.b()
local ad=a.c()
local ae=a.d()
local b=a.e()
aa.DemoWindow=a.f()
aa.Services=ad.Services
aa.Animation=ae


aa.Icons=a.g()
aa.Accent=a.h()
aa.ThemeConfigs=a.i()
aa.ElementFlags=a.j()

local c=a.k()
aa.ElementColors=c.Coloring
aa.Animations=c.Animations
aa.Styles=c.Styles


ad:CallOnInitConnections(aa)

aa.DynamicImages={
[aa.Icons.Arrow]="ImageFollowsText",
[aa.Icons.Close]="ImageFollowsText",
[aa.Icons.Dot]="ImageFollowsText",
}










local d=aa.Services
local f=d.HttpService
local g=d.Players
local h=d.UserInputService
local i=d.RunService
local j=d.InsertService


local k=g.LocalPlayer
aa.PlayerGui=k.PlayerGui
aa.Mouse=k:GetMouse()

local l=function()end

function GetAndRemove(m,n)
local o=n[m]
if o then
n[m]=nil
end
return o
end

function MoveTableItem(m,n,o)
local p=table.find(m,n)
if not p then return end

local q=table.remove(m,p)
table.insert(m,o,q)
end

function Merge(m,n)
for o,p in next,n do
m[o]=p
end
end

function Copy(m,n)
local o=table.clone(m)


if n then
Merge(o,n)
end

return o
end





































function aa.Warn(m,...)
warn("[ReGui]::",...)
end

function aa.Error(m,...)
local n=aa:Concat({...}," ")
local o=`\n[ReGui]:: {n}`
coroutine.wrap(error)(o)
end

function aa.IsDoubleClick(m,n)
local o=m.DoubleClickThreshold
return n<o
end

function aa.StyleContainers(m)
local n=m.Container
local o=n.Overlays
local p=n.Windows

m:SetProperties(p,{
OnTopOfCoreBlur=true
})
m:SetProperties(o,{
OnTopOfCoreBlur=true
})
end

function aa.Init(m,n)
n=n or{}


if m.Initialised then return end


Merge(m,n)
Merge(m,{
Initialised=true,
HasGamepad=m:IsConsoleDevice(),
HasTouchScreen=m:IsMobileDevice(),
})


m:CheckConfig(m,{
ContainerParent=function()
return ad:ResolveUIParent()
end,
Prefabs=function()
return m:LoadPrefabs()
end,
},true)


m:CheckConfig(m,{
Container=function()
return m:InsertPrefab("Container",{
Parent=m.ContainerParent,
Name=m.ContainerName
})
end,
},true)


local o=m.Container
local p=m.TooltipOffset
local q=m.ActiveTooltips
local u=o.Overlays
local v=0

m:StyleContainers()


m.TooltipsContainer=m.Elements:Overlay{
Parent=u
}


h.InputBegan:Connect(function(w)
if not m:IsMouseEvent(w,true)then return end

local x=tick()
local y=x-v
local z=m:IsDoubleClick(y)


v=z and 0 or x


m:UpdateWindowFocuses()
end)

local function InputUpdate()
local w=m.TooltipsContainer
local x=#q>0
w.Visible=x

if not x then return end


local y,z=aa:GetMouseLocation()
local A=u.AbsolutePosition

w.Position=UDim2.fromOffset(
y-A.X+p,
z-A.Y+p
)
end


i.RenderStepped:Connect(InputUpdate)
end

function aa.CheckImportState(m)

if m.Initialised then return end


local n=m.PrefabsId
local o=ad:CheckAssetUrl(n)
local p,q=pcall(function()
return j:LoadLocalAsset(o)
end)


m:Init{
Prefabs=p and q or nil
}
end

function aa.GetVersion(m)
return m.Version
end

function aa.IsMobileDevice(m)
return h.TouchEnabled
end

function aa.IsConsoleDevice(m)
return h.GamepadEnabled
end

function aa.GetScreenSize(m)
return workspace.CurrentCamera.ViewportSize
end

function aa.LoadPrefabs(m)
local n=m.PlayerGui
local o="ReGui-Prefabs"


local p=script:WaitForChild(o,2)
if p then return p end


local q=n:WaitForChild(o,2)
if q then return q end

return nil
end

function aa.CheckConfig(m,n,o,p,q)
return ad:CheckConfig(n,o,p,q)
end

function aa.CreateInstance(m,n,o,p)
local q=Instance.new(n,o)


if p then
local u=p.UsePropertiesList

if not u then
m:SetProperties(q,p)
else
m:ApplyFlags{
Object=q,
Class=p
}
end
end

return q
end

function aa.ConnectMouseEvent(m,n,o)
local p=o.Callback
local q=o.DoubleClick
local u=o.OnlyMouseHovering

local v=0
local w

if u then
w=m:DetectHover(u)
end

n.Activated:Connect(function(...)
local x=tick()
local y=x-v


if w and not w.Hovering then return end


if q then
if not aa:IsDoubleClick(y)then
v=x
return
end
v=0
end

p(...)
end)
end

function aa.GetAnimation(m,n)
return n and m.Animation or TweenInfo.new(0)
end

function aa.DynamicImageTag(m,n,o,p)
local q=m.DynamicImages
local u=q[o]

if not u then return end
if not p then return end

p:TagElements{
[n]=u
}
end

function aa.GetDictSize(m,n)
local o=0
for p,q in n do
o+=1
end
return o
end

function aa.RemoveAnimations(m,n)
local o=m:GetAnimationData(n)
local p=o.Connections


for q,u in next,p do
u:Disconnect()
end
end

function aa.GetAnimationData(m,n)
local o=m.AnimationConnections
local p=o[n]


if p then return p end

local q={
Connections={}
}

o[n]=q
return q
end

function aa.AddAnimationSignal(m,n,o)
local p=m:GetAnimationData(n)
local q=p.Connections

table.insert(q,o)
end

function aa.SetAnimationsEnabled(m,n)
m.NoAnimations=not n
end

function aa.SetAnimation(m,n,o,p)
p=p or n

local q=m.Animations
local u=m.HasTouchScreen


local v=o
if typeof(o)~="table"then
v=q[o]
end

assert(v,`No animation data for Class {o}!`)


m:RemoveAnimations(p)


local w=v.Init
local x=v.Connections
local y=v.Tweeninfo
local z=v.NoAnimation


local A=m:GetAnimationData(n)
local B=A.State


local D
local E=true
local F
local G={}


local H={}
function H.Reset(I,J)
if not D then return end
D(J)
end
function H.FireSignal(I,J,K)
G[J](K)
end
function H.Refresh(I,J)
if not F then return end
G[F](J)
end
function H.SetEnabled(I,J)
E=J
end

for I,J in next,x do
local function OnSignal(K)
K=K==true
F=I


local L=m.NoAnimations
if L then return end


if not E then return end

A.State=I

ae:Tween{
NoAnimation=K or z,
Object=n,
Tweeninfo=y,
EndProperties=J
}
end


local K=p[I]


if not u then
local L=K:Connect(OnSignal)
m:AddAnimationSignal(p,L)
end

G[I]=OnSignal


if I==w then
D=OnSignal
end
end

if B then

H:FireSignal(B)
else

H:Reset(true)
end

return H
end






function aa.ConnectDrag(m,n,o)
m:CheckConfig(o,{
DragStart=l,
DragEnd=l,
DragMovement=l,
OnDragStateChange=l,
})


local p=o.DragStart
local q=o.DragEnd
local u=o.DragMovement
local v=o.OnDragStateChange


local w={
StartAndEnd={
Enum.UserInputType.MouseButton1,
Enum.UserInputType.Touch
},
Movement={
Enum.UserInputType.MouseMovement,
Enum.UserInputType.Touch
}
}

local x=false

local function InputTypeAllowed(y,z)
local A=y.UserInputType
return table.find(w[z],A)
end
local function KeyToVector(y)
local z=y.Position
return Vector2.new(z.X,z.Y)
end
local function SetIsDragging(y)

m._DraggingDisabled=y

x=y
v(y)
end
local function MakeSignal(y)
local z=y.IsDragging
local A=y.InputType
local B=y.Callback

return function(D)
if y.DraggingRequired~=x then return end
if y.CheckDraggingDisabled and m._DraggingDisabled then return end
if not InputTypeAllowed(D,A)then return end


if y.UpdateState then
SetIsDragging(z)
end

local E=KeyToVector(D)
B(E)
end
end


n.InputBegan:Connect(MakeSignal{
CheckDraggingDisabled=true,
DraggingRequired=false,
UpdateState=true,
IsDragging=true,
InputType="StartAndEnd",
Callback=p,
})
h.InputEnded:Connect(MakeSignal{
DraggingRequired=true,
UpdateState=true,
IsDragging=false,
InputType="StartAndEnd",
Callback=q,
})
h.InputChanged:Connect(MakeSignal{
DraggingRequired=true,
InputType="Movement",
Callback=u,
})
end











function aa.MakeDraggable(m,n)

local o=n.Move
local p=n.Grab
local q=n.OnDragStateChange

local u
local v


local w={}
function w.SetEnabled(x,y)
local z=n.StateChanged
x.Enabled=y



if z then
z(x)
end
end
function w.CanDrag(x,y)
return x.Enabled
end


local function DragStart(x)
if not w:CanDrag()then return end
local y=n.DragBegin

v=x
y(v)
end

local function DragMovement(x)
if not w:CanDrag()then return end

local y=x-v
local z=n.OnUpdate

z(y)
end


local function PositionBegan(x)
u=o.Position
end
local function UpdatePosition(x)
local y=UDim2.new(
u.X.Scale,
u.X.Offset+x.X,
u.Y.Scale,
u.Y.Offset+x.Y
)
n:SetPosition(y)
end
local function SetPosition(x,y)

ae:Tween{
Object=o,
EndProperties={
Position=y
}
}
end


m:CheckConfig(n,{
Enabled=true,
OnUpdate=UpdatePosition,
SetPosition=SetPosition,
DragBegin=PositionBegan
})


m:ConnectDrag(p,{
DragStart=DragStart,
DragMovement=DragMovement,
OnDragStateChange=q
})


local x=n.Enabled
w:SetEnabled(x)

return w
end








function aa.MakeResizable(m,n)
aa:CheckConfig(n,{
MinimumSize=Vector2.new(160,90),
MaximumSize=Vector2.new(math.huge,math.huge)
})


local o=n.MaximumSize
local p=n.MinimumSize
local q=n.Resize
local u=n.OnUpdate

local v


local w=aa:InsertPrefab("ResizeGrab",{
Parent=q
})

local function StateChanged(x)
w.Visible=x.Enabled
end


local function UpdateSize(x)
local y=v+x


local z=UDim2.fromOffset(
math.clamp(y.X,p.X,o.X),
math.clamp(y.Y,p.Y,o.Y)
)


if u then
u(z)
return
end


ae:Tween{
Object=q,
EndProperties={
Size=z
}
}
end
local function ResizeBegin(x)
v=q.AbsoluteSize
end


local x=m:MakeDraggable{
Grab=w,
OnUpdate=UpdateSize,
DragBegin=ResizeBegin,
StateChanged=StateChanged
}

x.Grab=w

return x
end

function aa.IsMouseEvent(m,n,o)
local p=n.UserInputType.Name


if o and p:find"Movement"then return end

return p:find"Touch"or p:find"Mouse"
end









function aa.DetectHover(m,n,o)
local p=o or{}
p.Hovering=false


local q=p.OnInput
local u=p.OnHoverChange
local v=p.Anykey
local w=p.MouseMove
local x=p.MouseEnter
local y=p.MouseOnly

local function Update(z,A,B)

if z and y then
if not aa:IsMouseEvent(z,true)then return end
end


if A~=nil then
local D=p.Hovering
p.Hovering=A


if A~=D and u then
u(A)
end
end


if not x and B then return end


if q then
local D=p.Hovering
q(D,z)
return
end
end


local z={
n.MouseEnter:Connect(function()
Update(nil,true,true)
end),
n.MouseLeave:Connect(function()
Update(nil,false,true)
end)
}


if v or y then
table.insert(z,h.InputBegan:Connect(function(A)
Update(A)
end))
end


if w then
local A=n.MouseMoved:Connect(function()
Update()
end)
table.insert(z,A)
end

function p.Disconnect(A)
for B,D in next,z do
D:Disconnect()
end
end

return p
end

function aa.StackWindows(m)
local n=m.Windows
local o=20

for p,q in next,n do
local u=q.WindowFrame

local v=UDim2.fromOffset(o*p,o*p)

q:Center()
u.Position+=v
end
end

function aa.GetElementFlags(m,n)
local o=m._FlagCache
return o[n]
end









function aa.UpdateColors(m,n)

local o=n.Object
local p=n.Tag
local q=n.NoAnimation
local u=n.TagsList
local v=n.Theme
local w=n.Tweeninfo


local x=m.ElementColors
local y=m:GetElementFlags(o)
local z=m.Debug

local A=x[p]


if typeof(A)=="string"then
A=x[A]
end

if typeof(p)=="table"then
A=p
elseif u then
u[o]=p
end


if not A then return end


local B={}
for D,E in next,A do
local F=m:GetThemeKey(v,E)


if y and y[D]then
continue
end


if not F then
if z then
m:Warn(`Color: '{E}' does not exist!`)
end
continue
end

B[D]=F
end


ae:Tween{
Tweeninfo=w,
Object=o,
NoAnimation=q,
EndProperties=B
}
end








function aa.MultiUpdateColors(m,n)
local o=n.Objects

for p,q in next,o do
m:UpdateColors{
TagsList=n.TagsList,
Theme=n.Theme,
NoAnimation=not n.Animate,
Tweeninfo=n.Tweeninfo,

Object=p,
Tag=q,
}
end
end

function aa.ApplyStyle(m,n,o)
local p=m.Styles

local q=p[o]
if not q then return end


m:ApplyFlags{
Object=n,
Class=q
}
end

function aa.ClassIgnores(m,n)
local o=m.ClassIgnored
local p=table.find(o,n)

return p and true or false
end

function aa.MergeMetatables(m,n,o)
local p=m.Debug
local q={}

q.__index=function(u,v)
local w=m:ClassIgnores(v)


local x=n[v]
if x~=nil and not w then
return x
end


local y,z=pcall(function()
local y=o[v]
return m:PatchSelf(o,y)
end)

return y and z or nil
end

q.__newindex=function(u,v,w)
local x=m:ClassIgnores(v)
local y=typeof(w)=="function"


local z=n[v]~=nil or y
if z and not x then
n[v]=w
return
end


xpcall(function()
o[v]=w
end,function(A)
if p then
m:Warn(`Newindex Error: {o}.{v} = {w}\n{A}`)
end

n[v]=w
end)
end

return setmetatable({},q)
end

function aa.Concat(m,n,o)
local p=""
for q,u in next,n do
p..=tostring(u)..(q~=#n and o or"")
end
return p
end

function aa.GetValueFromAliases(m,n,o)
for p,q in n do
local u=o[q]
if u~=nil then
return u
end
end

return nil
end

function aa.RecursiveCall(m,n,o)
for p,q in next,n:GetDescendants()do
o(q)
end
end







function aa.ApplyFlags(m,n)
local o=m.ElementFlags


local p=n.Object
local q=n.Class
local u=n.WindowClass

function n.GetThemeKey(v,w)
if u then
return u:GetThemeKey(w)
else
return aa:GetThemeKey(nil,w)
end
end


m:SetProperties(p,q)


for v,w in next,o do
local x=w.Properties
local y=w.Callback
local z=w.Recursive
local A=w.WindowProperties


local B=m:GetValueFromAliases(x,q)


if u and A and B==nil then
B=m:GetValueFromAliases(A,u)
end

if B==nil then continue end


y(n,p,B)


if z then
m:RecursiveCall(p,function(D)
y(n,D,B)
end)
end
end
end

function aa.SetProperties(m,n,o)
return ad:SetProperties(n,o)
end

function aa.InsertPrefab(m,n,o)
local p=m.Prefabs
local q=p.Prefabs

local u=q:WaitForChild(n)
local v=u:Clone()


if o then
local w=o.UsePropertiesList

if not w then
m:SetProperties(v,o)
else
m:ApplyFlags{
Object=v,
Class=o
}
end
end

return v
end

function aa.GetContentSize(m,n,o)
local p=n:FindFirstChildOfClass"UIListLayout"
local q=n:FindFirstChildOfClass"UIPadding"
local u=n:FindFirstChildOfClass"UIStroke"

local v


if p and not o then
v=p.AbsoluteContentSize
else
v=n.AbsoluteSize
end


if q then
local w=q.PaddingTop.Offset
local x=q.PaddingBottom.Offset
local y=q.PaddingLeft.Offset
local z=q.PaddingRight.Offset

v+=Vector2.new(y+z,w+x)
end

if u then
local w=u.Thickness
v+=Vector2.new(w/2,w/2)
end

return v
end

function aa.PatchSelf(m,n,o,...)

if typeof(o)~="function"then
return o,...
end

return function(p,...)
return o(n,...)
end
end






function aa.MakeCanvas(m,n)

local o=m.Elements
local p=m.Debug


local q=n.Element
local u=n.WindowClass
local v=n.Class
local w=n.OnChildChange

local x=b:NewSignal()


if w then
x:Connect(w)
end


if not u and p then
m:Warn(`No WindowClass for {q}`)
m:Warn(n)
end


local y=ad:NewClass(o,{
Class=v,
RawObject=q,
WindowClass=u or false,
OnChildChange=x,
Elements={}
})


local z={
__index=function(z,A)

local B=y[A]
if B~=nil then
return m:PatchSelf(y,B)
end


local D=v[A]
if D~=nil then
return m:PatchSelf(v,D)
end


local E=q[A]
return m:PatchSelf(q,E)
end,
__newindex=function(z,A,B)
local D=v[A]~=nil


if D then
v[A]=B
else
q[A]=B
end
end,
}

return setmetatable({},z)
end


function aa.GetIniData(m,n)
local o=m.IniToSave
local p={}

for q,u in next,o do
p[u]=n[u]
end

return p
end

function aa.DumpIni(m,n)
local o=m.IniSettings
local p={}

for q,u in next,o do
p[q]=m:GetIniData(u)
end


if n then
return f:JSONEncode(p)
end

return p
end

function aa.LoadIniIntoElement(m,n,o)
local p={Value=
function(p)
n:SetValue(p)
end,
}

for q,u in next,o do

local v=p[q]
if v then
v(u)
continue
end

n[q]=u
end
end

function aa.LoadIni(m,n,o)
local p=m.IniSettings
assert(n,"No Ini configuration was passed")


if o then
n=f:JSONDecode(n)
end

for q,u in next,n do
local v=p[q]
m:LoadIniIntoElement(v,u)
end
end

function aa.AddIniFlag(m,n,o)
local p=m.IniSettings
p[n]=o
end







function aa.OnElementCreate(m,n)
local o=m._FlagCache

local p=n.Flags
local q=n.Object
local u=n.Canvas
local v=n.Class

local w=u.WindowClass

local x=p.NoAutoTag
local y=p.NoAutoFlags
local z=p.ColorTag
local A=p.NoStyle
local B=p.IniFlag


o[q]=p


if B then
m:AddIniFlag(B,v)
end


if A then return end


if not x and w then
w:TagElements{
[q]=z
}
end


if w then
w:LoadStylesIntoElement(n)
end

if not y then

m:ApplyFlags{
Object=q,
Class=p,
WindowClass=w
}
end
end

function aa.VisualError(m,n,o,p)
local q=m.Initialised and n.Error


if not q then
m:Error("Class:",p)
return
end


n:Error{
Parent=o,
Text=p
}
end

function aa.WrapGeneration(m,n,o)
local p=m._ErrorCache

local q=o.Base
local u=o.IgnoreDefaults

return function(v,w,...)
w=w or{}


m:CheckConfig(w,q)


local x=w.CloneTable


if x then
w=table.clone(w)
end

local y=v.RawObject
local z=v.Elements
local A=v.OnChildChange


m:CheckConfig(w,{
Parent=y,
Name=w.ColorTag
},nil,u)


if v==m then
v=m.Elements
end



local B,D,E=pcall(n,v,w,...)


if B==false then
if y then
if p[y]then return end
p[y]=D
end


m:VisualError(v,y,D)
m:Error("Class:",D)
m:Error(debug.traceback())
end


if E==nil then
E=D
end


if A then
A:Fire(D)
end


if E then
if z then
table.insert(z,E)
end

m:OnElementCreate{
Object=E,
Flags=w,
Class=D,
Canvas=v
}
end

return D,E
end
end

function aa.DefineElement(m,n,o)
local p=m.Elements
local q=m.ThemeConfigs
local u=m.ElementColors

local v=q.DarkTheme


local w=o.Base
local x=o.Create
local y=o.Export
local z=o.ThemeTags
local A=o.ColorData


m:CheckConfig(w,{
ColorTag=n,
ElementStyle=n
})


if z then
Merge(v,z)
end


if A then
Merge(u,A)
end


local B=m:WrapGeneration(x,o)


if y then
m[n]=B
end


p[n]=B

return B
end

function aa.DefineGlobalFlag(m,n)
local o=m.ElementFlags
table.insert(o,n)
end

function aa.DefineTheme(m,n,o)
local p=m.ThemeConfigs


m:CheckConfig(o,{
BaseTheme=p.DarkTheme
})

local q=GetAndRemove("BaseTheme",o)
local u={
BaseTheme=q,
Values=o
}


p[n]=u

return u
end

function aa.GetMouseLocation(m)
local n=m.Mouse
return n.X,n.Y
end

function aa.SetWindowFocusesEnabled(m,n)
m.WindowFocusesEnabled=n
end

function aa.UpdateWindowFocuses(m)
local n=m.Windows
local o=m.WindowFocusesEnabled

if not o then return end


for p,q in n do
local u=q.HoverConnection
if not u then continue end


local v=u.Hovering
if v then
m:SetFocusedWindow(q)
return
end
end

m:SetFocusedWindow(nil)
end

function aa.WindowCanFocus(m,n)
if n.NoSelect then return false end
if n.Collapsed then return false end
if n._SelectDisabled then return false end

return true
end

function aa.GetFocusedWindow(m)
return m.FocusedWindow
end

function aa.BringWindowToFront(m,n)
local o=m.Windows


local p=n.NoBringToFrontOnFocus
if p then return end


MoveTableItem(o,n,1)
end

function aa.SetFocusedWindow(m,n)
local o=m:GetFocusedWindow()
local p=m.Windows


if o==n then return end
m.FocusedWindow=n


if n then
local q=m:WindowCanFocus(n)
if not q then return end


m:BringWindowToFront(n)
end


local q=#p
for u,v in p do
local w=m:WindowCanFocus(v)
local x=v.WindowFrame


if not w then continue end

q-=1


if q then
x.ZIndex=q
end


local y=v==n
v:SetFocused(y,q)
end
end

function aa.SetItemTooltip(m,n,o)local p=
m.Elements
local q=m.TooltipsContainer
local u=m.ActiveTooltips


local v,w=q:Canvas{
Visible=false,
UiPadding=UDim.new()
}


task.spawn(o,v)


aa:DetectHover(n,{
MouseMove=true,
MouseEnter=true,
OnHoverChange=function(x)

if x then
table.insert(u,v)
return
end


local y=table.find(u,v)
table.remove(u,y)
end,
OnInput=function(x,y)
w.Visible=x
end,
})
end

function aa.CheckFlags(m,n,o)
for p,q in next,n do
local u=o[p]
if not u then continue end

q(u)
end
end

function aa.GetThemeKey(m,n,o)
local p=m.ThemeConfigs


if typeof(n)=="string"then
n=p[n]
end

local q=p.DarkTheme
n=n or q

local u=n.BaseTheme
local v=n.Values


local w=v[o]
if w then return w end


if u then
return m:GetThemeKey(u,o)
end

return
end

function aa.SelectionGroup(m,n)
local o
local p=false

local function ForEach(q,u)
for v,w in next,n do
if typeof(w)=="Instance"then continue end
if w==u then continue end

q(w)
end
end

local function Callback(q)
if p then return end
p=true

local u=o
o=q:GetValue()

if not u then
u=o
end

ForEach(function(v)
v:SetValue(u)
end,q)

p=false
end

ForEach(function(q)
q.Callback=Callback
end)
end


local m=aa.Elements
m.__index=m

function m.GetObject(n)
return n.RawObject
end

function m.ApplyFlags(n,o,p)
local q=n.WindowClass

aa:ApplyFlags{
WindowClass=q,
Object=o,
Class=p
}
end

function m.Remove(n)
local o=n.OnChildChange
local p=n:GetObject()
local q=n.Class


local u=q.Remove
if u then
return u(q)
end


if o then
o:Fire(q or n)
end

if q then
table.clear(q)
end

p:Destroy()
table.clear(n)
end

function m.GetChildElements(n)
local o=n.Elements
return o
end

function m.ClearChildElements(n)
local o=n:GetChildElements()
for p,q in next,o do
q:Destroy()
end
end

function m.TagElements(n,o)
local p=n.WindowClass
local q=aa.Debug


if not p then
if q then
aa:Warn("No WindowClass for TagElements:",o)
end
return
end

p:TagElements(o)
end

function m.GetThemeKey(n,o)
local p=n.WindowClass

if p then
return p:GetThemeKey(o)
end

return aa:GetThemeKey(nil,o)
end

function m.SetColorTags(n,o,p)
local q=n.WindowClass
if not q then return end

local u=q.TagsList
local v=q.Theme

aa:MultiUpdateColors{
Animate=p,
Theme=v,
TagsList=u,
Objects=o,
}
end

function m.SetElementFocused(n,o,p)
local q=n.WindowClass
local u=aa.HasTouchScreen

local v=p.Focused
local w=p.Animation


aa:SetAnimationsEnabled(not v)


if not v and w then
w:Refresh()
end


if not q then return end
if not u then return end
local x=q.ContentCanvas


x.Interactable=not v
end

aa:DefineElement("Dropdown",{
Base={
ColorTag="PopupCanvas",
Disabled=false,
AutoClose=true,
OnSelected=l
},
Create=function(n,o)
o.Parent=aa.Container.Overlays


local p=o.Selected
local q=o.Items
local u=o.OnSelected


local v,w=n:PopupCanvas(o)
local x=aa:MergeMetatables(o,v)

local y={}

local function SetValue(z)
u(z)
end

function o.ClearEntries(z)
for A,B in y do
B:Remove()
end
end

function o.SetItems(z,A,B)
local D=A[1]


z:ClearEntries()


for E,F in A do
local G=D and F or E
local H=E==B or F==B


local I=v:Selectable{
Text=tostring(G),
Selected=H,
ZIndex=6,
Callback=function()
return SetValue(G)
end,
}

table.insert(y,I)
end
end


if q then
o:SetItems(q,p)
end

return x,w
end,
})

aa:DefineElement("OverlayScroll",{
Base={
ElementClass="OverlayScroll",
Spacing=UDim.new(0,4),
},
Create=function(n,o)
local p=n.WindowClass

local q=o.ElementClass
local u=o.Spacing


local v=aa:InsertPrefab(q,o)
local w=v:FindFirstChild"ContentFrame"or v
local x=v:FindFirstChild("UIListLayout",true)

x.Padding=u

local y=aa:MergeMetatables(n,o)


local z=aa:MakeCanvas{
Element=w,
WindowClass=p,
Class=y
}

function o.GetCanvasSize(A)
return w.AbsoluteCanvasSize
end

return z,v
end,
})

aa:DefineElement("Overlay",{
Base={
ElementClass="Overlay"
},
Create=m.OverlayScroll,
})





aa:DefineElement("Image",{
Base={
Image="",
Callback=l
},
Create=function(n,o)

local p=aa:InsertPrefab("Image",o)
p.Activated:Connect(function(...)
local q=o.Callback
return q(p,...)
end)

return p
end,
})





aa:DefineElement("VideoPlayer",{
Base={
Video="",
Callback=l
},
Create=function(n,o)

local p=o.Video
o.Video=ad:CheckAssetUrl(p)


local q=aa:InsertPrefab("VideoPlayer",o)
return q
end,
})








aa:DefineElement("Button",{
Base={
Text="Button",
DoubleClick=false,
Callback=l
},
Create=function(n,o)

local p=aa:InsertPrefab("Button",o)
local q=aa:MergeMetatables(o,p)

local u=o.DoubleClick
function o.SetDisabled(v,w)
v.Disabled=w
end


aa:ConnectMouseEvent(p,{
DoubleClick=u,
Callback=function(...)
if o.Disabled then return end
local v=o.Callback
return v(q,...)
end,
})

return q,p
end,
})









aa:DefineElement("Selectable",{
Base={
Text="Selectable",
Callback=l,
Selected=false,
Disabled=false,
Size=UDim2.fromScale(1,0),
AutomaticSize=Enum.AutomaticSize.Y,
TextXAlignment=Enum.TextXAlignment.Left,
AnimationTags={
Selected="Buttons",
Unselected="TransparentButtons"
},
},
Create=function(n,o)
local p=n.Class.AfterClick

local q=o.Selected
local u=o.Disabled


local v=aa:InsertPrefab("Button",o)
local w=aa:MergeMetatables(o,v)

v.Activated:Connect(function(...)

local x=o.Callback
x(v,...)


if p then
p(v,...)
end
end)

function o.SetSelected(x,y)
local z=x.AnimationTags
local A=y and z.Selected or z.Unselected

x.Selected=y
aa:SetAnimation(v,A)
return x
end

function o.SetDisabled(x,y)
x.Disabled=y
v.Interactable=not y
return x
end


o:SetSelected(q)
o:SetDisabled(u)

return w,v
end,
})





aa:DefineElement("ImageButton",{
Base={
ElementStyle="Button",
Callback=l
},
Create=m.Image,
})

aa:DefineElement("SmallButton",{
Base={
Text="Button",
PaddingTop=UDim.new(),
PaddingBottom=UDim.new(),
PaddingLeft=UDim.new(0,2),
PaddingRight=UDim.new(0,2),
ColorTag="Button",
ElementStyle="Button",
Callback=l,
},
Create=m.Button
})






















aa:DefineElement("Keybind",{
Base={
Label="Keybind",
ColorTag="Frame",
Value=nil,
DeleteKey=Enum.KeyCode.Backspace,
IgnoreGameProcessed=true,
Enabled=true,
Disabled=false,
Callback=l,
OnKeybindSet=l,
OnBlacklistedKeybindSet=l,
KeyBlacklist={},
UiPadding=UDim.new(),
AutomaticSize=Enum.AutomaticSize.None,
Size=UDim2.new(0.3,0,0,19)
},
Create=function(n,o)
local p=o.Value
local q=o.Label
local u=o.Disabled
local v=o.KeyBlacklist


local w=aa:InsertPrefab("Button",o)
local x=aa:MergeMetatables(o,w)

local y=n:Label{
Parent=w,
Text=q,
Position=UDim2.new(1,4,0.5),
AnchorPoint=Vector2.new(0,0.5)
}

local function Callback(z,...)
return z(w,...)
end

local function KeyIsBlacklisted(z)
return table.find(v,z)
end

function o.SetDisabled(z,A)
z.Disabled=A
w.Interactable=not A
n:SetColorTags({
[y]=A and"LabelDisabled"or"Label"
},true)
return z
end

function o.SetValue(z,A)
local B=z.OnKeybindSet
local D=z.DeleteKey


if A==D then
A=nil
end

z.Value=A
w.Text=A and A.Name or"Not set"


Callback(B,A)
return z
end

function o.WaitForNewKey(z)
z._WaitingForNewKey=true
w.Text="..."
w.Interactable=false
end

local function GetKeyId(z)
local A=z.KeyCode
local B=z.UserInputType


if B~=Enum.UserInputType.Keyboard then
return B
end

return A
end

local function CheckNewKey(z)
local A=o.OnBlacklistedKeybindSet
local B=o.Value

local D=GetKeyId(z)


if not h.WindowFocused then return end


if KeyIsBlacklisted(D)then

Callback(A,D)
return
end

w.Interactable=true
o._WaitingForNewKey=false


if D.Name=="Unknown"then
return o:SetValue(B)
end


o:SetValue(D)
return
end

local function InputBegan(z,A)
local B=o.IgnoreGameProcessed
local D=o.DeleteKey
local E=o.Enabled
local F=o.Value
local G=o.Callback

local H=GetKeyId(z)


if o._WaitingForNewKey then
CheckNewKey(z)
return
end


if not E and w.Interactable then return end
if not B and A then return end


if not F then return end
if H==D then return end
if H.Name~=F.Name then return end


Callback(G,H)
end


o:SetValue(p)
o:SetDisabled(u)


o.Connection=h.InputBegan:Connect(InputBegan)
w.Activated:Connect(function()
o:WaitForNewKey()
end)

aa:SetAnimation(w,"Inputs")

return x,w
end
})

aa:DefineElement("ArrowButton",{
Base={
Direction="Left",
ColorTag="Button",
Icon=aa.Icons.Arrow,
Size=UDim2.fromOffset(21,21),
IconSize=UDim2.fromScale(1,1),
IconPadding=UDim.new(0,4),
Rotations={
Left=180,
Right=0,
}
},
Create=function(n,o)

local p=o.Direction
local q=o.Rotations

local u=q[p]
o.IconRotation=u


local v=aa:InsertPrefab("ArrowButton",o)
v.Activated:Connect(function(...)
local w=o.Callback
return w(v,...)
end)

return v
end,
})








aa:DefineElement("Label",{
Base={
Font="Inconsolata"
},
ColorData={LabelPadding=
{
PaddingTop="LabelPaddingTop",
PaddingBottom="LabelPaddingBottom"
},
},
Create=function(n,o)

local p=o.Bold
local q=o.Italic
local u=o.Font
local v=o.FontFace


local w=Enum.FontWeight.Medium
local x=Enum.FontWeight.Bold


local y=Enum.FontStyle.Normal
local z=Enum.FontStyle.Italic

local A=p and x or w
local B=q and z or y
local D=p or q

if not v and D then
o.FontFace=Font.fromName(u,A,B)
end

local E=aa:InsertPrefab("Label",o)
local F=E:FindFirstChildOfClass"UIPadding"

n:TagElements{
[F]="LabelPadding",
}


return E
end,
})

aa:DefineElement("Error",{
Base={
RichText=true,
TextWrapped=true
},
ColorData={Error=
{
TextColor3="ErrorText",
FontFace="TextFont",
},
},
Create=function(n,o)
local p=o.Text
o.Text=`<b>⛔ Error:</b> {p}`

return n:Label(o)
end,
})






















aa:DefineElement("CodeEditor",{
Base={
Editable=true,
Fill=true,
Text=""
},
Create=function(n,o)
local p=n.WindowClass
local q=ab.CodeFrame.new(o)
local u=q.Gui

o.Parent=n:GetObject()

aa:ApplyFlags{
Object=u,
WindowClass=p,
Class=o
}

return q,u
end,
})


local n={
Engaged=false
}
n.__index=n

function n.SetEngaged(o,p)
local q=o.WindowClass
o.Engaged=p


if q then
q:SetCanvasInteractable(not p)
end
end

function n.IsHovering(o)
local p=false


o:Foreach(function(q)
p=q.Popup:IsMouseHovering()
return p
end)

return p
end

function n.Foreach(o,p)
local q=o.Menus
for u,v in next,q do

local w=p(v)
if w then break end
end
end

function n.SetFocusedMenu(o,p)
o:Foreach(function(q)

local u=q==p
q:SetActiveState(u)
end)
end

function n.Close(o)
o:SetEngaged(false)
o:SetFocusedMenu(nil)
end

function n.MenuItem(o,p)
local q=o.Canvas
local u=o.Menus


local v=q:MenuButton(p)
local w=q:PopupCanvas{
RelativeTo=v,
MaxSizeX=210,
Visible=false,
AutoClose=false,
AfterClick=function()
o:Close()
end,
}


local x={
Popup=w,
Button=v
}


aa:DetectHover(v,{
MouseEnter=true,
OnInput=function()
if not o.Engaged then return end
o:SetFocusedMenu(x)
end,
})

function x.SetActiveState(y,z)
w:SetPopupVisible(z)
v:SetSelected(z)
end


v.Activated:Connect(function()
o:SetFocusedMenu(x)
o:SetEngaged(true)
end)


table.insert(u,x)

return w,x
end

aa:DefineElement("MenuBar",{
Base={},
Create=function(o,p)
local q=o.WindowClass


local u=aa:InsertPrefab("MenuBar",p)


local v=aa:MakeCanvas{
Element=u,
WindowClass=q,
Class=p
}


local w=ad:NewClass(n,{
WindowClass=q,
Canvas=v,
Object=u,
Menus={}
})
Merge(w,p)


aa:DetectHover(u,{
MouseOnly=true,
OnInput=function()
if not w.Engaged then return end
if w:IsHovering()then return end

w:Close()
end,
})

local x=aa:MergeMetatables(w,v)
return x,u
end,
})

aa:DefineElement("MenuButton",{
Base={
Text="MenuButton",
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
Size=UDim2.fromOffset(0,19),
AutomaticSize=Enum.AutomaticSize.XY
},
Create=m.Selectable
})


local o={
ColorTags={
BGSelected={
[true]="SelectedTab",
[false]="DeselectedTab"
},
LabelSelected={
[true]="SelectedTabLabel",
[false]="DeselectedTabLabel"
},
}
}
function o.SetButtonSelected(p,q,u)

if q.IsSelected==u then return end
q.IsSelected=u

local v=p.NoAnimation
local w=p.WindowClass
local x=p.ColorTags


local y=w.Theme
local z=w.TagsList


local A=x.BGSelected
local B=x.LabelSelected

local D=q.TabButton
local E=D.Button
local F=E.Label

aa:MultiUpdateColors{
Animate=not v,
Theme=y,
TagsList=z,
Objects={
[E]=A[u],
[F]=B[u],
},
}
end

function o.CompareTabs(p,q,u)
if not q then return false end
return q.MatchBy==u or q==u
end

function o.ForEachTab(p,q,u)
local v=typeof(q)=="string"
local w=p.Tabs

for x,y in w do
local z=y.Name
local A=false


if v then
A=z==q
else
A=p:CompareTabs(y,q)
end


u(y,A,x)
end
end

function o.RemoveTab(p,q)
local u=p.OnTabRemove
local v=p.Tabs

p:ForEachTab(q,function(w,x,y)
if not x then return end
local z=w.TabButton
local A=w.OnClosure


table.remove(v,y)
z:Destroy()


u(p,w)
A(w)
end)

return p
end









function o.CreateTab(p,q)
q=q or{}
aa:CheckConfig(q,{
Name="Tab",
AutoSize="Y",
Focused=false,
OnClosure=l
})


local u=p.AutoSelectNewTabs
local v=p.WindowClass
local w=p.ParentCanvas
local x=p.Tabs
local y=p.TabsFrame
local z=p.OnTabCreate


local A=q.Focused
local B=q.Name local D=
q.Icon
local E=A or#x<=0 and u


local F=aa:InsertPrefab("TabButton",q)
F.Parent=y


local G=F.Button
local H=G:FindFirstChildOfClass"UIPadding"
local I=G.Label
I.Text=tostring(B)

Merge(q,{
TabButton=F
})

local function SetActive()
p:SetActiveTab(q)
end


local J={Closeable=
function()
local J=w:RadioButton{
Parent=G,
Visible=not p.NoClose,
Icon=aa.Icons.Close,
IconSize=UDim2.fromOffset(11,11),
LayoutOrder=3,
ZIndex=2,
UsePropertiesList=true,
Callback=function()
p:RemoveTab(q)
end,
}


local K=J.Icon
aa:SetAnimation(K,{
Connections={
MouseEnter={
ImageTransparency=0,
},
MouseLeave={
ImageTransparency=1,
}
},
Init="MouseLeave"
},F)
end,
}


G.Activated:Connect(SetActive)


aa:CheckFlags(J,q)


table.insert(x,q)


if v then
v:TagElements{
[H]="TabPadding",
}
end


aa:SetAnimation(G,"Buttons")
p:SetButtonSelected(q,E)


w:ApplyFlags(F,q)

local K=z(p,q)


if E then
p:SetActiveTab(q)
end

return K or q
end

function o.SetActiveTab(p,q)local u=

p.Tabs local v=
p.NoAnimation
local w=p.ActiveTab
local x=p.OnActiveTabChange local y=

typeof(q)=="string"
local z


p:ForEachTab(q,function(A,B,D)
if B then
z=A
end
p:SetButtonSelected(A,B)
end)

if not z then return p end
if p:CompareTabs(z,w)then return p end

p.ActiveTab=z


x(p,z,w)

return p
end







aa:DefineElement("TabBar",{
Base={
AutoSelectNewTabs=true,
OnActiveTabChange=l,
OnTabCreate=l,
OnTabRemove=l,
},
ColorData={DeselectedTab=
{
BackgroundColor3="TabBg"
},SelectedTab=
{
BackgroundColor3="TabBgActive"
},DeselectedTabLabel=
{
FontFace="TextFont",
TextColor3="TabText",
},SelectedTabLabel=
{
FontFace="TextFont",
TextColor3="TabTextActive",
},TabsBarSeparator=
{
BackgroundColor3="TabBgActive",
},TabPadding=
{
PaddingTop="TabTextPaddingTop",
PaddingBottom="TabTextPaddingBottom"
},TabPagePadding=
{
PaddingBottom="TabPagePadding",
PaddingLeft="TabPagePadding",
PaddingRight="TabPagePadding",
PaddingTop="TabPagePadding",
}
},
Create=function(p,q)
local w=p.WindowClass


local x=aa:InsertPrefab("TabsBar",q)
local y=ad:NewClass(o)

local z=x.Separator
local A=x.TabsFrame


local B=aa:MakeCanvas{
Element=A,
WindowClass=w,
Class=y
}


Merge(y,q)
Merge(y,{
ParentCanvas=p,
Object=x,
TabsFrame=A,
WindowClass=w,
Tabs={}
})


p:TagElements{
[x]="TabsBar",
[z]="TabsBarSeparator",
}

local D=aa:MergeMetatables(B,x)
return D,x
end,
})





aa:DefineElement("TabSelector",{
Base={
NoTabsBar=false,
OnActiveTabChange=l,
OnTabCreate=l,
OnTabRemove=l,
},
Create=function(p,q)
local w=p.WindowClass

local x=q.NoTabsBar
local y=q.NoAnimation


local z=aa:InsertPrefab("TabSelector",q)

local A=z.Body
local B=A.PageTemplate
B.Visible=false


local function OnTabCreate(D,E,...)
local F=E.AutoSize
local G=E.Name


local H=B:Clone()
local I=ad:GetChildOfClass(H,"UIPadding")

aa:SetProperties(H,{
Parent=A,
Name=G,
AutomaticSize=Enum.AutomaticSize[F],
Size=UDim2.fromScale(
F=="Y"and 1 or 0,
F=="X"and 1 or 0
)
})


p:TagElements{
[I]="TabPagePadding",
}


local J=aa:MakeCanvas{
Element=H,
WindowClass=w,
Class=E
}


q.OnTabCreate(D,E,...)

Merge(E,{
Page=H,
MatchBy=J
})

return J
end
local function OnActiveTabChange(D,E,...)
D:ForEachTab(E,function(F,G,H)
local I=F.Page
I.Visible=G

if not G then return end


local J=p:GetThemeKey"AnimationTweenInfo"
ae:Tween{
Object=I,
Tweeninfo=J,
NoAnimation=y,
StartProperties={
Position=UDim2.fromOffset(0,4)
},
EndProperties={
Position=UDim2.fromOffset(0,0)
}
}
end)


q.OnActiveTabChange(D,E,...)
end


local D=p:TabBar{
Parent=z,
Visible=not x,
OnTabCreate=OnTabCreate,
OnActiveTabChange=OnActiveTabChange,
OnTabRemove=function(D,E,...)
E.Page:Remove()
q.OnTabRemove(...)
end,
}

local E=aa:MergeMetatables(D,z)
return E,z
end,
})






aa:DefineElement("RadioButton",{
Base={
Callback=l,
},
Create=function(p,q)
local w=aa:InsertPrefab("RadioButton",q)
w.Activated:Connect(function(...)
local x=q.Callback
return x(w,...)
end)

return w
end,
})















aa:DefineElement("Checkbox",{
Base={
Label="Checkbox",
IsRadio=false,
Value=false,
NoAutoTag=true,
TickedImageSize=UDim2.fromScale(1,1),
UntickedImageSize=UDim2.fromScale(0,0),
Callback=l,
Disabled=false
},
Create=function(p,q)

local w=q.IsRadio
local x=q.Value
local y=q.Label
local z=q.TickedImageSize
local A=q.UntickedImageSize
local B=q.Disabled


local D=aa:InsertPrefab("CheckBox",q)
local E=aa:MergeMetatables(q,D)

local F=D.Tickbox
local G=F.Tick
G.Image=aa.Icons.Checkmark


local H=F:FindFirstChildOfClass"UIPadding"
local I=ad:GetChildOfClass(F,"UICorner")


local J=p:Label{
Text=y,
Parent=D,
LayoutOrder=2
}


local K=UDim.new(0,3)
if w then
G.ImageTransparency=1
G.BackgroundTransparency=0
I.CornerRadius=UDim.new(1,0)
else
K=UDim.new(0,2)
end


aa:SetProperties(H,{
PaddingBottom=K,
PaddingLeft=K,
PaddingRight=K,
PaddingTop=K,
})


local function Callback(...)
local L=q.Callback
return L(E,...)
end

local function SetStyle(L,M)
local N=p:GetThemeKey"AnimationTweenInfo"


local O=L and z or A
ae:Tween{
Object=G,
Tweeninfo=N,
NoAnimation=M,
EndProperties={
Size=O
}
}
end

function q.SetDisabled(L,M)
L.Disabled=M
D.Interactable=not M
p:SetColorTags({
[J]=M and"LabelDisabled"or"Label"
},true)
return L
end

function q.SetValue(L,M,N)
L.Value=M


SetStyle(M,N)


Callback(M)

return L
end

function q.SetTicked(L,...)
aa:Warn"Checkbox:SetTicked is deprecated, please use :SetValue"
return L:SetValue(...)
end

function q.Toggle(L)
local M=not L.Value
L.Value=M
L:SetValue(M)

return L
end


local function Clicked()
q:Toggle()
end


D.Activated:Connect(Clicked)
F.Activated:Connect(Clicked)


q:SetValue(x,true)
q:SetDisabled(B)


aa:SetAnimation(F,"Buttons",D)
p:TagElements{
[G]="CheckMark",
[F]="Checkbox"
}

return E,D
end,
})

aa:DefineElement("Radiobox",{
Base={
IsRadio=true,
CornerRadius=UDim.new(1,0),
},
Create=m.Checkbox,
})



















aa:DefineElement("PlotHistogram",{
Base={
ColorTag="Frame",
Label="Histogram"
},
Create=function(p,q)

local w=q.Label
local x=q.Points


local y=aa:InsertPrefab("Histogram",q)
local z=aa:MergeMetatables(q,y)

local A=y.Canvas
local B=A.PointTemplate
B.Visible=false

p:Label{
Text=w,
Parent=y,
Position=UDim2.new(1,4)
}


local D
aa:SetItemTooltip(y,function(E)
D=E:Label()
end)

Merge(q,{
_Plots={},
_Cache={}
})

function q.GetBaseValues(E)
local F=E.Minimum
local G=E.Maximum


if F and G then
return F,G
end

local H=E._Plots

for I,J in H do
local K=J.Value


if not F or K<F then
F=K
end


if not G or K>G then
G=K
end
end

return F,G
end

function q.UpdateGraph(E)
local F=E._Plots

local G,H=E:GetBaseValues()
if not G or not H then return end

local I=H-G


for J,K in F do
local L=K.Point
local M=K.Value

local N=(M-G)/I
N=math.clamp(N,0.05,1)

L.Size=UDim2.fromScale(1,N)
end

return E
end

function q.Plot(E,F)
local G=E._Plots
local H={}


local I=B:Clone()
local J=I.Bar

aa:SetProperties(I,{
Parent=A,
Visible=true
})

local K=aa:DetectHover(I,{
MouseEnter=true,
OnInput=function()
H:UpdateTooltip()
end,
})

local L={
Object=I,
Point=J,
Value=F
}

function H.UpdateTooltip(M)
local N=H:GetPointIndex()
D.Text=`{N}:	{L.Value}`
end

function H.SetValue(M,N)
L.Value=N
q:UpdateGraph()


if K.Hovering then
M:UpdateTooltip()
end
end

function H.GetPointIndex(M)
return table.find(G,L)
end

function H.Remove(M,N)
table.remove(G,M:GetPointIndex())
I:Remove()
q:UpdateGraph()
end


table.insert(G,L)


E:UpdateGraph()


aa:SetAnimation(J,"Plots",I)
p:TagElements{
[J]="Plot"
}

return H
end

function q.PlotGraph(E,F)
local G=E._Cache


local H=#G-#F
if H>=1 then

for I=1,H do
local J=table.remove(G,I)
if J then
J:Remove()
end
end
end

for I,J in F do

local K=G[I]
if K then
K:SetValue(J)
continue
end


G[I]=E:Plot(J)
end

return E
end


if x then
q:PlotGraph(x)
end

return z,y
end,
})












aa:DefineElement("Viewport",{
Base={
IsRadio=true,
},
Create=function(p,q)

local w=q.Model
local x=q.Camera


local y=aa:InsertPrefab("Viewport",q)
local z=aa:MergeMetatables(q,y)

local A=y.Viewport
local B=A.WorldModel

if not x then
x=aa:CreateInstance("Camera",A)
x.CFrame=CFrame.new(0,0,0)
end

Merge(q,{
Camera=x,
WorldModel=B,
Viewport=A
})

function q.SetCamera(D,E)
D.Camera=E
A.CurrentCamera=E
return D
end

function q.SetModel(D,E,F)
local G=D.Clone

B:ClearAllChildren()


if G then
E=E:Clone()
end

if F then
E:PivotTo(F)
end

E.Parent=B
D.Model=E

return E
end


if w then
q:SetModel(w)
end

q:SetCamera(x)

return z,y
end,
})













aa:DefineElement("InputText",{
Base={
Value="",
Placeholder="",
Label="Input text",
Callback=l,
MultiLine=false,
NoAutoTag=true,
Disabled=false
},
Create=function(p,q)

local w=q.MultiLine
local x=q.Placeholder
local y=q.Label
local z=q.Disabled
local A=q.Value


local B=aa:InsertPrefab("InputBox",q)
local D=B.Frame
local E=D.Input

local F=aa:MergeMetatables(q,B)

p:Label{
Parent=B,
Text=y,
AutomaticSize=Enum.AutomaticSize.X,
Size=UDim2.fromOffset(0,19),
Position=UDim2.new(1,4),
LayoutOrder=2
}

aa:SetProperties(E,{
PlaceholderText=x,
MultiLine=w
})

local function Callback(...)
local G=q.Callback
G(F,...)
end

function q.SetValue(G,H)
E.Text=tostring(H)
G.Value=H
return G
end

function q.SetDisabled(G,H)
G.Disabled=H
B.Interactable=not H
p:SetColorTags({
[y]=H and"LabelDisabled"or"Label"
},true)
return G
end

function q.Clear(G)
E.Text=""
return G
end

local function TextChanged()
local G=E.Text
q.Value=G
Callback(G)
end


E:GetPropertyChangedSignal"Text":Connect(TextChanged)


q:SetDisabled(z)
q:SetValue(A)

p:TagElements{
[E]="Frame"
}

return F,B
end,
})

















aa:DefineElement("InputInt",{
Base={
Value=0,
Increment=1,
Placeholder="",
Label="Input Int",
Callback=l,
},
Create=function(p,q)

local w=q.Value
local x=q.Placeholder
local y=q.Label
local z=q.Disabled
local A=q.NoButtons


local B=aa:InsertPrefab("InputBox",q)
local D=aa:MergeMetatables(q,B)

local E=B.Frame
local F=E.Input
F.PlaceholderText=x


local G=p:Button{
Text="-",
Parent=E,
LayoutOrder=2,
Ratio=1,
AutomaticSize=Enum.AutomaticSize.None,
FlexMode=Enum.UIFlexMode.None,
Size=UDim2.fromScale(1,1),
Visible=not A,
Callback=function()
q:Decrease()
end,
}


local H=p:Button{
Text="+",
Parent=E,
LayoutOrder=3,
Ratio=1,
AutomaticSize=Enum.AutomaticSize.None,
FlexMode=Enum.UIFlexMode.None,
Size=UDim2.fromScale(1,1),
Visible=not A,
Callback=function()
q:Increase()
end,
}

local I=p:Label{
Parent=B,
Text=y,
AutomaticSize=Enum.AutomaticSize.X,
Size=UDim2.fromOffset(0,19),
Position=UDim2.new(1,4),
LayoutOrder=4
}

local function Callback(...)
local J=q.Callback
J(D,...)
end

function q.Increase(J)
local K=J.Value
local L=J.Increment
q:SetValue(K+L)
end

function q.Decrease(J)
local K=J.Value
local L=J.Increment
q:SetValue(K-L)
end

function q.SetDisabled(J,K)
J.Disabled=K
B.Interactable=not K
p:SetColorTags({
[I]=K and"LabelDisabled"or"Label"
},true)
return J
end

function q.SetValue(J,K)
local L=J.Value
local M=J.Minimum
local N=J.Maximum


K=tonumber(K)


if not K then
K=L
end


if M and N then
K=math.clamp(K,M,N)
end


F.Text=K
q.Value=K
Callback(K)

return J
end

local function TextChanged()
local J=F.Text
q:SetValue(J)
end


q:SetValue(w)
q:SetDisabled(z)


F.FocusLost:Connect(TextChanged)


p:TagElements{
[H]="Button",
[G]="Button",
[F]="Frame",
}

return D,B
end,
})

aa:DefineElement("InputTextMultiline",{
Base={
Label="",
Size=UDim2.new(1,0,0,39),
Border=false,
ColorTag="Frame"
},
Create=function(p,q)
return p:Console(q)
end,
})
























aa:DefineElement("Console",{
Base={
Enabled=true,
Value="",
TextWrapped=false,
Border=true,
MaxLines=300,
LinesFormat="%s",
Callback=l,
},
Create=function(p,q)

local w=q.ReadOnly
local x=q.LineNumbers
local y=q.Value
local z=q.Placeholder


local A=aa:InsertPrefab("Console",q)
local B=aa:MergeMetatables(q,A)

local D=A.Source
local E=A.Lines
E.Visible=x

function q.CountLines(F,G)
local H=D.Text:split"\n"
local I=#H

if I==1 and H[1]==""then
return 0
end

return I
end

function q.UpdateLineNumbers(F)

local G=F.LineNumbers
local H=F.LinesFormat


if not G then return end


local I=F:CountLines()
E.Text=""

for J=1,I do
local K=H:format(J)
local L=J~=I and'\n'or''
E.Text..=`{K}{L}`
end


local J=E.AbsoluteSize.X
D.Size=UDim2.new(1,-J,0,0)

return F
end

function q.CheckLineCount(F)

local G=q.MaxLines
if not G then return end

local H=D.Text
local I=H:split"\n"


if#I>G then
local J=`{I[1]}\\n`
local K=H:sub(#J)
F:SetValue(K)
end

return F
end

function q.UpdateScroll(F)
local G=A.AbsoluteCanvasSize
A.CanvasPosition=Vector2.new(0,G.Y)
return F
end

function q.SetValue(F,G)
if not F.Enabled then return end

D.Text=tostring(G)
F:Update()

return F
end

function q.GetValue(F)
return D.Text
end

function q.Clear(F)
D.Text=""
F:Update()
return F
end

function q.AppendText(F,...)
local G=F:CountLines(true)
local H=aa:Concat({...}," ")


if G==0 then
return F:SetValue(H)
end

local I=F:GetValue()
local J=`{I}\n{H}`


F:SetValue(J)

return F
end

function q.Update(F)

local G=F.AutoScroll

F:CheckLineCount()
F:UpdateLineNumbers()


if G then
F:UpdateScroll()
end
end

local function Changed()
local F=q:GetValue()
q:Update()
q:Callback(F)
end


q:SetValue(y)


aa:SetProperties(D,q)
aa:SetProperties(D,{
TextEditable=not w,
Parent=A,
PlaceholderText=z
})

p:TagElements{
[D]="ConsoleText",
[E]="ConsoleLineNumbers",
}


D:GetPropertyChangedSignal"Text":Connect(Changed)

return B,A
end,
})















aa:DefineElement("Table",{
Base={
VerticalAlignment=Enum.VerticalAlignment.Top,
RowBackground=false,
RowBgTransparency=0.87,
Border=false,
Spacing=UDim.new(0,4)
},
Create=function(p,q)
local w=p.WindowClass


local x=q.RowBgTransparency
local y=q.RowBackground
local z=q.Border
local A=q.VerticalAlignment
local B=q.MaxColumns
local D=q.Spacing


local E=aa:InsertPrefab("Table",q)
local F=aa:MergeMetatables(q,E)

local G=E.RowTemp
local H=0
local I={}
local J=z and y

function q.Row(K,L)
L=L or{}

local M=L.IsHeader

local N=0
local O={}


local P=G:Clone()
aa:SetProperties(P,{
Name="Row",
Visible=true,
Parent=E,
})


local Q=P:FindFirstChildOfClass"UIListLayout"
aa:SetProperties(Q,{
VerticalAlignment=A,
Padding=not J and D or UDim.new(0,1)
})


if M then
p:TagElements{
[P]="Header"
}
else
H+=1
end


if y and not M then
local R=H%2~=1 and x or 1
P.BackgroundTransparency=R
end


local R={}
local S=aa:MergeMetatables(R,P)

function R.Column(T,U)
U=U or{}

aa:CheckConfig(U,{
HorizontalAlign=Enum.HorizontalAlignment.Left,
VerticalAlignment=Enum.VerticalAlignment.Top,
})


local V=P.ColumnTemp:Clone()


local W=V:FindFirstChildOfClass"UIListLayout"
aa:SetProperties(W,U)


local X=V:FindFirstChildOfClass"UIStroke"
X.Enabled=z


local Y=V:FindFirstChildOfClass"UIPadding"
if not J then
Y:Destroy()
end


aa:SetProperties(V,{
Parent=P,
Visible=true,
Name="Column"
})


return aa:MakeCanvas{
Element=V,
WindowClass=w,
Class=S
}
end

function R.NextColumn(T)
N+=1

local U=N%B+1
local V=O[U]


if not V then
V=T:Column()
O[U]=V
end

return V
end

table.insert(I,R)


return S
end


function q.NextRow(K)
return K:Row()
end

function q.HeaderRow(K)
return K:Row{
IsHeader=true
}
end

function q.ClearRows(K)
H=0


for L,M in next,E:GetChildren()do
if not M:IsA"Frame"then continue end
if M==G then continue end

M:Destroy()
end

return q
end

return F,E
end,
})




aa:DefineElement("List",{
Base={
Spacing=4,
HorizontalFlex=Enum.UIFlexAlignment.None,
VerticalFlex=Enum.UIFlexAlignment.None,
HorizontalAlignment=Enum.HorizontalAlignment.Left,
VerticalAlignment=Enum.VerticalAlignment.Top,
FillDirection=Enum.FillDirection.Horizontal,
},
Create=function(p,q)
local w=p.WindowClass


local x=q.Spacing
local y=q.HorizontalFlex
local z=q.VerticalFlex
local A=q.HorizontalAlignment
local B=q.VerticalAlignment
local D=q.FillDirection


local E=aa:InsertPrefab("List",q)
local F=aa:MergeMetatables(q,E)

local G=E.UIListLayout
aa:SetProperties(G,{
Padding=UDim.new(0,x),
HorizontalFlex=y,
VerticalFlex=z,
HorizontalAlignment=A,
VerticalAlignment=B,
FillDirection=D,
})


local H=aa:MakeCanvas{
Element=E,
WindowClass=w,
Class=F
}

return H,E
end,
})






















aa:DefineElement("CollapsingHeader",{
Base={
Title="Collapsing Header",
CollapseIcon=aa.Icons.Arrow,
Collapsed=true,
Offset=0,
NoAutoTag=true,
NoAutoFlags=true,
IconPadding=UDim.new(0,4),
Activated=l
},
Create=function(p,q)

local w=q.Title
local x=q.Collapsed
local y=q.ElementStyle
local z=q.Offset
local A=q.TitleBarProperties
local B=q.OpenOnDoubleClick
local D=q.OpenOnArrow
local E=q.CollapseIcon
local F=q.IconPadding
local G=q.Icon
local H=q.NoArrow


local I=aa:InsertPrefab("CollapsingHeader",q)

local J=I.TitleBar
local K=J.Collapse
local L=J.Icon
p:ApplyFlags(L,{
Image=G
})

local M=K.CollapseIcon
local N=K.UIPadding
ad:SetPadding(N,F)
p:ApplyFlags(M,{
Image=E
})

local O=p:Label{
ColorTag="CollapsingHeader",
Parent=J,
LayoutOrder=2
}


local P,Q=p:Indent{
Class=q,
Parent=I,
Offset=z,
LayoutOrder=2,
Size=UDim2.fromScale(1,0),
AutomaticSize=Enum.AutomaticSize.None,
PaddingTop=UDim.new(0,4),
PaddingBottom=UDim.new(0,1),
}

local function Activated()
local R=q.Activated
R(P)
end

function q.Remove(R)
I:Destroy()
table.clear(R)
end
function q.SetArrowVisible(R,S)
M.Visible=S
end
function q.SetTitle(R,S)
O.Text=S
end
function q.SetVisible(R,S)
I.Visible=S
end
function q.SetIcon(R,S)
local T=S and S~=""
L.Visible=T

if T then
L.Image=ad:CheckAssetUrl(S)
end
end


function q.SetCollapsed(R,S)
R.Collapsed=S

local T=aa:GetContentSize(Q)
local U=P:GetThemeKey"AnimationTweenInfo"


local V=UDim2.fromScale(1,0)
local W=V+UDim2.fromOffset(0,T.Y)

ae:HeaderCollapse{
Tweeninfo=U,
Collapsed=S,
Toggle=M,
Resize=Q,
Hide=Q,


ClosedSize=V,
OpenSize=W,
}

return R
end

local function Toggle()
q:SetCollapsed(not q.Collapsed)
end


if A then
P:ApplyFlags(J,A)
end


if not D then
aa:ConnectMouseEvent(J,{
DoubleClick=B,
Callback=Toggle,
})
end
M.Activated:Connect(Toggle)
J.Activated:Connect(Activated)


q:SetCollapsed(x)
q:SetTitle(w)
q:SetArrowVisible(not H)


aa:ApplyStyle(J,y)
P:TagElements{
[J]="CollapsingHeader",
}

return P,I
end,
})

aa:DefineElement("TreeNode",{
Base={
Offset=21,
IconPadding=UDim.new(0,2),
TitleBarProperties={
Size=UDim2.new(1,0,0,13)
}
},
Create=m.CollapsingHeader,
})




aa:DefineElement("Separator",{
Base={
NoAutoTag=true,
NoAutoTheme=true
},
Create=function(p,q)
local w=q.Text


local x=aa:InsertPrefab("SeparatorText",q)

p:Label{
Text=tostring(w),
Visible=w~=nil,
Parent=x,
LayoutOrder=2,
Size=UDim2.new(),
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
}

p:TagElements{
[x.Left]="Separator",
[x.Right]="Separator",
}

return x
end,
})





aa:DefineElement("Canvas",{
Base={},
Create=function(p,q)
local w=p.WindowClass

local x=q.Scroll
local y=q.Class or q


local z=x and"ScrollingCanvas"or"Canvas"
local A=aa:InsertPrefab(z,q)


local B=aa:MakeCanvas{
Element=A,
WindowClass=w,
Class=y
}

return B,A
end,
})

aa:DefineElement("ScrollingCanvas",{
Base={
Scroll=true
},
Create=m.Canvas
})




aa:DefineElement("Region",{
Base={
Scroll=false,
AutomaticSize=Enum.AutomaticSize.Y
},
Create=function(p,q)
local w=p.WindowClass

local x=q.Scroll
local y=x and"ScrollingCanvas"or"Canvas"


local z=aa:InsertPrefab(y,q)


local A=aa:MakeCanvas{
Element=z,
WindowClass=w,
Class=q
}

return A,z
end,
})

aa:DefineElement("Group",{
Base={
Scroll=false,
AutomaticSize=Enum.AutomaticSize.Y
},
Create=function(p,q)
local w=p.WindowClass


local x=aa:InsertPrefab("Group",q)


local y=aa:MakeCanvas{
Element=x,
WindowClass=w,
Class=q
}

return y,x
end,
})








aa:DefineElement("Indent",{
Base={
Offset=15,
PaddingTop=UDim.new(),
PaddingBottom=UDim.new(),
PaddingRight=UDim.new(),
},
Create=function(p,q)
local w=q.Offset
q.PaddingLeft=UDim.new(0,w)

return p:Canvas(q)
end,
})








aa:DefineElement("BulletText",{
Base={},
Create=function(p,q)
local w=q.Rows


for x,y in next,w do
local z=p:Bullet(q)
z:Label{
Text=tostring(y),
LayoutOrder=2,
Size=UDim2.fromOffset(0,14),
}
end
end,
})




aa:DefineElement("Bullet",{
Base={
Padding=3,
Icon=aa.Icons.Dot,
IconSize=UDim2.fromOffset(5,5)
},
Create=function(p,q)
local w=p.WindowClass


local x=q.Padding


local y=aa:InsertPrefab("Bullet",q)


local z=aa:MakeCanvas{
Element=y,
WindowClass=w,
Class=p
}


local A=y.UIListLayout
A.Padding=UDim.new(0,x)

return z,y
end,
})








aa:DefineElement("Row",{
Base={
Spacing=4,
Expanded=false,
HorizontalFlex=Enum.UIFlexAlignment.None,
VerticalFlex=Enum.UIFlexAlignment.None,
},
Create=function(p,q)
local w=p.WindowClass


local x=q.Spacing
local y=q.Expanded
local z=q.HorizontalFlex
local A=q.VerticalFlex


local B=aa:InsertPrefab("Row",q)
local D=aa:MergeMetatables(q,B)

local E=B:FindFirstChildOfClass"UIListLayout"
E.Padding=UDim.new(0,x)
E.HorizontalFlex=z
E.VerticalFlex=A


local F=aa:MakeCanvas{
Element=B,
WindowClass=w,
Class=D
}

function q.Expand(G)
E.HorizontalFlex=Enum.UIFlexAlignment.Fill
return G
end


if y then
q:Expand()
end

return F,B
end,
})


















aa:DefineElement("SliderBase",{
Base={
Format="%.f",
Label="",
Type="Slider",
Callback=l,
NoGrab=false,
NoClick=false,
Minimum=0,
Maximum=100,
ColorTag="Frame",
Disabled=false,
},
Create=function(p,q)

local w=q.Value or q.Minimum
local x=q.Format
local y=q.Label
local z=q.NoAnimation
local A=q.NoGrab
local B=q.NoClick
local D=q.Type
local E=q.Disabled


local F=aa:InsertPrefab"Slider"
local G=F.Track
local H=G.Grab
local I=G.ValueText

local J=aa:MergeMetatables(q,F)
local K=H.AbsoluteSize


local L=aa:SetAnimation(F,"Inputs")

local M=p:Label{
Parent=F,
Text=y,
Position=UDim2.new(1,4),
Size=UDim2.fromScale(0,1)
}

Merge(q,{
Grab=H,
Name=y,
})


if D=="Slider"then
G.Position=UDim2.fromOffset(K.X/2,0)
G.Size=UDim2.new(1,-K.X,1,0)
end

local N={Slider=
function(N)
return{
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(N,0.5)
}
end,Progress=
function(N)
return{
Size=UDim2.fromScale(N,1)
}
end,Snap=
function(N,O,P,Q)
local R=(math.round(O)-P)/Q
return{
Size=UDim2.fromScale(1/Q,1),
Position=UDim2.fromScale(R,0.5)
}
end,
}

local function Callback(...)
local O=q.Callback
return O(J,...)
end

function q.SetDisabled(O,P)
O.Disabled=P
F.Interactable=not P
p:SetColorTags({
[M]=P and"LabelDisabled"or"Label"
},true)
return O
end

function q.SetValueText(O,P)
I.Text=tostring(P)
end

function q.SetValue(O,P,Q)
local R=p:GetThemeKey"AnimationTweenInfo"

local S=q.Minimum
local T=q.Maximum

local U=P
local V=T-S


if not Q then
U=(P-S)/V
else

P=S+(V*U)
end


U=math.clamp(U,0,1)


local W=N[D](U,P,S,T)


ae:Tween{
Object=H,
Tweeninfo=R,
NoAnimation=z,
EndProperties=W
}


O.Value=P
O:SetValueText(x:format(P,T))


Callback(P)

return O
end

local function SetFocused(O)

p:SetColorTags({
[F]=O and"FrameActive"or"Frame"
},true)
p:SetElementFocused(F,{
Focused=O,
Animation=L
})
end


local function CanDrag()
if q.Disabled then return end
if q.ReadOnly then return end

return true
end
local function DragMovement(O)
if not CanDrag()then return end


local P=G.AbsolutePosition.X
local Q=G.AbsoluteSize.X


local R=O.X
local S=R-P


local T=math.clamp(S/Q,0,1)

q:SetValue(T,true)
end
local function DragBegan(...)
if not CanDrag()then return end

SetFocused(true)

if not B then
DragMovement(...)
end
end
local function DragEnded()
SetFocused(false)
end


H.Visible=not A
q:SetValue(w)
q:SetDisabled(E)

p:TagElements{
[I]="Label",
[H]="SliderGrab"
}


aa:ConnectDrag(G,{
DragStart=DragBegan,
DragMovement=DragMovement,
DragEnd=DragEnded,
})

return J,F
end,
})








aa:DefineElement("SliderEnum",{
Base={
Items={},
Label="Slider Enum",
Type="Snap",
Minimum=1,
Maximum=10,
Value=1,
Callback=l,
ColorTag="Frame"
},
Create=function(p,q)

local w=q.Callback
local x=q.Value

local function Calculate(y,z)
z=math.round(z)


local A=y.Items
y.Maximum=#A


return A[z]
end


q.Callback=function(y,z)
local A=Calculate(y,z)
y:SetValueText(A)

q.Value=A

return w(y,A)
end

Calculate(q,x)


return p:SliderBase(q)
end,
})

aa:DefineElement("SliderInt",{
Base={
Label="Slider Int",
ColorTag="Frame",
},
Create=m.SliderBase,
})

aa:DefineElement("SliderFloat",{
Base={
Label="Slider Float",
Format="%.3f",
ColorTag="Frame",
},
Create=m.SliderBase,
})














aa:DefineElement("DragInt",{
Base={
Format="%.f",
Label="Drag Int",
Callback=l,
Minimum=0,
Maximum=100,
ColorTag="Frame",
Disabled=false
},
Create=function(p,q)

local w=q.Value or q.Minimum
local x=q.Format
local y=q.Label
local z=q.Disabled


local A=aa:InsertPrefab"Slider"
local B=aa:MergeMetatables(q,A)

local D=A.Track
local E=D.ValueText
local F=D.Grab
F.Visible=false

local G=p:Label{
Parent=A,
Text=y,
Position=UDim2.new(1,7),
Size=UDim2.fromScale(0,1)
}

local H
local I=0
local J=0


local K=aa:SetAnimation(A,"Inputs")

local function Callback(...)
local L=q.Callback
return L(B,...)
end

function q.SetValue(L,M,N)
local O=L.Minimum
local P=L.Maximum

local Q=P-O


if not N then
I=((M-O)/Q)*100
else

M=O+(Q*(I/100))
end

M=math.clamp(M,O,P)


L.Value=M
E.Text=x:format(M,P)


Callback(M)

return L
end
function q.SetDisabled(L,M)
L.Disabled=M
p:SetColorTags({
[G]=M and"LabelDisabled"or"Label"
},true)
return L
end

local function SetFocused(L)

p:SetColorTags({
[A]=L and"FrameActive"or"Frame"
},true)

p:SetElementFocused(A,{
Focused=L,
Animation=K
})
end


local function CanDrag()
if q.Disabled then return end
if q.ReadOnly then return end

return true
end
local function DragStart(L)
if not CanDrag()then return end
SetFocused(true)

H=L
J=I
end
local function DragMovement(L)
if not CanDrag()then return end

local M=L.X-H.X
local N=J+(M/2)

I=math.clamp(N,0,100)
q:SetValue(I,true)
end
local function DragEnded()
SetFocused(false)
end


q:SetValue(w)
q:SetDisabled(z)


aa:ConnectDrag(D,{
DragStart=DragStart,
DragEnd=DragEnded,
DragMovement=DragMovement,
})

p:TagElements{
[E]="Label"
}

return B,A
end,
})

aa:DefineElement("DragFloat",{
Base={
Format="%.3f",
Label="Drag Float",
ColorTag="Frame"
},
Create=m.DragInt,
})

aa:DefineElement("MultiElement",{
Base={
Callback=l,
Label="",
Disabled=false,
BaseInputConfig={},
InputConfigs={},
Value={},
Minimum={},
Maximum={},
MultiCallback=l,
},
Create=function(p,q)

local w=q.Label
local x=q.BaseInputConfig
local y=q.InputConfigs
local z=q.InputType
local A=q.Disabled
local B=q.Value
local D=q.Minimum
local E=q.Maximum

assert(z,"No input type provided for MultiElement")




local F,G=p:Row{
Spacing=4
}

local H=F:Row{
Size=UDim2.fromScale(0.65,0),
Expanded=true,
}

local I=F:Label{
Size=UDim2.fromScale(0.35,0),
LayoutOrder=2,
Text=w
}

local J=aa:MergeMetatables(q,F)
local K={}
local L=false

local function GetValue()
local M={}
for N,O in K do
M[N]=O:GetValue()
end

q.Value=M
return M
end

local function Callback(...)
local M=q.MultiCallback
M(J,...)
end

local function InputChanged()

if#K~=#y then return end
if not L then return end

local M=GetValue()
Callback(M)
end

function q.SetDisabled(M,N)
M.Disabled=N


p:SetColorTags({
[I]=N and"LabelDisabled"or"Label"
},true)


for O,P in K do
P:SetDisabled(N)
end
end

function q.SetValue(M,N)
L=false


for O,P in N do
local Q=K[O]
assert(Q,`No input object for index: {O}`)

Q:SetValue(P)
end

L=true
Callback(N)
end


x=Copy(x,{
Size=UDim2.new(1,0,0,19),
Label="",
Callback=InputChanged,
})


for M,N in y do
local O=Copy(x,N)
aa:CheckConfig(O,{
Minimum=D[M],
Maximum=E[M],
})


local P=H[z](H,O)
table.insert(K,P)
end


Merge(q,{
Row=H,
Inputs=K
})

L=true


q:SetDisabled(A)
q:SetValue(B)

return J,G
end,
})

local function GenerateMultiInput(p,q,w,x)
aa:DefineElement(p,{
Base={
Label=p,
Callback=l,
InputType=q,
InputConfigs=table.create(w,{}),
BaseInputConfig={},
},
Create=function(y,z)
local A=z.BaseInputConfig


if x then
Merge(A,x)
end

aa:CheckConfig(A,{
ReadOnly=z.ReadOnly,
Format=z.Format,
})

z.MultiCallback=function(...)
local B=z.Callback
B(...)
end

return y:MultiElement(z)
end,
})
end










local function GenerateColor3Input(p,q)
aa:DefineElement(p,{
Base={
Label=p,
Callback=l,
Value=aa.Accent.Light,
Disabled=false,
Minimum={0,0,0},
Maximum={255,255,255,100},
BaseInputConfig={},
InputConfigs={
[1]={Format="R: %.f"},
[2]={Format="G: %.f"},
[3]={Format="B: %.f"},
}
},
Create=function(w,x)

local y=x.Value








local z=Copy(x,{
Value={1,1,1},
Callback=function(z,...)
if x.ValueChanged then
x:ValueChanged(...)
end
end,
})

local A,B=w[q](w,z)
local D=aa:MergeMetatables(x,A)
local E=A.Row


local F=E:Button{
BackgroundTransparency=0,
Size=UDim2.fromOffset(19,19),
UiPadding=0,
Text="",
Ratio=1,
ColorTag="",
ElementStyle=""
}

local function Callback(...)
local G=x.Callback
return G(D,...)
end

local function SetPreview(G)
F.BackgroundColor3=G
Callback(G)
end

function x.ValueChanged(G,H)
local I,J,K=H[1],H[2],H[3]
local L=Color3.fromRGB(I,J,K)

G.Value=L
SetPreview(L)
end

function x.SetValue(G,H)
G.Value=H
SetPreview(H)


A:SetValue{
math.round(H.R*255),
math.round(H.G*255),
math.round(H.B*255)
}
end


x:SetValue(y)

return D,B
end,
})
end











local function GenerateCFrameInput(p,q)
aa:DefineElement(p,{
Base={
Label=p,
Callback=l,
Disabled=false,
Value=CFrame.new(10,10,10),
Minimum=CFrame.new(0,0,0),
Maximum=CFrame.new(100,100,100),
BaseInputConfig={},
InputConfigs={
[1]={Format="X: %.f"},
[2]={Format="Y: %.f"},
[3]={Format="Z: %.f"}
}
},
Create=function(w,x)

local y=x.Value
local z=x.Maximum
local A=x.Minimum

local B=Copy(x,{
Maximum={z.X,z.Y,z.Z},
Minimum={A.X,A.Y,A.Z},
Value={y.X,y.Y,y.Z},
Callback=function(B,...)
if x.ValueChanged then
x:ValueChanged(...)
end
end,
})


local D,E=w[q](w,B)
local F=aa:MergeMetatables(x,D)

local function Callback(...)
local G=x.Callback
return G(F,...)
end

function x.ValueChanged(G,H)
local I,J,K=H[1],H[2],H[3]
local L=CFrame.new(I,J,K)
G.Value=L
Callback(L)
end

function x.SetValue(G,H)
G.Value=H


D:SetValue{
math.round(H.X),
math.round(H.Y),
math.round(H.Z)
}
end


x:SetValue(y)

return F,E
end,
})
end

aa:DefineElement("SliderProgress",{
Base={
Label="Slider Progress",
Type="Progress",
ColorTag="Frame",
},
Create=m.SliderBase,
})




aa:DefineElement("ProgressBar",{
Base={
Label="Progress Bar",
Type="Progress",
ReadOnly=true,
MinValue=0,
MaxValue=100,
Format="% i%%",
Interactable=false,
ColorTag="Frame"
},
Create=function(p,q)
function q.SetPercentage(w,x)
q:SetValue(x)
end

local w,x=p:SliderBase(q)
local y=w.Grab

p:TagElements{
[y]={
BackgroundColor3="ProgressBar"
}
}

return w,x
end,
})


















aa:DefineElement("Combo",{
Base={
Value="",
Placeholder="",
Callback=l,
Items={},
Disabled=false,
WidthFitPreview=false,
Label="Combo"
},
Create=function(p,q)

local w=q.Placeholder
local x=q.NoAnimation
local y=q.Selected
local z=q.Label
local A=q.Disabled
local B=q.WidthFitPreview



local D=aa:InsertPrefab("Combo",q)
local E=aa:MergeMetatables(q,D)

local F=D.Combo
local G


local H=p:Label{
Text=tostring(w),
Parent=F,

Name="ValueText"
}
local I=p:ArrowButton{
Parent=F,
Interactable=false,
Size=UDim2.fromOffset(19,19),
LayoutOrder=2,
}
local J=p:Label{
Text=z,
Parent=D,
LayoutOrder=2,
}


if B then
aa:SetProperties(D,{
AutomaticSize=Enum.AutomaticSize.XY,
Size=UDim2.new(0,0,0,0)
})
aa:SetProperties(F,{
AutomaticSize=Enum.AutomaticSize.XY,
Size=UDim2.fromScale(0,1)
})
end

local function Callback(K,...)
q:SetOpen(false)
return q.Callback(E,K,...)
end

local function SetAnimationState(K,L)
local M=p:GetThemeKey"AnimationTweenInfo"

D.Interactable=not K


ae:HeaderCollapseToggle{
Tweeninfo=M,
NoAnimation=L,
Collapsed=not K,
Toggle=I.Icon,
}
end

local function GetItems()
local K=q.GetItems
local L=q.Items


if K then
return K()
end


return L
end

function q.SetValueText(K,L)
H.Text=tostring(L)
end

function q.ClosePopup(K)
if not G then return end
G:ClosePopup(true)
end

function q.SetDisabled(K,L)
K.Disabled=L
D.Interactable=not L
p:SetColorTags({
[J]=L and"LabelDisabled"or"Label"
},true)
return K
end

function q.SetValue(K,L)
local M=GetItems()
local N=M[L]
local O=N or L

K.Selected=L
K.Value=O

K:ClosePopup()


if typeof(L)=="number"then
K:SetValueText(O)
else
K:SetValueText(L)
end

Callback(L,O)
return K
end

function q.SetOpen(K,L)
local M=K.Selected

K.Open=L
SetAnimationState(L,x)

if not L then

K:ClosePopup()
return
end


G=p:Dropdown{
RelativeTo=F,
Items=GetItems(),
Selected=M,
OnSelected=function(...)
q:SetValue(...)
end,
OnClosed=function()
K:SetOpen(false)
end,
}

return K
end

local function ToggleOpen()
local K=q.Open
q:SetOpen(not K)
end


F.Activated:Connect(ToggleOpen)


SetAnimationState(false,true)
q:SetDisabled(A)

if y then
q:SetValue(y)
end


aa:SetAnimation(F,"Inputs")

p:TagElements{
[F]="Frame",
}

return E,D
end,
})

















































































































local p={

TileBarConfig={
Close={
Image=aa.Icons.Close,
IconPadding=UDim.new(0,3)
},
Collapse={
Image=aa.Icons.Arrow,
IconPadding=UDim.new(0,3)
},
},

CloseCallback=l,


Collapsible=true,
Open=true,
Focused=false
}

function p.Tween(q,w)
aa:CheckConfig(w,{
Tweeninfo=q:GetThemeKey"AnimationTweenInfo"
})
return ae:Tween(w)
end

function p.TagElements(q,w)

local x=q.TagsList
local y=q.Theme

aa:MultiUpdateColors{
Theme=y,
TagsList=x,
Objects=w
}
end





function p.MakeTitleBarCanvas(q)
local w=q.TitleBar


local x=aa:MakeCanvas{
WindowClass=q,
Element=w
}
q.TitleBarCanvas=x

return x
end

function p.AddDefaultTitleButtons(q)
local w=q.TileBarConfig
local x=w.Collapse
local y=w.Close


local z=q.TitleBarCanvas
if not z then
z=q:MakeTitleBarCanvas()
end

aa:CheckConfig(q,{

Toggle=z:RadioButton{
Icon=x.Image,
IconPadding=x.IconPadding,
LayoutOrder=1,
Ratio=1,
Size=UDim2.new(0,0),
Callback=function()
q:ToggleCollapsed()
end,
},
CloseButton=z:RadioButton{
Icon=y.Image,
IconPadding=y.IconPadding,
LayoutOrder=3,
Ratio=1,
Size=UDim2.new(0,0),
Callback=function()
q:SetVisible(false)
end,
},
TitleLabel=z:Label{
ColorTag="Title",
LayoutOrder=2,
Size=UDim2.new(1,0),
Active=false,
Fill=true,
ClipsDescendants=true,
AutomaticSize=Enum.AutomaticSize.XY
}
})


q:TagElements{
[q.TitleLabel]="WindowTitle"
}
end

function p.Close(q)
local w=q.CloseCallback


if w then
local x=w(q)
if x==false then return end
end

q:Remove()
end

function p.SetVisible(q,w)
local x=q.WindowFrame
local y=q.NoFocusOnAppearing

q.Visible=w
x.Visible=w


if w and not y then
aa:SetFocusedWindow(q)
end

return q
end

function p.ToggleVisibility(q,w)
local x=q.Visible
q:SetVisible(not x)
end

function p.GetWindowSize(q)
return q.WindowFrame.AbsoluteSize
end

function p.GetTitleBarSizeY(q)
local w=q.TitleBar
return w.Visible and w.AbsoluteSize.Y or 0
end

function p.SetTitle(q,w)
q.TitleLabel.Text=tostring(w)
return q
end

function p.SetPosition(q,w)
q.WindowFrame.Position=w
return q
end

function p.SetSize(q,w,x)
local y=q.WindowFrame


if typeof(w)=="Vector2"then
w=UDim2.fromOffset(w.X,w.Y)
end

y.Size=w
q.Size=w

return q
end

function p.SetCanvasInteractable(q,w)
local x=q.Body
x.Interactable=w
end

function p.Center(q)
local w=q:GetWindowSize()/2
local x=UDim2.new(0.5,-w.X,0.5,-w.Y)

q:SetPosition(x)
return q
end

function p.LoadStylesIntoElement(q,w)
local x=w.Flags
local y=w.Object
local z=w.Canvas

local A={FrameRounding=
function()
if x.CornerRadius then return end
if not z then return end

local A=y:FindFirstChild("FrameRounding",true)
if not A then return end

z:TagElements{
[A]="FrameRounding"
}
end,
}

for B,D in A do
local E=q:GetThemeKey(B)
if E==nil then continue end

task.spawn(D,E)
end
end

function p.SetTheme(q,w)
local x=aa.ThemeConfigs
local y=q.TagsList
local z=q.WindowState


w=w or q.Theme


assert(x[w],`{w} is not a valid theme!`)

q.Theme=w


aa:MultiUpdateColors{
Animate=false,
Theme=w,
Objects=y
}


q:SetFocusedColors(z)
return q
end

function p.SetFocusedColors(q,w)

local x=q.WindowFrame
local y=q.TitleBar
local z=q.Theme
local A=q.TitleLabel
local B=q:GetThemeKey"AnimationTweenInfo"

local D=x:FindFirstChildOfClass"UIStroke"


local E={
Focused={
[D]="BorderActive",
[y]="TitleBarBgActive",
[A]={
TextColor3="TitleActive"
}
},
UnFocused={
[D]="Border",
[y]="TitleBarBg",
[A]={
TextColor3="Title"
}
},
Collapsed={
[D]="Border",
[y]="TitleBarBgCollapsed",
[A]={
TextColor3="Title"
}
}
}


aa:MultiUpdateColors{
Tweeninfo=B,
Animate=true,
Objects=E[w],
Theme=z,
}
end

function p.SetFocused(q,w)
w=w==nil and true or w


local x=q.Collapsed
local y=q.WindowState


if w then
aa:SetFocusedWindow(q)
end


local z=x and"Collapsed"or w and"Focused"or"UnFocused"


if z==y then return end
q.Focused=w
q.WindowState=z


q:SetFocusedColors(z)
end

function p.GetThemeKey(q,w)
return aa:GetThemeKey(q.Theme,w)
end

function p.SetCollapsible(q,w)
q.Collapsible=w
return q
end

function p.ToggleCollapsed(q,w)
local x=q.Collapsed
local y=q.Collapsible


if not w and not y then return q end

q:SetCollapsed(not x)
return q
end

function p.SetCollapsed(q,w,x)
local y=q.WindowFrame
local z=q.Body
local A=q.Toggle
local B=q.ResizeGrab
local D=q.Size
local E=q.AutoSize
local F=q:GetThemeKey"AnimationTweenInfo"

local G=q:GetWindowSize()
local H=q:GetTitleBarSizeY()

local I=A.Icon
local J=UDim2.fromOffset(G.X,H)

q.Collapsed=w
q:SetCollapsible(false)


q:SetFocused(not w)


ae:HeaderCollapse{
Tweeninfo=F,
NoAnimation=x,
Collapsed=w,
Toggle=I,
Resize=y,
NoAutomaticSize=not E,
Hide=z,

ClosedSize=J,
OpenSize=D,
Completed=function()
q:SetCollapsible(true)
end
}


q:Tween{
Object=B,
NoAnimation=x,
EndProperties={
TextTransparency=w and 1 or 0.6,
Interactable=not w
}
}

return q
end

function p.UpdateConfig(q,w)
local x={
NoTitleBar=function(x)
local y=q.TitleBar
y.Visible=not x
end,
NoClose=function(x)
local y=q.CloseButton
y.Visible=not x
end,
NoCollapse=function(x)
local y=q.Toggle
y.Visible=not x
end,
NoTabsBar=function(x)
local y=q.WindowTabSelector
if not y then return end

local z=y.TabsBar
z.Visible=not x
end,
NoScrollBar=function(x)
local y=x and 0 or 9
local z=q.NoScroll
local A=q.WindowTabSelector
local B=q.ContentCanvas


if A then
A.Body.ScrollBarThickness=y
end

if not z then
B.ScrollBarThickness=y
end
end,
NoScrolling=function(x)
local y=q.NoScroll
local z=q.WindowTabSelector
local A=q.ContentCanvas

if z then
z.Body.ScrollingEnabled=not x
end
if not y then
A.ScrollingEnabled=not x
end
end,
NoMove=function(x)
local y=q.DragConnection
y:SetEnabled(not x)
end,
NoResize=function(x)
local y=q.ResizeConnection
y:SetEnabled(not x)
end,
NoBackground=function(x)
local y=q:GetThemeKey"WindowBgTransparency"
local z=q.CanvasFrame
z.BackgroundTransparency=x and 1 or y
end,
}


Merge(q,w)


for y,z in w do
local A=x[y]
if A then
A(z)
end
end

return q
end


function p.Remove(q)
local w=q.WindowFrame
local x=q.WindowClass
local y=aa.Windows


local z=table.find(y,x)
if z then
table.remove(y,z)
end


w:Destroy()
end

function p.MenuBar(q,w,...)
local x=q.ContentCanvas
local y=q.ContentFrame

w=w or{}

Merge(w,{
Parent=y,
Layout=-1
})

return x:MenuBar(w,...)
end







































aa:DefineElement("Window",{
Export=true,
Base={
Theme="DarkTheme",
NoSelect=false,
NoTabs=true,
NoScroll=false,
Collapsed=false,
Visible=true,
AutoSize=false,
MinimumSize=Vector2.new(160,90),
OpenOnDoubleClick=true,
NoAutoTheme=true,
NoWindowRegistor=false,
NoBringToFrontOnFocus=false,
IsDragging=false,
},
Create=function(q,w)

aa:CheckImportState()


local x=aa.Windows
local y=aa.Container.Windows

aa:CheckConfig(w,{
Parent=y,
Title=aa.DefaultTitle
})


local z=w.NoDefaultTitleBarButtons
local A=w.Collapsed
local B=w.MinimumSize
local D=w.Title
local E=w.NoTabs
local F=w.NoScroll
local G=w.Theme
local H=w.AutomaticSize
local I=w.NoWindowRegistor
local J=w.AutoSelectNewTabs
local K=w.Parent~=y

local L={
Scroll=not F,
Fill=not H and true or nil,
UiPadding=UDim.new(0,E and 8 or 0),
AutoSelectNewTabs=J
}


if H then
Merge(L,{
AutomaticSize=H,
Size=UDim2.new(1,0)
})
end


local M=aa:InsertPrefab("Window",w)
local N=M.Content
local O=N.TitleBar


local P=ad:NewClass(p)


local Q=aa:MakeCanvas{
Element=N,
WindowClass=P,
Class=P
}


local R,S,T
local U,V=Q:Canvas(Copy(L,{
Parent=N,
CornerRadius=UDim.new(0,0),

}))


local W=aa:MakeResizable{
MinimumSize=B,
Resize=M,
OnUpdate=function(W)
P:SetSize(W,true)
end,
}


Merge(P,w)
Merge(P,{
WindowFrame=M,
ContentFrame=N,
CanvasFrame=V,
ResizeGrab=W.Grab,
TitleBar=O,
Elements=m,
TagsList={},
_SelectDisabled=K,


ResizeConnection=W,
HoverConnection=aa:DetectHover(N),
DragConnection=aa:MakeDraggable{
Grab=N,
Move=M,
SetPosition=function(X,Y)
local Z=R:GetThemeKey"AnimationTweenInfo"

ae:Tween{
Tweeninfo=Z,
Object=X.Move,
EndProperties={
Position=Y
}
}
end,
OnDragStateChange=function(X)
P.IsDragging=X
V.Interactable=not X


if X then
aa:SetFocusedWindow(T)
end


aa:SetWindowFocusesEnabled(not X)
end,
},
})


if E then

R,S=U,V
else

R,S=U:TabSelector(L)
P.WindowTabSelector=R
end


T=aa:MergeMetatables(P,R)


Merge(P,{
ContentCanvas=R,
WindowClass=T,
Body=S
})


aa:ConnectMouseEvent(N,{
DoubleClick=true,
OnlyMouseHovering=O,
Callback=function(...)
if not P.OpenOnDoubleClick then return end
if P.NoCollapse then return end

P:ToggleCollapsed()
end,
})


if not z then
P:AddDefaultTitleButtons()
end


P:SetTitle(D)
P:SetCollapsed(A,true)


P:SetTheme(G)
P:UpdateConfig(w)


P:SetFocused()


if not I then
table.insert(x,T)
end


local X=W.Grab
aa:SetAnimation(X,"TextButtons")
aa:SetFocusedWindow(T)

T:TagElements{
[X]="ResizeGrab",
[O]="TitleBar",
[V]="Window"
}

return T,M
end,
})




aa:DefineElement("TabsWindow",{
Export=true,
Base={
NoTabs=false,
AutoSelectNewTabs=true
},
Create=function(q,w)
return q:Window(w)
end,
})






















aa:DefineElement("PopupCanvas",{
Base={
AutoClose=false,
Scroll=false,
Visible=true,
Spacing=UDim.new(0,1),
AutomaticSize=Enum.AutomaticSize.XY,
MaxSizeY=150,
MinSizeX=100,
MaxSizeX=math.huge,
OnClosed=l
},
Create=function(q,w)
local x=w.RelativeTo
local y=w.MaxSizeY
local z=w.MinSizeX
local A=w.MaxSizeX
local B=w.Visible
local D=w.AutoClose
local E=w.NoAnimation
w.Parent=aa.Container.Overlays


local F,G=q:OverlayScroll(w)
local H=G.UIStroke

local I=H.Thickness
local J=G.Parent.AbsolutePosition
local K,L,M,N


local O=aa:DetectHover(G,{
MouseOnly=true,
OnInput=function(O,P)
if O then return end
if not G.Visible then return end
w:OnFocusLost()
end,
})

function w.FetchScales(P)

local Q=F:GetCanvasSize()

K=x.AbsolutePosition
L=x.AbsoluteSize

M=math.clamp(Q.Y,L.Y,y)
N=math.clamp(L.X,z,A)
end

function w.UpdatePosition(P)
G.Position=UDim2.fromOffset(
K.X-J.X+I,
K.Y-J.Y+L.Y
)
end

function w.GetScale(P,Q)
local R=UDim2.fromOffset(N,M)
local S=UDim2.fromOffset(N,0)

return Q and R or S
end

function w.IsMouseHovering(P)
return O.Hovering
end

function w.OnFocusLost(P)
local Q=P.OnClosed

P:SetPopupVisible(false)
Q(P)


if D then
P:ClosePopup()
end
end

function w.ClosePopup(P,Q)
P:SetPopupVisible(false,E,Q)
O:Disconnect()
G:Remove()
end

function w.SetPopupVisible(P,Q,R)

if G.Visible==Q then return end

x.Interactable=not Q
P:UpdateScales(Q,E,R)
P.Visible=Q
end

function w.UpdateScales(P,Q,R,S)
local T=F:GetThemeKey"AnimationTweenInfo"
Q=Q==nil and G.Visible or Q

w:FetchScales()
w:UpdatePosition()

local U=ae:Tween{
Tweeninfo=T,
Object=G,
NoAnimation=R,
EndProperties={
Size=w:GetScale(Q),
Visible=Q,
}
}


if U and S then
U.Completed:Wait()
end
end


w:UpdateScales(false,true)
w:SetPopupVisible(B)
F.OnChildChange:Connect(w.UpdateScales)

return F,G
end,
})






aa:DefineElement("PopupModal",{
Export=true,
Base={
NoAnimation=false,
NoCollapse=true,
NoClose=true,
NoResize=true,
NoSelect=true,
NoAutoFlags=true,
NoWindowRegistor=true,
NoScroll=true,
},
Create=function(q,w)
local x=q.WindowClass


local y=w.NoAnimation
local z
w.Parent=aa.Container.Overlays


if x then
z=x:GetThemeKey"ModalWindowDimTweenInfo"
w.Theme=x.Theme
end


local A=aa:InsertPrefab("ModalEffect",w)


local B=q:Window(Copy(w,{
NoAutoFlags=false,
Parent=A,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),
Size=UDim2.fromOffset(372,38),
AutomaticSize=Enum.AutomaticSize.Y
}))

function w.ClosePopup(D)
ae:Tween{
Object=A,
Tweeninfo=z,
NoAnimation=y,
EndProperties={
BackgroundTransparency=1
},
Completed=function()
A:Destroy()
end
}

B:Close()
end


ae:Tween{
Object=A,
Tweeninfo=z,
NoAnimation=y,
StartProperties={
BackgroundTransparency=1
},
EndProperties={
BackgroundTransparency=0.8
}
}


q:TagElements{
[A]="ModalWindowDim"
}


local D=aa:MergeMetatables(w,B)
return D,A
end,
})

GenerateMultiInput("InputInt2","InputInt",2,{NoButtons=true})
GenerateMultiInput("InputInt3","InputInt",3,{NoButtons=true})
GenerateMultiInput("InputInt4","InputInt",4,{NoButtons=true})
GenerateMultiInput("SliderInt2","SliderInt",2)
GenerateMultiInput("SliderInt3","SliderInt",3)
GenerateMultiInput("SliderInt4","SliderInt",4)
GenerateMultiInput("SliderFloat2","SliderFloat",2)
GenerateMultiInput("SliderFloat3","SliderFloat",3)
GenerateMultiInput("SliderFloat4","SliderFloat",4)
GenerateMultiInput("DragInt2","DragInt",2)
GenerateMultiInput("DragInt3","DragInt",3)
GenerateMultiInput("DragInt4","DragInt",4)
GenerateMultiInput("DragFloat2","DragFloat",2)
GenerateMultiInput("DragFloat3","DragFloat",3)
GenerateMultiInput("DragFloat4","DragFloat",4)

GenerateColor3Input("InputColor3","InputInt3")
GenerateColor3Input("SliderColor3","SliderInt3")
GenerateColor3Input("DragColor3","DragInt3")

GenerateCFrameInput("InputCFrame","InputInt3")
GenerateCFrameInput("SliderCFrame","SliderInt3")
GenerateCFrameInput("DragCFrame","DragInt3")

return aa end function a.l()local aa=a.cache.l if not aa then aa={c=__modImpl()}a.cache.l=aa end return aa.c end end do local function __modImpl()
local aa=a.a()

local ab=aa.getWeapons()

local ad=ab:GetChildren()


local ae={}

for b,c in ad do
ae[c.Name]={}

for d,f in c:GetChildren()do
if f:IsA"NumberValue"or f:IsA"IntValue"or f:IsA"BoolValue"then
ae[c.Name][f.Name]=(f).Value
end
end
end

local b={}

b.originalValues=ae

b.toggle2xFirerate=function(c)
for d,f in ad do
if f:FindFirstChild"FireRate"then
f.FireRate.Value=if not c
then ae[f.Name].FireRate
else ae[f.Name].FireRate/2
end
end
end

b.toggle2xEquipTime=function(c)
for d,f in ad do
if f:FindFirstChild"EquipTime"then
f.EquipTime.Value=if not c
then ae[f.Name].EquipTime
else ae[f.Name].EquipTime/2
end
end
end

b.toggle2xReloadTime=function(c)
for d,f in ad do
if f:FindFirstChild"ReloadSpeed"then
f.ReloadSpeed.Value=if not c
then ae[f.Name].ReloadSpeed
else ae[f.Name].ReloadSpeed/2
end
end
end

b.toggle2xShoot=function(c)
for d,f in ad do
if f:FindFirstChild"Bullets"then
f.Bullets.Value=if not c
then ae[f.Name].Bullets
else ae[f.Name].Bullets*2
end
end
end

b.toggle2xAmmo=function(c)
for d,f in ad do
if f:FindFirstChild"Ammo"then
f.Ammo.Value=if not c then ae[f.Name].Ammo else ae[f.Name].Ammo*2
end
end
end

b.toggle2xStoredAmmo=function(c)
for d,f in ad do
if f:FindFirstChild"StoredAmmo"then
f.StoredAmmo.Value=if not c
then ae[f.Name].StoredAmmo
else ae[f.Name].StoredAmmo*2
end
end
end

b.hasProperty=function(c,d)
if ab:FindFirstChild(c)then
if ab:FindFirstChild(d)then
return true
else
return false
end
else
return false
end
end

return b end function a.m()local aa=a.cache.m if not aa then aa={c=__modImpl()}a.cache.m=aa end return aa.c end end do local function __modImpl()

local aa=a.a()
local ab=a.m()

local ad={}

ad.load=function(ae)
local b=ae:CreateTab{Name="Weapons"}

if aa.isBypassed()then
b:Label{Text="Legit gameplay"}

b:Checkbox{
Value=false,
Label="Toggle 2X firerate",
Callback=function(c,d)
ab.toggle2xFirerate(d)
end,
}

b:Checkbox{
Value=false,
Label="Toggle 2X equip speed",
Callback=function(c,d)
ab.toggle2xEquipTime(d)
end,
}

b:Checkbox{
Value=false,
Label="Toggle 2X reload speed",
Callback=function(c,d)
ab.toggle2xReloadTime(d)
end,
}

b:Checkbox{
Value=false,
Label="Toggle 2X shot",
Callback=function(c,d)
ab.toggle2xShoot(d)
end,
}

b:Checkbox{
Value=false,
Label="Toggle 2X ammo",
Callback=function(c,d)
ab.toggle2xAmmo(d)
end,
}

b:Checkbox{
Value=false,
Label="Toggle 2X stored ammo",
Callback=function(c,d)
ab.toggle2xStoredAmmo(d)
end,
}

else
b:Label{Text="This tab is disabled\nbecause script couldn't bypass anticheat"}
end
end

return ad end function a.n()local aa=a.cache.n if not aa then aa={c=__modImpl()}a.cache.n=aa end return aa.c end end do local function __modImpl()

local aa={}

local ab=a.a()

local ad=(game:GetService"ReplicatedStorage")


local ae=(ad.VIPSettings.SpeedDemon)
local b=(ad.VIPSettings.NoVoiceCooldown)
local c=(ad.VIPSettings.AThirdPersonMode)
local d=(ad.VIPSettings.NoTeamLimits)

local function blank(f)
f:Label{Text=""}
end

aa.load=function(f)
local g=f:CreateTab{Name="Player"}

g:Separator{Text="Booleans"}

g:Checkbox{
Label="Enable BHop",
Value=false,
Callback=function(h,i)
ae.Value=i
end,
}

g:Checkbox{
Label="No VC commands cooldown",
Value=false,
Callback=function(h,i)
b.Value=i
end,
}

g:Checkbox{
Label="Change camera mode\nF5 to change",
Value=false,
Callback=function(h,i)
c.Value=i
end,
}

g:Checkbox{
Label="Allow to join full teams",
Value=false,
Callback=function(h,i)
d.Value=i
end,
}

blank(g)

g:Separator{Text="Keybinds"}

g:Keybind{
Label="Heal yourself as Doctor",
Value=Enum.KeyCode.E,

Callback=function(h,i)
local j=ab.getDoctorChangeTarget()
if j then
j:FireServer("Target",ab.getLocalPlayer().Name)
end
end,
}

blank(g)

g:Separator{Text="Map"}

g:Button{
Text="Remove current invisible walls",
Callback=function()



ab.clearIfExists(ab.getMapClips())
ab.clearIfExists(ab.getMapBlockBullets())
ab.clearIfExists(ab.getMapNoBuild())
ab.clearIfExists(ab.getMapProjectileClips())


for h,i in ab.getMapIgnores():GetChildren()do
if i.Name=="sounds_raining"then
i.CanCollide=false
i.CanQuery=false
i.CanTouch=false
end
end
end,
}

g:Button{
Text="Remove kill parts",
Callback=function()
ab.clearIfExists(ab.getMapTriggersHurt())
end,
}

g:Button{
Text="Remove collide teleports",
Callback=function()
for h,i in workspace:GetChildren()do
if(i:GetAttribute"BuildingType"=="Teleporter Entrance"or i:GetAttribute"BuildingType"=="Teleporter Exit")
and i:GetAttribute"Owner"~=ab.getLocalPlayer().Name
then
print(i)
for j,k in i:GetChildren()do
if k:IsA"BasePart"then
local l=k
l.CanCollide=false
l.CanQuery=false
l.CanTouch=false
end
end
end
end
end
}
end

return aa end function a.o()local aa=a.cache.o if not aa then aa={c=__modImpl()}a.cache.o=aa end return aa.c end end do local function __modImpl()

local aa=a.a()

local ab=aa.getRunService()
local ad=aa.getReplicatedStorage()

local ae=aa.getLocalPlayer()

if aa.shared_breakedAnticheat()then
warn"why do you want me to break anticheat again?"
warn(debug.traceback())
end


return function()
repeat
ab.Heartbeat:Wait()
until ad:GetAttribute"sv_setup"and ae:GetAttribute"FillMeIn"

ab.Heartbeat:Wait()

local b=0
local c=false
local d=false
local f

f=hookmetamethod(game,"__namecall",function(...)
if getcallingscript().Name=="NewLoader"then



c=true
d=true

error"tc2 totally legal software has just DESTROYED NewLoader thread!"
end
return f(...)
end)

local g=ab.Heartbeat:Connect(function(g)
b+=g
if b>=5 then
warn"unhooking `__namecall` back cause of timeout (bro i awaited 5 seconds)"
c=true
end
end)

repeat
ab.Heartbeat:Wait()
until c

g:Disconnect()
task.wait(0.5)
hookmetamethod(game,"__namecall",f)

return d
end end function a.p()local aa=a.cache.p if not aa then aa={c=__modImpl()}a.cache.p=aa end return aa.c end end end














































local aa=a.a()

local ab=aa.getRunService()

local ad=a.l()


local ae=a.n()
local b=a.o()

task.spawn(function()
if not aa.checkAnticheatHash()then
local c=ad:Window{Title="WARNING",Size=UDim2.fromOffset(300,200)}
c:Label{Text="Anticheat hash is not same!!"}
c:Label{Text="Do you really want to continue?"}
c:Label{Text="There's a chance that you can get banned!!!!!!!"}
c:Label{Text="Script wont do anything unless you press that checkbox"}
c:Indent{Offset=30}

local d=false

c:Checkbox{
Label="im pretty sure thats a small patch and i wont get ban",
Value=false,
Callback=function(f,g)
d=g
end,
}

repeat
ab.Heartbeat:Wait()
until d

c:Label{Text="we'll see."}

task.wait(2)

c:Close()
end

local c=ad:TabsWindow{
Title="if it crashes try to execute after loading.",
Size=UDim2.fromOffset(300,325),
}

c:SetFocused(false)

if not aa.shared_breakedAnticheat()then
aa.setBypassed(a.p()())
end

c:SetTitle"Team Country 2 HACKS?!"
c:SetFocused(true)

b.load(c)
ae.load(c)
end)