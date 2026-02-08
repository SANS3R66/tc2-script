local a={cache={}}do do local function __modImpl()local b=(cloneref(game:
GetService'Players'))local c=(cloneref(game:GetService'RunService'))local d=(
cloneref(game:GetService'ReplicatedStorage'))local e=(cloneref(game:GetService
'ReplicatedFirst'))local f={}local g=false f.getPlayers=function()return b end f
.getRunService=function()return c end f.getReplicatedStorage=function()return d
end f.getLocalPlayer=function()local h=b.LocalPlayer if not h then h=b.
PlayerAdded:Wait()end return h end f.getWeapons=function()return d:
FindFirstChild'Weapons'end f.getMap=function()return(workspace:FindFirstChild
'Map')end f.getMapIgnores=function()return(f.getMap():FindFirstChild'Ignore')end
f.getMapBlockBullets=function()return(f.getMapIgnores():FindFirstChild
'BlockBullets')end f.getMapNoBuild=function()return(f.getMapIgnores():
FindFirstChild'NoBuild')end f.getMapClips=function()return(f.getMap():
FindFirstChild'Clips')end f.getMapTriggersHurt=function()return(f.getMapIgnores(
):FindFirstChild'trigger_hurt')end f.getMapProjectileClips=function()return(f.
getMap().Geometry:FindFirstChild'ProjectileClips')end f.getDoctorChangeTarget=
function()local h=f.getLocalPlayer().Character if not h then return else local i
=h:FindFirstChild'Doctor'if not i then return else local j=(i:FindFirstChild
'ChangeValue')if not j then return else return j end end end end f.findNil=
function(h,i)for j,k in next,getnilinstances()do if k.ClassName==i and k.Name==h
then return k end end return end f.shared_breakedAnticheat=function()return
getgenv().tc2_anticheat_breaker==true end f.isBypassed=function()return f.
shared_breakedAnticheat()or g end f.getModuleAnticheatHash=function()return
[[4cb5e36a088b4905dfaa379ac2ed6ac6937ce50a5d4790f90157c75c984aec106b4059e62ec61f324848fde5a2107983]]
end f.getNewLoaderHash=function()return
[[2f40fd8aff0a80c48b2aad5816e9c1f0b895056ed1880c88467d22b5723bf9675793cf602b32f2d4560851f1f092c6d4]]
end f.getAnticheatModule=function()return f.findNil('Module','ModuleScript')end
f.getNewLoaderScript=function()return e:FindFirstChild'NewLoader'end f.
setBypassed=function(h)g=h end f.checkAnticheatHash=function()local h=f.
getNewLoaderScript()if h then return getscripthash(h)==f.getNewLoaderHash()else
warn"there's no NewLoader in ReplicatedFirst. uh"return false end end f.
destroyIfExists=function(h)if h then h:Destroy()end end f.clearIfExists=function
(h)if h then h:ClearAllChildren()end end f.parentToIfExists=function(h,i)if h
and i then h.Parent=i end end f.noCollisionIfExists=function(h)if h then h.
CanCollide=false h.CanTouch=false h.CanQuery=false end end return f end function
a.a()local b=a.cache.a if not b then b={c=__modImpl()}a.cache.a=b end return b.c
end end do local function __modImpl()local b=a.a()local c=b.getWeapons()local d=
(c:GetChildren())local e={}for f,g in d do e[g.Name]={}for h,i in g:GetChildren(
)do if i:IsA'NumberValue'or i:IsA'IntValue'or i:IsA'BoolValue'then e[g.Name][i.
Name]=(i).Value end end end local f={}f.originalValues=e f.toggle2xFirerate=
function(g)for h,i in d do local j=(i:FindFirstChild'FireRate')if j then j.Value
=if not g then e[i.Name].FireRate else e[i.Name].FireRate/2 end end end f.
toggle2xEquipTime=function(g)for h,i in d do local j=(i:FindFirstChild
'EquipTime')if j then j.Value=if not g then e[i.Name].EquipTime else e[i.Name].
EquipTime/2 end end end f.toggle2xReloadTime=function(g)for h,i in d do local j=
(i:FindFirstChild'ReloadSpeed')if j then j.Value=if not g then e[i.Name].
ReloadSpeed else e[i.Name].ReloadSpeed/2 end end end f.toggle2xShoot=function(g)
for h,i in d do local j=(i:FindFirstChild'Bullets')if j then j.Value=if not g
then e[i.Name].Bullets else e[i.Name].Bullets*2 end end end f.toggleSpread=
function(g)for h,i in d do local j=(i:FindFirstChild'Spread')if j then j.Value=
if not g then e[i.Name].Spread else 1 end end end f.toggle2xAmmo=function(g)for
h,i in d do local j=(i:FindFirstChild'Ammo')if j then j.Value=if not g then e[i.
Name].Ammo else e[i.Name].Ammo*2 end end end f.toggle2xStoredAmmo=function(g)for
h,i in d do local j=(i:FindFirstChild'StoredAmmo')if j then j.Value=if not g
then e[i.Name].StoredAmmo else e[i.Name].StoredAmmo*2 end end end f.hasProperty=
function(g,h)if c:FindFirstChild(g)then if c:FindFirstChild(h)then return true
else return false end else return false end end return f end function a.b()local
b=a.cache.b if not b then b={c=__modImpl()}a.cache.b=b end return b.c end end do
local function __modImpl()local b=a.a()local c=a.b()local d={}d.load=function(e)
local f=e:AddRightGroupbox('Gun mods','sword')if b.isBypassed()then f:AddToggle(
'Toggle2XEquipSpeed',{Text='Toggle 2X equip speed',Value=false,Callback=function
(g)c.toggle2xEquipTime(g)end})f:AddToggle('Toggle2XReloadSpeed',{Text=
'Toggle 2X reload speed',Value=false,Callback=function(g)c.toggle2xReloadTime(g)
end})f:AddToggle('Toggle2XShot',{Text='Toggle 2X shot',Value=false,Callback=
function(g)c.toggle2xShoot(g)end})f:AddToggle('Toggle2XFirerate',{Text=
'Toggle 2X firerate',Value=false,Callback=function(g)c.toggle2xFirerate(g)end})f
:AddToggle('Toggle2XAmmo',{Text='Toggle 2X ammo',Value=false,Callback=function(g
)c.toggle2xAmmo(g)end})f:AddToggle('Toggle2XStoredAmmo',{Text=
'Toggle 2X stored ammo',Value=false,Callback=function(g)c.toggle2xStoredAmmo(g)
end})else f:AddLabel
[[This tab is disabled cause script couldn't bypass anticheat
(so you wont get banned)]]
end end return d end function a.c()local b=a.cache.c if not b then b={c=
__modImpl()}a.cache.c=b end return b.c end end do local function __modImpl()
local b=a.a()local c=(game:GetService'ReplicatedStorage')local d=(c:
FindFirstChild'VIPSettings')local e=(d:FindFirstChild'SpeedDemon')local f=(d:
FindFirstChild'NoVoiceCooldown')local g=(d:FindFirstChild'AThirdPersonMode')
local h=(d:FindFirstChild'NoTeamLimits')local i={}i.load=function(j)local k=j:
AddLeftGroupbox('Player','user')k:AddToggle('ToggleBHOP',{Text='Enable Bhop',
Tooltip='Allows you to Bhop by holding Space.',Value=false,Callback=function(l)e
.Value=l end})k:AddToggle('ToggleNoVCCooldown',{Text='No VC commands cooldown',
Tooltip=
[[Allows you to spam voice commands.
There's still some limit if you spam too much.]]
,Value=false,Callback=function(l)f.Value=l end})k:AddToggle('ToggleCameraMode',{
Text='Enable camera mode changer',Tooltip=
'Allows you to change camera modes by pressing F5.',Value=false,Callback=
function(l)g.Value=l end})k:AddToggle('ToggleFullTeams',{Text=
'Allow to join full teams',Tooltip=
[[Allows you to join equal team.
Or go into spectator mode if you try to join a team that is too big.]]
,Value=false,Callback=function(l)h.Value=l end})k:AddDivider()k:AddLabel
'Heal yourself as Doctor bind':AddKeyPicker('BindDoctorHeal',{Default='E',NoUI=
true,Text='Key',Callback=function(l)if l then local m=b.getDoctorChangeTarget()
if m then m:FireServer('Target',b.getLocalPlayer().Name)end end end})k:
AddDivider()k:AddButton('Remove invisible walls',function()b.clearIfExists(b.
getMapClips())b.clearIfExists(b.getMapBlockBullets())b.clearIfExists(b.
getMapNoBuild())b.clearIfExists(b.getMapProjectileClips())for l,m in b.
getMapIgnores():GetChildren()do if m.Name=='sounds_raining'and m:IsA'Part'then m
.CanCollide=false m.CanQuery=false m.CanTouch=false end end end)k:AddButton(
'Remove kill parts',function()b.clearIfExists(b.getMapTriggersHurt())end)end
return i end function a.d()local b=a.cache.d if not b then b={c=__modImpl()}a.
cache.d=b end return b.c end end do local function __modImpl()local b=a.a()local
c=b.getRunService()local d=b.getReplicatedStorage()local e=b.getLocalPlayer()if
b.shared_breakedAnticheat()then warn
'why do you want me to break anticheat again?'warn(debug.traceback())end return
function()repeat c.Heartbeat:Wait()until d:GetAttribute'sv_setup'and e:
GetAttribute'FillMeIn'c.Heartbeat:Wait()local f=0 local g=false local h=false
local i i=hookmetamethod(game,'__namecall',function(...)local j=
getcallingscript()if j and j.Name=='NewLoader'then g=true h=true error
[[tc2 totally legal software has just DESTROYED NewLoader thread!]]end return i(
...)end)local j=c.Heartbeat:Connect(function(j)f+=j if f>=5 then warn
[[unhooking `__namecall` back cause of timeout (bro i awaited 5 seconds)]]g=true
end end)repeat c.Heartbeat:Wait()until g j:Disconnect()task.wait(1.5)
hookmetamethod(game,'__namecall',i)return h end end function a.e()local b=a.
cache.e if not b then b={c=__modImpl()}a.cache.e=b end return b.c end end end
local b=a.a()b.getRunService()local c=a.c()local d=a.d()local e=request{Url=
[[https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua]],
Method='GET'}.Body local f,g=loadstring(e)assert(f,string.format(
'Obsidian UI Library failed to load: %s',tostring(g)))local h=(f())task.spawn(
function()local i=h:CreateWindow{Title='Tc2 hacks?!',Footer='version: some',Icon
='',NotifySide='Right',Center=true,ShowCustomCursor=false}local j=i:AddTab(
'Main','user')local k=i:AddTab('Settings','wrench')do local l=k:AddLeftGroupbox(
'UI Settings','wrench')do l:AddLabel'Menu bind':AddKeyPicker('MenuKeybind',{
Default='RightShift',NoUI=true,Text='Menu keybind',ChangedCallback=function(m)if
m:IsA'KeyCode'then h.ToggleKeybind=m end end})l:AddButton('Unload',function()h:
Unload()end)end h.ToggleKeybind=Enum.KeyCode.RightShift end d.load(j)if not b.
shared_breakedAnticheat()then h:Notify{Title='Bypassing anti hacker',Description
='after bypassing a gun mods box will be available',Time=5}b.setBypassed(a.e()()
)end c.load(j)end)
