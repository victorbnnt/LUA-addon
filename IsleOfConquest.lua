------------------------------Isle-Of-Conquest----------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
local _,Faction = UnitFactionGroup("player");
local TextsI = {L["quarry"],L["hangar"],L["docks"],L["workshop"],L["refinery"],L["hordekeep"],L["alliancekeep"],L["SiegeEngine"]};
local JBar,JBarTex,JBarText = "JBar0%d","JBarTex0%d","JBarText0%d";
local JBarTime,JBarState = "JBarTime0%d","JBarState0%d";
--------------------------------------------------------------------------------
---MainFrame
local Frame030 = CreateFrame("Frame","Frame030",UIParent);
Frame030:RegisterEvent("ADDON_LOADED");
Frame030:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame030:RegisterEvent("CHAT_MSG_BG_SYSTEM_ALLIANCE");
Frame030:RegisterEvent("CHAT_MSG_BG_SYSTEM_HORDE");
Frame030:RegisterEvent("UPDATE_BATTLEFIELD_SCORE");
Frame030:SetHeight(70);
Frame030:SetWidth(200);
Frame030:RegisterForDrag("LeftButton");

---Score Bars
local Frame031 = CreateFrame("Frame","Frame031",Frame030);
Frame031:RegisterForDrag("LeftButton");
local FrameTex031 = Frame031:CreateTexture("FrameTex031");

local Frame032 = CreateFrame("Frame","Frame032",Frame030);
Frame032:RegisterForDrag("LeftButton");
local FrameTex032 = Frame032:CreateTexture("FrameTex032");

---Score text
local Frame033 = CreateFrame("Frame","Frame033",Frame030);
Frame033:RegisterForDrag("LeftButton");
Frame033:SetHeight(15);
Frame033:SetWidth(70);
local FrameText033 = Frame033:CreateFontString("FrameText033");
FrameText033:SetPoint("CENTER",Frame033,"CENTER",0,0);

local Frame034 = CreateFrame("Frame","Frame034",Frame030);
Frame034:RegisterForDrag("LeftButton");
Frame034:SetHeight(15);
Frame034:SetWidth(70);
local FrameText034 = Frame034:CreateFontString("FrameText034");
FrameText034:SetPoint("CENTER",Frame034,"CENTER",0,0);

local Frame035 = CreateFrame("Frame","Frame035",Frame030);
Frame035:RegisterForDrag("LeftButton");
Frame035:SetHeight(18);
Frame035:SetWidth(150);

local FrameTex0351 = Frame035:CreateTexture("FrameTex0351");
FrameTex0351:SetPoint("CENTER",Frame035,"CENTER",-60,0);
FrameTex0351:SetHeight(15);FrameTex0351:SetWidth(15);
local FrameTex0352 = Frame035:CreateTexture("FrameTex0352");
FrameTex0352:SetPoint("CENTER",Frame035,"CENTER",-40,0);
FrameTex0352:SetHeight(15);FrameTex0352:SetWidth(15);
local FrameTex0353 = Frame035:CreateTexture("FrameTex0353");
FrameTex0353:SetPoint("CENTER",Frame035,"CENTER",-20,0);
FrameTex0353:SetHeight(15);FrameTex0353:SetWidth(15);
local FrameTex0354 = Frame035:CreateTexture("FrameTex0354");
FrameTex0354:SetPoint("CENTER",Frame035,"CENTER",0,0);
FrameTex0354:SetHeight(15);FrameTex0354:SetWidth(15);
local FrameTex0355 = Frame035:CreateTexture("FrameTex0355");
FrameTex0355:SetPoint("CENTER",Frame035,"CENTER",20,0);
FrameTex0355:SetHeight(15);FrameTex0355:SetWidth(15);
local FrameTex0356 = Frame035:CreateTexture("FrameTex0356");
FrameTex0356:SetPoint("CENTER",Frame035,"CENTER",40,0);
FrameTex0356:SetHeight(15);FrameTex0356:SetWidth(15);
local FrameTex0357 = Frame035:CreateTexture("FrameTex0357");
FrameTex0357:SetPoint("CENTER",Frame035,"CENTER",60,0);
FrameTex0357:SetHeight(15);FrameTex0357:SetWidth(15);

