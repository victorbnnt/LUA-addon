-------------------------------GlobalFunctions----------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
local Frame = "Frame0%d";
--------------------------------------------------------------------------------
local Zone = {L["Arathi Basin"],
              L["Warsong Gulch"],
              L["Isle of Conquest"],
              L["Eye of the Storm"],
              L["Strand of the Ancients"],
              L["Alterac Valley"],
              L["Battle for Gilneas"],
              L["Twin Peaks"],
              L["Wintergrasp"],
              L["Tol Barad"],
              L["Tol Barad Peninsula"]};

---------------------------------------------------------------------------Reset
function Reset()
wipe(Ll);
Ll=LLPvpState_Init;
ReloadUI();
end

------------------------------------------------------------------InBattleground
function InBattleground(key)
 local zone = GetRealZoneText();
     return (zone==Zone[key]);     
end

------------------------------------------------------------------InBattleground
function InBg()
   for i=1,11 do
     if InBattleground(i) then
     return true;
     end
   end
end 

----------------------------------------------------------------------MoveFrames
function SavePos(key)   
   local frame = _G[Frame:format(key)];
   Ll.FramePos[key][1] = select(1,frame:GetPoint());
   Ll.FramePos[key][2] = "UIParent";
   Ll.FramePos[key][3] = select(3,frame:GetPoint());
   Ll.FramePos[key][4] = select(4,frame:GetPoint());
   Ll.FramePos[key][5] = select(5,frame:GetPoint());
end

function SaveSubPos(parentkey,subkey)
   local frame = _G[Frame:format(parentkey)];
   local subframe = _G[Frame:format(subkey)]; 
   local a,b,c,d = frame:GetBottom(),frame:GetLeft(),subframe:GetBottom(),subframe:GetLeft();
   local e,f,g,h = frame:GetHeight(),frame:GetWidth(),subframe:GetHeight(),subframe:GetWidth();
   Ll.FramePos[subkey][1] = "CENTER";
   Ll.FramePos[subkey][2] = frame:GetName();
   Ll.FramePos[subkey][3] = "CENTER";
   Ll.FramePos[subkey][4] = (d+h/2)-(b+f/2);
   Ll.FramePos[subkey][5] = (c+g/2)-(a+e/2);
end

function SetFramePos(key)
   local frame = _G[Frame:format(key)];
   frame:ClearAllPoints();
   frame:SetPoint(unpack(Ll.FramePos[key]));
end

function MoveFrame(key,type)
   local frame = _G[Frame:format(key)];
if (type) then
   if (frame:IsMovable()) then     
     frame:SetMovable(false);
     frame:EnableMouse(false);     
   else
     frame:SetMovable(true);
     frame:EnableMouse(true);     
   end 
else
   if (frame:IsMovable()) then
     frame:SetMovable(false);
     frame:EnableMouse(false);
     frame:SetBackdropColor(0,0,0,0);
     frame:SetBackdropBorderColor(0,0,0,0);
   else
     frame:SetMovable(true);
     frame:EnableMouse(true);
     frame:SetBackdropColor(205/255,133/255,0,0.5);
     frame:SetBackdropBorderColor(0.6,0.6,0.6,0.5);
   end  
end   
end

function FDragStart(key)
    local frame = _G[Frame:format(key)];
    frame:SetScript("OnDragStart",function(self) self:StartMoving() end);
end

function FDragStop(parentkey,subkey)
if (subkey) then
    local frame = _G[Frame:format(parentkey)];
    local subframe = _G[Frame:format(subkey)];
    subframe:SetScript("OnDragStop",function(self) self:StopMovingOrSizing(); SaveSubPos(parentkey,subkey);SetFramePos(subkey); end);
else
    local frame = _G[Frame:format(parentkey)];
    frame:SetScript("OnDragStop",function(self) self:StopMovingOrSizing(); SavePos(parentkey);SetFramePos(parentkey); end); 
end
end

