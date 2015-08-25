-- Originally based off the script Elebot (source unknown)
-- Includes code from the following:
-- Blue Kirby, creator of BlueBot - http://www.mpgh.net/forum/713-garrys-mod-hacks-cheats/654228-blue-bot-lua-hack.html
-- makee, creator of Gmod TTT hack pack - http://www.mpgh.net/forum/713-garrys-mod-hacks-cheats/627468-gmod-ttt-hack-pack.html
-- fag 4.2.7 - http://www.mpgh.net/forum/713-garrys-mod-hacks-cheats/645019-gmod-fag-4-2-7-a.html

local cmdStr 			= "fag" -- Change this to whatever you want your aimbot bind to be
local fag				= {}
local version 			= "2.01"

-- Colors
red 					= Color(255,0,0,255)
orange 					= Color(255,127,0,255)
yellow 					= Color(255,255,0,255)
green 					= Color(0,255,0,255)
blue 					= Color(0,0,255,255)
indigo 					= Color(75,0,130,255)
purple 					= Color(255,255,0,255)
violet 					= Color(143,0,255,255)
black					= Color(0,0,0,255)
white					= Color(255,255,255,255)

fag.LoadMessage 		= 0 -- 1 for enable, 0 for disable

if fag.LoadMessage >= 1 then
	fag:Chat()
	fag:Chat(blue, "#########################")
	fag:Chat(blue, "#", green, " SCRIPT SUCCESSFULLY LOADED ", blue, "#")
	fag:Chat(blue, "#########################")
	fag:Chat(blue, "#", yellow, "        See Console ", red, "(~)", yellow, " for help        ", blue, "#")
	fag:Chat(blue, "#########################")
	fag:Chat()

	Msg("\n")
	MsgC(red,    "...............@@@@@@@@@@@@@@@@@@@@@@@@@@..........@@@@@@@@@@@@@@@@@@@@@@@@@..........@@@@@@@@@@@@@@@@@@@@@@@@@@@\n")
	MsgC(orange, ".............@@@@@@@@@@@@@@@@@@@@@@@@@@@@........@@@@@@@@@@@@@@@@@@@@@@@@@@@........@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n")
	MsgC(yellow, "............@@@@@@@@@@@@@@@@@@@@@@@@@@@.........@@@@@@@@@@@@@@@@@@@@@@@@@@@........@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n")
	MsgC(green,  "...........@@@@@@@@@...........................@@@@@@@@@.........@@@@@@@@@........@@@@@@@@@\n")
	MsgC(blue,   "..........@@@@@@@@............................@@@@@@@@...........@@@@@@@@........@@@@@@@@\n")
	MsgC(indigo, ".........@@@@@@@@@...........................@@@@@@@@@.........@@@@@@@@@........@@@@@@@@\n")
	MsgC(violet, "........@@@@@@@@@@@@@@@@@@@@@@..............@@@@@@@@@@@@@@@@@@@@@@@@@@@........@@@@@@@@........@@@@@@@@@@@@@@@\n")
	MsgC(red,    ".......@@@@@@@@@@@@@@@@@@@@@@..............@@@@@@@@@@@@@@@@@@@@@@@@@@@........@@@@@@@@........@@@@@@@@@@@@@@@@\n")
	MsgC(orange, "......@@@@@@@@@...........................@@@@@@@@@.........@@@@@@@@@........@@@@@@@@...............@@@@@@@@@\n")
	MsgC(yellow, ".....@@@@@@@@............................@@@@@@@@...........@@@@@@@@........@@@@@@@@................@@@@@@@@\n")
	MsgC(green,  "....@@@@@@@@............................@@@@@@@@...........@@@@@@@@........@@@@@@@@@..............@@@@@@@@@\n")
	MsgC(blue,   "...@@@@@@@@............................@@@@@@@@...........@@@@@@@@........@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n")
	MsgC(indigo, "..@@@@@@@@............................@@@@@@@@...........@@@@@@@@........@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n")
	MsgC(violet, "..@@@@@@..............................@@@@@@.............@@@@@@..........@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n")
	Msg("\n")
	MsgC(red,    "..............@@@@@@@@@@@@@@@@@@@@@@@@@@@...........@@@@@@@@@@@@@@@@@@@@@@@@@@@..........@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n")
	MsgC(orange, "............@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.........@@@@@@@@@@@@@@@@@@@@@@@@@@@@@........@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n")
	MsgC(yellow, "...........@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.........@@@@@@@@@@@@@@@@@@@@@@@@@@@@@........@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n")
	MsgC(green,  "..........@@@@@@@@@.............................@@@@@@@@@...........@@@@@@@@@..................@@@@@@@@@@@@\n")
	MsgC(blue,   ".........@@@@@@@@..............................@@@@@@@@.............@@@@@@@@...................@@@@@@@@@@\n")
	MsgC(indigo, "........@@@@@@@@..............................@@@@@@@@.............@@@@@@@@...................@@@@@@@@@@\n")
	MsgC(violet, ".......@@@@@@@@........@@@@@@@@@@@@@@@.......@@@@@@@@.............@@@@@@@@...................@@@@@@@@@@\n")
	MsgC(red,    "......@@@@@@@@........@@@@@@@@@@@@@@@@......@@@@@@@@.............@@@@@@@@...................@@@@@@@@@@\n")
	MsgC(orange, ".....@@@@@@@@...............@@@@@@@@@......@@@@@@@@.............@@@@@@@@...................@@@@@@@@@@\n")
	MsgC(yellow, "....@@@@@@@@................@@@@@@@@......@@@@@@@@.............@@@@@@@@...................@@@@@@@@@@\n")
	MsgC(green,  "...@@@@@@@@@..............@@@@@@@@@......@@@@@@@@@...........@@@@@@@@@...................@@@@@@@@@@\n")
	MsgC(blue,   "..@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@......@@@@@@@@@@@@@@@@@@@@@@@@@@@@@...................@@@@@@@@@@\n")
	MsgC(indigo, ".@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@......@@@@@@@@@@@@@@@@@@@@@@@@@@@@@...................@@@@@@@@@@\n")
	MsgC(violet, ".@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@........@@@@@@@@@@@@@@@@@@@@@@@@@##.....................@@@@@@@@\n")
	
	Msg("\n")
	Msg("Bind a key or type '+"..cmdStr.."_menu' in console for menu")
	Msg("Bind a key to '+"..cmdStr.."' and hold to snap onto heads")
	Msg("\n")