--------------------------------------------------------------------Bases/Timers
local Frame036 = CreateFrame("Frame","Frame036",UIParent);
local Frame036bis = CreateFrame("Frame","Frame036bis",UIParent);
Frame036:SetHeight(25);
Frame036:SetWidth(25);
Frame036:RegisterForDrag("LeftButton");
local BaseBD030 = CreateFrame("Frame","BaseBD030",Frame036);
BaseBD030:SetPoint("BOTTOM","Frame036","TOP",0,0);
BaseBD030:SetWidth(15);
BaseBD030:SetHeight(145);

---------------------------------DOOR-------------------------------------------
local IOCdoor = CreateFrame("Button","IOCdoor",UIParent);
IOCdoor:SetPoint("CENTER",UIParent,"CENTER",0,0); 
IOCdoor:SetWidth(2); 
IOCdoor:SetHeight(2); 
IOCdoor:EnableMouse(false);
IOCdoor:Hide();

local IOCdoorText=IOCdoor:CreateFontString("IOCdoorText");
IOCdoorText:SetPoint("CENTER",IOCdoor,"CENTER",0,0);
IOCdoor:SetScale(0.1);

---------------------------------------------------------------------------Event
function Frame030:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
      Frame030:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame030:SetBackdropColor(0,0,0,0);
      Frame030:SetBackdropBorderColor(0,0,0,0);
      
      Frame031:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame032:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      
      Frame033:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame033:SetBackdropColor(0,0,0,0);
      Frame033:SetBackdropBorderColor(0,0,0,0);
      
      Frame034:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame034:SetBackdropColor(0,0,0,0);
      Frame034:SetBackdropBorderColor(0,0,0,0);
      
      Frame035:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame035:SetBackdropColor(0,0,0,0);
      Frame035:SetBackdropBorderColor(0,0,0,0);
      
      FrameTex0351:SetTexture(Ll.Icons.Mine[1]);
      FrameTex0352:SetTexture(Ll.Icons.Hangar[1]);
      FrameTex0353:SetTexture(Ll.Icons.Docks[1]);
      FrameTex0354:SetTexture(Ll.Icons.Workshop[1]);
      FrameTex0355:SetTexture(Ll.Icons.Refinery[1]);
      FrameTex0356:SetTexture(Ll.Icons.Keep[4]);
      FrameTex0357:SetTexture(Ll.Icons.Keep[2]);
      
      Frame036:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});      
      Frame036:SetBackdropColor(0,0,0,0);
      Frame036:SetBackdropBorderColor(0,0,0,0);
      
      BaseBD030:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      IOCdoorText:SetFont(Ll.Fonts[2],15,"OUTLINE");
      
      for i = 1,8 do
        local JBar,JBarTex,JBarText,JBarTime,JBarState = JBar:format(i),JBarTex:format(i),JBarText:format(i),JBarTime:format(i),JBarState:format(i);
        
        local JBar = CreateFrame("Frame",JBar,Frame036);
              JBar:SetPoint("BOTTOMRIGHT",Frame018,"TOPLEFT",0,Ll.TimerPos[i]);
              JBar:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});                  
              JBar:SetFrameLevel(0);
              JBar:SetAlpha(0);
        local JBarTex = JBar:CreateTexture(JBarTex,"ARTWORK");
              JBarTex:SetPoint("LEFT",JBar,"LEFT",2,0);
        local JBarTime = JBar:CreateFontString(JBarTime,"OVERLAY"); 
              JBarTime:SetPoint("LEFT",JBar,"LEFT",2,0);
        local JBarText = Frame036:CreateFontString(JBarText,"OVERLAY");
              JBarText:SetFont(Ll.Fonts[Ll.FontKey[31]],Ll.FontSize[31],Ll.FontOutline[Ll.FontOutlineKey[31]]);
              JBarText:SetText(TextsI[9-i]);
        local JBarState = BaseBD030:CreateTexture(JBarState,"ARTWORK");  --texture bases
              JBarState:SetPoint("BOTTOM",BaseBD030,"BOTTOM",0,(18*i)-15);
              JBarState:SetHeight(13);
              JBarState:SetWidth(13);
        Ll.IOCBars[i] = JBar; 
     end      
              
   FDragStart(30);FDragStop(30);
   FDragStart(31);FDragStop(30,31);
   FDragStart(32);FDragStop(30,32);   
   FDragStart(33);FDragStop(30,33);
   FDragStart(34);FDragStop(30,34);
   FDragStart(35);FDragStop(30,35);
   FDragStart(36);FDragStop(36); 
      
   Frame030:SetPoint(unpack(Ll.FramePos[30]));
   Frame031:SetPoint(unpack(Ll.FramePos[31]));
   Frame032:SetPoint(unpack(Ll.FramePos[32]));
   Frame033:SetPoint(unpack(Ll.FramePos[33]));
   Frame034:SetPoint(unpack(Ll.FramePos[34]));
   Frame035:SetPoint(unpack(Ll.FramePos[35]));
   Frame036:SetPoint(unpack(Ll.FramePos[36]));
   
   if (InPrepa()) then Ll.BGioc.State = {3,0,1,2,2,2,2,2}; else Ll.BGioc.State = {3,3,3,3,3,3,3,3}; end 
           
   if (InBattleground(3)) then
     Frame030:Show();     
   else
     Frame030:Hide();     
   end      