---------------------------------------------------------------------Wintergrasp
function IsWgraspUC()
   if InBattleground(9) then
      local UC = Ll.AlwaysUp[1];
      return (UC == L["Alliance Controlled"] or UC == L["Horde Controlled"]);     
   end
end

------------------------------------------------------------------------TolBarad
function IsTolBaradUC()
   if (InBattleground(10) or InBattleground(11)) then
      local UC = Ll.AlwaysUp[1];
      return (UC == L["Control Alliance"] or UC == L["Control Horde"]);     
   end
end

---------------------------------------------------------------------Preparation
function InPrepa()
   for i=1,40 do
      local name=UnitAura("player",i);
      if (name==L["Preparation"]) then
         return true;
      end
      if (not name) then
         return false;
      end
   end
end

------------------------------------------------------------------------IsInRaid
function IsInRaid(msg) 
   for i=1,GetNumRaidMembers() do
      local playerID = format("raid%d",i);
      local playerName = UnitName(playerID);
      if (string.match(msg,playerName)) then
        return strmatch(msg,playerName);
      end       
   end
end

-------------------------------------------------------------------FillScoreBars
function SCBars(texture,current,total,key)
  local texture = _G[texture];
if (Ll.FillBars[key]==1) then
   texture:SetWidth(Ll.TexWidth[key]);
else
   if (current~="") then     
     if (current==0) then
        texture:SetWidth(1);
     else
        texture:SetWidth((Ll.TexWidth[key]/total)*current);         
     end
   end
end
end

-------------------------------------------------------------------Fonction-Test
function TestTimers(frame,bgkey,tim,testkey,Color,State)
  local Frames = _G[frame];
if (InBattleground(bgkey)) then
  ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
elseif (Ll.TestMode[testkey]==1) then
      Frames:Hide();
      Frames:SetAlpha(0);
      Ll.TestMode[testkey] = 0;
      for i=1,getn(tim) do tim[i] = -1; end      
else       
      Frames:Show();
      Frames:SetAlpha(1);
      Ll.TestMode[testkey] = 1;
    
    if (bgkey==1) then
        for i = 1,getn(tim) do tim[i] = math.random(62); end
        Ll.TestMode[31] = 0;Ll.TestMode[61] = 0;Ll.TestMode[62] = 0;Ll.TestMode[63] = 0;Ll.TestMode[71] = 0;Ll.TestMode[41] = 0;  
    elseif (bgkey==3) then
        for i = 2,getn(tim) do tim[i] = math.random(62); end
        tim[1] = math.random(182);
        Ll.TestMode[11] = 0;Ll.TestMode[61] = 0;Ll.TestMode[62] = 0;Ll.TestMode[63] = 0;Ll.TestMode[71] = 0;Ll.TestMode[41] = 0; 
    elseif (bgkey==4) then        
        Ll.TestMode[11] = 0;Ll.TestMode[61] = 0;Ll.TestMode[62] = 0;Ll.TestMode[63] = 0;Ll.TestMode[71] = 0;Ll.TestMode[31] = 0;
    elseif (bgkey==6) then
        for i = 1,getn(tim) do tim[i] = math.random(242); end        
        Ll.TestMode[11] = 0;Ll.TestMode[31] = 0;Ll.TestMode[71] = 0;Ll.TestMode[41] = 0; 
    elseif (bgkey==7) then
        for i = 1,getn(tim) do tim[i] = math.random(62); end        
        Ll.TestMode[11] = 0;Ll.TestMode[31] = 0;Ll.TestMode[61] = 0;Ll.TestMode[62] = 0;Ll.TestMode[63] = 0;Ll.TestMode[41] = 0;              
    end      
      for i=1,getn(Color) do Color[i] = math.random(0,1) end
      for i=1,getn(State) do State[i] = math.random(0,3) end
end
end

------------------------------------------------------------------Fonction-Test2
function TestTimers2(frame,bgkey,tim,testkey,Color,State)
  local Frames = _G[frame];
if (InBattleground(bgkey)) then
  ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
elseif (Ll.TestMode[testkey]==1) then
      Frames:Hide();
      Frames:SetAlpha(0);
      Ll.TestMode[testkey] = 0;    
