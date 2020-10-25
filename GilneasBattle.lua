--------------------------------Gilneas-Battle----------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
local _,Faction = UnitFactionGroup("player");
local Texts = {L["Waterworks"],L["mines"],L["lighthouse"]};
local FBar,FBarTex,FBarText = "FBar0%d","FBarTex0%d","FBarText0%d";
local FBarTime,FBarState = "FBarTime0%d","FBarState0%d";
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Visib = CreateFrame("Frame","Visib",UIParent);
--------------------------------------------------------------------------------
---MainFrame
local Frame070 = CreateFrame("Frame","Frame070",UIParent);
Frame070:RegisterEvent("ADDON_LOADED");
Frame070:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame070:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE");
Frame070:RegisterEvent("UPDATE_BATTLEFIELD_SCORE");
Frame070:SetHeight(70);
Frame070:SetWidth(200);
Frame070:RegisterForDrag("LeftButton");

---Score Bars
local Frame071 = CreateFrame("Frame","Frame071",Frame070);
Frame071:RegisterForDrag("LeftButton");
local FrameTex071 = Frame071:CreateTexture("FrameTex071");

local Frame072 = CreateFrame("Frame","Frame072",Frame070);
Frame072:RegisterForDrag("LeftButton");
local FrameTex072 = Frame072:CreateTexture("FrameTex072");

---Score text
local Frame073 = CreateFrame("Frame","Frame073",Frame070);
Frame073:RegisterForDrag("LeftButton");
Frame073:SetHeight(15);
Frame073:SetWidth(70);
local FrameText073 = Frame073:CreateFontString("FrameText073");
FrameText073:SetPoint("CENTER",Frame073,"CENTER",0,0);

local Frame074 = CreateFrame("Frame","Frame074",Frame070);
Frame074:RegisterForDrag("LeftButton");
Frame074:SetHeight(15);
Frame074:SetWidth(70);
local FrameText074 = Frame074:CreateFontString("FrameText074");
FrameText074:SetPoint("CENTER",Frame074,"CENTER",0,0);
local FrameTex074 = Frame074:CreateTexture("FrameTex074");
FrameTex074:SetPoint("CENTER",Frame074,"CENTER",0,0);

local Frame075 = CreateFrame("Frame","Frame075",Frame070);
Frame075:RegisterForDrag("LeftButton");
Frame075:SetHeight(15);
Frame075:SetWidth(70);
local FrameText075 = Frame075:CreateFontString("FrameText075");
FrameText075:SetPoint("CENTER",Frame075,"CENTER",0,0);

local Frame076 = CreateFrame("Frame","Frame076",Frame070);
Frame076:RegisterForDrag("LeftButton");
Frame076:SetHeight(15);
Frame076:SetWidth(70);
local FrameText076 = Frame076:CreateFontString("FrameText076");
FrameText076:SetPoint("CENTER",Frame076,"CENTER",0,0);
local FrameTex076 = Frame076:CreateTexture("FrameTex076");
FrameTex076:SetPoint("CENTER",Frame076,"CENTER",0,0);

local Frame077 = CreateFrame("Frame","Frame077",Frame070);
Frame077:RegisterForDrag("LeftButton");
Frame077:SetHeight(18);
Frame077:SetWidth(85);

local FrameTex0771 = Frame077:CreateTexture("FrameTex0771");
FrameTex0771:SetPoint("CENTER",Frame077,"CENTER",-20,0);
FrameTex0771:SetHeight(15);FrameTex0771:SetWidth(15);
local FrameTex0772 = Frame077:CreateTexture("FrameTex0772");
FrameTex0772:SetPoint("CENTER",Frame077,"CENTER",0,0);
FrameTex0772:SetHeight(15);FrameTex0772:SetWidth(15);
local FrameTex0773 = Frame077:CreateTexture("FrameTex0773");
FrameTex0773:SetPoint("CENTER",Frame077,"CENTER",20,0);
FrameTex0773:SetHeight(15);FrameTex0773:SetWidth(15);

