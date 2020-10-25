--------------------------------Alterac-Valley----------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
local _,Faction = UnitFactionGroup("player");
local TextsAVT = {L["Ndun"],L["Sdun"],L["icewingt"],L["stoneheartht"],L["icebloodt"],L["towerpoint"],L["eastfrost"],L["westfrost"]};
local TextsAVG = {L["Stormpike Aid Station"],L["Stormpike grave"],L["stonehearth grave"],L["Snowfall grave"],L["Iceblood grave"],L["Frostwolf grave"],L["Frostwolf Relief Hut"]}; 
local TextsAVM = {L["irondeep"],L["coldtooth"]};
local UBar,UBarTex,UBarText = "UBar0%d","UBarTex0%d","UBarText0%d";
local UBarTime,UBarState = "UBarTime0%d","UBarState0%d";
local VBar,VBarTex,VBarText = "VBar0%d","VBarTex0%d","VBarText0%d";
local VBarTime,VBarState = "VBarTime0%d","VBarState0%d";
local WBarText,WBarState = "WBarText0%d","WBarState0%d";
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
---MainFrame
local Frame060 = CreateFrame("Frame","Frame060",UIParent);
Frame060:RegisterEvent("ADDON_LOADED");
Frame060:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame060:RegisterEvent("CHAT_MSG_BG_SYSTEM_ALLIANCE");
Frame060:RegisterEvent("CHAT_MSG_BG_SYSTEM_HORDE");
Frame060:RegisterEvent("UPDATE_BATTLEFIELD_SCORE");
Frame060:RegisterEvent("CHAT_MSG_MONSTER_YELL");
Frame060:SetHeight(70);
Frame060:SetWidth(200);
Frame060:RegisterForDrag("LeftButton");

---Score Bars
local Frame061 = CreateFrame("Frame","Frame061",Frame060);
Frame061:RegisterForDrag("LeftButton");
local FrameTex061 = Frame061:CreateTexture("FrameTex061");

local Frame062 = CreateFrame("Frame","Frame062",Frame060);
Frame062:RegisterForDrag("LeftButton");
local FrameTex062 = Frame062:CreateTexture("FrameTex062");

---Score text
local Frame063 = CreateFrame("Frame","Frame063",Frame060);
Frame063:RegisterForDrag("LeftButton");
Frame063:SetHeight(15);
Frame063:SetWidth(70);
local FrameText063 = Frame063:CreateFontString("FrameText063");
FrameText063:SetPoint("CENTER",Frame063,"CENTER",0,0);

local Frame064 = CreateFrame("Frame","Frame064",Frame060);
Frame064:RegisterForDrag("LeftButton");
Frame064:SetHeight(15);
Frame064:SetWidth(70);
local FrameText064 = Frame064:CreateFontString("FrameText064");
FrameText064:SetPoint("CENTER",Frame064,"CENTER",0,0);

--------------------------------------------------------------------Bases/Timers
local Frame065 = CreateFrame("Frame","Frame065",UIParent);
local Frame066 = CreateFrame("Frame","Frame066",UIParent);
local Frame067 = CreateFrame("Frame","Frame067",UIParent);
local Frame065bis = CreateFrame("Frame","Frame065bis",UIParent);
Frame065:SetHeight(25);
Frame065:SetWidth(25);
Frame065:RegisterForDrag("LeftButton");
Frame066:SetHeight(25);
Frame066:SetWidth(25);
Frame066:RegisterForDrag("LeftButton");
Frame067:SetHeight(25);
Frame067:SetWidth(25);
Frame067:RegisterForDrag("LeftButton");
local BaseBD060 = CreateFrame("Frame","BaseBD060",Frame065);
BaseBD060:SetPoint("BOTTOM","Frame065","TOP",0,0);
BaseBD060:SetWidth(15);
BaseBD060:SetHeight(145);
local BaseBD061 = CreateFrame("Frame","BaseBD061",Frame066);
BaseBD061:SetPoint("BOTTOM","Frame066","TOP",0,0);
BaseBD061:SetWidth(15);
BaseBD061:SetHeight(127);
local BaseBD062 = CreateFrame("Frame","BaseBD062",Frame067);
BaseBD062:SetPoint("BOTTOM","Frame067","TOP",0,0);
BaseBD062:SetWidth(15);
BaseBD062:SetHeight(36);

