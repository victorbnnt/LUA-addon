------------------------------Eye-Of-The-Storm----------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
local _,Faction = UnitFactionGroup("player");
local Texts = {L["Draenei ruins"],L["fel reaver"],L["eds"],L["mage"]};
local KBarText,KBarState = "KBarText0%d","KBarState0%d";
--------------------------------------------------------------------------------
---MainFrame
local Frame040 = CreateFrame("Frame","Frame040",UIParent);
Frame040:RegisterEvent("ADDON_LOADED");
Frame040:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame040:RegisterEvent("CHAT_MSG_BG_SYSTEM_ALLIANCE");
Frame040:RegisterEvent("CHAT_MSG_BG_SYSTEM_HORDE");
Frame040:RegisterEvent("UPDATE_BATTLEFIELD_SCORE");
Frame040:SetHeight(70);
Frame040:SetWidth(200);
Frame040:RegisterForDrag("LeftButton");

---Score Bars
local Frame041 = CreateFrame("Frame","Frame041",Frame040);
Frame041:RegisterForDrag("LeftButton");
local FrameTex041 = Frame041:CreateTexture("FrameTex041");

local Frame042 = CreateFrame("Frame","Frame042",Frame040);
Frame042:RegisterForDrag("LeftButton");
local FrameTex042 = Frame042:CreateTexture("FrameTex042");

---Score text
local Frame043 = CreateFrame("Frame","Frame043",Frame040);
Frame043:RegisterForDrag("LeftButton");
Frame043:SetHeight(15);
Frame043:SetWidth(70);
local FrameText043 = Frame043:CreateFontString("FrameText043");
FrameText043:SetPoint("CENTER",Frame043,"CENTER",0,0);

local Frame044 = CreateFrame("Frame","Frame044",Frame040);
Frame044:RegisterForDrag("LeftButton");
Frame044:SetHeight(15);
Frame044:SetWidth(70);
local FrameText044 = Frame044:CreateFontString("FrameText044");
FrameText044:SetPoint("CENTER",Frame044,"CENTER",0,0);

local Frame045 = CreateFrame("Frame","Frame045",Frame040);
Frame045:RegisterForDrag("LeftButton");
Frame045:SetHeight(15);
Frame045:SetWidth(70);
local FrameText045 = Frame045:CreateFontString("FrameText045");
FrameText045:SetPoint("CENTER",Frame045,"CENTER",0,0);

local Frame046 = CreateFrame("Frame","Frame046",Frame040);
Frame046:RegisterForDrag("LeftButton");
Frame046:SetHeight(15);
Frame046:SetWidth(70);
local FrameText046 = Frame046:CreateFontString("FrameText046");
FrameText046:SetPoint("CENTER",Frame046,"CENTER",0,0);

local Frame047 = CreateFrame("Button","Frame047",Frame040,"SecureActionButtonTemplate");
Frame047:SetWidth(80); 
Frame047:SetHeight(15); 
Frame047:EnableMouse(true);
Frame047:SetMovable(false);
local FrameText047 = Frame047:CreateFontString("FrameText047");
FrameText047:SetPoint("LEFT",Frame047,"LEFT",0,0);
local FrameTex047 = Frame047:CreateTexture("FrameTex047");
FrameTex047:SetPoint("LEFT",Frame047,"LEFT",0,-10);
FrameTex047:SetHeight(3);

---Carrier Health
local Frame048 = CreateFrame("Frame","Frame048",Frame040);
Frame048:SetHeight(15);
Frame048:SetWidth(50);
local FrameText048 = Frame048:CreateFontString("FrameText048");
FrameText048:SetPoint("CENTER",Frame048,"CENTER",0,0);

--------------------------------------------------------------------Bases/Timers
local Frame049 = CreateFrame("Frame","Frame049",UIParent);
local Frame049bis = CreateFrame("Frame","Frame049bis",UIParent);
Frame049:SetHeight(25);
Frame049:SetWidth(25);
Frame049:RegisterForDrag("LeftButton");
local BaseBD040 = CreateFrame("Frame","BaseBD040",Frame049);
BaseBD040:SetPoint("BOTTOM","Frame049","TOP",0,0);
BaseBD040:SetWidth(15);
BaseBD040:SetHeight(72);