else       
      Frames:Show();
      Frames:SetAlpha(1);
      Ll.TestMode[testkey] = 1;       
      for i=1,getn(State) do State[i] = math.random(0,3) end
end
end

-----------------------------------------------------------------------Timers-BG
function TimersBG(onlytime,timer,p,name,nameXofs,nameYofs,frame,anchor)
   if (onlytime==1) then
      if (timer[p]>0) then
    name:SetTextColor(1,1,1,1);
    name:ClearAllPoints();
    name:SetPoint("RIGHT",frame,"RIGHT",nameXofs-2,nameYofs);
      else
    name:SetTextColor(1,1,1,0);
    name:ClearAllPoints();
    name:SetPoint("RIGHT",frame,"RIGHT",nameXofs-2,nameYofs);
      end    
  else
      if (timer[p]>0) then
    name:SetTextColor(1,1,1,1);
    name:ClearAllPoints();
    name:SetPoint("RIGHT",frame,"RIGHT",nameXofs-2,nameYofs);
      else
    name:SetTextColor(1,1,1,1);
    name:ClearAllPoints();
    name:SetPoint("RIGHT",anchor,"BOTTOM",-15,(18*(p))-8);    
      end
  end
end

function TimerBG_1(frame,texture,text,K,duree)
if (K>60) then 
text:SetText(SecondsToTime(K,true));
else
text:SetText(SecondsToTime(K));
end 
texture:SetWidth((frame:GetWidth()/duree)*K);
end

function H(point,table)
return select(point,table:GetPoint());
end

function TimerBG_2(i,j,spacing,Xofs,Yofs,anchor,table,timer,key)       
if (Ll.OnlyTime[key]==1) then    
       if (timer[i]<=0) then
           table[i]:Hide();
       else
           table[i]:Show();
       end
    table[1]:ClearAllPoints();       
    table[1]:SetPoint("BOTTOMRIGHT",anchor,"TOPLEFT",Xofs,3+Yofs);        
    if (table[i]:IsVisible()) then                             
        for k=i+1,j do
           table[k]:ClearAllPoints();           
           table[k]:SetPoint("BOTTOMRIGHT",anchor,"TOPLEFT",Xofs,H(5,table[i])+table[i]:GetHeight()+spacing); 
        end      
    else        
        for k=i+1,j do
           table[k]:ClearAllPoints();
           table[k]:SetPoint("BOTTOMRIGHT",anchor,"TOPLEFT",Xofs,H(5,table[i]));   
        end
    end
else        
      if (timer[i]<=0) then
           table[i]:Show();
           table[i]:SetAlpha(0);
      else
           table[i]:SetAlpha(1);
           table[i]:Show();
      end 
      table[1]:ClearAllPoints();      
      table[1]:SetPoint("BOTTOMRIGHT",anchor,"TOPLEFT",Xofs,3+Yofs)        
          for k=i+1,j do
           table[k]:ClearAllPoints();           
           table[k]:SetPoint("BOTTOMRIGHT",anchor,"TOPLEFT",Xofs,H(5,table[i])+table[i]:GetHeight()+spacing); 
          end  
   end   
end
----------------------------------------------------------------EOTS-FlagCarrier
function IsCarrierE(faction)
 if (faction==L["Alliance"]) then
   for p = 1,GetNumRaidMembers() do   
    local CarrierID = format("raid%d",p);    
      for q = 1,20 do
        local Aura = UnitAura(CarrierID,q);
        if (Aura) then
          if (string.match(Aura,L["EOTS Flag"])) then
             Ll.EotsCarrier[1] = UnitName(CarrierID);            
             Ll.CarrierHealth[3] = format("%.f %s",100*UnitHealth(CarrierID)/UnitHealthMax(CarrierID),"%"); 
             Ll.TexWidth[41] = 50*(UnitHealth(CarrierID)/UnitHealthMax(CarrierID));                   
          end
        end      
      end
   end 
 else
   for p = 1,GetNumRaidMembers() do
    local CarrierID = format("raid%d",p);    
      for q = 1,20 do
        local Aura = UnitAura(CarrierID,q);
        if (Aura) then
          if (string.match(Aura,L["EOTS Flag"])) then
             Ll.EotsCarrier[1] = UnitName(CarrierID);               
             Ll.CarrierHealth[3] = format("%.f %s",100*UnitHealth(CarrierID)/UnitHealthMax(CarrierID),"%");
             Ll.TexWidth[41] = 50*(UnitHealth(CarrierID)/UnitHealthMax(CarrierID));                     
          end
        end      
      end
   end 
 end