---------------------------------------------------------------------------Event
function Frame060:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
      Frame060:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame060:SetBackdropColor(0,0,0,0);
      Frame060:SetBackdropBorderColor(0,0,0,0);
      
      Frame061:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame062:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
            
      Frame063:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame063:SetBackdropColor(0,0,0,0);
      Frame063:SetBackdropBorderColor(0,0,0,0);
      
      Frame064:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame064:SetBackdropColor(0,0,0,0);
      Frame064:SetBackdropBorderColor(0,0,0,0);
      
      Frame065:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});      
      Frame065:SetBackdropColor(0,0,0,0);
      Frame065:SetBackdropBorderColor(0,0,0,0);
      
      Frame066:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});      
      Frame066:SetBackdropColor(0,0,0,0);
      Frame066:SetBackdropBorderColor(0,0,0,0);
      
      Frame067:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});      
      Frame067:SetBackdropColor(0,0,0,0);
      Frame067:SetBackdropBorderColor(0,0,0,0);
      
      BaseBD060:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      BaseBD061:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      BaseBD062:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      
       for i = 1,8 do
        local UBar,UBarTex,UBarText,UBarTime,UBarState = UBar:format(i),UBarTex:format(i),UBarText:format(i),UBarTime:format(i),UBarState:format(i);        
        local UBar = CreateFrame("Frame",UBar,Frame065);
              UBar:SetPoint("BOTTOMRIGHT",Frame065,"TOPLEFT",0,Ll.TimerPos[i]);
              UBar:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});                  
              UBar:SetFrameLevel(0);
              UBar:SetAlpha(0);
        local UBarTex = UBar:CreateTexture(UBarTex,"ARTWORK");
              UBarTex:SetPoint("LEFT",UBar,"LEFT",2,0);
        local UBarTime = UBar:CreateFontString(UBarTime,"OVERLAY"); 
              UBarTime:SetPoint("LEFT",UBar,"LEFT",2,0);
        local UBarText = Frame065:CreateFontString(UBarText,"OVERLAY");
              UBarText:SetFont(Ll.Fonts[Ll.FontKey[61]],Ll.FontSize[61],Ll.FontOutline[Ll.FontOutlineKey[61]]);
              UBarText:SetText(TextsAVT[9-i]);
        local UBarState = BaseBD060:CreateTexture(UBarState,"ARTWORK");  --texture bases
              UBarState:SetPoint("BOTTOM",BaseBD060,"BOTTOM",0,(18*i)-15);
              UBarState:SetHeight(13);
              UBarState:SetWidth(13);
        Ll.AVTBars[i] = UBar; 
     end
     
       for i = 1,7 do
        local VBar,VBarTex,VBarText,VBarTime,VBarState = VBar:format(i),VBarTex:format(i),VBarText:format(i),VBarTime:format(i),VBarState:format(i);        
        local VBar = CreateFrame("Frame",VBar,Frame066);
              VBar:SetPoint("BOTTOMRIGHT",Frame066,"TOPLEFT",0,Ll.TimerPos[i]);
              VBar:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});                  
              VBar:SetFrameLevel(0);
              VBar:SetAlpha(0);
        local VBarTex = VBar:CreateTexture(VBarTex,"ARTWORK");
              VBarTex:SetPoint("LEFT",VBar,"LEFT",2,0);
        local VBarTime = VBar:CreateFontString(VBarTime,"OVERLAY"); 
              VBarTime:SetPoint("LEFT",VBar,"LEFT",2,0);
        local VBarText = Frame066:CreateFontString(VBarText,"OVERLAY");
              VBarText:SetFont(Ll.Fonts[Ll.FontKey[61]],Ll.FontSize[61],Ll.FontOutline[Ll.FontOutlineKey[61]]);
              VBarText:SetText(TextsAVG[8-i]);
        local VBarState = BaseBD061:CreateTexture(VBarState,"ARTWORK");  --texture bases
              VBarState:SetPoint("BOTTOM",BaseBD061,"BOTTOM",0,(18*i)-15);
              VBarState:SetHeight(13);
              VBarState:SetWidth(13);
        Ll.AVGBars[i] = VBar; 
     end
     
     for i = 1,2 do
        local WBarText,WBarState = WBarText:format(i),WBarState:format(i);       
        
        local WBarText = Frame067:CreateFontString(WBarText,"OVERLAY");
              WBarText:SetPoint("RIGHT",Frame067,"LEFT",2,Ll.TimerPos[i]+20);
              WBarText:SetFont(Ll.Fonts[Ll.FontKey[61]],Ll.FontSize[61],Ll.FontOutline[Ll.FontOutlineKey[61]]);
              WBarText:SetText(TextsAVM[3-i]);
        local WBarState = BaseBD062:CreateTexture(WBarState,"ARTWORK");  --texture bases
              WBarState:SetPoint("BOTTOM",BaseBD062,"BOTTOM",0,(18*i)-15);
              WBarState:SetHeight(13);
              WBarState:SetWidth(13);
    end   
              
   FDragStart(60);FDragStop(60);
   FDragStart(61);FDragStop(60,61);
   FDragStart(62);FDragStop(60,62);   
   FDragStart(63);FDragStop(60,63);
   FDragStart(64);FDragStop(60,64);
   FDragStart(65);FDragStop(65);
   FDragStart(66);FDragStop(66);
   FDragStart(67);FDragStop(67);
   
   Frame060:SetPoint(unpack(Ll.FramePos[60]));
   Frame061:SetPoint(unpack(Ll.FramePos[61]));
   Frame062:SetPoint(unpack(Ll.FramePos[62]));
   Frame063:SetPoint(unpack(Ll.FramePos[63]));
   Frame064:SetPoint(unpack(Ll.FramePos[64]));
   Frame065:SetPoint(unpack(Ll.FramePos[65]));
   Frame066:SetPoint(unpack(Ll.FramePos[66]));
   Frame067:SetPoint(unpack(Ll.FramePos[67]));

      if (InPrepa()) then Ll.BGavt.State = {2,2,2,2,2,2,2,2}; else Ll.BGavt.State = {3,3,3,3,3,3,3,3}; end
      if (InPrepa()) then Ll.BGavg.State = {1,1,1,2,0,0,0}; else Ll.BGavg.State = {3,3,3,3,3,3,3}; end
      if (InPrepa()) then Ll.BGavm.State = {2,2}; else Ll.BGavm.State = {3,3}; end
                       
   if (InBattleground(6)) then
     Frame060:Show();     
   else
     Frame060:Hide();     
   end      
