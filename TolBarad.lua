------------------------------------Tol-Barad-----------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
--------------------------------------------------------------------------------
local TolBarad = CreateFrame("Frame","TolBarad",UIParent);
-------------------------------------------------------TolBarad-BattleInProgress
local Frame0100 = CreateFrame("Frame","Frame0100",UIParent);
Frame0100:RegisterEvent("ADDON_LOADED");
Frame0100:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame0100:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE");
Frame0100:SetHeight(70);
Frame0100:SetWidth(200);
Frame0100:RegisterForDrag("LeftButton");

local Frame0101 = CreateFrame("Frame","Frame0101",Frame0100);
Frame0101:RegisterForDrag("LeftButton");
local FrameTex0101 = Frame0101:CreateTexture("FrameTex0101");
FrameTex0101:SetPoint("CENTER",Frame0101,"CENTER",0,-10);
local FrameText0101 = Frame0101:CreateFontString("FrameText0101");
FrameText0101:SetPoint("CENTER",Frame0101,"CENTER",0,0);

local Frame0102 = CreateFrame("Frame","Frame0102",Frame0100);
Frame0102:RegisterForDrag("LeftButton");
local FrameText0102 = Frame0102:CreateFontString("FrameText0102");
FrameText0102:SetPoint("CENTER",Frame0102,"CENTER",0,0);

local Frame0103 = CreateFrame("Frame","Frame0103",Frame0100);
Frame0103:RegisterForDrag("LeftButton");
Frame0103:SetHeight(15);
Frame0103:SetWidth(120);
local FrameText0103 = Frame0103:CreateFontString("FrameText0103");
FrameText0103:SetPoint("CENTER",Frame0103,"CENTER",0,0);

local Frame0104 = CreateFrame("Frame","Frame0104",Frame0100);
Frame0104:RegisterForDrag("LeftButton");
Frame0104:SetHeight(18);
Frame0104:SetWidth(85);

local FrameTex01041 = Frame0104:CreateTexture("FrameTex01041");
FrameTex01041:SetPoint("CENTER",Frame0104,"CENTER",-40,0);
FrameTex01041:SetHeight(15);FrameTex01041:SetWidth(15);
local FrameTex01042 = Frame0104:CreateTexture("FrameTex01042");
FrameTex01042:SetPoint("CENTER",Frame0104,"CENTER",-20,0);
FrameTex01042:SetHeight(15);FrameTex01042:SetWidth(15);
local FrameTex01043 = Frame0104:CreateTexture("FrameTex01043");
FrameTex01043:SetPoint("CENTER",Frame0104,"CENTER",0,0);
FrameTex01043:SetHeight(15);FrameTex01043:SetWidth(15);

---------------------------------------------------------------------------Event
function Frame0100:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
   Frame0100:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame0100:SetBackdropColor(0,0,0,0);
   Frame0100:SetBackdropBorderColor(0,0,0,0);
   
   Frame0101:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame0102:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame0101:SetBackdropColor(0,0,0,0);
   Frame0101:SetBackdropBorderColor(0,0,0,0);  
   Frame0102:SetBackdropColor(0,0,0,0);
   Frame0102:SetBackdropBorderColor(0,0,0,0);    
   
   Frame0103:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame0103:SetBackdropColor(0,0,0,0);
   Frame0103:SetBackdropBorderColor(0,0,0,0);
   
   Frame0104:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame0104:SetBackdropColor(0,0,0,0);
   Frame0104:SetBackdropBorderColor(0,0,0,0); 
   
   FrameTex01041:SetTexture(Ll.Icons.Towers[1]);
   FrameTex01042:SetTexture(Ll.Icons.Blacksmith[1]);
   FrameTex01043:SetTexture(Ll.Icons.Towers[1]);            
   
   FDragStart(100);FDragStop(100);
   FDragStart(101);FDragStop(100,101);
   FDragStart(102);FDragStop(100,102);   
   FDragStart(103);FDragStop(100,103); 
   FDragStart(104);FDragStop(100,104);    
   
   Frame0100:SetPoint(unpack(Ll.FramePos[100]));
   Frame0101:SetPoint(unpack(Ll.FramePos[101]));
   Frame0102:SetPoint(unpack(Ll.FramePos[102]));
   Frame0103:SetPoint(unpack(Ll.FramePos[103]));
   Frame0104:SetPoint(unpack(Ll.FramePos[104]));  
      
   if (InBattleground(10) or InBattleground(11)) then
     Frame0100:Show();     
   else
     Frame0100:Hide();     
   end      
end
end