---------------------------------------------------------------------------Event
function Frame040:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
      Frame040:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame040:SetBackdropColor(0,0,0,0);
      Frame040:SetBackdropBorderColor(0,0,0,0);
      
      Frame041:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame042:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      
      Frame043:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame043:SetBackdropColor(0,0,0,0);
      Frame043:SetBackdropBorderColor(0,0,0,0);
      
      Frame044:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame044:SetBackdropColor(0,0,0,0);
      Frame044:SetBackdropBorderColor(0,0,0,0);
      
      Frame045:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame045:SetBackdropColor(0,0,0,0);
      Frame045:SetBackdropBorderColor(0,0,0,0);
      
      Frame046:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame046:SetBackdropColor(0,0,0,0);
      Frame046:SetBackdropBorderColor(0,0,0,0);
      
      Frame047:RegisterForDrag("LeftButton");
      Frame047:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame047:SetBackdropColor(0,0,0,0);
      Frame047:SetBackdropBorderColor(0,0,0,0);
      Frame047:SetScript("OnEnter",function() Frame047:SetBackdropColor(0.4,0.5,0.4,0.8); end);
      Frame047:SetScript("OnLeave",function() Frame047:SetBackdropColor(0,0,0,0); end);
      Frame047:SetAttribute("type1", "macro");
      FrameTex047:SetTexture(Ll.Textures[1]);
      FrameTex047:SetWidth(Ll.TexWidth[41]);      
      
      Frame048:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame048:SetBackdropColor(0,0,0,0);
      Frame048:SetBackdropBorderColor(0,0,0,0);
      
      Frame049:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});      
      Frame049:SetBackdropColor(0,0,0,0);
      Frame049:SetBackdropBorderColor(0,0,0,0);
      
      BaseBD040:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      
      for i = 1,4 do
        local KBarText,KBarState = KBarText:format(i),KBarState:format(i);       
        
        local KBarText = Frame049:CreateFontString(KBarText,"OVERLAY");
              KBarText:SetPoint("RIGHT",Frame049,"LEFT",2,Ll.TimerPos[i]+20);
              KBarText:SetFont(Ll.Fonts[Ll.FontKey[42]],Ll.FontSize[42],Ll.FontOutline[Ll.FontOutlineKey[42]]);
              KBarText:SetText(Texts[5-i]);
        local KBarState = BaseBD040:CreateTexture(KBarState,"ARTWORK");  --texture bases
              KBarState:SetPoint("BOTTOM",BaseBD040,"BOTTOM",0,(18*i)-15);
              KBarState:SetHeight(13);
              KBarState:SetWidth(13);

     end       
         
   FDragStart(40);FDragStop(40);
   FDragStart(41);FDragStop(40,41);
   FDragStart(42);FDragStop(40,42);   
   FDragStart(43);FDragStop(40,43);
   FDragStart(44);FDragStop(40,44);
   FDragStart(45);FDragStop(40,45);   
   FDragStart(46);FDragStop(40,46); 
   FDragStart(47);FDragStop(40,47);
   FDragStart(48);FDragStop(40,48);
   FDragStart(49);FDragStop(49);     
   
   Frame040:SetPoint(unpack(Ll.FramePos[40]));
   Frame041:SetPoint(unpack(Ll.FramePos[41]));
   Frame042:SetPoint(unpack(Ll.FramePos[42]));
   Frame043:SetPoint(unpack(Ll.FramePos[43]));
   Frame044:SetPoint(unpack(Ll.FramePos[44]));
   Frame045:SetPoint(unpack(Ll.FramePos[45]));
   Frame046:SetPoint(unpack(Ll.FramePos[46]));
   Frame047:SetPoint(unpack(Ll.FramePos[47]));
   Frame048:SetPoint(unpack(Ll.FramePos[48]));    
   Frame049:SetPoint(unpack(Ll.FramePos[49]));

      if (InPrepa()) then Ll.BGeots.State = {2,2,2,2}; else Ll.BGeots.State = {3,3,3,3}; end

   if (InBattleground(4)) then
     Frame040:Show();     
   else
     Frame040:Hide();     
   end      
end
end