end
end

if (event == "CHAT_MSG_MONSTER_YELL") then
local msg=...;
     
--TOWERS    
--assaulted
      if (string.find(msg,L["NDun assaulted"])) then Ll.BGavt.Time[8]=242;Ll.BGavt.Color[8]=1;Ll.BGavt.State[8]=2;         
      elseif (string.find(msg,L["SDun assaulted"])) then Ll.BGavt.Time[7]=242;Ll.BGavt.Color[7]=1;Ll.BGavt.State[7]=2;          
      elseif (string.find(msg,L["IcewingT assaulted"])) then Ll.BGavt.Time[6]=242;Ll.BGavt.Color[6]=1;Ll.BGavt.State[6]=2;       
      elseif (string.find(msg,L["StonehearthT assaulted"])) then Ll.BGavt.Time[5]=242;Ll.BGavt.Color[5]=1;Ll.BGavt.State[5]=2;                  
      elseif (string.find(msg,L["IcebloodT assaulted"]) and string.find(msg,L["assaultedice"])) then Ll.BGavt.Time[4]=242;Ll.BGavt.Color[4]=0;Ll.BGavt.State[4]=2;             
      elseif (string.find(msg,L["TowerPoint assaulted"])) then Ll.BGavt.Time[3]=242;Ll.BGavt.Color[3]=0;Ll.BGavt.State[3]=2;                  
      elseif (string.find(msg,L["EastFrostT assaulted"])) then Ll.BGavt.Time[2]=242;Ll.BGavt.Color[2]=0;Ll.BGavt.State[2]=2;            
      elseif (string.find(msg,L["WestFrostT assaulted"])) then Ll.BGavt.Time[1]=242;Ll.BGavt.Color[1]=0;Ll.BGavt.State[1]=2;          
--defended      
      elseif (string.find(msg,L["NDun defended"])) then Ll.BGavt.Time[8]=-1;Ll.BGavt.State[8]=0;       
      elseif (string.find(msg,L["SDun defended"])) then Ll.BGavt.Time[7]=-1;Ll.BGavt.State[7]=0;               
      elseif (string.find(msg,L["IcewingT defended"])) then Ll.BGavt.Time[6]=-1;Ll.BGavt.State[6]=0;           
      elseif (string.find(msg,L["StonehearthT defended"])) then Ll.BGavt.Time[5]=-1;Ll.BGavt.State[5]=0;               
      elseif (string.find(msg,L["IcebloodT defended"]) and string.find(msg,L["takenice"])) then Ll.BGavt.Time[4]=-1;Ll.BGavt.State[4]=1;           
      elseif (string.find(msg,L["TowerPoint defended"])) then Ll.BGavt.Time[3]=-1;Ll.BGavt.State[3]=1;                
      elseif (string.find(msg,L["EastFrostT defended"])) then Ll.BGavt.Time[2]=-1;Ll.BGavt.State[2]=1;              
      elseif (string.find(msg,L["WestFrostT defended"])) then Ll.BGavt.Time[1]=-1;Ll.BGavt.State[1]=1;               
--destroyed      
      elseif (string.find(msg,L["NDun destroyed"])) then Ll.BGavt.Time[8]=-1;Ll.BGavt.State[8]=2;        
      elseif (string.find(msg,L["SDun destroyed"])) then Ll.BGavt.Time[7]=-1;Ll.BGavt.State[7]=2;       
      elseif (string.find(msg,L["IcewingT destroyed"])) then Ll.BGavt.Time[6]=-1;Ll.BGavt.State[6]=2;    
      elseif (string.find(msg,L["StonehearthT destroyed"])) then Ll.BGavt.Time[5]=-1;Ll.BGavt.State[5]=2;      
      elseif (string.find(msg,L["IcebloodT destroyed"])) then Ll.BGavt.Time[4]=-1;Ll.BGavt.State[4]=2;      
      elseif (string.find(msg,L["TowerPoint destroyed"])) then Ll.BGavt.Time[3]=-1;Ll.BGavt.State[3]=2;   
      elseif (string.find(msg,L["EastFrostT destroyed"])) then Ll.BGavt.Time[2]=-1;Ll.BGavt.State[2]=2;     
      elseif (string.find(msg,L["WestFrostT destroyed"])) then Ll.BGavt.Time[1]=-1;Ll.BGavt.State[1]=2;      