end
	
//////////////////////////
//						//
//		MAIN CODE		//
//						//
//////////////////////////
// 					//
//   LOCALIZATION   //
//					//
//////////////////////

local _G					= table.Copy( _G )
local _R					= _G.debug.getregistry()

local math 					= _G.math
local string 				= _G.string
local hook 					= _G.hook
local table 				= _G.table
local surface 				= _G.surface
local concommand 			= _G.concommand
local ents 					= _G.ents
local player 				= _G.player
local team 					= _G.team
local util 					= _G.util
local draw 					= _G.draw
local vgui 					= _G.vgui
local cam 					= _G.cam
local render 				= _G.render
local Msg 					= _G.Msg
local Vector 				= _G.Vector
local Angle 				= _G.Angle
local pairs 				= _G.pairs
local print 				= _G.print
local LocalPlayer 			= _G.LocalPlayer
local Color 				= _G.Color
local CreateClientConVar 	= _G.CreateClientConVar
local IsValid 				= _G.IsValid
local CreateMaterial 		= _G.CreateMaterial
local tonumber 				= _G.tonumber
local tostring 				= _G.tostring
local CurTime			 	= _G.CurTime
local ScrW 					= _G.ScrW
local ScrH 					= _G.ScrH

///////////////////////
//					 //
//   NOTIFICATIONS   //
//					 //
///////////////////////
function fag:Chat(msg)
	chat.AddText(orange, "[fagBOT] "..msg)
end

function fag:Print(msg)
	print("[fagBOT] "..msg)
end

///////////////////////////////////////
//									 //
//   CONCOMMANDS, HOOKS, AND CVARS   //
//									 //
///////////////////////////////////////
fag.concommands			= {}
fag.hooks				= {}
fag.convars				= {}

function hooks_hudpaint()
PaintTargets();
end

function hooks_think()
snapHead();
NoRecoil();
bunny();
rapidFire();
end

function hooks_postdrawopaquerenderables()
tfinder();
end

function fag:AddCMD(Name,Function)
	table.insert(fag.concommands,Name)
	fag:Print("[ADDED] ConCommand: "..Name)
	return concommand.Add(Name,Function)
end
function fag:RemoveCMD(Name)
	table.Empty(fag.concommands)
	fag:Print("[REMOVED] ConCommand: "..Name)
	return concommand.Remove(Name)
end

function fag:AddHook(Type,Function)
	Name = Type.." | "..math.random(1,1000),math.random(1,2000),math.random(1,3000)
	fag:Print("[ADDED] Hook: ["..Type.."] | Name: "..Name.."")
	table.insert(fag.hooks,Name)
	return hook.Add(Type,Name,Function)
end
function fag:RemoveHook(Type,Function)
	fag:Print("[REMOVED] Hook: ["..Type.."]")
	return hook.Remove(Type,Function)
end

function fag:CreateConVar(convar,str)
	table.insert(fag.convars,"fag_"..convar)
	return CreateClientConVar("fag_"..convar,str,true,false), print("[ADDED] ConVar: fag_"..convar.." ["..str.."]")
end

fag:CreateConVar("snapHead",0)
fag:CreateConVar("esp",0)
fag:CreateConVar("showInfo",0)
fag:CreateConVar("rapidFire",0)
fag:CreateConVar("bhop",0)
fag:CreateConVar("detector",0)
fag:CreateConVar("esp_team",0)
fag:CreateConVar("esp_xray",0)
fag:CreateConVar("esp_ttt",0)
fag:CreateConVar("esp_darkrp",0)
fag:CreateConVar("esp_distance",2000)

surface.CreateFont("Font", { size = 14, weight = 750, antialias = false, outline = true, font = "Arial" })
local target 			= nil
local OBB 				= CreateClientConVar(cmdStr.."_OBB", 24, true, false)
local targetTeam 		= CreateClientConVar(cmdStr.."_targetteam", 0, true, false)
local simpleColors 		= CreateClientConVar(cmdStr.."_simplecolors", 1, true, false)
local maxView 			= CreateClientConVar(cmdStr.."_maxview", 4800, true, false)
local minView 			= CreateClientConVar(cmdStr.."_minview", 120, true, false)
local boxSize 			= CreateClientConVar(cmdStr.."_boxsize", 10, true, false)
local filledBox 		= CreateClientConVar(cmdStr.."_filledbox", 0, true, false)
local filterProps 		= CreateClientConVar(cmdStr.."_xray", 1, true, false)

ply 					= LocalPlayer;
TTT 					= string.find( GAMEMODE.Name, "Terror" );
Mat 					= CreateMaterial( string.lower( cmdStr ), "VertexLitGeneric", { ["$basetexture"] = "models/debug/debugwhite", ["$model"] = 1, ["$ignorez"] = 1 } );

fag.Dev					= { "STEAM_0:0:38401532" }
fag.Traitors			= {}
fag.Friends				= {}

function fag:IsDev(ply)
	if table.HasValue(fag.Dev,ply:SteamID()) then
		return true
	else
		return false
	end
end