if (event=="CHAT_MSG_BG_SYSTEM_ALLIANCE") then
local arg1=...;
msg=arg1;
          if (string.match(msg,L["has taken the flag"]) and string.match(msg,L["Alliance"])) then
                      Ll.EotsCarrier[1] = nil;
                      Ll.CarrierHealth[3] = "";
                      Ll.TexWidth[41] = 60;
                      --Frame047:SetAlpha(0);          
          elseif (string.match(msg,L["has taken the flag"]) and not string.match(msg,L["Alliance"])) then
                      Ll.EotsCarrier[1] = eotsCarrier(msg);                                        
          elseif (string.match(msg,L["have captured the flag"]) or string.match(msg,L["has been dropped"])) then
                      Ll.EotsCarrier[1] = nil;
                      Ll.CarrierHealth[3] = "";
                      Ll.TexWidth[41] = 60;                           
          end 
          
        if (string.find(msg,L["draenei captured"])) then Ll.BGeots.State[4]=0;
          elseif (string.find(msg,L["felreaver captured"])) then Ll.BGeots.State[3]=0;
          elseif (string.find(msg,L["eds captured"])) then Ll.BGeots.State[2]=0;
          elseif (string.find(msg,L["mage captured"])) then Ll.BGeots.State[1]=0;
          elseif (string.find(msg,L["draenei lost"])) then Ll.BGeots.State[4]=2;
          elseif (string.find(msg,L["felreaver lost"])) then Ll.BGeots.State[3]=2;
          elseif (string.find(msg,L["eds lost"])) then Ll.BGeots.State[2]=2;
          elseif (string.find(msg,L["mage lost"])) then Ll.BGeots.State[1]=2;
        end      
end
if (event=="CHAT_MSG_BG_SYSTEM_HORDE") then
local arg1=...;
msg=arg1;
          if (string.match(msg,L["has taken the flag"])) then
                      Ll.EotsCarrier[1] = eotsCarrier(msg);                        
          elseif (string.match(msg,L["have captured the flag"]) or string.match(msg,L["has been dropped"])) then
                      Ll.EotsCarrier[1] = nil;
                      Ll.CarrierHealth[3] = "";
                      Ll.TexWidth[41] = 60;                         
          end
          
        if (string.find(msg,L["draenei captured"])) then Ll.BGeots.State[4]=1;
          elseif (string.find(msg,L["felreaver captured"])) then Ll.BGeots.State[3]=1;
          elseif (string.find(msg,L["eds captured"])) then Ll.BGeots.State[2]=1;
          elseif (string.find(msg,L["mage captured"])) then Ll.BGeots.State[1]=1;
          elseif (string.find(msg,L["draenei lost"])) then Ll.BGeots.State[4]=2;
          elseif (string.find(msg,L["felreaver lost"])) then Ll.BGeots.State[3]=2;
          elseif (string.find(msg,L["eds lost"])) then Ll.BGeots.State[2]=2;
          elseif (string.find(msg,L["mage lost"])) then Ll.BGeots.State[1]=2;
        end         
end

if (event=="UPDATE_BATTLEFIELD_SCORE") then
RequestBattlefieldScoreData();
end

if (event=="ZONE_CHANGED_NEW_AREA") then
  if (InPrepa()) then Ll.BGeots.State = {2,2,2,2}; else Ll.BGeots.State = {3,3,3,3}; end

  Ll.EotsCarrier[1] = nil;
  Ll.CarrierHealth[3] = "";
  Ll.TexWidth[41] = 60;
  if (InBattleground(4)) then
     Frame040:Show();     
  else     
     Frame040:Hide();     
  end
end 
end
Frame040:SetScript("OnEvent",Frame040.OnEvent);

--------------------------------------------------------------------------Update
local function MainUpdate()

---Visibility
if (InPrepa() or Ll.Active.Score==0 or Ll.Active.Addon==0) then
  Frame040:SetAlpha(0);
else
  Frame040:SetAlpha(1);
end

---Scale
Frame040:SetScale(Ll.Scale[40]);