----GRAVEYARDS
--assaulted        
      elseif (string.find(msg,L["Stormpike Aid Station assaulted"]) and string.find(msg,L["Alliance"])) then Ll.BGavg.Time[7]=242;Ll.BGavg.Color[7]=0;Ll.BGavg.State[7]=2;              
      elseif (string.find(msg,L["Stormpike Aid Station assaulted"]) and string.find(msg,L["Horde"])) then Ll.BGavg.Time[7]=242;Ll.BGavg.Color[7]=1;Ll.BGavg.State[7]=2;        
      elseif (string.find(msg,L["Stormpike assaulted"]) and string.find(msg,L["Alliance"])) then Ll.BGavg.Time[6]=242;Ll.BGavg.Color[6]=0;Ll.BGavg.State[6]=2;        
      elseif (string.find(msg,L["Stormpike assaulted"]) and string.find(msg,L["Horde"])) then Ll.BGavg.Time[6]=242;Ll.BGavg.Color[6]=1;Ll.BGavg.State[6]=2;           
      elseif (string.find(msg,L["stonehearth assaulted"]) and string.find(msg,L["Alliance"])) then Ll.BGavg.Time[5]=242;Ll.BGavg.Color[5]=0;Ll.BGavg.State[5]=2;        
      elseif (string.find(msg,L["stonehearth assaulted"]) and string.find(msg,L["Horde"])) then Ll.BGavg.Time[5]=242;Ll.BGavg.Color[5]=1;Ll.BGavg.State[5]=2;           
      elseif (strmatch(msg,L["Snowfall assaultedi"]) and strmatch(msg,L["Icebloodassault"]) and strmatch(msg,L["Alliance"])) then Ll.BGavg.Time[4]=242;Ll.BGavg.Color[4]=0;Ll.BGavg.State[4]=2;        
      elseif (strmatch(msg,L["Snowfall assaultedi"]) and strmatch(msg,L["Icebloodassault"]) and strmatch(msg,L["Horde"])) then Ll.BGavg.Time[4]=242;Ll.BGavg.Color[4]=1;Ll.BGavg.State[4]=2;           
      elseif (strmatch(msg,L["Iceblood assaulted"]) and strmatch(msg,L["Icebloodassault"]) and strmatch(msg,L["Alliance"])) then Ll.BGavg.Time[3]=242;Ll.BGavg.Color[3]=0;Ll.BGavg.State[3]=2;        
      elseif (strmatch(msg,L["Iceblood assaulted"]) and strmatch(msg,L["Icebloodassault"]) and strmatch(msg,L["Horde"])) then Ll.BGavg.Time[3]=242;Ll.BGavg.Color[3]=1;Ll.BGavg.State[3]=2;             
      elseif (strmatch(msg,L["Frostwolf assaulted"]) and strmatch(msg,L["Icebloodassault"]) and strmatch(msg,L["Alliance"])) then Ll.BGavg.Time[2]=242;Ll.BGavg.Color[2]=0;Ll.BGavg.State[2]=2;        
      elseif (strmatch(msg,L["Frostwolf assaulted"]) and strmatch(msg,L["Icebloodassault"]) and strmatch(msg,L["Horde"])) then Ll.BGavg.Time[2]=242;Ll.BGavg.Color[2]=1;Ll.BGavg.State[2]=2;        
      elseif (strmatch(msg,L["FrostwolfRH assaulted"]) and strmatch(msg,L["Icebloodassault"]) and strmatch(msg,L["Alliance"])) then Ll.BGavg.Time[1]=242;Ll.BGavg.Color[1]=0;Ll.BGavg.State[1]=2;       
      elseif (strmatch(msg,L["FrostwolfRH assaulted"]) and strmatch(msg,L["Icebloodassault"]) and strmatch(msg,L["Horde"])) then Ll.BGavg.Time[1]=242;Ll.BGavg.Color[1]=1;Ll.BGavg.State[1]=2;        
--captured           
      elseif (string.find(msg,L["Stormpike Aid Station captured"]) and string.find(msg,L["Alliance"])) then Ll.BGavg.Time[7]=-1;Ll.BGavg.State[7]=0;            
      elseif (string.find(msg,L["Stormpike Aid Station captured"]) and string.find(msg,L["Horde"])) then Ll.BGavg.Time[7]=-1;Ll.BGavg.State[7]=1;        
      elseif (string.find(msg,L["Stormpike captured"]) and string.find(msg,L["Alliance"])) then Ll.BGavg.Time[6]=-1;Ll.BGavg.State[6]=0;        
      elseif (string.find(msg,L["Stormpike captured"]) and string.find(msg,L["Horde"])) then Ll.BGavg.Time[6]=-1;Ll.BGavg.State[6]=1;         
      elseif (string.find(msg,L["stonehearth captured"]) and string.find(msg,L["Alliance"])) then Ll.BGavg.Time[5]=-1;Ll.BGavg.State[5]=0;       
      elseif (string.find(msg,L["stonehearth captured"]) and string.find(msg,L["Horde"])) then Ll.BGavg.Time[5]=-1;Ll.BGavg.State[5]=1;        
      elseif (strmatch(msg,L["Snowfall assaultedj"]) and strmatch(msg,L["Icebloodtaken"]) and strmatch(msg,L["Alliance"])) then Ll.BGavg.Time[4]=-1;Ll.BGavg.State[4]=0;             
      elseif (strmatch(msg,L["Snowfall assaultedj"]) and strmatch(msg,L["Icebloodtaken"]) and strmatch(msg,L["Horde"])) then Ll.BGavg.Time[4]=-1;Ll.BGavg.State[4]=1;              
      elseif (strmatch(msg,L["Iceblood assaulted"]) and strmatch(msg,L["Icebloodtaken"]) and strmatch(msg,L["Alliance"])) then Ll.BGavg.Time[3]=-1;Ll.BGavg.State[3]=0;        
      elseif (strmatch(msg,L["Iceblood assaulted"]) and strmatch(msg,L["Icebloodtaken"]) and strmatch(msg,L["Horde"])) then Ll.BGavg.Time[3]=-1;Ll.BGavg.State[3]=1;         
      elseif (strmatch(msg,L["Frostwolf assaulted"]) and strmatch(msg,L["Icebloodtaken"]) and strmatch(msg,L["Alliance"])) then Ll.BGavg.Time[2]=-1;Ll.BGavg.State[2]=0;        
      elseif (strmatch(msg,L["Frostwolf assaulted"]) and strmatch(msg,L["Icebloodtaken"]) and strmatch(msg,L["Horde"])) then Ll.BGavg.Time[2]=-1;Ll.BGavg.State[2]=1;             
      elseif (strmatch(msg,L["FrostwolfRH assaulted"]) and strmatch(msg,L["Icebloodtaken"]) and strmatch(msg,L["Alliance"])) then Ll.BGavg.Time[1]=-1;Ll.BGavg.State[1]=0;        
      elseif (strmatch(msg,L["FrostwolfRH assaulted"]) and strmatch(msg,L["Icebloodtaken"]) and strmatch(msg,L["Horde"])) then Ll.BGavg.Time[1]=-1;Ll.BGavg.State[1]=1;        