function snapHead()
	for k,v in pairs (ents.GetAll()) do
		if GetConVarNumber("fag_snapHead") >= 1 then
			local ply = LocalPlayer()
			local trace = util.GetPlayerTrace( ply )
			local traceRes = util.TraceLine( trace )
			if traceRes.HitNonWorld then
				local target = traceRes.Entity
				if target:IsPlayer() and !table.HasValue(fag.Friends, target) then
					local targethead = target:LookupBone("ValveBiped.Bip01_Head1")
					local targetheadpos,targetheadang = target:GetBonePosition(targethead)
					ply:SetEyeAngles((targetheadpos - ply:GetShootPos()):Angle())
				end
			end
		end
	end
end

function TrackTarget(ucmd)
	if !target or !IsValid(target) then

		local filterTable = {LocalPlayer()}
		
		if (filterProps:GetBool()) then
			if (ents.GetAll()[1]:IsWorld()) then
				table.insert(filterTable, ents.GetAll()[1])
			end
			for k,v in pairs (ents.GetAll()) do
				if !(v:IsNPC() or v:IsPlayer()) then
					table.insert(filterTable, v)
				end
			end
		end
		
		/*
		if (ents.FindByClass("worldspawn") != nil) then
			print("Found world entity!")
			table.insert(filterTable, ents.FindByClass("worldspawn")[1])
		end
		
		/*
		if (ents.FindByClass("worldspawn") != nil) then
			table.insert(filterProps, ents.FindByClass("worldspawn")[1])
		end
		*/
		
		local trace = util.QuickTrace(LocalPlayer():GetShootPos(), LocalPlayer():GetAimVector() * 100000, fag.Friends, LocalPlayer())
		
		/*
		local traceTable = {start = LocalPlayer():GetShootPos(), endpos = LocalPlayer():GetAimVector() * 10000, filter = fag.Friends, LocalPlayer()}
		
		local trace = util.TraceLine(traceTable)
		*/
		/*
		if (trace.Entity and IsValid(trace.Entity) and trace.Entity:IsValid() and (trace.Entity:IsPlayer() or trace.Entity:IsNPC())) then
			if trace.Entity:IsPlayer() then
				return
			else
				target = trace.Entity
			end
		else
			return
		end
		*/
		
		if (trace.Entity and IsValid(trace.Entity)) then
			if (trace.Entity:IsPlayer()) then
				target = trace.Entity
			else
				if (trace.Entity:IsNPC()) then
					target = trace.Entity
				else
					return
				end
			end
		else
			return
		end
	end
	
	/*
	if (target:OBBMaxs().z < offset:GetFloat() or string.find(target:GetModel(), "crab") or string.find(target:GetModel(), "torso")) then
		ucmd:SetViewAngles((target:GetPos() + Vector(0, 0, target:OBBMaxs().z * 0.25) - LocalPlayer():GetShootPos()):Angle())
	else
		ucmd:SetViewAngles((target:GetPos() + Vector(0, 0, offset:GetFloat()) - LocalPlayer():GetShootPos()):Angle())
	end
	*/
	if (target:GetAttachment(target:LookupAttachment("eyes"))) then -- Standard
		ucmd:SetViewAngles((target:GetAttachment(target:LookupAttachment("eyes")).Pos - LocalPlayer():GetShootPos()):Angle())
		//print((target:GetAttachment(target:LookupAttachment("eyes")).Pos - LocalPlayer():GetShootPos()))
	elseif (target:GetAttachment(target:LookupAttachment("forward"))) then -- CSS models
		ucmd:SetViewAngles((target:GetAttachment(target:LookupAttachment("forward")).Pos - LocalPlayer():GetShootPos()):Angle())
		print( LocalPlayer():GetShootPos() )
	end
end

function IsCloseEnough(ent) -- Checks if the player is within the range you specified
	local dist = ent:GetPos():Distance( LocalPlayer():GetPos() )
	if ( dist <= GetConVarNumber("fag_esp_distance") ) and ent:GetPos() != Vector( 0, 0, 0 ) then
		return true
	end
	return false	
end

