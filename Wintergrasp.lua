--------------------------------WINTERGRASP-------------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
----------------------------------------------------Wintergrasp-BattleInProgress
local Winter = CreateFrame("Frame","Winter",UIParent);
--------------------------------------------------------------------------------
local Frame090 = CreateFrame("Frame","Frame090",UIParent);
Frame090:RegisterEvent("ADDON_LOADED");
Frame090:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame090:SetHeight(70);
Frame090:SetWidth(200);
Frame090:RegisterForDrag("LeftButton");

local Frame091 = CreateFrame("Frame","Frame091",Frame090);
Frame091:RegisterForDrag("LeftButton");
local FrameTex091 = Frame091:CreateTexture("FrameTex091");
local FrameText091 = Frame091:CreateFontString("FrameText091");
FrameText091:SetPoint("CENTER",Frame091,"CENTER",0,0);

local Frame092 = CreateFrame("Frame","Frame092",Frame090);
Frame092:RegisterForDrag("LeftButton");
local FrameTex092 = Frame092:CreateTexture("FrameTex092");
local FrameText092 = Frame092:CreateFontString("FrameText092");
FrameText092:SetPoint("CENTER",Frame092,"CENTER",0,0);

local Frame093 = CreateFrame("Frame","Frame093",Frame090);
Frame093:RegisterForDrag("LeftButton");
Frame093:SetHeight(15);
Frame093:SetWidth(120);
local FrameText093 = Frame093:CreateFontString("FrameText093");
FrameText093:SetPoint("CENTER",Frame093,"CENTER",0,0);

---------------------------------------------------------------------------Event
function Frame090:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
   Frame090:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame090:SetBackdropColor(0,0,0,0);
   Frame090:SetBackdropBorderColor(0,0,0,0);
   
   Frame091:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame092:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});   
   
   FDragStart(90);FDragStop(90);
   FDragStart(91);FDragStop(90,91);
   FDragStart(92);FDragStop(90,92);   
   FDragStart(93);FDragStop(90,93);   
   
   Frame090:SetPoint(unpack(Ll.FramePos[90]));
   Frame091:SetPoint(unpack(Ll.FramePos[91]));
   Frame092:SetPoint(unpack(Ll.FramePos[92]));
   Frame093:SetPoint(unpack(Ll.FramePos[93]));
   
  
   if (InBattleground(9)) then
     Frame090:Show();     
   else
     Frame090:Hide();     
   end      
end
end

if (event=="ZONE_CHANGED_NEW_AREA") then
  if (InBattleground(9)) then
     Frame090:Show();     
  else
     Frame090:Hide();     
  end
end 
end
Frame090:SetScript("OnEvent",Frame090.OnEvent);

--------------------------------------------------------------------------Update
local function MainUpdate()

---Scale
Frame090:SetScale(Ll.Scale[90]);

---Height/Width/Textures/Texts 1
local Bdr,Bdg,Bdb,Bda = unpack(Ll.Colors[96]);
local BBdr,BBdg,BBdb,BBda = unpack(Ll.Colors[97]);
Frame091:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame091:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame091:SetHeight(Ll.BarHeight[90]);
Frame091:SetWidth(Ll.BarWidth[90]);

FrameTex091:SetTexture(Ll.Textures[Ll.TextureKey[90]]);
FrameTex091:SetPoint("CENTER",Frame091,"CENTER",Ll.TexXofs[90],Ll.TexYofs[90]);
FrameTex091:SetHeight(Ll.TexHeight[90]);
FrameTex091:SetWidth(Ll.TexWidth[90]);

local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[90]);
local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[91]);
FrameTex091:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[90]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);

FrameText091:SetFont(Ll.Fonts[Ll.FontKey[90]],Ll.FontSize[90],Ll.FontOutline[Ll.FontOutlineKey[90]]);
if (Ll.AlwaysUp[1]~="") then
FrameText091:SetText(Ll.AlwaysUp[2]);
end

---Height/Width/Textures/Texts 2
Frame092:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame092:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame092:SetHeight(Ll.BarHeight[90]);
Frame092:SetWidth(Ll.BarWidth[90]);

FrameTex092:SetTexture(Ll.Textures[Ll.TextureKey[90]]);
FrameTex092:SetPoint("CENTER",Frame092,"CENTER",Ll.TexXofs[90],Ll.TexYofs[90]);
FrameTex092:SetHeight(Ll.TexHeight[90]);
FrameTex092:SetWidth(Ll.TexWidth[90]);

local Hr1,Hg1,Hb1,Ha1 = unpack(Ll.Colors[92]);
local Hr2,Hg2,Hb2,Ha2 = unpack(Ll.Colors[93]);
FrameTex092:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[90]],Hr1,Hg1,Hb1,Ha1,Hr2,Hg2,Hb2,Ha2);