--------------------------------------------------------------------Bases/Timers
local Frame078 = CreateFrame("Frame","Frame078",UIParent);
local Frame078bis = CreateFrame("Frame","Frame078bis",UIParent);
Frame078:SetHeight(25);
Frame078:SetWidth(25);
Frame078:RegisterForDrag("LeftButton");
local BaseBD070 = CreateFrame("Frame","BaseBD070",Frame078);
BaseBD070:SetPoint("BOTTOM","Frame078","TOP",0,0);
BaseBD070:SetWidth(15);
BaseBD070:SetHeight(55);

---------------------------------------------------------------------------Event
function Frame070:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
      Frame070:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame070:SetBackdropColor(0,0,0,0);
      Frame070:SetBackdropBorderColor(0,0,0,0);
      
      Frame071:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame072:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      
      Frame073:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame073:SetBackdropColor(0,0,0,0);
      Frame073:SetBackdropBorderColor(0,0,0,0);
      
      Frame074:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame074:SetBackdropColor(0,0,0,0);
      Frame074:SetBackdropBorderColor(0,0,0,0);
      
      Frame075:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame075:SetBackdropColor(0,0,0,0);
      Frame075:SetBackdropBorderColor(0,0,0,0);
      
      Frame076:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame076:SetBackdropColor(0,0,0,0);
      Frame076:SetBackdropBorderColor(0,0,0,0);
      
      Frame077:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame077:SetBackdropColor(0,0,0,0);
      Frame077:SetBackdropBorderColor(0,0,0,0);
      
      FrameTex0771:SetTexture(Ll.Icons.Blacksmith[1]);
      FrameTex0772:SetTexture(Ll.Icons.Mine[1]);
      FrameTex0773:SetTexture(Ll.Icons.Towers[1]);      
      
      Frame078:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});      
      Frame078:SetBackdropColor(0,0,0,0);
      Frame078:SetBackdropBorderColor(0,0,0,0);
      
      BaseBD070:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      
      for i = 1,3 do
        local FBar,FBarTex,FBarText,FBarTime,FBarState = FBar:format(i),FBarTex:format(i),FBarText:format(i),FBarTime:format(i),FBarState:format(i);
        
        local FBar = CreateFrame("Frame",FBar,Frame078);
              FBar:SetPoint("BOTTOMRIGHT",Frame078,"TOPLEFT",0,Ll.TimerPos[i]);
              FBar:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});                  
              FBar:SetFrameLevel(0);
              FBar:SetAlpha(0);
        local FBarTex = FBar:CreateTexture(FBarTex,"ARTWORK");
              FBarTex:SetPoint("LEFT",FBar,"LEFT",2,0);
        local FBarTime = FBar:CreateFontString(FBarTime,"OVERLAY"); 
              FBarTime:SetPoint("LEFT",FBar,"LEFT",2,0);
        local FBarText = Frame078:CreateFontString(FBarText,"OVERLAY");
              FBarText:SetFont(Ll.Fonts[Ll.FontKey[11]],Ll.FontSize[11],Ll.FontOutline[Ll.FontOutlineKey[11]]);
              FBarText:SetText(Texts[4-i]);
        local FBarState = BaseBD070:CreateTexture(FBarState,"ARTWORK");  --texture bases
              FBarState:SetPoint("BOTTOM",BaseBD070,"BOTTOM",0,(18*i)-15);
              FBarState:SetHeight(13);
              FBarState:SetWidth(13);
        Ll.BfGBars[i] = FBar; 
     end      
              
   FDragStart(70);FDragStop(70);
   FDragStart(71);FDragStop(70,71);
   FDragStart(72);FDragStop(70,72);   
   FDragStart(73);FDragStop(70,73);
   FDragStart(74);FDragStop(70,74);
   FDragStart(75);FDragStop(70,75);   
   FDragStart(76);FDragStop(70,76);
   FDragStart(77);FDragStop(70,77);
   FDragStart(78);FDragStop(78);   
   
   Frame070:SetPoint(unpack(Ll.FramePos[70]));
   Frame071:SetPoint(unpack(Ll.FramePos[71]));
   Frame072:SetPoint(unpack(Ll.FramePos[72]));
   Frame073:SetPoint(unpack(Ll.FramePos[73]));
   Frame074:SetPoint(unpack(Ll.FramePos[74]));
   Frame075:SetPoint(unpack(Ll.FramePos[75]));
   Frame076:SetPoint(unpack(Ll.FramePos[76]));
   Frame077:SetPoint(unpack(Ll.FramePos[77]));
   Frame078:SetPoint(unpack(Ll.FramePos[78]));  
        
   if (InPrepa()) then Ll.BGbfg.State = {2,2,2}; else Ll.BGbfg.State = {3,3,3}; end
           
   if (InBattleground(7)) then    
     Frame070:Show();     
   else
     Frame070:Hide();   
   end      