if (event=="CHAT_MSG_RAID_BOSS_EMOTE") then
local arg1=...;
msg=arg1;
--Alliance
  if (string.find(msg,L["Alliance"])) then
     if (string.find(msg,L["warden captured2"]) or string.find(msg,L["warden captured"])) then FrameTex01041:SetTexture(Ll.Icons.Towers[3]);
     elseif (string.find(msg,L["slagworks captured2"]) or string.find(msg,L["slagworks captured"])) then FrameTex01042:SetTexture(Ll.Icons.Blacksmith[3]);
     elseif (string.find(msg,L["ironclad captured2"]) or string.find(msg,L["ironclad captured"])) then FrameTex01043:SetTexture(Ll.Icons.Towers[3]);       
     elseif (strmatch(msg,L["warden lost"]) or strmatch(msg,L["warden lost2"])) then FrameTex01041:SetTexture(Ll.Icons.Towers[1]);     
     elseif (string.find(msg,L["slagworks lost"]) or string.find(msg,L["slagworks lost2"])) then FrameTex01042:SetTexture(Ll.Icons.Blacksmith[1]);      
     elseif (string.find(msg,L["ironclad lost"]) or string.find(msg,L["ironclad lost2"])) then FrameTex01043:SetTexture(Ll.Icons.Towers[1]);
     else      
     end
     
--Horde    
  elseif (string.find(msg,L["Horde"])) then
     if (string.find(msg,L["warden captured2"]) or string.find(msg,L["warden captured"])) then FrameTex01041:SetTexture(Ll.Icons.Towers[5]);
     elseif (string.find(msg,L["slagworks captured"]) or string.find(msg,L["slagworks captured2"])) then FrameTex01042:SetTexture(Ll.Icons.Blacksmith[5]);
     elseif (string.find(msg,L["ironclad captured"]) or string.find(msg,L["ironclad captured2"])) then FrameTex01043:SetTexture(Ll.Icons.Towers[5]);       
     elseif (strmatch(msg,L["warden lost"]) or strmatch(msg,L["warden lost2"])) then FrameTex01041:SetTexture(Ll.Icons.Towers[1]);     
     elseif (string.find(msg,L["slagworks lost"]) or string.find(msg,L["slagworks lost2"])) then FrameTex01042:SetTexture(Ll.Icons.Blacksmith[1]);      
     elseif (string.find(msg,L["ironclad lost"]) or string.find(msg,L["ironclad lost2"])) then FrameTex01043:SetTexture(Ll.Icons.Towers[1]);         
     else
     end
end
end

if (event=="ZONE_CHANGED_NEW_AREA") then
  if (InBattleground(10) or InBattleground(11)) then
     Frame0100:Show();     
  else
     Frame0100:Hide();     
  end
end 
end
Frame0100:SetScript("OnEvent",Frame0100.OnEvent);

--------------------------------------------------------------------------Update
local function MainUpdate()

---Scale
Frame0100:SetScale(Ll.Scale[100]);

Frame0101:SetHeight(Ll.BarHeight[100]);
Frame0101:SetWidth(Ll.BarWidth[100]);

Frame0102:SetHeight(Ll.BarHeight[100]);
Frame0102:SetWidth(Ll.BarWidth[100]);

---Height/Width/Textures/Texts 1
local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[100]);
local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[101]);
local Hr1,Hg1,Hb1,Ha1 = unpack(Ll.Colors[102]);
local Hr2,Hg2,Hb2,Ha2 = unpack(Ll.Colors[103]);

if (Ll.AlwaysUp[1]==L["Horde Attack"]) then
FrameTex0101:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[100]],Hr1,Hg1,Hb1,Ha1,Hr2,Hg2,Hb2,Ha2);
else
FrameTex0101:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[100]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);
end

FrameTex0101:SetTexture(Ll.Textures[Ll.TextureKey[100]]);
FrameTex0101:SetHeight(Ll.TexHeight[100]);
FrameTex0101:SetWidth(Ll.TexWidth[100]);

FrameText0101:SetFont(Ll.Fonts[Ll.FontKey[100]],Ll.FontSize[100],Ll.FontOutline[Ll.FontOutlineKey[100]]);
if (Ll.AlwaysUp[1]~="") then
FrameText0101:SetText(Ll.AlwaysUp[1]);
end

---Height/Width/Textures/Texts 2
FrameText0102:SetFont(Ll.Fonts[Ll.FontKey[100]],Ll.FontSize[100],Ll.FontOutline[Ll.FontOutlineKey[100]]);
if (Ll.AlwaysUp[2]~="") then
FrameText0102:SetText(strmatch(Ll.AlwaysUp[2],"%d").." / 3");
end

---Height/Width/Textures/Texts 3
FrameText0103:SetFont(Ll.Fonts[Ll.FontKey[100]],Ll.FontSize[100],Ll.FontOutline[Ll.FontOutlineKey[100]]);
if (Ll.AlwaysUp[3]~="") then
FrameText0103:SetText(Ll.AlwaysUp[3]);
end
end
Frame0100:SetScript("OnUpdate",function() MainUpdate(); end);

------------------------------------------------------------------Move-functions
function MoveTolBaradIP()
if (Frame0100:IsVisible() and Frame0100:GetAlpha()==1) then
MoveFrame(100);
MoveFrame(101);
MoveFrame(102);
MoveFrame(103);
MoveFrame(104);
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
end
end