FrameText092:SetFont(Ll.Fonts[Ll.FontKey[90]],Ll.FontSize[90],Ll.FontOutline[Ll.FontOutlineKey[90]]);
if (Ll.AlwaysUp[2]~="") then
FrameText092:SetText(Ll.AlwaysUp[1]);
end

---Height/Width/Textures/Texts 3
FrameText093:SetFont(Ll.Fonts[Ll.FontKey[90]],Ll.FontSize[90],Ll.FontOutline[Ll.FontOutlineKey[90]]);
if (Ll.AlwaysUp[3]~="") then
FrameText093:SetText(Ll.AlwaysUp[3]);
end
end
Frame090:SetScript("OnUpdate",function() MainUpdate(); end);

------------------------------------------------------------------Move-functions
function MoveWgraspIP()
if (Frame090:IsVisible() and Frame090:GetAlpha()==1) then
MoveFrame(90);
MoveFrame(91,91);
MoveFrame(92,92);
MoveFrame(93);
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
end
end

-------------------------------------------------------Wintergrasp-Under-Control
local Frame0900 = CreateFrame("Frame","Frame0900",UIParent);
Frame0900:RegisterEvent("ADDON_LOADED");
Frame0900:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame0900:SetHeight(70);
Frame0900:SetWidth(200);
Frame0900:RegisterForDrag("LeftButton");
local FrameTex0900 = Frame0900:CreateTexture("FrameTex0900");
FrameTex0900:SetPoint("CENTER",Frame0900,"CENTER",0,-1);

local Frame0901 = CreateFrame("Frame","Frame0901",Frame0900);
Frame0901:RegisterForDrag("LeftButton");
local FrameText0901 = Frame0901:CreateFontString("FrameText0901");
FrameText0901:SetPoint("CENTER",Frame0901,"CENTER",0,0);

local Frame0902 = CreateFrame("Frame","Frame0902",Frame0900);
Frame0902:RegisterForDrag("LeftButton");
local FrameText0902 = Frame0902:CreateFontString("FrameText0902");
FrameText0902:SetPoint("CENTER",Frame0902,"CENTER",0,0);

---------------------------------------------------------------------------Event
function Frame0900:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
   Frame0900:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame0900:SetBackdropColor(0,0,0,0);
   Frame0900:SetBackdropBorderColor(0,0,0,0);    
   
   FDragStart(900);FDragStop(900);
   FDragStart(901);FDragStop(900,901);
   FDragStart(902);FDragStop(900,902);   
   
   Frame0901:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame0902:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame0901:SetBackdropColor(0,0,0,0);Frame0901:SetBackdropBorderColor(0,0,0,0);
   Frame0902:SetBackdropColor(0,0,0,0);Frame0902:SetBackdropBorderColor(0,0,0,0);
   
   Frame0900:SetPoint(unpack(Ll.FramePos[900]));
   Frame0901:SetPoint(unpack(Ll.FramePos[901]));
   Frame0902:SetPoint(unpack(Ll.FramePos[902]));
   
   Frame0901:SetHeight(19);
   Frame0901:SetWidth(135);
   Frame0902:SetHeight(19);
   Frame0902:SetWidth(135);   
   
   if (InBattleground(9)) then
     Frame0900:Show();     
   else
     Frame0900:Hide();     
   end      
end
end

if (event=="ZONE_CHANGED_NEW_AREA") then
  if (InBattleground(9)) then
     Frame0900:Show();     
  else
     Frame0900:Hide();     
  end
end
end
Frame0900:SetScript("OnEvent",Frame0900.OnEvent);

--------------------------------------------------------------------------Update
local function MainUpdateUC(elapsed)

---Scale
Frame0900:SetScale(Ll.Scale[91]);

---Height/Width/Textures/Texts
FrameText0901:SetFont(Ll.Fonts[Ll.FontKey[91]],Ll.FontSize[91],Ll.FontOutline[Ll.FontOutlineKey[91]]);
if (Ll.AlwaysUp[1]~="") then
FrameText0901:SetText(Ll.AlwaysUp[1]);
end

FrameText0902:SetFont(Ll.Fonts[Ll.FontKey[91]],Ll.FontSize[91],Ll.FontOutline[Ll.FontOutlineKey[91]]);
if (Ll.AlwaysUp[2]~="") then
FrameText0902:SetText(Ll.AlwaysUp[2]);
end

local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[900]);
local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[901]);
local Hr1,Hg1,Hb1,Ha1 = unpack(Ll.Colors[902]);
local Hr2,Hg2,Hb2,Ha2 = unpack(Ll.Colors[903]);