----Mines
      elseif (string.find(msg,L["irondeepmine captured"]) and string.find(msg,L["Alliance"])) then Ll.BGavm.State[1]=0;      
      elseif (string.find(msg,L["irondeepmine captured"]) and string.find(msg,L["Horde"])) then Ll.BGavm.State[1]=1;      
      elseif (string.find(msg,L["coldtoothmine captured"]) and string.find(msg,L["Alliance"])) then Ll.BGavm.State[2]=0;      
      elseif (string.find(msg,L["coldtoothmine captured"]) and string.find(msg,L["Horde"])) then Ll.BGavm.State[2]=1;      
      end 
   
end


if (event=="CHAT_MSG_BG_SYSTEM_ALLIANCE") then
local arg1=...;
msg=arg1;
    if (string.find(msg,L["Snowfall assaulted2"])) then Ll.BGavg.Time[4]=242;Ll.BGavg.Color[4]=0;Ll.BGavg.State[4]=2; end         
end

if (event=="CHAT_MSG_BG_SYSTEM_HORDE") then
local arg1=...;
msg=arg1;
    if (string.find(msg,L["Snowfall assaulted2"])) then Ll.BGavg.Time[4]=242;Ll.BGavg.Color[4]=1;Ll.BGavg.State[4]=2; end
end

if (event=="UPDATE_BATTLEFIELD_SCORE") then
RequestBattlefieldScoreData();
end

if (event=="ZONE_CHANGED_NEW_AREA") then
     if (InPrepa()) then Ll.BGavt.State = {2,2,2,2,2,2,2,2}; else Ll.BGavt.State = {3,3,3,3,3,3,3,3}; end
     if (InPrepa()) then Ll.BGavg.State = {1,1,1,2,0,0,0}; else Ll.BGavg.State = {3,3,3,3,3,3,3}; end
     if (InPrepa()) then Ll.BGavm.State = {2,2}; else Ll.BGavm.State = {3,3}; end     
     for i=1,8 do Ll.BGavt.Time[i]=-1; end
     for i=1,7 do Ll.BGavg.Time[i]=-1; end
     
  if (InBattleground(6)) then
     Frame060:Show();     
  else     
     Frame060:Hide();     
  end
end 
end
Frame060:SetScript("OnEvent",Frame060.OnEvent);

--------------------------------------------------------------------------Update
local function MainUpdate()

---Visibility
if (InPrepa() or Ll.Active.Score==0 or Ll.Active.Addon==0) then
  Frame060:SetAlpha(0);
else
  Frame060:SetAlpha(1);
end

---Scale
Frame060:SetScale(Ll.Scale[60]);

---Height/Width/Textures/Texts 1
local Bdr,Bdg,Bdb,Bda = unpack(Ll.Colors[66]);
local BBdr,BBdg,BBdb,BBda = unpack(Ll.Colors[67]);
Frame061:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame061:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame061:SetHeight(Ll.BarHeight[60]);
Frame061:SetWidth(Ll.BarWidth[60]);

FrameTex061:SetTexture(Ll.Textures[Ll.TextureKey[60]]);
FrameTex061:SetPoint("LEFT",Frame061,"LEFT",Ll.TexXofs[60],Ll.TexYofs[60]);
FrameTex061:SetHeight(Ll.TexHeight[60]);

if (Ll.FillBars[60]==1) then
   FrameTex061:SetWidth(Ll.TexWidth[60]);
else
   if (Ll.AlwaysUp[1]~="") then     
     if (reinforcements1(Ll.AlwaysUp[1])==0) then
        FrameTex061:SetWidth(1);
     else
        FrameTex061:SetWidth((Ll.TexWidth[60]/600)*reinforcements1(Ll.AlwaysUp[1]));         
     end
   end
end

local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[60]);
local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[61]);
FrameTex061:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[60]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);

---Height/Width/Textures/Texts 2
Frame062:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame062:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame062:SetHeight(Ll.BarHeight[60]);
Frame062:SetWidth(Ll.BarWidth[60]);

FrameTex062:SetTexture(Ll.Textures[Ll.TextureKey[60]]);
FrameTex062:SetPoint("LEFT",Frame062,"LEFT",Ll.TexXofs[60],Ll.TexYofs[60]);
FrameTex062:SetHeight(Ll.TexHeight[60]);

if (Ll.FillBars[60]==1) then
   FrameTex062:SetWidth(Ll.TexWidth[60]);
