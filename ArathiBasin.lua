--------------------------------Arathi-Basin------------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
local _,Faction = UnitFactionGroup("player");
local Texts = {L["farm"],L["blacks"],L["lumb"],L["mine"],L["stableN"]};
local TBar,TBarTex,TBarText = "TBar0%d","TBarTex0%d","TBarText0%d";
local TBarTime,TBarState = "TBarTime0%d","TBarState0%d";
--------------------------------------------------------------------------------
local Visib = CreateFrame("Frame","Visib",UIParent);
--------------------------------------------------------------------------------
---MainFrame
local Frame010 = CreateFrame("Frame","Frame010",UIParent);
Frame010:RegisterEvent("ADDON_LOADED");
Frame010:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame010:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE");
Frame010:RegisterEvent("UPDATE_BATTLEFIELD_SCORE");
Frame010:SetHeight(70);
Frame010:SetWidth(200);
Frame010:RegisterForDrag("LeftButton");

---Score Bars
local Frame011 = CreateFrame("Frame","Frame011",Frame010);
Frame011:RegisterForDrag("LeftButton");
local FrameTex011 = Frame011:CreateTexture("FrameTex011");

local Frame012 = CreateFrame("Frame","Frame012",Frame010);
Frame012:RegisterForDrag("LeftButton");
local FrameTex012 = Frame012:CreateTexture("FrameTex012");

---Score text
local Frame013 = CreateFrame("Frame","Frame013",Frame010);
Frame013:RegisterForDrag("LeftButton");
Frame013:SetHeight(15);
Frame013:SetWidth(70);
local FrameText013 = Frame013:CreateFontString("FrameText013");
FrameText013:SetPoint("CENTER",Frame013,"CENTER",0,0);

local Frame014 = CreateFrame("Frame","Frame014",Frame010);
Frame014:RegisterForDrag("LeftButton");
Frame014:SetHeight(15);
Frame014:SetWidth(70);
local FrameText014 = Frame014:CreateFontString("FrameText014");
FrameText014:SetPoint("CENTER",Frame014,"CENTER",0,0);
local FrameTex014 = Frame014:CreateTexture("FrameTex014");
FrameTex014:SetPoint("CENTER",Frame014,"CENTER",0,0);

local Frame015 = CreateFrame("Frame","Frame015",Frame010);
Frame015:RegisterForDrag("LeftButton");
Frame015:SetHeight(15);
Frame015:SetWidth(70);
local FrameText015 = Frame015:CreateFontString("FrameText015");
FrameText015:SetPoint("CENTER",Frame015,"CENTER",0,0);

local Frame016 = CreateFrame("Frame","Frame016",Frame010);
Frame016:RegisterForDrag("LeftButton");
Frame016:SetHeight(15);
Frame016:SetWidth(70);
local FrameText016 = Frame016:CreateFontString("FrameText016");
FrameText016:SetPoint("CENTER",Frame016,"CENTER",0,0);
local FrameTex016 = Frame016:CreateTexture("FrameTex016");
FrameTex016:SetPoint("CENTER",Frame016,"CENTER",0,0);

local Frame017 = CreateFrame("Frame","Frame017",Frame010);
Frame017:RegisterForDrag("LeftButton");
Frame017:SetHeight(18);
Frame017:SetWidth(85);

local FrameTex0171 = Frame017:CreateTexture("FrameTex0171");
FrameTex0171:SetPoint("CENTER",Frame017,"CENTER",-40,0);
FrameTex0171:SetHeight(15);FrameTex0171:SetWidth(15);
local FrameTex0172 = Frame017:CreateTexture("FrameTex0172");
FrameTex0172:SetPoint("CENTER",Frame017,"CENTER",-20,0);
FrameTex0172:SetHeight(15);FrameTex0172:SetWidth(15);
local FrameTex0173 = Frame017:CreateTexture("FrameTex0173");
FrameTex0173:SetPoint("CENTER",Frame017,"CENTER",0,0);
FrameTex0173:SetHeight(15);FrameTex0173:SetWidth(15);
local FrameTex0174 = Frame017:CreateTexture("FrameTex0174");
FrameTex0174:SetPoint("CENTER",Frame017,"CENTER",20,0);
FrameTex0174:SetHeight(15);FrameTex0174:SetWidth(15);
local FrameTex0175 = Frame017:CreateTexture("FrameTex0175");
FrameTex0175:SetPoint("CENTER",Frame017,"CENTER",40,0);
FrameTex0175:SetHeight(15);FrameTex0175:SetWidth(15);

