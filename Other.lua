-----------------------------------Other----------------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
--------------------------------------------------------------------------------

-------------------------------------------------------------------------BGStart
local ControlF = CreateFrame("Frame","ControlF",UIParent);

local Frame01 = CreateFrame("Frame","Frame01",UIParent);
Frame01:RegisterEvent("ADDON_LOADED");
Frame01:RegisterEvent("PLAYER_LOGOUT"); 
Frame01:RegisterEvent("PLAYER_ENTERING_WORLD");
Frame01:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame01:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL");
Frame01:SetHeight(25);
Frame01:SetWidth(25);
Frame01:RegisterForDrag("LeftButton");

local BgStartT = CreateFrame("Frame","BgStartT",Frame01);

local BgStartTTex = BgStartT:CreateTexture("BgStartTTex");
BgStartTTex:SetPoint("LEFT",BgStartT,"LEFT",2,0);

local Frame03 = CreateFrame("Frame","Frame03",Frame01);
Frame03:RegisterForDrag("LeftButton");
local FrameText03 = Frame03:CreateFontString("FrameText03");
FrameText03:SetPoint("CENTER",Frame03,"CENTER",0,0);

local Frame04 = CreateFrame("Frame","Frame04",Frame01);
Frame04:RegisterForDrag("LeftButton");
local FrameText04 = Frame04:CreateFontString("FrameText04");
FrameText04:SetPoint("CENTER",Frame04,"CENTER",0,0);

---------------------------------------------------------------------------Event
function Frame01:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then

   Frame01:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame01:SetBackdropColor(0,0,0,0);
   Frame01:SetBackdropBorderColor(0,0,0,0);
   
   Frame03:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame03:SetBackdropColor(0,0,0,0);
   Frame03:SetBackdropBorderColor(0,0,0,0);
   Frame03:SetHeight(15);
   Frame03:SetWidth(100);
   
   Frame04:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame04:SetBackdropColor(0,0,0,0);
   Frame04:SetBackdropBorderColor(0,0,0,0);
   Frame04:SetHeight(15);
   Frame04:SetWidth(50);
   
   FrameText03:SetFont(Ll.Fonts[Ll.FontKey[1]],Ll.FontSize[1],Ll.FontOutline[Ll.FontOutlineKey[1]]);
   BgStartT:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   
   FDragStart(1);FDragStop(1);
   FDragStart(3);FDragStop(1,3);
   FDragStart(4);FDragStop(1,4);   
   
   Frame01:SetPoint(unpack(Ll.FramePos[1]));
   Frame03:SetPoint(unpack(Ll.FramePos[3]));
   Frame04:SetPoint(unpack(Ll.FramePos[4]));
   BgStartT:SetPoint(unpack(Ll.FramePos[2]));

end
end

if (event=="ZONE_CHANGED_NEW_AREA" or event=="PLAYER_ENTERING_WORLD") then
local Zone=GetRealZoneText();
--Ll.BGtimer[1]=-1;
        if (Zone==L["Arathi Basin"]) then
          FrameText03:SetText(L["Arathi Basin START"]);        
        elseif (Zone==L["Alterac Valley"]) then
          FrameText03:SetText(L["Alterac Valley START"]);           
        elseif (Zone==L["Eye of the Storm"]) then
          FrameText03:SetText(L["Eye of the Storm START"]);            
        elseif (Zone==L["Isle of Conquest"]) then
          FrameText03:SetText(L["Isle of Conquest START"]);          
        elseif (Zone==L["Strand of the Ancients"]) then
          FrameText03:SetText(L["Strand of the Ancients START"]);               
        elseif (Zone==L["Warsong Gulch"]) then
          FrameText03:SetText(L["Warsong Gulch START"]);          
        elseif (Zone==L["Battle for Gilneas"]) then
          FrameText03:SetText(L["Gilneas START"]);
        elseif (Zone==L["Twin Peaks"]) then
          FrameText03:SetText(L["Twin START"]);
        else
          FrameText03:SetText(L["Battle Begins"]);        
        end
end