end
end

if (event=="CHAT_MSG_RAID_BOSS_EMOTE") then
local arg1=...;
msg=arg1;
--Alliance
  if (string.find(msg,L["Alliance"])) then
     if (string.find(msg,L["waterworks claimed"])) then FrameTex0771:SetTexture(Ll.Icons.Blacksmith[2]); Ll.BGbfg.Time[3] = 62;Ll.BGbfg.Color[3] = 0;Ll.BGbfg.State[3] = 2;
     elseif (string.find(msg,L["mines claimed"])) then FrameTex0772:SetTexture(Ll.Icons.Mine[2]); Ll.BGbfg.Time[2]=62;Ll.BGbfg.Color[2]=0;Ll.BGbfg.State[2]=2;
     elseif (string.find(msg,L["light claimed"])) then FrameTex0773:SetTexture(Ll.Icons.Towers[2]); Ll.BGbfg.Time[1]=62;Ll.BGbfg.Color[1]=0;Ll.BGbfg.State[1]=2;           
     elseif (string.find(msg,L["waterworks captured"])) then FrameTex0771:SetTexture(Ll.Icons.Blacksmith[3]); Ll.BGbfg.Time[3]=-1;Ll.BGbfg.State[3]=0;         
     elseif (string.find(msg,L["mines captured"])) then FrameTex0772:SetTexture(Ll.Icons.Mine[3]); Ll.BGbfg.Time[2]=-1;Ll.BGbfg.State[2]=0;                    
     elseif (string.find(msg,L["light captured"])) then FrameTex0773:SetTexture(Ll.Icons.Towers[3]); Ll.BGbfg.Time[1]=-1;Ll.BGbfg.State[1]=0;     
     end
     
--Horde    
  elseif (string.find(msg,L["Horde"])) then
     if (string.find(msg,L["waterworks claimed"])) then FrameTex0771:SetTexture(Ll.Icons.Blacksmith[4]); Ll.BGbfg.Time[3] = 62;Ll.BGbfg.Color[3] = 1;Ll.BGbfg.State[3] = 2;
     elseif (string.find(msg,L["mines claimed"])) then FrameTex0772:SetTexture(Ll.Icons.Mine[4]); Ll.BGbfg.Time[2]=62;Ll.BGbfg.Color[2]=1;Ll.BGbfg.State[2]=2;
     elseif (string.find(msg,L["light claimed"])) then FrameTex0773:SetTexture(Ll.Icons.Towers[4]); Ll.BGbfg.Time[1]=62;Ll.BGbfg.Color[1]=1;Ll.BGbfg.State[1]=2;           
     elseif (string.find(msg,L["waterworks captured"])) then FrameTex0771:SetTexture(Ll.Icons.Blacksmith[5]); Ll.BGbfg.Time[3]=-1;Ll.BGbfg.State[3]=1;         
     elseif (string.find(msg,L["mines captured"])) then FrameTex0772:SetTexture(Ll.Icons.Mine[5]); Ll.BGbfg.Time[2]=-1;Ll.BGbfg.State[2]=1;                    
     elseif (string.find(msg,L["light captured"])) then FrameTex0773:SetTexture(Ll.Icons.Towers[5]); Ll.BGbfg.Time[1]=-1;Ll.BGbfg.State[1]=1;        
     end