--------------------------------------------------------------------Bases/Timers
local Frame018 = CreateFrame("Frame","Frame018",UIParent);
local Frame018bis = CreateFrame("Frame","Frame018bis",UIParent);
Frame018:SetHeight(25);
Frame018:SetWidth(25);
Frame018:RegisterForDrag("LeftButton");
local BaseBD010 = CreateFrame("Frame","BaseBD010",Frame018);
BaseBD010:SetPoint("BOTTOM","Frame018","TOP",0,0);
BaseBD010:SetWidth(15);
BaseBD010:SetHeight(90);

---------------------------------------------------------------------------Event
function Frame010:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
      Frame010:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame010:SetBackdropColor(0,0,0,0);
      Frame010:SetBackdropBorderColor(0,0,0,0);
      
      Frame011:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame012:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      
      Frame013:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame013:SetBackdropColor(0,0,0,0);
      Frame013:SetBackdropBorderColor(0,0,0,0);
      
      Frame014:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame014:SetBackdropColor(0,0,0,0);
      Frame014:SetBackdropBorderColor(0,0,0,0);
      
      Frame015:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame015:SetBackdropColor(0,0,0,0);
      Frame015:SetBackdropBorderColor(0,0,0,0);
      
      Frame016:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame016:SetBackdropColor(0,0,0,0);
      Frame016:SetBackdropBorderColor(0,0,0,0);
      
      Frame017:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame017:SetBackdropColor(0,0,0,0);
      Frame017:SetBackdropBorderColor(0,0,0,0);
      
      FrameTex0171:SetTexture(Ll.Icons.Farm[1]);
      FrameTex0172:SetTexture(Ll.Icons.Blacksmith[1]);
      FrameTex0173:SetTexture(Ll.Icons.Mine[1]);
      FrameTex0174:SetTexture(Ll.Icons.Stables[1]);
      FrameTex0175:SetTexture(Ll.Icons.Lumber[1]);
      
      Frame018:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});      
      Frame018:SetBackdropColor(0,0,0,0);
      Frame018:SetBackdropBorderColor(0,0,0,0);
      
      BaseBD010:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      
      for i = 1,5 do
        local TBar,TBarTex,TBarText,TBarTime,TBarState = TBar:format(i),TBarTex:format(i),TBarText:format(i),TBarTime:format(i),TBarState:format(i);
        
        local TBar = CreateFrame("Frame",TBar,Frame018);
              TBar:SetPoint("BOTTOMRIGHT",Frame018,"TOPLEFT",0,Ll.TimerPos[i]);
              TBar:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});                  
              TBar:SetFrameLevel(0);
              TBar:SetAlpha(0);
        local TBarTex = TBar:CreateTexture(TBarTex,"ARTWORK");
              TBarTex:SetPoint("LEFT",TBar,"LEFT",2,0);
        local TBarTime = TBar:CreateFontString(TBarTime,"OVERLAY"); 
              TBarTime:SetPoint("LEFT",TBar,"LEFT",2,0);
        local TBarText = Frame018:CreateFontString(TBarText,"OVERLAY");
              TBarText:SetFont(Ll.Fonts[Ll.FontKey[11]],Ll.FontSize[11],Ll.FontOutline[Ll.FontOutlineKey[11]]);
              TBarText:SetText(Texts[6-i]);
        local TBarState = BaseBD010:CreateTexture(TBarState,"ARTWORK");  --texture bases
              TBarState:SetPoint("BOTTOM",BaseBD010,"BOTTOM",0,(18*i)-15);
              TBarState:SetHeight(13);
              TBarState:SetWidth(13);
        Ll.ABBars[i] = TBar; 
     end      
              
   FDragStart(10);FDragStop(10);
   FDragStart(11);FDragStop(10,11);
   FDragStart(12);FDragStop(10,12);   
   FDragStart(13);FDragStop(10,13);
   FDragStart(14);FDragStop(10,14);
   FDragStart(15);FDragStop(10,15);   
   FDragStart(16);FDragStop(10,16);
   FDragStart(17);FDragStop(10,17);
   FDragStart(18);FDragStop(18);   
   
   Frame010:SetPoint(unpack(Ll.FramePos[10]));
   Frame011:SetPoint(unpack(Ll.FramePos[11]));
   Frame012:SetPoint(unpack(Ll.FramePos[12]));
   Frame013:SetPoint(unpack(Ll.FramePos[13]));
   Frame014:SetPoint(unpack(Ll.FramePos[14]));
   Frame015:SetPoint(unpack(Ll.FramePos[15]));
   Frame016:SetPoint(unpack(Ll.FramePos[16]));
   Frame017:SetPoint(unpack(Ll.FramePos[17]));
   Frame018:SetPoint(unpack(Ll.FramePos[18]));  
        
   if (InPrepa()) then Ll.BGab.State = {2,2,2,2,2}; else Ll.BGab.State = {3,3,3,3,3}; end
           
   if (InBattleground(1)) then    
     Frame010:Show();     
   else
     Frame010:Hide();   
   end      