if (event=="CHAT_MSG_BG_SYSTEM_NEUTRAL") then
   local arg1=...;
   arb=arg1;
             if (string.find(arb,L["1 minute"]) or string.find(arb,L["60 second"])) then Ll.BGtimer[1]=60;
             elseif (string.find(arb,L["30 second"])) then Ll.BGtimer[1]=30;
             elseif (string.find(arb,L["15 second"])) then Ll.BGtimer[1]=15;
             end             
end 
end
Frame01:SetScript("OnEvent",Frame01.OnEvent);

--------------------------------------------------------------------------Update
function Frame01:OnUpdate(elapsed)
  local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[1]);
  local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[2]);
  local Ar3,Ag3,Ab3,Aa3 = unpack(Ll.Colors[3]);
  local Ar4,Ag4,Ab4,Aa4 = unpack(Ll.Colors[4]);
  
  Frame01:SetScale(Ll.Scale[1]);
  
  BgStartT:SetHeight(Ll.BarHeight[1]);
  BgStartT:SetWidth(Ll.BarWidth[1]);
  BgStartT:SetBackdropColor(Ar3,Ag3,Ab3,Aa3);
  BgStartT:SetBackdropBorderColor(Ar4,Ag4,Ab4,Aa4);
  
  BgStartTTex:SetTexture(Ll.Textures[Ll.TextureKey[1]]);
  BgStartTTex:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[1]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);
  BgStartTTex:SetHeight(Ll.TexHeight[1]);
  BgStartTTex:SetPoint("LEFT",BgStartT,"LEFT",2,Ll.TexYofs[1]);
  BgStartTTex:SetWidth(BgStartT:GetWidth());
  
  FrameText03:SetFont(Ll.Fonts[Ll.FontKey[1]],Ll.FontSize[1],Ll.FontOutline[Ll.FontOutlineKey[1]]);
  FrameText04:SetFont(Ll.Fonts[Ll.FontKey[1]],Ll.FontSize[1],Ll.FontOutline[Ll.FontOutlineKey[1]]);  
  
  Ll.BGtimer[1]=Ll.BGtimer[1]-elapsed;
  FrameText04:SetText(SecondsToTime(Ll.BGtimer[1]));
  BgStartTTex:SetWidth((BgStartT:GetWidth()/60)*Ll.BGtimer[1]-2);  
end
Frame01:SetScript("OnUpdate",Frame01.OnUpdate);

----------------------------------------------------------------------CaptureBar
local Frame05 = CreateFrame("Frame","Frame05",UIParent);
Frame05:RegisterEvent("PLAYER_ENTERING_WORLD");
Frame05:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame05:RegisterEvent("ADDON_LOADED");
Frame05:RegisterEvent("PLAYER_LOGOUT");
Frame05:RegisterForDrag("LeftButton");
Frame05:SetHeight(40);
Frame05:SetWidth(180);

local Frame06 = CreateFrame("Frame","Frame06",Frame05)
Frame06:SetPoint("CENTER","Frame05","CENTER",0,0);

local FrameTex060 = Frame06:CreateTexture("FrameTex060","BORDER");
FrameTex060:SetHeight(8);
FrameTex060:SetWidth(61);
local FrameTex061 = Frame06:CreateTexture("FrameTex061","BORDER");
FrameTex061:SetHeight(8);
FrameTex061:SetWidth(61);
local FrameTex062 = Frame06:CreateTexture("FrameTex062","ARTWORK");
FrameTex062:SetHeight(8);
local FrameTex063 = Frame06:CreateTexture("FrameTex063","ARTWORK");
FrameTex063:SetHeight(8);
FrameTex063:SetWidth(1.5);
local FrameTex064 = Frame06:CreateTexture("FrameTex064","ARTWORK");
FrameTex064:SetHeight(8);
FrameTex064:SetWidth(1.5);
local FrameTex065 = Frame06:CreateTexture("FrameTex065","OVERLAY");
FrameTex065:SetHeight(11);
FrameTex065:SetWidth(8);