--Assault  
  else
     if ((IsInRaid(arg1) and Faction==L["Alliance"]) or (not IsInRaid(arg1) and Faction==L["Horde"])) then
        if (string.find(msg,L["waterworks assaulted"])) then FrameTex0771:SetTexture(Ll.Icons.Blacksmith[2]); Ll.BGbfg.Time[3] = 62;Ll.BGbfg.Color[3] = 0;Ll.BGbfg.State[3] = 2;       
        elseif (string.find(msg,L["mines assaulted"])) then FrameTex0772:SetTexture(Ll.Icons.Mine[2]); Ll.BGbfg.Time[2]=62;Ll.BGbfg.Color[2]=0;Ll.BGbfg.State[2]=2;        
        elseif (string.find(msg,L["light assaulted"])) then FrameTex0773:SetTexture(Ll.Icons.Towers[2]); Ll.BGbfg.Time[1]=62;Ll.BGbfg.Color[1]=0;Ll.BGbfg.State[1]=2;
        end
     elseif ((not IsInRaid(arg1) and Faction==L["Alliance"]) or (IsInRaid(arg1) and Faction==L["Horde"])) then
        if (string.find(msg,L["waterworks assaulted"])) then FrameTex0771:SetTexture(Ll.Icons.Blacksmith[4]); Ll.BGbfg.Time[3] = 62;Ll.BGbfg.Color[3] = 1;Ll.BGbfg.State[3] = 2;       
        elseif (string.find(msg,L["mines assaulted"])) then FrameTex0772:SetTexture(Ll.Icons.Mine[4]); Ll.BGbfg.Time[2]=62;Ll.BGbfg.Color[2]=1;Ll.BGbfg.State[2]=2;        
        elseif (string.find(msg,L["light assaulted"])) then FrameTex0773:SetTexture(Ll.Icons.Towers[4]); Ll.BGbfg.Time[1]=62;Ll.BGbfg.Color[1]=1;Ll.BGbfg.State[1]=2;
        end    
     end  
  end
end

if (event=="UPDATE_BATTLEFIELD_SCORE") then
RequestBattlefieldScoreData();
end

if (event=="ZONE_CHANGED_NEW_AREA") then
     if (InPrepa()) then Ll.BGbfg.State = {2,2,2}; else Ll.BGbfg.State = {3,3,3}; end
     for i=1,3 do Ll.BGbfg.Time[i]=-1; end
     
  if (InBattleground(7)) then     
     Frame070:Show();       
  else     
     Frame070:Hide();       
  end
end 

end
Frame070:SetScript("OnEvent",Frame070.OnEvent);

---------------------------------------------------------------------ScoreUpdate
local function MainUpdate()

---Scale
Frame070:SetScale(Ll.Scale[70]);
Frame077:SetScale(Ll.Scale[71]);

---Height/Width/Textures/Texts 1
local Bdr,Bdg,Bdb,Bda = unpack(Ll.Colors[76]);
local BBdr,BBdg,BBdb,BBda = unpack(Ll.Colors[77]);
Frame071:SetHeight(Ll.BarHeight[70]);
Frame071:SetWidth(Ll.BarWidth[70]);
Frame071:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame071:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);      

FrameTex071:SetTexture(Ll.Textures[Ll.TextureKey[70]]);
FrameTex071:SetPoint("LEFT",Frame071,"LEFT",Ll.TexXofs[70],Ll.TexYofs[70]);
FrameTex071:SetHeight(Ll.TexHeight[70]);
SCBars("FrameTex071",BarScore(Ll.AlwaysUp[1]),2000,70);

local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[70]);
local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[71]);
FrameTex071:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[70]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);

---Height/Width/Textures/Texts 2
Frame072:SetHeight(Ll.BarHeight[70]);
Frame072:SetWidth(Ll.BarWidth[70]);

Frame072:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame072:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);

FrameTex072:SetTexture(Ll.Textures[Ll.TextureKey[70]]);
FrameTex072:SetPoint("LEFT",Frame072,"LEFT",Ll.TexXofs[70],Ll.TexYofs[70]);
FrameTex072:SetHeight(Ll.TexHeight[70]);
SCBars("FrameTex072",BarScore(Ll.AlwaysUp[2]),2000,70);