---Height/Width/Textures/Texts 1
local Bdr,Bdg,Bdb,Bda = unpack(Ll.Colors[46]);
local BBdr,BBdg,BBdb,BBda = unpack(Ll.Colors[47]);
Frame041:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame041:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame041:SetHeight(Ll.BarHeight[40]);
Frame041:SetWidth(Ll.BarWidth[40]);

FrameTex041:SetTexture(Ll.Textures[Ll.TextureKey[40]]);
FrameTex041:SetPoint("LEFT",Frame041,"LEFT",Ll.TexXofs[40],Ll.TexYofs[40]);
FrameTex041:SetHeight(Ll.TexHeight[40]);
SCBars("FrameTex041",Eotscore(Ll.AlwaysUp[1]),1600,40);

local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[40]);
local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[41]);
FrameTex041:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[40]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);

---Height/Width/Textures/Texts 2
Frame042:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame042:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame042:SetHeight(Ll.BarHeight[40]);
Frame042:SetWidth(Ll.BarWidth[40]);

FrameTex042:SetTexture(Ll.Textures[Ll.TextureKey[40]]);
FrameTex042:SetPoint("LEFT",Frame042,"LEFT",Ll.TexXofs[40],Ll.TexYofs[40]);
FrameTex042:SetHeight(Ll.TexHeight[40]);
SCBars("FrameTex042",Eotscore(Ll.AlwaysUp[2]),1600,40);

local Hr1,Hg1,Hb1,Ha1 = unpack(Ll.Colors[42]);
local Hr2,Hg2,Hb2,Ha2 = unpack(Ll.Colors[43]);
FrameTex042:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[40]],Hr1,Hg1,Hb1,Ha1,Hr2,Hg2,Hb2,Ha2);

FrameText043:SetFont(Ll.Fonts[Ll.FontKey[40]],Ll.FontSize[40],Ll.FontOutline[Ll.FontOutlineKey[40]]);
if (Ll.AlwaysUp[1]~="") then
FrameText043:SetText(Eotscore(Ll.AlwaysUp[1]));
end

FrameText044:SetFont(Ll.Fonts[Ll.FontKey[40]],Ll.FontSize[40],Ll.FontOutline[Ll.FontOutlineKey[40]]);
if (Ll.AlwaysUp[1]~="") then
FrameText044:SetText(bases1(Ll.AlwaysUp[1]));
end

FrameText045:SetFont(Ll.Fonts[Ll.FontKey[40]],Ll.FontSize[40],Ll.FontOutline[Ll.FontOutlineKey[40]]);
if (Ll.AlwaysUp[2]~="") then
FrameText045:SetText(Eotscore(Ll.AlwaysUp[2]));
end

FrameText046:SetFont(Ll.Fonts[Ll.FontKey[40]],Ll.FontSize[40],Ll.FontOutline[Ll.FontOutlineKey[40]]);
if (Ll.AlwaysUp[2]~="") then
FrameText046:SetText(bases1(Ll.AlwaysUp[2]));
end

FrameText047:SetFont(Ll.Fonts[Ll.FontKey[41]],Ll.FontSize[41],Ll.FontOutline[Ll.FontOutlineKey[41]]);
FrameText048:SetFont(Ll.Fonts[Ll.FontKey[41]],Ll.FontSize[41],Ll.FontOutline[Ll.FontOutlineKey[41]]);

--Check carrier with targets
IsCarrierE(Faction)
for i=1,GetNumRaidMembers() do            
    local TargetID = format("raid%d%s",i,"target");
    local Target = UnitName(TargetID);
    local TargetTargetID = format("raid%d%s",i,"targettarget");
    local TargetTarget = UnitName(TargetTargetID);
     if (Target~=nil) then 
        IsCarrierZE(TargetID);        
        if (TargetTarget~=nil) then
            IsCarrierZE(TargetTargetID);            
        end          
     end
end

if (Ll.EotsCarrier[1]==nil) then
             Frame047:Hide();
             FrameText047:SetText("");
             FrameText048:SetText("");
             FrameTex047:SetAlpha(0);                                  
             Frame047:SetAttribute("macrotext",format("/target %s",""));