local Frame07 = CreateFrame("Frame","Frame07",Frame06);
Frame07:SetPoint("CENTER","Frame06","CENTER",-75,0);
Frame07:SetHeight(18);
Frame07:SetWidth(18);
Frame07:SetAlpha(0);
local FrameTex070 = Frame07:CreateTexture("FrameTex070","ARTWORK");
FrameTex070:SetPoint("CENTER",Frame07,0,0)
FrameTex070:SetHeight(20);
FrameTex070:SetWidth(20);

local Frame08 = CreateFrame("Frame","Frame08",Frame06);
Frame08:SetPoint("CENTER",Frame06,"CENTER",75,0);
Frame08:SetHeight(18);
Frame08:SetWidth(18);
Frame08:SetAlpha(0);
local FrameTex080 = Frame08:CreateTexture("FrameTex080","ARTWORK");
FrameTex080:SetPoint("CENTER",Frame08,0,0)
FrameTex080:SetHeight(20);
FrameTex080:SetWidth(20);

---------------------------------------------------------------------------Event
function Frame05:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then

   Frame05:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame05:SetBackdropColor(0,0,0,0);
   Frame05:SetBackdropBorderColor(0,0,0,0);
   
   Frame06:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame06:SetBackdropColor(0.2,0.2,0.2,0.5);
   Frame06:SetBackdropBorderColor(0.6,0.6,0.6,1);
   Frame06:SetHeight(12);
   Frame06:SetWidth(124);
   
   Frame07:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame07:SetBackdropColor(0.2,0.2,0.2,0.5);
   Frame07:SetBackdropBorderColor(0.9,0.9,0.9,1);
   
   Frame08:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
   Frame08:SetBackdropColor(0.2,0.2,0.2,0.5);
   Frame08:SetBackdropBorderColor(0.9,0.9,0.9,1);
   
   FrameTex060:SetTexture(Ll.Textures[1]);
   FrameTex060:SetGradientAlpha("HORIZONTAL", 51/255,102/255,204/255, 1, 82/255,100/255,139/255, 1);
   FrameTex060:SetPoint("LEFT",Frame06,1,0);
   
   FrameTex061:SetTexture(Ll.Textures[1]);
   FrameTex061:SetGradientAlpha("HORIZONTAL", 204/255, 0, 0, 0.8, 170/255,0/255, 0/255, 0.8);
   FrameTex061:SetPoint("RIGHT",Frame06,-1,0);
   
   FrameTex062:SetTexture(Ll.Textures[1]);
   FrameTex062:SetGradientAlpha("VERTICAL",193/255,193/255,193/255,1,132/255,132/255,132/255,1);
   FrameTex062:SetPoint("CENTER",Frame06,0,0);
   
   FrameTex063:SetTexture(Ll.Textures[1]);
   FrameTex063:SetGradientAlpha("HORIZONTAL",0.1,0.1,0.1,1,0.1,0.1,0.1,1);
   
   FrameTex064:SetTexture(Ll.Textures[1]);
   FrameTex064:SetGradientAlpha("HORIZONTAL",0.1,0.1,0.1,1,0.1,0.1,0.1,1);
   
   FrameTex065:SetGradientAlpha("HORIZONTAL",0/255,0/255,0/255,1,140/255,140/255,140/255,1);
   FrameTex065:SetTexture(Ll.CaptureBar[1]);
   
   FrameTex070:SetTexture("Interface\\AddOns\\LLPvpState\\Texture\\allianceicon.tga");
   FrameTex080:SetTexture("Interface\\AddOns\\LLPvpState\\Texture\\hordeicon.tga");  
   
   FDragStart(5);FDragStop(5);
      
   Frame05:SetPoint(unpack(Ll.FramePos[5]));
   
end
end

if (event=="PLAYER_ENTERING_WORLD" or event=="ZONE_CHANGED_NEW_AREA") then
  IsCbarVisible();
end

end
Frame05:SetScript("OnEvent",Frame05.OnEvent);