----------------------------------------------------------TolBarad-Under-Control
local Frame01000 = CreateFrame("Frame","Frame01000",UIParent);
Frame01000:RegisterEvent("ADDON_LOADED");
Frame01000:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame01000:SetHeight(70);
Frame01000:SetWidth(200);
Frame01000:RegisterForDrag("LeftButton");
local FrameTex01000 = Frame01000:CreateTexture("FrameTex01000");
FrameTex01000:SetPoint("CENTER",Frame01000,"CENTER",0,-1);

local Frame01001 = CreateFrame("Frame","Frame01001",Frame01000);
Frame01001:RegisterForDrag("LeftButton");
local FrameText01001 = Frame01001:CreateFontString("FrameText01001");
FrameText01001:SetPoint("CENTER",Frame01001,"CENTER",0,0);

local Frame01002 = CreateFrame("Frame","Frame01002",Frame01000);
Frame01002:RegisterForDrag("LeftButton");
local FrameText01002 = Frame01002:CreateFontString("FrameText01002");
FrameText01002:SetPoint("CENTER",Frame01002,"CENTER",0,0);

---------------------------------------------------------------------------Event
function Frame01000:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
   Frame01000:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame01000:SetBackdropColor(0,0,0,0);
   Frame01000:SetBackdropBorderColor(0,0,0,0);    
   
   FDragStart(1000);FDragStop(1000);
   FDragStart(1001);FDragStop(1000,1001);
   FDragStart(1002);FDragStop(1000,1002);   
   
   Frame01001:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame01002:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame01001:SetBackdropColor(0,0,0,0);Frame01001:SetBackdropBorderColor(0,0,0,0);
   Frame01002:SetBackdropColor(0,0,0,0);Frame01002:SetBackdropBorderColor(0,0,0,0);
   
   Frame01000:SetPoint(unpack(Ll.FramePos[1000]));
   Frame01001:SetPoint(unpack(Ll.FramePos[1001]));
   Frame01002:SetPoint(unpack(Ll.FramePos[1002]));
   
   Frame01001:SetHeight(19);Frame01001:SetWidth(135);
   Frame01002:SetHeight(19);Frame01002:SetWidth(135);       
   
   if (InBattleground(10) or InBattleground(11)) then
     Frame01000:Show();     
   else
     Frame01000:Hide();     
   end      
end
end

if (event=="ZONE_CHANGED_NEW_AREA") then
  if (InBattleground(10) or InBattleground(11)) then
     Frame01000:Show();     
  else
     Frame01000:Hide();     
  end
end
end
Frame01000:SetScript("OnEvent",Frame01000.OnEvent); 

--------------------------------------------------------------------------Update
local function MainUpdateUC(elapsed)

---Scale
Frame01000:SetScale(Ll.Scale[101]);

---Height/Width/Textures/Texts
FrameText01001:SetFont(Ll.Fonts[Ll.FontKey[101]],Ll.FontSize[101],Ll.FontOutline[Ll.FontOutlineKey[101]]);
if (Ll.AlwaysUp[1]~="") then
FrameText01001:SetText(Ll.AlwaysUp[1]);
end

FrameText01002:SetFont(Ll.Fonts[Ll.FontKey[101]],Ll.FontSize[101],Ll.FontOutline[Ll.FontOutlineKey[101]]);
if (Ll.AlwaysUp[2]~="") then
FrameText01002:SetText(Ll.AlwaysUp[2]);
end

local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[1000]);
local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[1001]);
local Hr1,Hg1,Hb1,Ha1 = unpack(Ll.Colors[1002]);
local Hr2,Hg2,Hb2,Ha2 = unpack(Ll.Colors[1003]);

if (Ll.AlwaysUp[1]==L["Control Alliance"]) then
FrameTex01000:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[101]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);
else
FrameTex01000:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[101]],Hr1,Hg1,Hb1,Ha1,Hr2,Hg2,Hb2,Ha2);
end

FrameTex01000:SetTexture(Ll.Textures[Ll.TextureKey[101]]);
FrameTex01000:SetHeight(Ll.TexHeight[101]);
FrameTex01000:SetWidth(Ll.TexWidth[101]);
end
Frame01000:SetScript("OnUpdate",function() MainUpdateUC(elapsed); end);

------------------------------------------------------------------Move-functions
function MoveTolBaradUC()
if (Frame01000:IsVisible() and Frame01000:GetAlpha()==1) then
MoveFrame(1000);
MoveFrame(1001);
MoveFrame(1002);
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now",0.5,0.5,0.9);
end
end

----------------------------------------------------------------------Visibility
local function Visib()

--Under Control
if (Ll.AlwaysUp[1]=="") then
   Frame01000:Hide();
elseif (IsTolBaradUC() and Ll.Active.Score==1 and Ll.Active.Addon==1) then
   Frame01000:Show();
else
   Frame01000:Hide();   
end


--Battle In Progress
if (Ll.AlwaysUp[1]=="" or IsTolBaradUC() or Ll.Active.Addon==0 or Ll.Active.Score==0 or not InBattleground(10) or not InBattleground(11)) then
   Frame0100:Hide();
else
   Frame0100:Show(); 
end


end
TolBarad:SetScript("OnUpdate",function() Visib(); end);