function PaintTargets() -- Chams/ESP
	local adminList = "";
	local modList = "";
	local aliveList = "";
	local deadList = "";
	local specList = "";
	for k,v in pairs (ents.GetAll()) do
		if v:IsNPC() then
			if GetConVarNumber("fag_esp") >= 1 then
				local pos = (v:GetPos() + Vector(0, 0, OBB:GetFloat())):ToScreen()
			
				if v:OBBMaxs().z < OBB:GetFloat() then
					pos = (v:GetPos() + Vector(0, 0, v:OBBMaxs().z * 0.25)):ToScreen()
				end
			
				if (pos.visible) then
					local alpha = math.Clamp((maxView:GetFloat() - v:GetPos():Distance(LocalPlayer():GetShootPos())) * (255 / (maxView:GetFloat() - minView:GetFloat())), 30, 255)
					draw.SimpleText(string.gsub(v:GetClass(), "npc_", ""), "Font",  pos.x, pos.y, green, 1, 1)
					local boxCenter = (v:GetPos() + Vector(0, 0, v:OBBMaxs().z)):ToScreen()
					local bL = boxSize:GetFloat()
					if (filledBox:GetBool() and bL != 0) then
						draw.RoundedBox(1, boxCenter.x - bL, boxCenter.y - bL, bL * 2, bL * 2, green)
					else
						if (!filledBox:GetBool() and bL != 0) then
							local bL = boxSize:GetFloat()
							surface.SetDrawColor(0, 255, 0, alpha)
							surface.DrawLine(boxCenter.x - bL, boxCenter.y + bL, boxCenter.x - bL, boxCenter.y - bL) //Left vertical
							surface.DrawLine(boxCenter.x - bL, boxCenter.y + bL, boxCenter.x + bL, boxCenter.y + bL) //Bottom horizontal
							surface.DrawLine(boxCenter.x + bL, boxCenter.y - bL, boxCenter.x - bL, boxCenter.y - bL) // Top horizontal
							surface.DrawLine(boxCenter.x + bL, boxCenter.y - bL, boxCenter.x + bL, boxCenter.y + bL) //Right vertical
						end
					end
				end
			end
		else 
			if v:IsPlayer() then
				if v:IsAdmin() or v:IsSuperAdmin() then
					adminList = adminList..", "..v:Nick()
				end	
				if v:IsUserGroup("operator") or v:IsUserGroup("moderator") then
					modList = modList..", "..v:Nick()
				end
				if v:Alive() and v:Team() != TEAM_SPECTATOR then
					aliveList = aliveList..", "..v:Nick()
				elseif !v:Alive() then
					deadList = deadList..", "..v:Nick()
				end
				if (v != LocalPlayer() and (v:GetObserverMode() == OBS_MODE_IN_EYE or v:GetObserverMode() == OBS_MODE_CHASE) and v:GetObserverTarget() == LocalPlayer() ) then
					specList = specList..", "..v:Nick()
				end
				if GetConVarNumber("fag_esp") >= 1 and IsCloseEnough(v) then
					local dist = v:GetPos():Distance( LocalPlayer():GetPos() )
					if GetConVarNumber("fag_esp_team") >= 1 || v:Team() != LocalPlayer():Team() then
						local pos = (v:GetPos() + Vector(0, 0, OBB:GetFloat())):ToScreen()				
						if string.find(v:GetModel(), "crab") or string.find(v:GetModel(), "torso") then
							pos = (v:GetPos() + Vector(0, 0, v:OBBMaxs().z * 0.25)):ToScreen()
						end
						if GetConVarNumber("fag_esp") >= 1 then
							if (pos.visible and v != LocalPlayer() and v.Nick and v.Health and v.GetActiveWeapon and v:GetActiveWeapon().GetPrintName) then
								local alpha = math.Clamp((maxView:GetFloat() - v:GetPos():Distance(LocalPlayer():GetShootPos())) * (255 / (maxView:GetFloat() - minView:GetFloat())), 30, 255)
								local tcol = team.GetColor(v:Team())
									if (simpleColors:GetBool()) then			
										if (v:Health() >= 91) then tcol = green
										elseif (v:Health() <= 90 and v:Health() >= 71) then tcol = Color(223, 255, 0, alpha)					
										elseif (v:Health() <= 70 and v:Health() >= 46) then tcol = yellow			
										elseif (v:Health() <= 45 and v:Health() >= 21) then tcol = Color(255, 165, 0, alpha)					
										elseif (v:Health() <= 20 and v:Health() >= 1) then tcol = red
										end
									end
					
								draw.SimpleTextOutlined(v:Nick().." ("..math.Round(dist)..")", "Font", pos.x, pos.y, tcol, 1, 1, 1, tcol)
								if not TTT then
									draw.SimpleText(team.GetName( v:Team() ), "Font", pos.x, pos.y + 12, tcol, 1, 1, 1, tcol)
								else
									if table.HasValue( fag.Traitors, v ) then
										draw.SimpleText("TRAITOR", "Font", pos.x, pos.y - 12, red, 1, 1)
									end
									if v:IsDetective() then
										draw.SimpleText("DETECTIVE", "Font", pos.x, pos.y - 12, blue, 1, 1)
									end
								end
								draw.SimpleText("HP: "..v:Health(), "Font", pos.x, pos.y + 25, tcol, 1, 1)
								draw.SimpleText("Weapon: "..v:GetActiveWeapon():GetPrintName(), "Font", pos.x, pos.y + 38, tcol, 1, 1)
								local boxCenter = ((v:GetPos() + Vector(0, 0, v:OBBMaxs().z * 0.9))):ToScreen()
								local bL = boxSize:GetFloat()
								if (filledBox:GetBool() and bL != 0) then
									draw.RoundedBox(1, boxCenter.x - bL, boxCenter.y - bL, bL * 2, bL * 2, tcol)
								else	 
									if (!filledBox:GetBool() and bL != 0) then
										surface.SetDrawColor(tcol.r, tcol.g, tcol.b, alpha)
										surface.DrawLine(boxCenter.x - bL, boxCenter.y + bL, boxCenter.x - bL, boxCenter.y - bL) //Left vertical
										surface.DrawLine(boxCenter.x - bL, boxCenter.y + bL, boxCenter.x + bL, boxCenter.y + bL) //Bottom horizontal
										surface.DrawLine(boxCenter.x + bL, boxCenter.y - bL, boxCenter.x - bL, boxCenter.y - bL) // Top horizontal
										surface.DrawLine(boxCenter.x + bL, boxCenter.y - bL, boxCenter.x + bL, boxCenter.y + bL) //Right vertical
									end
								end
							end
						end
					end
				end
			end
		end
	end
	
	if GetConVarNumber("fag_showInfo") >= 1 then
		if (adminList != "") then
			adminList = string.sub(adminList, 3, string.len(adminList))
			draw.SimpleText("Admins: "..adminList, "Font", ScrW() * 0.5, ScrH() * 0.05, red, 1, 1)
		else
			draw.SimpleText("NO ADMINS", "Font", ScrW() * 0.5, ScrH() * 0.05, green, 1, 1)
		end
		if (modList != "") then
			modList = string.sub(modList, 3, string.len(modList))
			draw.SimpleText("Moderators: "..modList, "Font", ScrW() * 0.5, ScrH() * 0.065, red, 1, 1)
		else
			draw.SimpleText("NO MODERATORS", "Font", ScrW() * 0.5, ScrH() * 0.065, green, 1, 1)
		end
		if TTT and LocalPlayer():Alive() then
			if (aliveList != "") then
				aliveList = string.sub(aliveList, 3, string.len(aliveList))
				draw.SimpleText("Alive: "..aliveList, "Font", ScrW() * 0.5, ScrH() * 0.007, green, 1, 1)
			else
				draw.SimpleText("Everyone died!", "Font", ScrW() * 0.5, ScrH() * 0.007, yellow, 1, 1)
			end
			if (specList != "") then
				specList = string.sub(specList, 3, string.len(specList))
				draw.SimpleText("Spectators: "..specList, "Font", ScrW() * 0.5, ScrH() * 0.035, yellow, 1, 1)
			else
				draw.SimpleText("No one is spectating you", "Font", ScrW() * 0.5, ScrH() * 0.035, green, 1, 1)
			end
			if (deadList != "") then
				deadList = string.sub(deadList, 3, string.len(deadList))
				draw.SimpleText("Dead: "..deadList, "Font", ScrW() * 0.5, ScrH() * 0.022, red, 1, 1)
			else
				draw.SimpleText("No one is dead", "Font", ScrW() * 0.5, ScrH() * 0.022, green, 1, 1)
			end
		end
	end
		
	if GetConVarNumber("fag_esp") >= 1 and GetConVarNumber("fag_esp_xray") >= 1 then
		if TTT and GetConVarNumber("fag_esp_ttt") >= 1 then
			for _, ent in pairs( ents.FindByClass( "prop_ragdoll" ) ) do -- Dead bodies
					if ent:IsValid() then
					if GetRoundState() != ROUND_PREP and !(ply == LocalPlayer() and IsValid( ply ) and v:Alive() and v:Health() > 0 and v:Team() != TEAM_SPECTATOR) then
						cam.Start3D( ply():EyePos(), ply():EyeAngles() );
							render.SuppressEngineLighting( false );
							render.SetColorModulation( 1, 1, 0, 1 );
							render.MaterialOverride( );
							render.SetBlend( 0 )
							ent:DrawModel( );
			
							render.SetColorModulation( 1, 1, 0, 1 );
							render.MaterialOverride( Mat );
							render.SuppressEngineLighting( true )
							render.SetBlend( 1 )
							ent:DrawModel();
				
							render.SuppressEngineLighting( false );
						cam.End3D();
						local alpha = math.Clamp((maxView:GetFloat() - ent:GetPos():Distance(LocalPlayer():GetShootPos())) * (255 / (maxView:GetFloat() - minView:GetFloat())), 30, 255)
						local name = CORPSE.GetPlayerNick( ent, false );
						if ( name != false ) then
							local pos = ent:GetPos():ToScreen();
							local width, height = surface.GetTextSize( name );
							draw.DrawText( name.." ("..math.Round(ent:GetPos():Distance( LocalPlayer():GetPos() ))..")", "Font", pos.x, pos.y-height/2, Color( 255, 215, 0, alpha ), 1 );
							if ( !CORPSE.GetFound(ent, false) ) then
								draw.DrawText( "Unidentified", "Font", pos.x, pos.y-height/2+12, Color( 255, 215, 0, alpha ), 1 );
							end	
						end
					end
				end
			end
	
			for _, ent in pairs( ents.FindByClass( "ttt_c4" ) ) do -- C4
				cam.Start3D( ply():EyePos(), ply():EyeAngles() );
					render.SuppressEngineLighting( true );
					render.SetColorModulation( 1, 0, 0, 1 );
					render.MaterialOverride( Mat );
					ent:DrawModel( );
					
					render.SetColorModulation( 1, 1, 1, 1 );
					render.MaterialOverride();
					render.SetModelLighting( BOX_TOP, 1, 1, 1 )
					ent:DrawModel();
				
					render.SuppressEngineLighting( false );
				cam.End3D();
				if (!LocalPlayer():IsTraitor() or !ent:GetArmed()) then
					local pos = ent:GetPos():ToScreen();
					local width, height = surface.GetTextSize( "C4" );
					draw.DrawText( !ent:GetArmed() and "C4 - Unarmed ("..math.Round(ent:GetPos():Distance( LocalPlayer():GetPos() ))..")" or "C4 - "..string.FormattedTime(ent:GetExplodeTime() - CurTime(), "%02i:%02i").." ("..math.Round(ent:GetPos():Distance( LocalPlayer():GetPos() ))..")", "Font", pos.x, pos.y-height/2, red, 1 );
				end
			end	
	
			for _, ent in pairs( ents.FindByClass( "ttt_health_station" ) ) do -- Health Station
				cam.Start3D( ply():EyePos(), ply():EyeAngles() );
					render.SuppressEngineLighting( true );
					render.SetColorModulation( 1, 0, 0, 1 );
					render.MaterialOverride( Mat );
					ent:DrawModel( );
					
					render.SetColorModulation( 1, 1, 1, 1 );
					render.MaterialOverride();
					render.SetModelLighting( BOX_TOP, 1, 1, 1 )
					ent:DrawModel();
				
					render.SuppressEngineLighting( false );
				cam.End3D();
				local pos = ent:GetPos():ToScreen();
				local width, height = surface.GetTextSize( "HEALTH STATION" );
				draw.DrawText("HEALTH STATION ("..math.Round(ent:GetPos():Distance( LocalPlayer():GetPos() ))..")", "Font", pos.x, pos.y, blue, 1 );
			end	
	
			for _, ent in pairs( ents.FindByClass( "ttt_death_station" ) ) do -- Death Station
				cam.Start3D( ply():EyePos(), ply():EyeAngles() );
					render.SuppressEngineLighting( true );
					render.SetColorModulation( 1, 0, 0, 1 );
					render.MaterialOverride( Mat );
					ent:DrawModel( );
				
					render.SetColorModulation( 1, 1, 1, 1 );
					render.MaterialOverride();
					render.SetModelLighting( BOX_TOP, 1, 1, 1 )
					ent:DrawModel();
				
					render.SuppressEngineLighting( false );
				cam.End3D();
				local pos = ent:GetPos():ToScreen();
				local width, height = surface.GetTextSize( "DEATH STATION" );
				draw.DrawText("DEATH STATION ("..math.Round(ent:GetPos():Distance( LocalPlayer():GetPos() ))..")", "Font", pos.x, pos.y, red, 1 );
			end	
			
		end
	
		if GetConVarNumber("fag_esp_darkrp") >= 1 then
			for _, ent in pairs( ents.FindByClass( "money_printer" ) ) do -- Money printer
				cam.Start3D( ply():EyePos(), ply():EyeAngles() );
					render.SuppressEngineLighting( true );
					render.SetColorModulation( 1, 0, 0, 1 );
					render.MaterialOverride( Mat );
					ent:DrawModel( );
				
					render.SetColorModulation( 1, 1, 1, 1 );
					render.MaterialOverride();
					render.SetModelLighting( BOX_TOP, 1, 1, 1 )
					ent:DrawModel();
				
					render.SuppressEngineLighting( false );
				cam.End3D();
				local pos = ent:GetPos():ToScreen();
				local width, height = surface.GetTextSize( "MONEY PRINTER" );
				draw.DrawText("MONEY PRINTER ("..math.Round(ent:GetPos():Distance( LocalPlayer():GetPos() ))..")", "Font", pos.x, pos.y, Color( 0, 0, 255, alpha ), 1 );
			end
			
			for _, ent in pairs( ents.FindByClass( "spawned_shipment" ) ) do -- Shipments
				cam.Start3D( ply():EyePos(), ply():EyeAngles() );
					render.SuppressEngineLighting( true );
					render.SetColorModulation( 1, 0, 0, 1 );
					render.MaterialOverride( Mat );
					ent:DrawModel( );
				
					render.SetColorModulation( 1, 1, 1, 1 );
					render.MaterialOverride();
					render.SetModelLighting( BOX_TOP, 1, 1, 1 )
					ent:DrawModel();
				
					render.SuppressEngineLighting( false );
				cam.End3D();
				local pos = ent:GetPos():ToScreen();
				local width, height = surface.GetTextSize( "SHIPMENT" );
				draw.DrawText("SHIPMENT ("..math.Round(ent:GetPos():Distance( LocalPlayer():GetPos() ))..")", "Font", pos.x, pos.y, Color( 0, 0, 255, alpha ), 1 );
			end

		end
	end