end
end

if (event=="CHAT_MSG_BG_SYSTEM_ALLIANCE") then
local arg1=...;
msg=arg1;
--Alliance Asssault
   if (string.find(msg,L["quarry assaulted"])) then FrameTex0351:SetTexture(Ll.Icons.Mine[2]); Ll.BGioc.Time[8] = 62;Ll.BGioc.Color[8] = 0;Ll.BGioc.State[8] = 2;       
     elseif (string.find(msg,L["hangar assaulted"])) then FrameTex0352:SetTexture(Ll.Icons.Hangar[2]); Ll.BGioc.Time[7] = 62;Ll.BGioc.Color[7] = 0;Ll.BGioc.State[7] = 2;    
     elseif (string.find(msg,L["docks assaulted"])) then FrameTex0353:SetTexture(Ll.Icons.Docks[2]); Ll.BGioc.Time[6] = 62;Ll.BGioc.Color[6] = 0;Ll.BGioc.State[6] = 2;      
     elseif (string.find(msg,L["workshop assaulted"])) then FrameTex0354:SetTexture(Ll.Icons.Workshop[2]); Ll.BGioc.Time[5] = 62;Ll.BGioc.Color[5] = 0;Ll.BGioc.State[5] = 2;Ll.BGioc.Time[1]=-1;Ll.BGioc.State[1]=2;    
     elseif (string.find(msg,L["refinery assaulted"])) then FrameTex0355:SetTexture(Ll.Icons.Refinery[2]); Ll.BGioc.Time[4] = 62;Ll.BGioc.Color[4] = 0;Ll.BGioc.State[4] = 2;    
     elseif (string.find(msg,L["horde keep assaulted"])) then FrameTex0356:SetTexture(Ll.Icons.Keep[1]); Ll.BGioc.Time[3] = 62;Ll.BGioc.Color[3] = 0;Ll.BGioc.State[3] = 2;    
     elseif (string.find(msg,L["alliance keep assaulted"])) then FrameTex0357:SetTexture(Ll.Icons.Keep[1]); Ll.BGioc.Time[2] = 62;Ll.BGioc.Color[2] = 0;Ll.BGioc.State[2] = 2;              