end
end

if (event=="CHAT_MSG_RAID_BOSS_EMOTE") then
local arg1=...;
msg=arg1;
--Alliance
  if (string.find(msg,L["Alliance"])) then
     if (string.find(msg,L["farm claimed"])) then FrameTex0171:SetTexture(Ll.Icons.Farm[2]); Ll.BGab.Time[5] = 62;Ll.BGab.Color[5] = 0;Ll.BGab.State[5] = 2;
     elseif (string.find(msg,L["blacksmith claimed"])) then FrameTex0172:SetTexture(Ll.Icons.Blacksmith[2]); Ll.BGab.Time[4]=62;Ll.BGab.Color[4]=0;Ll.BGab.State[4]=2;
     elseif (string.find(msg,L["mine claimed"])) then FrameTex0173:SetTexture(Ll.Icons.Mine[2]); Ll.BGab.Time[2]=62;Ll.BGab.Color[2]=0;Ll.BGab.State[2]=2;  
     elseif ((strmatch(msg,L["stable"]) and strmatch(msg,L["stables claimed"]))) then FrameTex0174:SetTexture(Ll.Icons.Stables[2]); Ll.BGab.Time[1]=62;Ll.BGab.Color[1]=0;Ll.BGab.State[1]=2;     
     elseif (string.find(msg,L["lumber mill claimed"])) then FrameTex0175:SetTexture(Ll.Icons.Lumber[2]); Ll.BGab.Time[3]=62;Ll.BGab.Color[3]=0;Ll.BGab.State[3]=2;      
     elseif (string.find(msg,L["farm captured"])) then FrameTex0171:SetTexture(Ll.Icons.Farm[3]); Ll.BGab.Time[5]=-1;Ll.BGab.State[5]=0;         
     elseif (string.find(msg,L["blacksmith captured"])) then FrameTex0172:SetTexture(Ll.Icons.Blacksmith[3]); Ll.BGab.Time[4]=-1;Ll.BGab.State[4]=0;                    
     elseif (string.find(msg,L["lumber mill captured"])) then FrameTex0175:SetTexture(Ll.Icons.Lumber[3]); Ll.BGab.Time[3]=-1;Ll.BGab.State[3]=0;             
     elseif (string.find(msg,L["mine captured"])) then FrameTex0173:SetTexture(Ll.Icons.Mine[3]); Ll.BGab.Time[2]=-1;Ll.BGab.State[2]=0;                 
     elseif (string.find(msg,L["stables captured"])) then FrameTex0174:SetTexture(Ll.Icons.Stables[3]); Ll.BGab.Time[1]=-1;Ll.BGab.State[1]=0;      
     end
     