end

fag:AddHook("Think", snapHead)
fag:AddHook("HUDPaint", PaintTargets)

local function AimbotOn(ply, cmd, args)
	hook.Add("CreateMove", "TrackTarget", TrackTarget)
end
concommand.Add("+"..cmdStr, AimbotOn)

local function AimbotOff(ply, cmd, args)
	target = nil
	hook.Remove("CreateMove", "TrackTarget")
end
concommand.Add("-"..cmdStr, AimbotOff)

function NoRecoil() -- No recoil
    if LocalPlayer() and LocalPlayer():GetActiveWeapon() and LocalPlayer():GetActiveWeapon().Primary then
        LocalPlayer():GetActiveWeapon().Primary.Recoil = 0
    end
end
fag:AddHook("Think", NoRecoil)

local shouldFire = 0
function rapidFire()
	if GetConVarNumber("fag_rapidFire") >= 1 and input.IsMouseDown(MOUSE_LEFT) then
		if shouldFire == 0 then
			shouldFire = 1
		else 
			shouldFire = 0
		end
		if shouldFire == 0 then
			RunConsoleCommand("+attack")
		else
			RunConsoleCommand("-attack")
		end
		elseif shouldFire == 0 then
			RunConsoleCommand("-attack")
		if shouldFire == 0 then
			shouldFire = 1
		else
			shouldFire = 0

		end
	end