else         
             if (Frame047:IsVisible()) then
               FrameText048:SetText(Ll.CarrierHealth[3]);
               FrameTex047:SetWidth(Ll.TexWidth[41]);
             end      
             Frame047:Show();
             FrameText047:SetText(Ll.EotsCarrier[1]);                                                       
             for i=1,GetNumBattlefieldScores() do
                  local Name,_,_,_,_,_,_,_,class = GetBattlefieldScore(i);               
                      local name = FormatCarrier(Name);                                                                                        
                  if (string.match(Ll.EotsCarrier[1],name)~=nil) then
                      local A,B,C,D = ColorCarrier(class);                                           
                      FrameText047:SetTextColor(A,B,C,D);
                      FrameTex047:SetGradientAlpha("HORIZONTAL",A,B,C,D,A,B,C,D);
                      Frame047:SetAttribute("macrotext",format("/target %s",Name));                                   
                  end
             end
                                   
end
end
Frame040:SetScript("OnUpdate",function() MainUpdate(); end);

----------------------------------------------------------------------BaseUpdate
function Frame049:OnUpdate(elapsed)
---Visibility
if (InPrepa() or Ll.Active.Base==0  or Ll.Active.Addon==0 or Ll.ActiveEOTS[2]==0) then
  Frame049:SetAlpha(0);
else
  Frame049:SetAlpha(1);
end

Frame049:SetScale(Ll.Scale[42]);
-------Bases
local Bbdr,Bbdg,Bbdb,Bbda = unpack(Ll.Colors[400]);
local BbBdr,BbBdg,BbBdb,BbBda = unpack(Ll.Colors[401]);
BaseBD040:SetBackdropColor(Bbdr,Bbdg,Bbdb,Bbda);
BaseBD040:SetBackdropBorderColor(BbBdr,BbBdg,BbBdb,BbBda);

-------Timers
local All1r,All1g,All1b,All1a = unpack(Ll.Colors[402]);
local All2r,All2g,All2b,All2a = unpack(Ll.Colors[403]);
local H1r,H1g,H1b,H1a = unpack(Ll.Colors[404]);
local H2r,H2g,H2b,H2a = unpack(Ll.Colors[405]);
local N1r,N1g,N1b,N1a = unpack(Ll.Colors[406]);
local N2r,N2g,N2b,N2a = unpack(Ll.Colors[407]);

for i = 1,4 do
   local KBarText,KBarState = _G[KBarText:format(i)],_G[KBarState:format(i)];   
   KBarState:SetTexture(Ll.Textures[Ll.TextureKey[41]]);
   KBarText:SetFont(Ll.Fonts[Ll.FontKey[42]],Ll.FontSize[42],Ll.FontOutline[Ll.FontOutlineKey[42]]);   
   
   if (Ll.BGeots.State[i]==0) then
    KBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[41]],All1r,All1g,All1b,All1a,All2r,All2g,All2b,All2a);
   elseif (Ll.BGeots.State[i]==1) then
    KBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[41]],H1r,H1g,H1b,H1a,H2r,H2g,H2b,H2a);
   elseif (Ll.BGeots.State[i]==2) then 
    KBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[41]],N1r,N1g,N1b,N1a,N2r,N2g,N2b,N2a);
   else
    KBarState:SetAlpha(0);
   end   
end
end
Frame049:SetScript("OnUpdate",Frame049.OnUpdate);

function Frame049bis:OnUpdate(elapsed)
  if (InBattleground(4)) then
    Frame049:Show();
  elseif (Ll.TestMode[41]==1) then
    Frame049:Show();     
  else  
    Frame049:Hide();      
  end  
end
Frame049bis:SetScript("OnUpdate",Frame049bis.OnUpdate);

------------------------------------------------------------------Move-functions
function MoveEots()
if (Frame040:IsVisible()) then
MoveFrame(40);
MoveFrame(41,41);
MoveFrame(42,42);
MoveFrame(43);
MoveFrame(44);
MoveFrame(45);
MoveFrame(46);
MoveFrame(47);
MoveFrame(48);
--if (Ll.ActiveEOTS[1]==1) then
--  MoveFrame(481);
--end
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
end
end

-------------------------------------------------------------Test-functions-Base
function TestEOTS()
if (InBattleground(4)) then   
   MoveFrame(49);
else
   TestTimers2("Frame049",4,nil,41,nil,Ll.BGeots.State)
   MoveFrame(49);
end
end