--Horde    
  elseif (string.find(msg,L["Horde"])) then
     if (string.find(msg,L["farm claimed"])) then FrameTex0171:SetTexture(Ll.Icons.Farm[4]); Ll.BGab.Time[5]=62;Ll.BGab.Color[5]=1;Ll.BGab.State[5]=2; 
     elseif (string.find(msg,L["blacksmith claimed"])) then FrameTex0172:SetTexture(Ll.Icons.Blacksmith[4]); Ll.BGab.Time[4]=62;Ll.BGab.Color[4]=1;Ll.BGab.State[4]=2;  
     elseif (string.find(msg,L["mine claimed"])) then FrameTex0173:SetTexture(Ll.Icons.Mine[4]); Ll.BGab.Time[2]=62;Ll.BGab.Color[2]=1;Ll.BGab.State[2]=2;
     elseif ((strmatch(msg,L["stables"]) and strmatch(msg,L["stables claimed"]))) then FrameTex0174:SetTexture(Ll.Icons.Stables[4]); Ll.BGab.Time[1]=62;Ll.BGab.Color[1]=1;Ll.BGab.State[1]=2;
     elseif (string.find(msg,L["lumber mill claimed"])) then FrameTex0175:SetTexture(Ll.Icons.Lumber[4]); Ll.BGab.Time[3]=62;Ll.BGab.Color[3]=1;Ll.BGab.State[3]=2;     
     elseif (string.find(msg,L["farm captured"])) then FrameTex0171:SetTexture(Ll.Icons.Farm[5]); Ll.BGab.Time[5]=-1;Ll.BGab.State[5]=1;     
     elseif (string.find(msg,L["blacksmith captured"])) then FrameTex0172:SetTexture(Ll.Icons.Blacksmith[5]); Ll.BGab.Time[4]=-1;Ll.BGab.State[4]=1;             
     elseif (string.find(msg,L["lumber mill captured"])) then FrameTex0175:SetTexture(Ll.Icons.Lumber[5]); Ll.BGab.Time[3]=-1;Ll.BGab.State[3]=1;                        
     elseif (string.find(msg,L["mine captured"])) then FrameTex0173:SetTexture(Ll.Icons.Mine[5]); Ll.BGab.Time[2]=-1;Ll.BGab.State[2]=1;             
     elseif (string.find(msg,L["stables captured"])) then FrameTex0174:SetTexture(Ll.Icons.Stables[5]); Ll.BGab.Time[1]=-1;Ll.BGab.State[1]=1;        
     end