--------------------------------------------------------------------------Update
function Frame06:OnUpdate()
Frame05:SetScale(Ll.Scale[2]);
if (WorldStateCaptureBar1) then
   if (WorldStateCaptureBar1:IsVisible()==1) then
      Frame06:SetAlpha(1);
      WorldStateCaptureBar1:SetAlpha(0);
      local w = WorldStateCaptureBar1MiddleBar:GetWidth();
      local z1,z2,z3,z4,z5 = WorldStateCaptureBar1Indicator:GetPoint();
      
      FrameTex062:SetWidth(w);
      FrameTex064:SetPoint("CENTER",Frame06,((-1)*(w/2))-0.5,0);
      FrameTex063:SetPoint("CENTER",(w/2)+0.5,0);
      FrameTex065:SetPoint(z1,Frame06,z3,z4-25,z5);
    if (WorldStateCaptureBar1LeftIconHighlight:IsVisible()==1) then
      Frame07:SetAlpha(1);    
    else
      Frame07:SetAlpha(0.4); 
    end
    if (WorldStateCaptureBar1RightIconHighlight:IsVisible()==1) then
      Frame08:SetAlpha(1);    
    else
      Frame08:SetAlpha(0.4);
    end    
   else
    Frame06:SetAlpha(0);
  end
else
Frame06:SetAlpha(0);
end
end
Frame06:SetScript("OnUpdate", Frame06.OnUpdate);

----------------------------------------------------------------------WALLHEALTH
local WallHealth = CreateFrame("Frame","WallHealth",UIParent);
WallHealth:RegisterEvent("PLAYER_ENTERING_WORLD");
WallHealth:RegisterEvent("ZONE_CHANGED_NEW_AREA");
WallHealth:RegisterEvent("ADDON_LOADED");
local WallHealthText = GameTooltipStatusBar:CreateFontString(WallHealthText);
WallHealthText:SetPoint("CENTER",GameTooltipStatusBar,"CENTER",0,0);

---------------------------------------------------------------------------Event
function WallHealth:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
WallHealthText:SetFont(Ll.Fonts[Ll.FontKey[2]],13,"OUTLINE");
end
end

if (event=="PLAYER_ENTERING_WORLD" or event=="ZONE_CHANGED_NEW_AREA") then
local o=GetRealZoneText();
WallHealthText:SetText("");     
if (o==L["Wintergrasp"] or o==L["Isle of Conquest"] or o==L["Strand of the Ancients"] or o==L["Ulduar"]) then
if (Ll.Active.Wall==1) then
WallHealth:Show();
end
else
WallHealth:Hide();
end
end
end
WallHealth:SetScript("OnEvent",WallHealth.OnEvent);

--------------------------------------------------------------------------Update
function WallHealth:OnUpdate()
if (GameTooltip:IsVisible()) then
local a,b = GameTooltipStatusBar:GetMinMaxValues()
local k = GameTooltipStatusBar:GetValue();

local GateHealth =_G["GameTooltipTextLeft"..1];
local text=GateHealth:GetText();

if (text==L["Wgrasp FortTower"] or text==L["GobWorkshop"] or text==L["Wgrasp FortDoor"] or text==L["Wgrasp FortWall"] or text==L["Wgrasp Wall"] or text==L["Wgrasp FortGate"] or 
text==L["Shadow tower"] or text==L["WE tower"] or text==L["FW tower"] or text==L["Gate Blue"] or text==L["Gate Green"] or text==L["Gate Purple"] or text==L["Gate Red"] or 
text==L["Gate Yellow"] or text==L["reliq chamber"] or text==L["Alliance Gate"] or text==L["Horde Gate"] or text==L["Uldu TowerStorm"] or text==L["Uldu TowerFrost"] or 
text==L["Uldu Towerflam"] or text==L["Uldu TowerNat"]) then
local p = string.format("%s%s",strsub(tostring((k/b)*100),1,5),"%");
 
 
 if ((k/b)*100<=75 and (k/b)*100>=35) then
 GameTooltipStatusBarTexture:SetGradientAlpha("HORIZONTAL",205/255,133/255,0,1,255/255,165/255,0,1);
 elseif ((k/b)*100<35) then
 GameTooltipStatusBarTexture:SetGradientAlpha("HORIZONTAL",255/255,0,0,1,205/255,0,0,1); 
 end