end

function IsCarrierZE(UnitID)
   for j = 1,20 do
       local Aura = UnitAura(UnitID,j);
       if (Aura) then
       if (string.match(Aura,L["EOTS Flag"])) then
          Ll.EotsCarrier[1] = UnitName(UnitID);
          Ll.CarrierHealth[3] = format("%.f %s",100*UnitHealth(UnitID)/UnitHealthMax(UnitID),"%");
          Ll.TexWidth[41] = 50*(UnitHealth(UnitID)/UnitHealthMax(UnitID));                 
       end 
       end
   end
end

------------------------------------------------------------------WG-FlagCarrier
function IsCarrier(faction)
 if (faction==L["Alliance"]) then
   for p = 1,GetNumRaidMembers() do
    local CarrierID = format("raid%d",p);    
      for q = 1,20 do
        local Aura = UnitAura(CarrierID,q);
        if (Aura) then
          if (string.match(Aura,L["Horde Flag"]) or string.match(Aura,L["Horde Flag 2"])) then
             Ll.CarrierName[1] = UnitName(CarrierID);
             Ll.CarrierHealth[1] = format("%.f %s",100*UnitHealth(CarrierID)/UnitHealthMax(CarrierID),"%"); 
             Ll.TexWidth[21] = 50*(UnitHealth(CarrierID)/UnitHealthMax(CarrierID));                   
          end
        end      
      end
   end 
 else
   for p = 1,GetNumRaidMembers() do
    local CarrierID = format("raid%d",p);    
      for q = 1,20 do
        local Aura = UnitAura(CarrierID,q);
        if (Aura) then
          if (string.match(Aura,L["Alliance Flag"])) then
             Ll.CarrierName[2] = UnitName(CarrierID);
             Ll.CarrierHealth[2] = format("%.f %s",100*UnitHealth(CarrierID)/UnitHealthMax(CarrierID),"%");
             Ll.TexWidth[22] = 50*(UnitHealth(CarrierID)/UnitHealthMax(CarrierID));                     
          end
        end      
      end
   end 
 end
end

function IsCarrierH(UnitID)
   for j = 1,20 do
       local Aura = UnitAura(UnitID,j);
       if (Aura) then
       if (string.match(Aura,L["Alliance Flag"])) then
          Ll.CarrierName[2] = UnitName(UnitID);
          Ll.CarrierHealth[2] = format("%.f %s",100*UnitHealth(UnitID)/UnitHealthMax(UnitID),"%");
          Ll.TexWidth[22] = 50*(UnitHealth(UnitID)/UnitHealthMax(UnitID));                 
       end 
       end
   end
end

function IsCarrierA(UnitID)
   for j = 1,20 do
       local Aura = UnitAura(UnitID,j);
       if (Aura) then
       if (string.match(Aura,L["Horde Flag"]) or string.match(Aura,L["Horde Flag 2"])) then          
          Ll.CarrierName[1] = UnitName(UnitID);
          Ll.CarrierHealth[1] = format("%.f %s",100*UnitHealth(UnitID)/UnitHealthMax(UnitID),"%");
          Ll.TexWidth[21] = 50*(UnitHealth(UnitID)/UnitHealthMax(UnitID));                    
       end
       end 
   end
end