--Alliance capture/defense
     elseif (string.find(msg,L["quarry captured"])) then FrameTex0351:SetTexture(Ll.Icons.Mine[3]); Ll.BGioc.Time[8]=-1;Ll.BGioc.State[8]=0;    
     elseif (string.find(msg,L["hangar captured"])) then FrameTex0352:SetTexture(Ll.Icons.Hangar[3]); Ll.BGioc.Time[7]=-1;Ll.BGioc.State[7]=0;       
     elseif (string.find(msg,L["docks captured"])) then FrameTex0353:SetTexture(Ll.Icons.Docks[3]); Ll.BGioc.Time[6]=-1;Ll.BGioc.State[6]=0;        
     elseif (string.find(msg,L["workshop captured"])) then FrameTex0354:SetTexture(Ll.Icons.Workshop[3]); Ll.BGioc.Time[5]=-1;Ll.BGioc.State[5]=0;Ll.BGioc.Time[1]=182;Ll.BGioc.Color[1]=0;Ll.BGioc.State[1]=0;        
     elseif (string.find(msg,L["refinery captured"])) then FrameTex0355:SetTexture(Ll.Icons.Refinery[3]); Ll.BGioc.Time[4]=-1;Ll.BGioc.State[4]=0;        
     elseif (string.find(msg,L["horde keep captured"])) then FrameTex0356:SetTexture(Ll.Icons.Keep[2]); Ll.BGioc.Time[3]=-1;Ll.BGioc.State[3]=0;         
     elseif (string.find(msg,L["alliance keep captured"])) then FrameTex0357:SetTexture(Ll.Icons.Keep[2]); Ll.BGioc.Time[2]=-1;Ll.BGioc.State[2]=0;
     elseif (string.find(msg,L["gate"]) and string.find(msg,L["Horde"])) then
          IOCdoorText:SetTextColor(58/255,95/255,205/255);
          IOCdoorText:SetText(L["horde door down"]);
          IOCdoor:Show();      
     end       
end

if (event=="CHAT_MSG_BG_SYSTEM_HORDE") then
local arg1=...;
msg=arg1;
--Horde Asssault
   if (string.find(msg,L["quarry assaulted"])) then FrameTex0351:SetTexture(Ll.Icons.Mine[4]); Ll.BGioc.Time[8] = 62;Ll.BGioc.Color[8] = 1;Ll.BGioc.State[8] = 2;       
     elseif (string.find(msg,L["hangar assaulted"])) then FrameTex0352:SetTexture(Ll.Icons.Hangar[4]); Ll.BGioc.Time[7] = 62;Ll.BGioc.Color[7] = 1;Ll.BGioc.State[7] = 2;    
     elseif (string.find(msg,L["docks assaulted"])) then FrameTex0353:SetTexture(Ll.Icons.Docks[4]); Ll.BGioc.Time[6] = 62;Ll.BGioc.Color[6] = 1;Ll.BGioc.State[6] = 2;      
     elseif (string.find(msg,L["workshop assaulted"])) then FrameTex0354:SetTexture(Ll.Icons.Workshop[4]); Ll.BGioc.Time[5] = 62;Ll.BGioc.Color[5] = 1;Ll.BGioc.State[5] = 2;Ll.BGioc.Time[1]=-1;Ll.BGioc.State[1]=2;    
     elseif (string.find(msg,L["refinery assaulted"])) then FrameTex0355:SetTexture(Ll.Icons.Refinery[4]); Ll.BGioc.Time[4] = 62;Ll.BGioc.Color[4] = 1;Ll.BGioc.State[4] = 2;    
     elseif (string.find(msg,L["horde keep assaulted"])) then FrameTex0356:SetTexture(Ll.Icons.Keep[3]); Ll.BGioc.Time[3] = 62;Ll.BGioc.Color[3] = 1;Ll.BGioc.State[3] = 2;    
     elseif (string.find(msg,L["alliance keep assaulted"])) then FrameTex0357:SetTexture(Ll.Icons.Keep[3]); Ll.BGioc.Time[2] = 62;Ll.BGioc.Color[2] = 1;Ll.BGioc.State[2] = 2;              