else
   if (Ll.AlwaysUp[2]~="") then     
     if (reinforcements1(Ll.AlwaysUp[2])==0) then
        FrameTex062:SetWidth(1);
     else
        FrameTex062:SetWidth((Ll.TexWidth[60]/600)*reinforcements1(Ll.AlwaysUp[2]));         
     end
   end
end

local Hr1,Hg1,Hb1,Ha1 = unpack(Ll.Colors[62]);
local Hr2,Hg2,Hb2,Ha2 = unpack(Ll.Colors[63]);
FrameTex062:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[60]],Hr1,Hg1,Hb1,Ha1,Hr2,Hg2,Hb2,Ha2);

FrameText063:SetFont(Ll.Fonts[Ll.FontKey[60]],Ll.FontSize[60],Ll.FontOutline[Ll.FontOutlineKey[60]]);
if (Ll.AlwaysUp[1]~="") then
FrameText063:SetText(reinforcements1(Ll.AlwaysUp[1]));
end

FrameText064:SetFont(Ll.Fonts[Ll.FontKey[60]],Ll.FontSize[60],Ll.FontOutline[Ll.FontOutlineKey[60]]);
if (Ll.AlwaysUp[2]~="") then
FrameText064:SetText(reinforcements1(Ll.AlwaysUp[2]));
end 
end
Frame060:SetScript("OnUpdate",function() MainUpdate(); end);


--------------------------------------------------------------------TOWERSUpdate
function Frame065:OnUpdate(elapsed)
---Visibility
if (InPrepa() or Ll.Active.Base==0 or Ll.Active.Addon==0 or Ll.ActiveAVT[2]==0) then
  Frame065:SetAlpha(0);
else
  Frame065:SetAlpha(1);
end

if (Ll.OnlyTime[60]==1) then
BaseBD060:Hide();
else
BaseBD060:Show();
end

Frame065:SetScale(Ll.Scale[62]);
-------Bases
local Bbdr,Bbdg,Bbdb,Bbda = unpack(Ll.Colors[600]);
local BbBdr,BbBdg,BbBdb,BbBda = unpack(Ll.Colors[601]);
BaseBD060:SetBackdropColor(Bbdr,Bbdg,Bbdb,Bbda);
BaseBD060:SetBackdropBorderColor(BbBdr,BbBdg,BbBdb,BbBda);

-------Timers
local Adr,Adg,Adb,Ada = unpack(Ll.Colors[608]);
local ABdr,ABdg,ABdb,ABda = unpack(Ll.Colors[609]);
local All1r,All1g,All1b,All1a = unpack(Ll.Colors[602]);
local All2r,All2g,All2b,All2a = unpack(Ll.Colors[603]);
local H1r,H1g,H1b,H1a = unpack(Ll.Colors[604]);
local H2r,H2g,H2b,H2a = unpack(Ll.Colors[605]);
local N1r,N1g,N1b,N1a = unpack(Ll.Colors[606]);
local N2r,N2g,N2b,N2a = unpack(Ll.Colors[607]);

for i = 1,8 do
   local UBar,UBarTex,UBarText,UBarTime,UBarState = _G[UBar:format(i)],_G[UBarTex:format(i)],_G[UBarText:format(i)],_G[UBarTime:format(i)],_G[UBarState:format(i)];
   UBar:SetBackdropColor(Adr,Adg,Adb,Ada);
   UBar:SetBackdropBorderColor(ABdr,ABdg,ABdb,ABda);   
   UBar:SetAlpha(1);      
   UBar:SetHeight(Ll.BarHeight[61]);
   UBar:SetWidth(Ll.BarWidth[61]);   
   UBarTex:SetTexture(Ll.Textures[Ll.TextureKey[61]]); 
   UBarTex:SetPoint("LEFT",UBar,"LEFT",2,Ll.TexYofs[61]);  
   UBarTex:SetHeight(Ll.TexHeight[61]);      
   UBarState:SetTexture(Ll.Textures[Ll.TextureKey[61]]);   
   UBarText:SetFont(Ll.Fonts[Ll.FontKey[61]],Ll.FontSize[61],Ll.FontOutline[Ll.FontOutlineKey[61]]);   
   UBarTime:SetPoint("LEFT",UBar,"LEFT",Ll.BaseTimeXofs[61]+5,Ll.BaseTimeYofs[61]);
   UBarTime:SetFont(Ll.Fonts[Ll.FontKey[61]],Ll.FontSize[61],Ll.FontOutline[Ll.FontOutlineKey[61]]);
   
   TimersBG(Ll.OnlyTime[60],Ll.BGavt.Time,i,UBarText,Ll.BaseTxtXofs[61],Ll.BaseTxtYofs[61],UBar,"BaseBD060");
   
   if (Ll.BGavt.Color[i]==0) then  
     UBarTex:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[61]],All1r,All1g,All1b,All1a,All2r,All2g,All2b,All2a);
   else
     UBarTex:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[61]],H1r,H1g,H1b,H1a,H2r,H2g,H2b,H2a);
   end
   
   if (Ll.BGavt.State[i]==0) then
    UBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[61]],All1r,All1g,All1b,All1a,All2r,All2g,All2b,All2a);
   elseif (Ll.BGavt.State[i]==1) then
    UBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[61]],H1r,H1g,H1b,H1a,H2r,H2g,H2b,H2a);
   elseif (Ll.BGavt.State[i]==2) then 
    UBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[61]],N1r,N1g,N1b,N1a,N2r,N2g,N2b,N2a);
   else
    UBarState:SetAlpha(0);
   end
   
   Ll.BGavt.Time[i]=Ll.BGavt.Time[i]-elapsed;
   TimerBG_1(UBar,UBarTex,UBarTime,Ll.BGavt.Time[i],242);
   TimerBG_2(i,8,Ll.BarSpacing[61],Ll.BarsXofs[61],Ll.BarsYofs[61],"Frame065",Ll.AVTBars,Ll.BGavt.Time,60);