local Hr1,Hg1,Hb1,Ha1 = unpack(Ll.Colors[72]);
local Hr2,Hg2,Hb2,Ha2 = unpack(Ll.Colors[73]);
FrameTex072:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[70]],Hr1,Hg1,Hb1,Ha1,Hr2,Hg2,Hb2,Ha2);

FrameText073:SetFont(Ll.Fonts[Ll.FontKey[70]],Ll.FontSize[70],Ll.FontOutline[Ll.FontOutlineKey[70]]);
if (Ll.AlwaysUp[1]~="") then
FrameText073:SetText(BarScore(Ll.AlwaysUp[1]));
end

FrameText074:SetFont(Ll.Fonts[Ll.FontKey[70]],Ll.FontSize[70],Ll.FontOutline[Ll.FontOutlineKey[70]]);
if (Ll.AlwaysUp[1]~="") then
FrameText074:SetText(bases(Ll.AlwaysUp[1]));
end

FrameText075:SetFont(Ll.Fonts[Ll.FontKey[70]],Ll.FontSize[70],Ll.FontOutline[Ll.FontOutlineKey[70]]);
if (Ll.AlwaysUp[2]~="") then
FrameText075:SetText(BarScore(Ll.AlwaysUp[2]));
end

FrameText076:SetFont(Ll.Fonts[Ll.FontKey[70]],Ll.FontSize[70],Ll.FontOutline[Ll.FontOutlineKey[70]]);
if (Ll.AlwaysUp[2]~="") then
FrameText076:SetText(bases(Ll.AlwaysUp[2]));
end 
end
Frame070:SetScript("OnUpdate",function() MainUpdate(); end);

----------------------------------------------------------------------BaseUpdate
function Frame078:OnUpdate(elapsed)
---Visibility
if (InPrepa() or Ll.Active.Base==0 or Ll.Active.Addon==0 or Ll.ActiveBFG[2]==0) then
  Frame078:SetAlpha(0);
else
  Frame078:SetAlpha(1);
end

if (Ll.OnlyTime[71]==1) then
BaseBD070:Hide();
else
BaseBD070:Show();
end

Frame078:SetScale(Ll.Scale[72]);
-------Bases
local Bbdr,Bbdg,Bbdb,Bbda = unpack(Ll.Colors[800]);
local BbBdr,BbBdg,BbBdb,BbBda = unpack(Ll.Colors[801]);
BaseBD070:SetBackdropColor(Bbdr,Bbdg,Bbdb,Bbda);
BaseBD070:SetBackdropBorderColor(BbBdr,BbBdg,BbBdb,BbBda);

-------Timers
local Adr,Adg,Adb,Ada = unpack(Ll.Colors[808]);
local ABdr,ABdg,ABdb,ABda = unpack(Ll.Colors[809]);
local All1r,All1g,All1b,All1a = unpack(Ll.Colors[802]);
local All2r,All2g,All2b,All2a = unpack(Ll.Colors[803]);
local H1r,H1g,H1b,H1a = unpack(Ll.Colors[804]);
local H2r,H2g,H2b,H2a = unpack(Ll.Colors[805]);
local N1r,N1g,N1b,N1a = unpack(Ll.Colors[806]);
local N2r,N2g,N2b,N2a = unpack(Ll.Colors[807]);