--Horde capture/defense
     elseif (string.find(msg,L["quarry captured"])) then FrameTex0351:SetTexture(Ll.Icons.Mine[5]); Ll.BGioc.Time[8]=-1;Ll.BGioc.State[8]=1;    
     elseif (string.find(msg,L["hangar captured"])) then FrameTex0352:SetTexture(Ll.Icons.Hangar[5]); Ll.BGioc.Time[7]=-1;Ll.BGioc.State[7]=1;       
     elseif (string.find(msg,L["docks captured"])) then FrameTex0353:SetTexture(Ll.Icons.Docks[5]); Ll.BGioc.Time[6]=-1;Ll.BGioc.State[6]=1;        
     elseif (string.find(msg,L["workshop captured"])) then FrameTex0354:SetTexture(Ll.Icons.Workshop[5]); Ll.BGioc.Time[5]=-1;Ll.BGioc.State[5]=1;Ll.BGioc.Time[1]=182;Ll.BGioc.Color[1]=1;Ll.BGioc.State[1]=1;         
     elseif (string.find(msg,L["refinery captured"])) then FrameTex0355:SetTexture(Ll.Icons.Refinery[5]); Ll.BGioc.Time[4]=-1;Ll.BGioc.State[4]=1;        
     elseif (string.find(msg,L["horde keep captured"])) then FrameTex0356:SetTexture(Ll.Icons.Keep[4]); Ll.BGioc.Time[3]=-1;Ll.BGioc.State[3]=1;         
     elseif (string.find(msg,L["alliance keep captured"])) then FrameTex0357:SetTexture(Ll.Icons.Keep[4]); Ll.BGioc.Time[2]=-1;Ll.BGioc.State[2]=1;
     elseif (string.find(msg,L["gate"]) and string.find(msg,L["Alliance"])) then
          IOCdoorText:SetTextColor(176/255,23/255,31/255);
          IOCdoorText:SetText(L["alliance door down"]);
          IOCdoor:Show();   
     end       

end

if (event=="UPDATE_BATTLEFIELD_SCORE") then
RequestBattlefieldScoreData();
end

if (event=="ZONE_CHANGED_NEW_AREA") then
  if (InPrepa()) then Ll.BGioc.State = {3,0,1,2,2,2,2,2}; else Ll.BGioc.State = {3,3,3,3,3,3,3,3}; end
  for i=1,8 do Ll.BGioc.Time[i]=-1; end
  
  if (InBattleground(3)) then
     Frame030:Show();     
  else     
     Frame030:Hide();     
  end
end 
end
Frame030:SetScript("OnEvent",Frame030.OnEvent);

----------------------------------------------------------------------------Door
function IOCdoor:OnUpdate(elapsed)
  Ll.Door[1] = Ll.Door[1]+0.3;
  if (Ll.Door[1]<2.5) then
    IOCdoor:SetScale(Ll.Door[1]);
  else
  end
  if (Ll.Door[1]>60) then
    Ll.Door[1]=0;
    IOCdoor:Hide();
  return;
  end
end
IOCdoor:SetScript("OnUpdate", IOCdoor.OnUpdate);

--------------------------------------------------------------------------Update
local function MainUpdate() 
---Visibility
if (InPrepa() or Ll.Active.Score==0 or Ll.Active.Addon==0) then
  Frame030:SetAlpha(0);
else
  Frame030:SetAlpha(1);
end

if (Ll.ActiveIOC[1]==0) then
Frame035:Hide();
else
Frame035:Show();
end

---Scale
Frame030:SetScale(Ll.Scale[30]);
Frame035:SetScale(Ll.Scale[31]);

---Height/Width/Textures/Texts 1
local Bdr,Bdg,Bdb,Bda = unpack(Ll.Colors[36]);
local BBdr,BBdg,BBdb,BBda = unpack(Ll.Colors[37]);
Frame031:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame031:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame031:SetHeight(Ll.BarHeight[30]);
Frame031:SetWidth(Ll.BarWidth[30]);

FrameTex031:SetTexture(Ll.Textures[Ll.TextureKey[30]]);
FrameTex031:SetPoint("LEFT",Frame031,"LEFT",Ll.TexXofs[30],Ll.TexYofs[30]);
FrameTex031:SetHeight(Ll.TexHeight[30]);
SCBars("FrameTex031",reinforcements(Ll.AlwaysUp[1]),300,30);