if (GameTooltip:NumLines()==2) then
      GameTooltipTextRight2:SetText(p);
        if (text==L["Gate Blue"] or text==L["Gate Green"] or text==L["Gate Purple"] or text==L["Gate Red"] or 
text==L["Gate Yellow"] or text==L["reliq chamber"]) then
      WallHealthText:SetText(string.format("%d%s",k*10990," / 10990"));
      WallHealthText:SetFont(Ll.Fonts[Ll.FontKey[2]],13,"OUTLINE");
        elseif (text==L["Alliance Gate"] or text==L["Horde Gate"]) then
      WallHealthText:SetText(string.format("%d%s",k*626950," / 626950"));
      WallHealthText:SetFont(Ll.Fonts[Ll.FontKey[2]],12,"OUTLINE");
        elseif (text==L["Wgrasp FortTower"] or text==L["Wgrasp FortWall"] or text==L["Wgrasp Wall"] or 
text==L["Wgrasp FortGate"]) then
      WallHealthText:SetText(string.format("%d%s",k*90000," / 90000"));
      WallHealthText:SetFont(Ll.Fonts[Ll.FontKey[2]],13,"OUTLINE");  
        else
      WallHealthText:SetText("");          
        end            
 elseif (GameTooltip:NumLines()==1) then
      GameTooltip:AddDoubleLine(" ",p,1,0,0,1,1,1);
      GameTooltip:Show();
 end
 
 if (k==0) then
   WallHealthText:SetFont(Ll.Fonts[Ll.FontKey[2]],13,"OUTLINE");
   WallHealthText:SetText("");  
 end
 
end
end
if (GameTooltip:NumLines()>2) then 
      WallHealthText:SetFont(Ll.Fonts[Ll.FontKey[2]],13,"OUTLINE");     
      WallHealthText:SetText("");
end
end 
WallHealth:SetScript("OnUpdate",WallHealth.OnUpdate);

----------------------------------------------------------------------Visibility
local function Control()
if (Ll.Active.Addon==1 and Ll.Active.Timer60==1) then
   if InPrepa() or InBg() then
     if (Ll.BGtimer[1]<0) then
       Frame01:SetAlpha(0);
     else
       Frame01:SetAlpha(1);
     end
   end
   
   if (InBg() and InPrepa()) then
     Frame01:Show();
   elseif (Ll.Test.Timer60==1) then
     Frame01:Show();   
   else
     Frame01:Hide();
   end   
else
  Frame01:Hide();
end

if Ll.Active.CaptureBar==0 or Ll.Active.Addon==0 then
 if (WorldStateCaptureBar1) then
  WorldStateCaptureBar1:SetAlpha(1);
 else
 end
  Frame06:Hide();
  Frame05:Hide();    
else
  IsCbarVisible();
  Frame06:Show();
end

if (Ll.Active.Wall==0 or Ll.Active.Addon==0) then
    WallHealth:Hide();
    WallHealthText:SetText("");
else
    WallHealth:Show();
end  
end
ControlF:SetScript("OnUpdate",function() Control(); end);

------------------------------------------------------Timers-Move-Test-functions
function TestTimer60()
if (Ll.Active.Timer60==0 or Ll.Active.Addon==0) then
   ChatFrame1:AddMessage("[LLPvpState] : not active",0.5,0.5,0.9);
else
if (InPrepa()) then
 if (Ll.BGtimer[1]<0) then
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now",0.5,0.5,0.9);
 else   
   MoveFrame(1);
   MoveFrame(3);
   MoveFrame(4);
 end
else
  if (Ll.Test.Timer60==1) then
   Frame01:SetAlpha(0);
   Ll.BGtimer[1] = -1;   
   Ll.Test.Timer60=0;
  else
   Frame01:SetAlpha(1);
   Ll.Test.Timer60=1;
   Ll.BGtimer[1] = 60;      
  end 
   MoveFrame(1);
   MoveFrame(3);
   MoveFrame(4);  
end
end
end

-------------------------------------------------------Capture-Bar-Move-function
function MoveCaptureBar()
if (Ll.Active.CaptureBar==0 or Ll.Active.Addon==0) then
   ChatFrame1:AddMessage("[LLPvpState] : not active.",0.5,0.5,0.9);
elseif (Frame05:IsVisible() and Frame06:GetAlpha()==1) then
   MoveFrame(5);
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9); 
end
end