--Assault  
  else
     if ((IsInRaid(arg1) and Faction==L["Alliance"]) or (not IsInRaid(arg1) and Faction==L["Horde"])) then
        if (string.find(msg,L["farm assaulted"])) then FrameTex0171:SetTexture(Ll.Icons.Farm[2]); Ll.BGab.Time[5] = 62;Ll.BGab.Color[5] = 0;Ll.BGab.State[5] = 2;        
        elseif (string.find(msg,L["blacksmith assaulted"])) then FrameTex0172:SetTexture(Ll.Icons.Blacksmith[2]); Ll.BGab.Time[4]=62;Ll.BGab.Color[4]=0;Ll.BGab.State[4]=2;
        elseif (string.find(msg,L["mine assaulted"])) then FrameTex0173:SetTexture(Ll.Icons.Mine[2]); Ll.BGab.Time[2]=62;Ll.BGab.Color[2]=0;Ll.BGab.State[2]=2;  
        elseif (string.find(msg,L["stables assaulted"])) then FrameTex0174:SetTexture(Ll.Icons.Stables[2]); Ll.BGab.Time[1]=62;Ll.BGab.Color[1]=0;Ll.BGab.State[1]=2;
        elseif (string.find(msg,L["lumber mill assaulted"])) then FrameTex0175:SetTexture(Ll.Icons.Lumber[2]); Ll.BGab.Time[3]=62;Ll.BGab.Color[3]=0;Ll.BGab.State[3]=2;   
        end
     elseif ((not IsInRaid(arg1) and Faction==L["Alliance"]) or (IsInRaid(arg1) and Faction==L["Horde"])) then
        if (string.find(msg,L["farm assaulted"])) then FrameTex0171:SetTexture(Ll.Icons.Farm[4]); Ll.BGab.Time[5]=62;Ll.BGab.Color[5]=1;Ll.BGab.State[5]=2;         
        elseif (string.find(msg,L["blacksmith assaulted"])) then FrameTex0172:SetTexture(Ll.Icons.Blacksmith[4]); Ll.BGab.Time[4]=62;Ll.BGab.Color[4]=1;Ll.BGab.State[4]=2;
        elseif (string.find(msg,L["mine assaulted"])) then FrameTex0173:SetTexture(Ll.Icons.Mine[4]); Ll.BGab.Time[2]=62;Ll.BGab.Color[2]=1;Ll.BGab.State[2]=2;
        elseif (string.find(msg,L["stables assaulted"])) then FrameTex0174:SetTexture(Ll.Icons.Stables[4]); Ll.BGab.Time[1]=62;Ll.BGab.Color[1]=1;Ll.BGab.State[1]=2;
        elseif (string.find(msg,L["lumber mill assaulted"])) then FrameTex0175:SetTexture(Ll.Icons.Lumber[4]); Ll.BGab.Time[3]=62;Ll.BGab.Color[3]=1;Ll.BGab.State[3]=2;
        end    
     end  
  end
end

if (event=="UPDATE_BATTLEFIELD_SCORE") then
RequestBattlefieldScoreData();
end

if (event=="ZONE_CHANGED_NEW_AREA") then
     if (InPrepa()) then Ll.BGab.State = {2,2,2,2,2}; else Ll.BGab.State = {3,3,3,3,3}; end
     for i=1,5 do Ll.BGab.Time[i]=-1; end
     
  if (InBattleground(1)) then     
     Frame010:Show();       
  else     
     Frame010:Hide();       
  end
end 
end
Frame010:SetScript("OnEvent",Frame010.OnEvent);

---------------------------------------------------------------------ScoreUpdate
local function MainUpdate()

---Scale
Frame010:SetScale(Ll.Scale[10]);
Frame017:SetScale(Ll.Scale[11]);

---Height/Width/Textures/Texts 1
local Bdr,Bdg,Bdb,Bda = unpack(Ll.Colors[16]);
local BBdr,BBdg,BBdb,BBda = unpack(Ll.Colors[17]);
Frame011:SetHeight(Ll.BarHeight[10]);
Frame011:SetWidth(Ll.BarWidth[10]);
Frame011:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame011:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);      

FrameTex011:SetTexture(Ll.Textures[Ll.TextureKey[10]]);
FrameTex011:SetPoint("LEFT",Frame011,"LEFT",Ll.TexXofs[10],Ll.TexYofs[10]);
FrameTex011:SetHeight(Ll.TexHeight[10]);
SCBars("FrameTex011",BarScore(Ll.AlwaysUp[1]),1600,10);

local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[10]);
local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[11]);
FrameTex011:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[10]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);

---Height/Width/Textures/Texts 2
Frame012:SetHeight(Ll.BarHeight[10]);
Frame012:SetWidth(Ll.BarWidth[10]);

Frame012:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame012:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);

FrameTex012:SetTexture(Ll.Textures[Ll.TextureKey[10]]);
FrameTex012:SetPoint("LEFT",Frame012,"LEFT",Ll.TexXofs[10],Ll.TexYofs[10]);
FrameTex012:SetHeight(Ll.TexHeight[10]);
SCBars("FrameTex012",BarScore(Ll.AlwaysUp[2]),1600,10);