local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[30]);
local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[31]);
FrameTex031:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[30]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);

---Height/Width/Textures/Texts 2
Frame032:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame032:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame032:SetHeight(Ll.BarHeight[30]);
Frame032:SetWidth(Ll.BarWidth[30]);

FrameTex032:SetTexture(Ll.Textures[Ll.TextureKey[30]]);
FrameTex032:SetPoint("LEFT",Frame032,"LEFT",Ll.TexXofs[30],Ll.TexYofs[30]);
FrameTex032:SetHeight(Ll.TexHeight[30]);
SCBars("FrameTex032",reinforcements(Ll.AlwaysUp[2]),300,30);

local Hr1,Hg1,Hb1,Ha1 = unpack(Ll.Colors[32]);
local Hr2,Hg2,Hb2,Ha2 = unpack(Ll.Colors[33]);
FrameTex032:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[30]],Hr1,Hg1,Hb1,Ha1,Hr2,Hg2,Hb2,Ha2);

FrameText033:SetFont(Ll.Fonts[Ll.FontKey[30]],Ll.FontSize[30],Ll.FontOutline[Ll.FontOutlineKey[30]]);
if (Ll.AlwaysUp[1]~="") then
FrameText033:SetText(reinforcements(Ll.AlwaysUp[1]));
end

FrameText034:SetFont(Ll.Fonts[Ll.FontKey[30]],Ll.FontSize[30],Ll.FontOutline[Ll.FontOutlineKey[30]]);
if (Ll.AlwaysUp[2]~="") then
FrameText034:SetText(reinforcements(Ll.AlwaysUp[2]));
end
end
Frame030:SetScript("OnUpdate",function() MainUpdate(); end);

----------------------------------------------------------------------BaseUpdate
function Frame036:OnUpdate(elapsed)
---Visibility
if (InPrepa() or Ll.Active.Base==0 or Ll.Active.Addon==0 or Ll.ActiveIOC[2]==0) then
  Frame036:SetAlpha(0);
else
  Frame036:SetAlpha(1);
end

if (Ll.OnlyTime[31]==1) then
BaseBD030:Hide();
else
BaseBD030:Show();
end

Frame036:SetScale(Ll.Scale[32]);
-------Bases
local Bbdr,Bbdg,Bbdb,Bbda = unpack(Ll.Colors[300]);
local BbBdr,BbBdg,BbBdb,BbBda = unpack(Ll.Colors[301]);
BaseBD030:SetBackdropColor(Bbdr,Bbdg,Bbdb,Bbda);
BaseBD030:SetBackdropBorderColor(BbBdr,BbBdg,BbBdb,BbBda);

-------Timers
local Adr,Adg,Adb,Ada = unpack(Ll.Colors[308]);
local ABdr,ABdg,ABdb,ABda = unpack(Ll.Colors[309]);
local All1r,All1g,All1b,All1a = unpack(Ll.Colors[302]);
local All2r,All2g,All2b,All2a = unpack(Ll.Colors[303]);
local H1r,H1g,H1b,H1a = unpack(Ll.Colors[304]);
local H2r,H2g,H2b,H2a = unpack(Ll.Colors[305]);
local N1r,N1g,N1b,N1a = unpack(Ll.Colors[306]);
local N2r,N2g,N2b,N2a = unpack(Ll.Colors[307]);