if (Ll.AlwaysUp[1]==L["Alliance Controlled"]) then
FrameTex0900:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[91]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);
else
FrameTex0900:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[91]],Hr1,Hg1,Hb1,Ha1,Hr2,Hg2,Hb2,Ha2);
end

FrameTex0900:SetTexture(Ll.Textures[Ll.TextureKey[91]]);
FrameTex0900:SetHeight(Ll.TexHeight[91]);
FrameTex0900:SetWidth(Ll.TexWidth[91]);
end
Frame0900:SetScript("OnUpdate",function() MainUpdateUC(elapsed); end);

------------------------------------------------------------------Move-functions
function MoveWgraspUC()
if (Frame0900:IsVisible() and Frame0900:GetAlpha()==1) then
MoveFrame(900);
MoveFrame(901);
MoveFrame(902);
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
end
end

---------------------------------------------------------Wintergrasp-Next-Battle
local Frame0950 = CreateFrame("FRAME","Frame0950",UIParent);
Frame0950:RegisterEvent("ADDON_LOADED");
Frame0950:RegisterEvent("PLAYER_ENTERING_WORLD");
Frame0950:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame0950:RegisterForDrag("LeftButton");

local FrameText0950 = Frame0950:CreateFontString("FrameText0950"); 
FrameText0950:SetPoint("CENTER",Frame0950,"CENTER",0,0);

local FrameTex0950 = Frame0950:CreateTexture("FrameTex0950");
FrameTex0950:SetPoint("LEFT",Frame0950,"LEFT",0,-8);

---------------------------------------------------------------------------Event
function Frame0950:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
   Frame0950:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame0950:SetHeight(20);
   Frame0950:SetWidth(150);
   Frame0950:SetBackdropColor(0,0,0,0);
   Frame0950:SetBackdropBorderColor(0,0,0,0);
   Frame0950:SetPoint(unpack(Ll.FramePos[950]));
   FDragStart(950);FDragStop(950);
   
   FrameText0950:SetFont(Ll.Fonts[2],12,Ll.FontOutline[1]);
   
   FrameTex0950:SetTexture(Ll.Textures[1]);
   FrameTex0950:SetGradientAlpha(Ll.TexGradient[1],0.1,0.1,0.1,0.8,0.3,0.3,0.3,0.8);
   FrameTex0950:SetHeight(15);
   
end
end 
end
Frame0950:SetScript("OnEvent",Frame0950.OnEvent);

--------------------------------------------------------------------------Update
local function WUpdate(elapsed)
Frame0950:SetScale(Ll.Scale[92]);
  Frame0950:SetAlpha(1);
  local inInstance, instanceType = IsInInstance();  
  if (GetWintergraspWaitTime() and not inInstance) then
      if (GetWintergraspWaitTime()>60) then
         local T = SecondsToTime(GetWintergraspWaitTime(),true);  
    	   FrameText0950:SetText(strjoin(" : ",L["Wintergrasp"],T));
      else
         local T = SecondsToTime(GetWintergraspWaitTime());  
    	   FrameText0950:SetText(strjoin(" : ",L["Wintergrasp"],T));
      end        	
  elseif (not inInstance and not GetWintergraspWaitTime()) then 	
    	FrameText0950:SetText(L["Battle in progress"]);    
  elseif (inInstance) then   
    	FrameText0950:SetText(L["Timer unavailable"]);    	
  end
     if (GetWintergraspWaitTime()) then
     FrameTex0950:SetWidth(150*GetWintergraspWaitTime()/8400);
     else 
     FrameTex0950:SetWidth(0.001);
     end
end
Frame0950:SetScript("OnUpdate",function() WUpdate(elapsed); end);

----------------------------------------------------------------------Visibility
local function Visib()

--Next Battle
if (Ll.WgWaitTime[1] == 0 or Ll.Active.Addon == 0) then
  Frame0950:Hide();
else
  Frame0950:Show();
end


--Under Control
if (Ll.AlwaysUp[1]=="") then
   Frame0900:Hide();
elseif (IsWgraspUC() and Ll.Active.Score==1 and Ll.Active.Addon==1) then
   Frame0900:Show();
else
   Frame0900:Hide();   
end


--Battle In Progress
if (Ll.AlwaysUp[1]=="" or IsWgraspUC() or Ll.Active.Addon==0 or Ll.Active.Score==0 or not InBattleground(9)) then
   Frame090:Hide();
else
   Frame090:Show(); 
end


end
Winter:SetScript("OnUpdate",function() Visib(); end);


------------------------------------------------------------------Move-functions
function MoveWgraspNB()
if (Frame0950:IsVisible() and Frame0950:GetAlpha()==1) then
MoveFrame(950);
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
end
end 