------------------------------------------------------------------TP-FlagCarrier
function IsCarrierTP(faction)
 if (faction==L["Alliance"]) then
   for p = 1,GetNumRaidMembers() do
    local CarrierID = format("raid%d",p);    
      for q = 1,20 do
        local Aura = UnitAura(CarrierID,q);
        if (Aura) then
          if (string.match(Aura,L["Horde Flag"]) or string.match(Aura,L["Horde Flag 2"])) then
             Ll.TPCarrier[1] = UnitName(CarrierID);
             Ll.CarrierHealth[1] = format("%.f %s",100*UnitHealth(CarrierID)/UnitHealthMax(CarrierID),"%"); 
             Ll.TexWidth[111] = 50*(UnitHealth(CarrierID)/UnitHealthMax(CarrierID));                   
          end
        end      
      end
   end 
 else
   for p = 1,GetNumRaidMembers() do
    local CarrierID = format("raid%d",p);    
      for q = 1,20 do
        local Aura = UnitAura(CarrierID,q);
        if (Aura) then
          if (string.match(Aura,L["Alliance Flag"])) then
             Ll.TPCarrier[2] = UnitName(CarrierID);
             Ll.CarrierHealth[2] = format("%.f %s",100*UnitHealth(CarrierID)/UnitHealthMax(CarrierID),"%");
             Ll.TexWidth[112] = 50*(UnitHealth(CarrierID)/UnitHealthMax(CarrierID));                     
          end
        end      
      end
   end 
 end
end

function IsCarrierHTP(UnitID)
   for j = 1,20 do
       local Aura = UnitAura(UnitID,j);
       if (Aura) then
       if (string.match(Aura,L["Alliance Flag"])) then
          Ll.TPCarrier[2] = UnitName(UnitID);
          Ll.CarrierHealth[2] = format("%.f %s",100*UnitHealth(UnitID)/UnitHealthMax(UnitID),"%");
          Ll.TexWidth[112] = 50*(UnitHealth(UnitID)/UnitHealthMax(UnitID));                 
       end 
       end
   end
end

function IsCarrierATP(UnitID)
   for j = 1,20 do
       local Aura = UnitAura(UnitID,j);
       if (Aura) then
       if (string.match(Aura,L["Horde Flag"]) or string.match(Aura,L["Horde Flag 2"])) then          
          Ll.TPCarrier[1] = UnitName(UnitID);
          Ll.CarrierHealth[1] = format("%.f %s",100*UnitHealth(UnitID)/UnitHealthMax(UnitID),"%");
          Ll.TexWidth[111] = 50*(UnitHealth(UnitID)/UnitHealthMax(UnitID));                    
       end
       end 
   end
end

---------------------------------------------Warsong-Gulch-Alliance-Carrier-Name
function WGallCar(text)
   local H=string.gsub(text,L["Alliance take flag"],"");
   local H1=string.gsub(H," ","");
   local H2=strtrim(H1,"!. ");
   return H2;
end

------------------------------------------------Warsong-Gulch-Horde-Carrier-Name
function WGhorCar(text)
   local H=string.gsub(text,L["Horde take flag"],"");
   local H1=string.gsub(H," ","");
   local H2=strtrim(H1,"!. ");
   return H2;
end

-------------------------------------------------------Warsong-Gulch-format-name
function FormatCarrier(Name)
   if (string.find(Name,"-")) then
    local H = string.find(Name,"-");
    local H1 = string.sub(Name,1,H-1);    
    return H1;
   end
   if not(string.find(Name,"-")) then    
    return Name;
   end 
end