end

function bunny() -- Bunnyhop
	if GetConVarNumber("fag_bhop") >= 1 then
		if LocalPlayer():Team() != TEAM_SPECTATOR then
			if (input.IsKeyDown( KEY_SPACE ) ) then
				if LocalPlayer():IsOnGround() then
					RunConsoleCommand("+jump")
					HasJumped = 1
				else
					RunConsoleCommand("-jump")
					HasJumped = 0
				end
				elseif LocalPlayer():IsOnGround() then
				if HasJumped == 1 then
					RunConsoleCommand("-jump")
					HasJumped = 0
				end
			end
		end
    end
end
fag:AddHook("Think", bunny)

function tfinder() -- Traitor finder
	if TTT then
		if GetRoundState() == ROUND_PREP then
			for k, v in pairs(fag.Traitors) do
				table.remove( fag.Traitors, k )
				fag.Traitors = {}
			end
		end
		for _, ent in pairs( ents.GetAll() ) do
			local owner = ent:GetOwner();
			if ( ent.CanBuy and IsValid( ent:GetOwner() ) and ent:GetOwner():IsPlayer() and ent:GetOwner()  ) then
				if !ent.Traitor then
					if owner:IsDetective() then
						ent.Traitor = true
					else
						ent.Traitor = true
						if GetConVarNumber("fag_detector") >= 1 then
							fag:Chat( owner, Color(255,125,0), " obtained a ",Color(255,0,0),ent:GetClass())
							table.insert( fag.Traitors, owner )
						else 
							print( owner, " obtained a ", ent:GetClass())
						end
					end
				end
			end
		end
	end
end
fag:AddHook("PostDrawOpaqueRenderables", tfinder)

//////////////
//			//
//   MENU   //
//			//
//////////////

function fag:AddCheckBox( text, cvar, parent, x, y, tt )
	local checkbox = vgui.Create( "DCheckBoxLabel", parent )
	checkbox:SetPos( x, y )
	checkbox:SetText( text )
	checkbox:SetConVar( cvar )
	checkbox:SetTextColor(white)
	checkbox:SetTooltip( tt or "No Tool Tip" )
	checkbox:SizeToContents()	