end

end
Frame065:SetScript("OnUpdate",Frame065.OnUpdate);

----------------------------------------------------------------GraveyardsUpdate
function Frame066:OnUpdate(elapsed)
---Visibility
if (InPrepa() or Ll.Active.Base==0 or Ll.Active.Addon==0 or Ll.ActiveAVG[2]==0) then
  Frame066:SetAlpha(0);
else
  Frame066:SetAlpha(1);
end

if (Ll.OnlyTime[61]==1) then
BaseBD061:Hide();
else
BaseBD061:Show();
end

Frame066:SetScale(Ll.Scale[63]);
-------Bases
local Bbdr,Bbdg,Bbdb,Bbda = unpack(Ll.Colors[500]);
local BbBdr,BbBdg,BbBdb,BbBda = unpack(Ll.Colors[501]);
BaseBD061:SetBackdropColor(Bbdr,Bbdg,Bbdb,Bbda);
BaseBD061:SetBackdropBorderColor(BbBdr,BbBdg,BbBdb,BbBda);

-------Timers
local Adr,Adg,Adb,Ada = unpack(Ll.Colors[508]);
local ABdr,ABdg,ABdb,ABda = unpack(Ll.Colors[509]);
local All1r,All1g,All1b,All1a = unpack(Ll.Colors[502]);
local All2r,All2g,All2b,All2a = unpack(Ll.Colors[503]);
local H1r,H1g,H1b,H1a = unpack(Ll.Colors[504]);
local H2r,H2g,H2b,H2a = unpack(Ll.Colors[505]);
local N1r,N1g,N1b,N1a = unpack(Ll.Colors[506]);
local N2r,N2g,N2b,N2a = unpack(Ll.Colors[507]);

for i = 1,7 do
   local VBar,VBarTex,VBarText,VBarTime,VBarState = _G[VBar:format(i)],_G[VBarTex:format(i)],_G[VBarText:format(i)],_G[VBarTime:format(i)],_G[VBarState:format(i)];
   VBar:SetBackdropColor(Adr,Adg,Adb,Ada);
   VBar:SetBackdropBorderColor(ABdr,ABdg,ABdb,ABda);   
   VBar:SetAlpha(1);      
   VBar:SetHeight(Ll.BarHeight[62]);
   VBar:SetWidth(Ll.BarWidth[62]);   
   VBarTex:SetTexture(Ll.Textures[Ll.TextureKey[62]]); 
   VBarTex:SetPoint("LEFT",VBar,"LEFT",2,Ll.TexYofs[62]);  
   VBarTex:SetHeight(Ll.TexHeight[62]);      
   VBarState:SetTexture(Ll.Textures[Ll.TextureKey[62]]);   
   VBarText:SetFont(Ll.Fonts[Ll.FontKey[62]],Ll.FontSize[62],Ll.FontOutline[Ll.FontOutlineKey[62]]);   
   VBarTime:SetPoint("LEFT",VBar,"LEFT",Ll.BaseTimeXofs[62]+5,Ll.BaseTimeYofs[62]);
   VBarTime:SetFont(Ll.Fonts[Ll.FontKey[62]],Ll.FontSize[62],Ll.FontOutline[Ll.FontOutlineKey[62]]);
   
   TimersBG(Ll.OnlyTime[61],Ll.BGavg.Time,i,VBarText,Ll.BaseTxtXofs[62],Ll.BaseTxtYofs[62],VBar,"BaseBD061");
   
   if (Ll.BGavg.Color[i]==0) then  
     VBarTex:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[62]],All1r,All1g,All1b,All1a,All2r,All2g,All2b,All2a);
   else
     VBarTex:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[62]],H1r,H1g,H1b,H1a,H2r,H2g,H2b,H2a);
   end
   
   if (Ll.BGavg.State[i]==0) then
    VBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[62]],All1r,All1g,All1b,All1a,All2r,All2g,All2b,All2a);
   elseif (Ll.BGavg.State[i]==1) then
    VBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[62]],H1r,H1g,H1b,H1a,H2r,H2g,H2b,H2a);
   elseif (Ll.BGavg.State[i]==2) then 
    VBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[62]],N1r,N1g,N1b,N1a,N2r,N2g,N2b,N2a);
   else
    VBarState:SetAlpha(0);
   end
   
   Ll.BGavg.Time[i]=Ll.BGavg.Time[i]-elapsed;
   TimerBG_1(VBar,VBarTex,VBarTime,Ll.BGavg.Time[i],242);
   TimerBG_2(i,7,Ll.BarSpacing[62],Ll.BarsXofs[62],Ll.BarsYofs[62],"Frame066",Ll.AVGBars,Ll.BGavg.Time,61);
end

end
Frame066:SetScript("OnUpdate",Frame066.OnUpdate);

