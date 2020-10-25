---------------------------Strand-Of-The-Ancients-------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
--------------------------------------------------------------------------------
---MainFrame
local Frame050 = CreateFrame("Frame","Frame050",UIParent);
Frame050:RegisterEvent("ADDON_LOADED");
Frame050:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame050:RegisterEvent("CHAT_MSG_BG_SYSTEM_ALLIANCE");
Frame050:RegisterEvent("CHAT_MSG_BG_SYSTEM_HORDE");
Frame050:RegisterEvent("UPDATE_BATTLEFIELD_SCORE");
Frame050:SetHeight(70);
Frame050:SetWidth(200);
Frame050:RegisterForDrag("LeftButton");

---Score Bars
local Frame051 = CreateFrame("Frame","Frame051",Frame050);
Frame051:RegisterForDrag("LeftButton");
local FrameTex051 = Frame051:CreateTexture("FrameTex051");

local Frame052 = CreateFrame("Frame","Frame052",Frame050);
Frame052:RegisterForDrag("LeftButton");
local FrameTex052 = Frame052:CreateTexture("FrameTex052");

---Score text
local Frame053 = CreateFrame("Frame","Frame053",Frame050);
Frame053:RegisterForDrag("LeftButton");
Frame053:SetHeight(15);
Frame053:SetWidth(70);
local FrameText053 = Frame053:CreateFontString("FrameText053");
FrameText053:SetPoint("CENTER",Frame053,"CENTER",0,0);

local Frame054 = CreateFrame("Frame","Frame054",Frame050);
Frame054:RegisterForDrag("LeftButton");
Frame054:SetHeight(15);
Frame054:SetWidth(70);
local FrameText054 = Frame054:CreateFontString("FrameText054");
FrameText054:SetPoint("CENTER",Frame054,"CENTER",0,0);

local Frame055 = CreateFrame("Frame","Frame055",Frame050);
Frame055:RegisterForDrag("LeftButton");
Frame055:SetHeight(15);
Frame055:SetWidth(70);
local FrameText055 = Frame055:CreateFontString("FrameText055");
FrameText055:SetPoint("CENTER",Frame055,"CENTER",0,0);

---------------------------------------------------------------------------Event
function Frame050:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
      Frame050:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame050:SetBackdropColor(0,0,0,0);
      Frame050:SetBackdropBorderColor(0,0,0,0);
      
      Frame051:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame052:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      
      Frame053:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame053:SetBackdropColor(0,0,0,0);
      Frame053:SetBackdropBorderColor(0,0,0,0);
      
      Frame054:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame054:SetBackdropColor(0,0,0,0);
      Frame054:SetBackdropBorderColor(0,0,0,0);
      
      Frame055:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame055:SetBackdropColor(0,0,0,0);
      Frame055:SetBackdropBorderColor(0,0,0,0);
               
   FDragStart(50);FDragStop(50);
   FDragStart(51);FDragStop(50,51);
   FDragStart(52);FDragStop(50,52);   
   FDragStart(53);FDragStop(50,53);
   FDragStart(54);FDragStop(50,54);
   FDragStart(55);FDragStop(50,55);   
   
   
   Frame050:SetPoint(unpack(Ll.FramePos[50]));
   Frame051:SetPoint(unpack(Ll.FramePos[51]));
   Frame052:SetPoint(unpack(Ll.FramePos[52]));
   Frame053:SetPoint(unpack(Ll.FramePos[53]));
   Frame054:SetPoint(unpack(Ll.FramePos[54]));
   Frame055:SetPoint(unpack(Ll.FramePos[55]));
           
   if (InBattleground(5)) then
     Frame050:Show();     
   else
     Frame050:Hide();     
   end      
end
end 

if (event=="UPDATE_BATTLEFIELD_SCORE") then
RequestBattlefieldScoreData();
end

if (event=="ZONE_CHANGED_NEW_AREA") then

  if (InBattleground(5)) then
     Frame050:Show();     
  else     
     Frame050:Hide();     
  end
end 
end
Frame050:SetScript("OnEvent",Frame050.OnEvent);

--------------------------------------------------------------------------Update
local function MainUpdate()

---Visibility
if (InPrepa() or Ll.Active.Score==0 or Ll.Active.Addon==0) then
  Frame050:SetAlpha(0);
else
  Frame050:SetAlpha(1);
end 

---Scale
Frame050:SetScale(Ll.Scale[50]);

---Height/Width/Textures/Texts 1
local Bdr,Bdg,Bdb,Bda = unpack(Ll.Colors[56]);
local BBdr,BBdg,BBdb,BBda = unpack(Ll.Colors[57]); 
Frame051:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame051:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame051:SetHeight(Ll.BarHeight[50]);
Frame051:SetWidth(Ll.BarWidth[50]);

FrameTex051:SetTexture(Ll.Textures[Ll.TextureKey[50]]);
FrameTex051:SetPoint("CENTER",Frame051,"CENTER",Ll.TexXofs[50],Ll.TexYofs[50]);
FrameTex051:SetHeight(Ll.TexHeight[50]);
FrameTex051:SetWidth(Ll.TexWidth[50]);

local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[50]);
local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[51]);
FrameTex051:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[50]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);

---Height/Width/Textures/Texts 2
Frame052:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame052:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame052:SetHeight(Ll.BarHeight[50]);
Frame052:SetWidth(Ll.BarWidth[50]);

FrameTex052:SetTexture(Ll.Textures[Ll.TextureKey[50]]);
FrameTex052:SetPoint("CENTER",Frame052,"CENTER",Ll.TexXofs[50],Ll.TexYofs[50]);
FrameTex052:SetHeight(Ll.TexHeight[50]);
FrameTex052:SetWidth(Ll.TexWidth[50]);

local Hr1,Hg1,Hb1,Ha1 = unpack(Ll.Colors[52]);
local Hr2,Hg2,Hb2,Ha2 = unpack(Ll.Colors[53]);
FrameTex052:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[50]],Hr1,Hg1,Hb1,Ha1,Hr2,Hg2,Hb2,Ha2);

FrameText053:SetFont(Ll.Fonts[Ll.FontKey[50]],Ll.FontSize[50],Ll.FontOutline[Ll.FontOutlineKey[50]]);
if (Ll.AlwaysUp[1]~="") then
FrameText053:SetText(Ll.AlwaysUp[1]);
end

FrameText054:SetFont(Ll.Fonts[Ll.FontKey[50]],Ll.FontSize[50],Ll.FontOutline[Ll.FontOutlineKey[50]]);
if (Ll.AlwaysUp[2]~="") then
FrameText054:SetText(Ll.AlwaysUp[2]);
end

FrameText055:SetFont(Ll.Fonts[Ll.FontKey[50]],Ll.FontSize[50],Ll.FontOutline[Ll.FontOutlineKey[50]]);
if (Ll.AlwaysUp[3]~="") then
FrameText055:SetText(Ll.AlwaysUp[3]);
end    
end
Frame050:SetScript("OnUpdate",function() MainUpdate(); end);

------------------------------------------------------------------Move-functions
function MoveStrand()
if (Frame050:IsVisible()) then
MoveFrame(50);
MoveFrame(51,51);
MoveFrame(52,52);
MoveFrame(53);
MoveFrame(54);
MoveFrame(55);
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
end
end