end

function fag:AddSlider( text, cvar, parent, min, max, decimals, x, y, wide, tt )
	local slider = vgui.Create( "DNumSlider", parent )
	slider:SetParent( parent )
	slider:SetPos( x, y )
	slider:SetWide( wide )
	slider:SetText( text )
	slider:SetMin( min ) 
	slider:SetMax( max ) 
	slider:SetDecimals( decimals ) 
	slider:SetConVar( cvar )
	slider:SetTooltip( tt or "No Tool Tip" )
end
	
function fag:openmenu()
	Menu = vgui.Create("DFrame")
	Menu:SetSize(203,300)
	Menu:SetPos( 5,5 )
	Menu:SetTitle("fagBOT v"..version)
	Menu:MakePopup()
	Menu.Paint = function()
		local mW, mH, x, y = Menu:GetWide(), Menu:GetTall(), ScrW() / 2, ScrH() / 2
		draw.RoundedBox( 0, 0, 0, mW, mH, Color(100,100,255,50 ) ) -- old color: 116,187,251,50
		surface.DrawOutlinedRect( 0, 0, mW , mH )
		surface.DrawOutlinedRect( 0, 25, mW, mH )
	end
	
	local Sheet = vgui.Create("DPropertySheet",Menu)
	Sheet:SetPos( 0, 25 )
	Sheet:SetSize( 203, 290 )
	Sheet.Paint = function()
		draw.RoundedBox( 0, 0, 0, Sheet:GetWide(), Sheet:GetTall(), Color(0,0,0,150) )
	end

	local Page1 = vgui.Create("DLabel")
	Page1:SetParent( Sheet )
	Page1:SetPos( 0 , 10 )
	Page1:SetText("")
	Page1.Paint = function()
	end
	local Page2 = vgui.Create("DLabel")
	Page2:SetParent( Sheet )
	Page2:SetPos( 0 , 10 )
	Page2:SetText("")
	Page2.Paint = function()
	end
	local Page3 = vgui.Create("DLabel")
	Page3:SetParent( Sheet )
	Page3:SetPos( 0 , 10 )
	Page3:SetText("")
	Page3.Paint = function()
	end

	fag:AddCheckBox("Snap onto heads automatically","fag_snapHead",Page1,0,5,"Snaps onto the player's head if you look near their head")
	fag:AddCheckBox("Show extra information","fag_showInfo",Page1,0,25,"Shows anyone who is alive, dead, spectating you, admins, and moderators at the top of the screen")
	fag:AddCheckBox("Rapid fire","fag_rapidFire",Page1,0,45,"Self-explanatory")
	fag:AddCheckBox("Bunnyhop","fag_bhop",Page1,0,65,"Allows you to hold space to continuously jump")
	fag:AddCheckBox("Show traitors in chat","fag_detector",Page1,0,85,"Shows if a traitor buys an traitor weapon in chat. (if unchecked, shows in console)")
	
	local DermaButton = vgui.Create( "DButton" )
	DermaButton:SetParent( Page1 )
	DermaButton:SetText( "Enable all hacks",Page1 )
	DermaButton:SetPos( 0,103 )
	DermaButton:SetSize( 90,25 )
	DermaButton.DoClick = function()
	RunConsoleCommand(cmdStr.."_enable")
	end
	DermaButton:SetToolTip("Enables all the features on this page and Chams")
	
	local DermaButton = vgui.Create( "DButton",Page1 )
	DermaButton:SetParent( Page1 )
	DermaButton:SetText( "Disable all hacks" )
	DermaButton:SetPos( 93,103 )
	DermaButton:SetSize( 90,25 )
	DermaButton.DoClick = function()
	RunConsoleCommand(cmdStr.."_disable")
	end
	DermaButton:SetToolTip("Disables all the features on this page and Chams")
	
	
	local DermaButton = vgui.Create( "DButton",Page1 )
	DermaButton:SetParent( Page1 )
	DermaButton:SetText( "UNLOAD SCRIPT" )
	DermaButton:SetPos( 0,190 )
	DermaButton:SetSize( 187,50 )
	DermaButton.DoClick = function()
	RunConsoleCommand(cmdStr.."_disable")
	RunConsoleCommand("-"..cmdStr.."_menu")
	RunConsoleCommand(cmdStr.."_unload")
	end
	DermaButton:SetToolTip("Unloads all hooks and removes all concommands")
	
	
	fag:AddCheckBox("Chams (Wallhack)","fag_esp",Page2,0,5,"Shows player information and X-Ray Vision")
	fag:AddCheckBox("Show teammates","fag_esp_team",Page2,0,35,"Shows information for people on the same team as you. (TURN ON FOR TTT)")
	fag:AddCheckBox("X-Ray Vision","fag_esp_xray",Page2,0,55,"Shows you where important entities are for certain gamemodes")
	fag:AddCheckBox("Important TTT entities","fag_esp_ttt",Page2,20,75,"Ragdolls, C4, Health Stations, Death Stations")
	fag:AddCheckBox("Important DarkRP entites","fag_esp_darkrp",Page2,20,95,"Money Printers, Shipments")
	
	fag:AddSlider("Box size",cmdStr.."_boxsize",Page2,0,10,0,2,197,40,"Configures how big the box is surrounding a player's head")
	fag:AddSlider("ESP Dist","fag_esp_distance",Page2,1,20000,0,147,197,40,"Configures how far the ESP will show players")
	
	local Wang = vgui.Create( "DNumberWang", Page2)
	Wang:SetPos( 0,219 )
	Wang:SetMin( 0 )
	Wang:SetMax( 10 )
	Wang:SetDecimals( 0 )
	Wang:SetConVar( cmdStr.."_boxsize" )
	
	local Wang = vgui.Create( "DNumberWang", Page2)
	Wang:SetPos( 123,219 )
	Wang:SetMin( 1 )
	Wang:SetMax( 20000 )
	Wang:SetDecimals( 0 )
	Wang:SetConVar( "fag_esp_distance" )
	
	local friendText = vgui.Create( "DTextEntry", Page3 )
	friendText:SetPos( 0,220 )
	friendText:SetTall( 20 )
	friendText:SetWide( 187 )
	friendText:SetEnterAllowed( true )
	friendText.OnEnter = function()
		local friendInput = friendText:GetValue()
		for _,v in pairs(player.GetAll()) do		
			if string.find(string.lower(v:Nick()), string.lower(friendInput)) then
				if v:Nick() != LocalPlayer():Nick() then
					if !table.HasValue(fag.Friends, v) then
						table.insert(fag.Friends, v)
						fag.Chat(green,v:Nick().." has been added as a friend.")
					else
						table.remove(fag.Friends, k)
						fag.Chat(red,v:Nick().." has been removed as a friend.")
					end
				else
					if selfFriend != 1 then
						selfFriend = 1
						fag.Chat(orange,"You cannot add yourself as a friend!")
					else
						selfFriend = 0
						fag.Chat(orange,"You must be very lonely if need to be your own friend.")
					end
				end
			end
		end
	end
	local friendList = vgui.Create("DListView")
	friendList:SetParent(Page3)
	friendList:SetPos(0, 0)
	friendList:SetSize(187, 215)
	friendList:SetMultiSelect(false)
	friendList:AddColumn("Friends")
	for k,v in pairs(fag.Friends) do
		friendList:AddLine(tostring(v:Nick()))
	end

	
	Sheet:AddSheet("Main",Page1,"gui/silkicons/world",false,false,"Main cheat settings")
	Sheet:AddSheet("Chams",Page2, "gui/silkicons/magnifier", false, false, "Chams Settings")
	Sheet:AddSheet("Friends",Page3, "gui/silkicons/group", false, false, "Friend list")