local Hr1,Hg1,Hb1,Ha1 = unpack(Ll.Colors[12]);
local Hr2,Hg2,Hb2,Ha2 = unpack(Ll.Colors[13]);
FrameTex012:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[10]],Hr1,Hg1,Hb1,Ha1,Hr2,Hg2,Hb2,Ha2);

FrameText013:SetFont(Ll.Fonts[Ll.FontKey[10]],Ll.FontSize[10],Ll.FontOutline[Ll.FontOutlineKey[10]]);
if (Ll.AlwaysUp[1]~="") then
FrameText013:SetText(BarScore(Ll.AlwaysUp[1]));
end

FrameText014:SetFont(Ll.Fonts[Ll.FontKey[10]],Ll.FontSize[10],Ll.FontOutline[Ll.FontOutlineKey[10]]);
if (Ll.AlwaysUp[1]~="") then
FrameText014:SetText(bases(Ll.AlwaysUp[1]));
end

FrameText015:SetFont(Ll.Fonts[Ll.FontKey[10]],Ll.FontSize[10],Ll.FontOutline[Ll.FontOutlineKey[10]]);
if (Ll.AlwaysUp[2]~="") then
FrameText015:SetText(BarScore(Ll.AlwaysUp[2]));
end

FrameText016:SetFont(Ll.Fonts[Ll.FontKey[10]],Ll.FontSize[10],Ll.FontOutline[Ll.FontOutlineKey[10]]);
if (Ll.AlwaysUp[2]~="") then
FrameText016:SetText(bases(Ll.AlwaysUp[2]));
end 
end
Frame010:SetScript("OnUpdate",function() MainUpdate(); end);

----------------------------------------------------------------------BaseUpdate
function Frame018:OnUpdate(elapsed)
---Visibility
if (InPrepa() or Ll.Active.Base==0 or Ll.Active.Addon==0 or Ll.ActiveAB[2]==0) then
  Frame018:SetAlpha(0);
else
  Frame018:SetAlpha(1);
end

if (Ll.OnlyTime[11]==1) then
BaseBD010:Hide();
else
BaseBD010:Show();
end

Frame018:SetScale(Ll.Scale[12]);
-------Bases
local Bbdr,Bbdg,Bbdb,Bbda = unpack(Ll.Colors[200]);
local BbBdr,BbBdg,BbBdb,BbBda = unpack(Ll.Colors[201]);
BaseBD010:SetBackdropColor(Bbdr,Bbdg,Bbdb,Bbda);
BaseBD010:SetBackdropBorderColor(BbBdr,BbBdg,BbBdb,BbBda);

-------Timers
local Adr,Adg,Adb,Ada = unpack(Ll.Colors[208]);
local ABdr,ABdg,ABdb,ABda = unpack(Ll.Colors[209]);
local All1r,All1g,All1b,All1a = unpack(Ll.Colors[202]);
local All2r,All2g,All2b,All2a = unpack(Ll.Colors[203]);
local H1r,H1g,H1b,H1a = unpack(Ll.Colors[204]);
local H2r,H2g,H2b,H2a = unpack(Ll.Colors[205]);
local N1r,N1g,N1b,N1a = unpack(Ll.Colors[206]);
local N2r,N2g,N2b,N2a = unpack(Ll.Colors[207]);