for i = 1,3 do
   local FBar,FBarTex,FBarText,FBarTime,FBarState = _G[FBar:format(i)],_G[FBarTex:format(i)],_G[FBarText:format(i)],_G[FBarTime:format(i)],_G[FBarState:format(i)];
   FBar:SetBackdropColor(Adr,Adg,Adb,Ada);
   FBar:SetBackdropBorderColor(ABdr,ABdg,ABdb,ABda);   
   FBar:SetAlpha(1);      
   FBar:SetHeight(Ll.BarHeight[71]);
   FBar:SetWidth(Ll.BarWidth[71]);   
   FBarTex:SetTexture(Ll.Textures[Ll.TextureKey[71]]); 
   FBarTex:SetPoint("LEFT",FBar,"LEFT",2,Ll.TexYofs[71]);  
   FBarTex:SetHeight(Ll.TexHeight[71]);      
   FBarState:SetTexture(Ll.Textures[Ll.TextureKey[71]]);   
   FBarText:SetFont(Ll.Fonts[Ll.FontKey[71]],Ll.FontSize[71],Ll.FontOutline[Ll.FontOutlineKey[71]]);   
   FBarTime:SetPoint("LEFT",FBar,"LEFT",Ll.BaseTimeXofs[71]+5,Ll.BaseTimeYofs[71]);
   FBarTime:SetFont(Ll.Fonts[Ll.FontKey[71]],Ll.FontSize[71],Ll.FontOutline[Ll.FontOutlineKey[71]]);
   
   TimersBG(Ll.OnlyTime[71],Ll.BGbfg.Time,i,FBarText,Ll.BaseTxtXofs[71],Ll.BaseTxtYofs[71],FBar,"BaseBD070");
   
   if (Ll.BGbfg.Color[i]==0) then  
     FBarTex:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[71]],All1r,All1g,All1b,All1a,All2r,All2g,All2b,All2a);
   else
     FBarTex:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[71]],H1r,H1g,H1b,H1a,H2r,H2g,H2b,H2a);
   end
   
   if (Ll.BGbfg.State[i]==0) then
    FBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[71]],All1r,All1g,All1b,All1a,All2r,All2g,All2b,All2a);
   elseif (Ll.BGbfg.State[i]==1) then
    FBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[71]],H1r,H1g,H1b,H1a,H2r,H2g,H2b,H2a);
   elseif (Ll.BGbfg.State[i]==2) then 
    FBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[71]],N1r,N1g,N1b,N1a,N2r,N2g,N2b,N2a);
   else
    FBarState:SetAlpha(0);
   end
   
   Ll.BGbfg.Time[i]=Ll.BGbfg.Time[i]-elapsed;
   TimerBG_1(FBar,FBarTex,FBarTime,Ll.BGbfg.Time[i],62);
   TimerBG_2(i,3,Ll.BarSpacing[71],Ll.BarsXofs[71],Ll.BarsYofs[71],"Frame078",Ll.BfGBars,Ll.BGbfg.Time,71);
end

end
Frame078:SetScript("OnUpdate",Frame078.OnUpdate);

function Frame078bis:OnUpdate(elapsed)
  if (InBattleground(7)) then
    Frame078:Show();
  elseif (Ll.TestMode[71]==1) then
    Frame078:Show();    
     if (Ll.BGbfg.Time[1]<0 and Ll.BGbfg.Time[2]<0 and Ll.BGbfg.Time[3]<0) then
        Frame078:SetMovable(false);
        Frame078:EnableMouse(false);
        Ll.TestMode[71]=0;
     end
  else  
    Frame078:Hide();      
  end
  
---Score
if (InPrepa() or Ll.Active.Score==0 or Ll.Active.Addon==0 or not InBattleground(7)) then
  Frame070:Hide();
else
  Frame070:Show();
end

if (Ll.ActiveBFG[1]==1) then
 Frame077:Show();
else
 Frame077:Hide();
end  
end
Frame078bis:SetScript("OnUpdate",Frame078bis.OnUpdate);

------------------------------------------------------------------Move-functions
function MoveGilneas()
if (Frame070:IsVisible()) then
MoveFrame(70);
MoveFrame(71,71);
MoveFrame(72,72);
MoveFrame(73);
MoveFrame(74);
MoveFrame(75);
MoveFrame(76);
MoveFrame(77);
--if (Ll.ActiveBFG[1]==1) then
--  MoveFrame(77);
--end
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
end
end

-------------------------------------------------------------Test-functions-Base
function TestGilneas()
if (InBattleground(7)) then   
   MoveFrame(78);
else
   TestTimers("Frame078",7,Ll.BGbfg.Time,71,Ll.BGbfg.Color,Ll.BGbfg.State);
   MoveFrame(78);
end
end