for i = 1,8 do
   local JBar,JBarTex,JBarText,JBarTime,JBarState = _G[JBar:format(i)],_G[JBarTex:format(i)],_G[JBarText:format(i)],_G[JBarTime:format(i)],_G[JBarState:format(i)];
   JBar:SetBackdropColor(Adr,Adg,Adb,Ada);
   JBar:SetBackdropBorderColor(ABdr,ABdg,ABdb,ABda);   
   JBar:SetAlpha(1);      
   JBar:SetHeight(Ll.BarHeight[31]);
   JBar:SetWidth(Ll.BarWidth[31]);   
   JBarTex:SetTexture(Ll.Textures[Ll.TextureKey[31]]); 
   JBarTex:SetPoint("LEFT",JBar,"LEFT",2,Ll.TexYofs[31]);  
   JBarTex:SetHeight(Ll.TexHeight[31]);      
   JBarState:SetTexture(Ll.Textures[Ll.TextureKey[31]]);   
   JBarText:SetFont(Ll.Fonts[Ll.FontKey[31]],Ll.FontSize[31],Ll.FontOutline[Ll.FontOutlineKey[31]]);   
   JBarTime:SetPoint("LEFT",JBar,"LEFT",Ll.BaseTimeXofs[31]+5,Ll.BaseTimeYofs[31]);
   JBarTime:SetFont(Ll.Fonts[Ll.FontKey[31]],Ll.FontSize[31],Ll.FontOutline[Ll.FontOutlineKey[31]]);
   
   TimersBG(Ll.OnlyTime[31],Ll.BGioc.Time,i,JBarText,Ll.BaseTxtXofs[31],Ll.BaseTxtYofs[31],JBar,"BaseBD030");
   
   if (Ll.BGioc.Color[i]==0) then  
     JBarTex:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[31]],All1r,All1g,All1b,All1a,All2r,All2g,All2b,All2a);
   else
     JBarTex:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[31]],H1r,H1g,H1b,H1a,H2r,H2g,H2b,H2a);
   end
   
   if (Ll.BGioc.State[i]==0) then
    JBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[31]],All1r,All1g,All1b,All1a,All2r,All2g,All2b,All2a);
   elseif (Ll.BGioc.State[i]==1) then
    JBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[31]],H1r,H1g,H1b,H1a,H2r,H2g,H2b,H2a);
   elseif (Ll.BGioc.State[i]==2) then 
    JBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[31]],N1r,N1g,N1b,N1a,N2r,N2g,N2b,N2a);
   else
    JBarState:SetAlpha(0);
   end
   
   Ll.BGioc.Time[i] = Ll.BGioc.Time[i]-elapsed;
   if (i~=1) then
     TimerBG_1(JBar,JBarTex,JBarTime,Ll.BGioc.Time[i],62);                          
   else
     TimerBG_1(JBar,JBarTex,JBarTime,Ll.BGioc.Time[i],182);
   end       
   TimerBG_2(i,8,Ll.BarSpacing[31],Ll.BarsXofs[31],Ll.BarsYofs[31],"Frame036",Ll.IOCBars,Ll.BGioc.Time,31);
end

end
Frame036:SetScript("OnUpdate",Frame036.OnUpdate);

function Frame036bis:OnUpdate(elapsed)
  if (InBattleground(3)) then
    Frame036:Show();
  elseif (Ll.TestMode[31]==1) then
    Frame036:Show();    
     if (Ll.BGioc.Time[1]<0 and Ll.BGioc.Time[2]<0 and Ll.BGioc.Time[3]<0 and Ll.BGioc.Time[4]<0 and Ll.BGioc.Time[5]<0 and Ll.BGioc.Time[6]<0 and Ll.BGioc.Time[7]<0 and Ll.BGioc.Time[8]<0) then
        Frame036:SetMovable(false);
        Frame036:EnableMouse(false);
        Ll.TestMode[31]=0;
     end
  else  
    Frame036:Hide();      
  end  
end
Frame036bis:SetScript("OnUpdate",Frame036bis.OnUpdate);

------------------------------------------------------------------Move-functions
function MoveIOC()
if (Frame030:IsVisible()) then
MoveFrame(30);
MoveFrame(31,31);
MoveFrame(32,32);
MoveFrame(33);
MoveFrame(34);
if (Ll.ActiveIOC[1]==1) then
  MoveFrame(35);
end
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
end
end

-------------------------------------------------------------Test-functions-Base
function TestIsle()
if (InBattleground(3)) then   
   MoveFrame(36);
else
   TestTimers("Frame036",3,Ll.BGioc.Time,31,Ll.BGioc.Color,Ll.BGioc.State);
   MoveFrame(36);
end
end