for i = 1,5 do
   local TBar,TBarTex,TBarText,TBarTime,TBarState = _G[TBar:format(i)],_G[TBarTex:format(i)],_G[TBarText:format(i)],_G[TBarTime:format(i)],_G[TBarState:format(i)];
   TBar:SetBackdropColor(Adr,Adg,Adb,Ada);
   TBar:SetBackdropBorderColor(ABdr,ABdg,ABdb,ABda);   
   TBar:SetAlpha(1);      
   TBar:SetHeight(Ll.BarHeight[11]);
   TBar:SetWidth(Ll.BarWidth[11]);   
   TBarTex:SetTexture(Ll.Textures[Ll.TextureKey[11]]); 
   TBarTex:SetPoint("LEFT",TBar,"LEFT",2,Ll.TexYofs[11]);  
   TBarTex:SetHeight(Ll.TexHeight[11]);      
   TBarState:SetTexture(Ll.Textures[Ll.TextureKey[11]]);   
   TBarText:SetFont(Ll.Fonts[Ll.FontKey[11]],Ll.FontSize[11],Ll.FontOutline[Ll.FontOutlineKey[11]]);   
   TBarTime:SetPoint("LEFT",TBar,"LEFT",Ll.BaseTimeXofs[11]+5,Ll.BaseTimeYofs[11]);
   TBarTime:SetFont(Ll.Fonts[Ll.FontKey[11]],Ll.FontSize[11],Ll.FontOutline[Ll.FontOutlineKey[11]]);
   
   TimersBG(Ll.OnlyTime[11],Ll.BGab.Time,i,TBarText,Ll.BaseTxtXofs[11],Ll.BaseTxtYofs[11],TBar,"BaseBD010");
   
   if (Ll.BGab.Color[i]==0) then  
     TBarTex:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[11]],All1r,All1g,All1b,All1a,All2r,All2g,All2b,All2a);
   else
     TBarTex:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[11]],H1r,H1g,H1b,H1a,H2r,H2g,H2b,H2a);
   end
   
   if (Ll.BGab.State[i]==0) then
    TBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[11]],All1r,All1g,All1b,All1a,All2r,All2g,All2b,All2a);
   elseif (Ll.BGab.State[i]==1) then
    TBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[11]],H1r,H1g,H1b,H1a,H2r,H2g,H2b,H2a);
   elseif (Ll.BGab.State[i]==2) then 
    TBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[11]],N1r,N1g,N1b,N1a,N2r,N2g,N2b,N2a);
   else
    TBarState:SetAlpha(0);
   end
   
   Ll.BGab.Time[i]=Ll.BGab.Time[i]-elapsed;
   TimerBG_1(TBar,TBarTex,TBarTime,Ll.BGab.Time[i],62);
   TimerBG_2(i,5,Ll.BarSpacing[11],Ll.BarsXofs[11],Ll.BarsYofs[11],"Frame018",Ll.ABBars,Ll.BGab.Time,11);
end

end
Frame018:SetScript("OnUpdate",Frame018.OnUpdate);


function Frame018bis:OnUpdate(elapsed)
  if (InBattleground(1)) then
    Frame018:Show();
  elseif (Ll.TestMode[11]==1) then
    Frame018:Show();    
     if (Ll.BGab.Time[1]<0 and Ll.BGab.Time[2]<0 and Ll.BGab.Time[3]<0 and Ll.BGab.Time[4]<0 and Ll.BGab.Time[5]<0) then
        Frame018:SetMovable(false);
        Frame018:EnableMouse(false);
        Ll.TestMode[11]=0;
     end
  else  
    Frame018:Hide();      
  end
  
---Score
if (InPrepa() or Ll.Active.Score==0 or Ll.Active.Addon==0 or not InBattleground(1)) then
  Frame010:Hide();
else
  Frame010:Show();
end

if (Ll.ActiveAB[1]==1) then
 Frame017:Show();
else
 Frame017:Hide();
end  
end
Frame018bis:SetScript("OnUpdate",Frame018bis.OnUpdate);
------------------------------------------------------------------Move-functions
function MoveArathi()
if (Frame010:IsVisible()) then
MoveFrame(10);
MoveFrame(11,11);
MoveFrame(12,12);
MoveFrame(13);
MoveFrame(14);
MoveFrame(15);
MoveFrame(16);
if (Ll.ActiveAB[1]==1) then
  MoveFrame(17);
end
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
end
end

-------------------------------------------------------------Test-functions-Base
function TestArathi()
if (InBattleground(1)) then   
   MoveFrame(18);
else
   TestTimers("Frame018",1,Ll.BGab.Time,11,Ll.BGab.Color,Ll.BGab.State);
   MoveFrame(18);
end
end