----------------------------------------------------------------------ClassColor
function ColorCarrier(class)
   if (class=="PALADIN") then      
      local C1,C2,C3,C4 = unpack(Ll.Colors[1500]);
      return C1,C2,C3,C4;
   end
   if (class=="WARRIOR") then      
      local C1,C2,C3,C4 = unpack(Ll.Colors[1501]);
      return C1,C2,C3,C4;
   end
   if (class=="WARLOCK") then      
      local C1,C2,C3,C4 = unpack(Ll.Colors[1502]);
      return C1,C2,C3,C4;
   end
   if (class=="HUNTER") then      
      local C1,C2,C3,C4 = unpack(Ll.Colors[1503]);
      return C1,C2,C3,C4;
   end
   if (class=="SHAMAN") then     
      local C1,C2,C3,C4 = unpack(Ll.Colors[1504]);
      return C1,C2,C3,C4;
   end
   if (class=="ROGUE") then      
      local C1,C2,C3,C4 = unpack(Ll.Colors[1505]);
      return C1,C2,C3,C4;
   end   
   if (class=="PRIEST") then      
      local C1,C2,C3,C4 = unpack(Ll.Colors[1506]);
      return C1,C2,C3,C4;
   end
   if (class=="MAGE") then      
      local C1,C2,C3,C4 = unpack(Ll.Colors[1507]);
      return C1,C2,C3,C4;
   end
   if (class=="DEATHKNIGHT") then
      local C1,C2,C3,C4 = unpack(Ll.Colors[1508]);
      return C1,C2,C3,C4;
   end    
   if (class=="DRUID") then      
      local C1,C2,C3,C4 = unpack(Ll.Colors[1509]);
      return C1,C2,C3,C4;
   end      
end

-------------------------------------------------------------Warsong-Gulch-Score
function WGscore(text)
if (string.find(text,"/")) then
   local a=string.sub(text,1,1);
   local b=tonumber(a);
   return b;
else
b=1;
return b;
end
end

--------------------------------------------------------------------Arathi-Score
function BarScore(text)
if (string.find(text,"%d+/%d+")) then
   local a=string.find(text,"%d+/%d+");
   local b=string.sub(text,a);
   local c=string.sub(b,0,-6);
   local d=tonumber(c)
   return d;
else
d=0.005;
return d;
end
end

--------------------------------------------------------------------Arathi-Bases
function bases(text)
if (string.match(text," %d ")) then
local F = string.trim(string.match(text," %d "));
return F;
end
end

------------------------------------------------------------------IsleofConquest
function reinforcements(text)
if (string.find(text,L["Reinforcements"])) then
   local a=string.find(text,"%d")
   local b=strlen(text);
   local c=string.sub(text,a,b);
   local d=tonumber(c);
   return d;
else
d=300;
return d;
end
end

--------------------------------------------------------------EyeOfTheStormScore
function Eotscore(text)
if (string.find(text,"%d+/%d+")) then
   local a=string.find(text,"%d+/%d+");
   local b=string.sub(text,a);
   local c=string.sub(b,0,-6);
   local d=tonumber(c)
   return d;
else
d=0.005;
return d;
end
end

---------------------------------------------------------------EyeOfTheStormFlag
function eotsCarrier(text)
   local H=string.gsub(text,L["has taken the flag"],"");
   local H1=string.gsub(H," ","");
   local H2=strtrim(H1,"!.");
   return H2;
end

--------------------------------------------------------------EyeOfTheStormbases
function bases1(text)
if (string.find(text,L["Victory Points"])) then
   local a,b=string.find(text,L["Victory Points"]);
   local c=string.sub(text,1,a-1);
   local d = string.match(c,"%d")
   return d;
else
d="";
return d;
end
end

-------------------------------------------------------------------AlteracValley
function reinforcements1(text)
--if (AlwaysUpFrame1Text) then
if (string.find(text,L["Reinforcements"])) then
   local a=string.find(text,"%d")
   local b=strlen(text);
   local c=string.sub(text,a,b);
   local d=tonumber(c);
   return d;
else
d=600;
return d;
end
--else
--d=600;
--return d;
--end
end

------------------------------------------------------------------------showCbar
function IsCbarVisible()
  local Zone = GetRealZoneText();
  if (Zone==L["Eye of the Storm"] or Zone==L["Wintergrasp"] or Zone==L["Hellfire Peninsula"] or 
      Zone==L["Terokkar Forest"] or Zone==L["Nagrand"] or Zone==L["Eastern Plaguelands"] or Zone==L["Tol Barad"]) then
      Frame05:Show();
   else
      Frame05:Hide();
   end
end