----------------------------------------------------------------------MineUpdate
function Frame067:OnUpdate(elapsed)
---Visibility
if (InPrepa() or Ll.Active.Base==0  or Ll.Active.Addon==0 or Ll.ActiveAVM[2]==0) then
  Frame067:SetAlpha(0);
else
  Frame067:SetAlpha(1);
end

Frame067:SetScale(Ll.Scale[64]);
-------Bases
local Bbdr,Bbdg,Bbdb,Bbda = unpack(Ll.Colors[700]);
local BbBdr,BbBdg,BbBdb,BbBda = unpack(Ll.Colors[701]);
BaseBD062:SetBackdropColor(Bbdr,Bbdg,Bbdb,Bbda);
BaseBD062:SetBackdropBorderColor(BbBdr,BbBdg,BbBdb,BbBda);

-------Timers
local All1r,All1g,All1b,All1a = unpack(Ll.Colors[702]);
local All2r,All2g,All2b,All2a = unpack(Ll.Colors[703]);
local H1r,H1g,H1b,H1a = unpack(Ll.Colors[704]);
local H2r,H2g,H2b,H2a = unpack(Ll.Colors[705]);
local N1r,N1g,N1b,N1a = unpack(Ll.Colors[706]);
local N2r,N2g,N2b,N2a = unpack(Ll.Colors[707]);

for i = 1,2 do
   local WBarText,WBarState = _G[WBarText:format(i)],_G[WBarState:format(i)];   
   WBarState:SetTexture(Ll.Textures[Ll.TextureKey[63]]);
   WBarText:SetFont(Ll.Fonts[Ll.FontKey[63]],Ll.FontSize[63],Ll.FontOutline[Ll.FontOutlineKey[63]]);   
   
   if (Ll.BGavm.State[i]==0) then
    WBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[63]],All1r,All1g,All1b,All1a,All2r,All2g,All2b,All2a);
   elseif (Ll.BGavm.State[i]==1) then
    WBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[63]],H1r,H1g,H1b,H1a,H2r,H2g,H2b,H2a);
   elseif (Ll.BGavm.State[i]==2) then 
    WBarState:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[63]],N1r,N1g,N1b,N1a,N2r,N2g,N2b,N2a);
   else
    WBarState:SetAlpha(0);
   end   
end
end
Frame067:SetScript("OnUpdate",Frame067.OnUpdate);

function Frame065bis:OnUpdate(elapsed)
  if (InBattleground(6)) then
    Frame065:Show();
  elseif (Ll.TestMode[61]==1) then
    Frame065:Show();    
     if (Ll.BGavt.Time[1]<0 and Ll.BGavt.Time[2]<0 and Ll.BGavt.Time[3]<0 and Ll.BGavt.Time[4]<0 and Ll.BGavt.Time[5]<0 and Ll.BGavt.Time[6]<0 and Ll.BGavt.Time[7]<0 and Ll.BGavt.Time[8]<0) then
        Frame065:SetMovable(false);
        Frame065:EnableMouse(false);
        Ll.TestMode[61]=0;
     end
  else  
    Frame065:Hide();      
  end
  
  
  if (InBattleground(6)) then
    Frame066:Show();
  elseif (Ll.TestMode[62]==1) then
    Frame066:Show();    
     if (Ll.BGavg.Time[1]<0 and Ll.BGavg.Time[2]<0 and Ll.BGavg.Time[3]<0 and Ll.BGavg.Time[4]<0 and Ll.BGavg.Time[5]<0 and Ll.BGavg.Time[6]<0 and Ll.BGavg.Time[7]<0) then
        Frame066:SetMovable(false);
        Frame066:EnableMouse(false);
        Ll.TestMode[62]=0;
     end
  else  
    Frame066:Hide();      
  end 
  
  
  if (InBattleground(6)) then
    Frame067:Show();
  elseif (Ll.TestMode[63]==1) then
    Frame067:Show();     
  else  
    Frame067:Hide();      
  end   
end
Frame065bis:SetScript("OnUpdate",Frame065bis.OnUpdate);

------------------------------------------------------------------Move-functions
function MoveAlterac()
if (Frame060:IsVisible()) then
MoveFrame(60);
MoveFrame(61,61);
MoveFrame(62,62);
MoveFrame(63);
MoveFrame(64);
--if (Ll.ActiveAVT[2]==1) then
--  MoveFrame(65);
--end
--if (Ll.ActiveAVG[2]==1) then
--  MoveFrame(66);
--end
--if (Ll.ActiveAVM[2]==1) then
--  MoveFrame(67);
--end
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
end
end

-------------------------------------------------------------Test-functions-Base
function TestAVT()
if (InBattleground(6)) then   
   MoveFrame(65);
else
   TestTimers("Frame065",6,Ll.BGavt.Time,61,Ll.BGavt.Color,Ll.BGavt.State);
   MoveFrame(65);
end
end

function TestAVG()
if (InBattleground(6)) then   
   MoveFrame(66);
else
   TestTimers("Frame066",6,Ll.BGavg.Time,62,Ll.BGavg.Color,Ll.BGavg.State);
   MoveFrame(66);
end
end

function TestAVM()
if (InBattleground(6)) then   
   MoveFrame(67);
else
   TestTimers2("Frame067",6,nil,63,nil,Ll.BGavm.State)
   MoveFrame(67);
end
end