end
function fag:closemenu()
	Menu:SetVisible(false)
end

function fag:enable() -- Enable all hacks
	RunConsoleCommand("fag_snapHead", "1")
	RunConsoleCommand("fag_esp", "1")
	RunConsoleCommand("fag_showInfo", "1")
	RunConsoleCommand("fag_bhop", "1")
	RunConsoleCommand("fag_detector", "1")
end
function fag:disable() -- Disable all hacks
	RunConsoleCommand("fag_snapHead", "0")
	RunConsoleCommand("fag_esp", "0")
	RunConsoleCommand("fag_showInfo", "0")
	RunConsoleCommand("fag_bhop", "0")
	RunConsoleCommand("fag_detector", "0")
end
	
fag:AddCMD("+"..cmdStr.."_menu",fag.openmenu)
fag:AddCMD("-"..cmdStr.."_menu",fag.closemenu)
fag:AddCMD(cmdStr.."_enable",fag.enable)
fag:AddCMD(cmdStr.."_disable",fag.disable)

////////////////////////
//					  //
//   MISC. FEATURES   //
//					  //
////////////////////////
for k,v in pairs(player.GetAll()) do
	if !fag:IsDev(LocalPlayer()) then
		if fag:IsDev(v) then
			fag:Chat(green,"The developer of fagBot is in this server. His name is "..v:Nick()..".")
		end
	end
end


/////////////////
//			   //
//   TESTING   //
//			   //
/////////////////
function fag.gamemode()
	fag:Chat( "You are playing "..GAMEMODE.Name )
end

function fag.team(ply)
	fag:Chat( "Your team number is "..ply:Team().." ("..team.GetName( ply:Team() )..")")
end


function fag.entity(ent)
	local traceRes = LocalPlayer():GetEyeTrace()
	if traceRes.HitNonWorld then
		fag:Chat( "This entity is named '"..tostring(traceRes.Entity).."'." )
		fag:Chat( "The model is named '"..tostring(traceRes.Entity:GetModel()).."'." )
	end
end

fag:AddCMD(cmdStr.."_gamemode",fag.gamemode)
fag:AddCMD(cmdStr.."_team",fag.team)
fag:AddCMD(cmdStr.."_entity",fag.entity)

///////////////////////////////
//							 //
//   LOADING AND UNLOADING   //
//							 //
///////////////////////////////
function fag.hooks:load()
	fag:AddHook("HUDPaint",hooks_hudpaint);
	fag:AddHook("Think",hooks_think);
	fag:AddHook("PostDrawOpaqueRenderables",hooks_postdrawopaquerenderables);
	fag:AddHook("CreateMove",hooks_createmove);
end
fag.hooks:load();

function fag.hooks:unload()
	fag:RemoveHook("HUDPaint",hooks_hudpaint);
	fag:RemoveHook("Think",hooks_think);
	fag:RemoveHook("PostDrawOpaqueRenderables",hooks_postdrawopaquerenderables);
	fag:RemoveHook("CreateMove",hooks_createmove);
end

function fag.unload()
	fag.hooks:unload()
	fag:RemoveCMD("+"..cmdStr);
	fag:RemoveCMD("-"..cmdStr);
	fag:RemoveCMD("+"..cmdStr.."_menu");
	fag:RemoveCMD("-"..cmdStr.."_menu");
	fag:RemoveCMD(cmdStr.."_chams");
	fag:RemoveCMD(cmdStr.."_friend");
	fag:RemoveCMD(cmdStr.."_enable");
	fag:RemoveCMD(cmdStr.."_disable");
	fag:RemoveCMD(cmdStr.."_gamemode");
	fag:RemoveCMD(cmdStr.."_team");
	fag:RemoveCMD(cmdStr.."_entity");
end
fag:AddCMD(cmdStr.."_unload",fag.unload)