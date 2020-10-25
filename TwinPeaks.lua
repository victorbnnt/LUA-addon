----------------------------------Twin-Peaks------------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
local _,Faction = UnitFactionGroup("player");
--------------------------------------------------------------------------------
---MainFrame
local Frame0110 = CreateFrame("Frame","Frame0110",UIParent);
Frame0110:RegisterEvent("ADDON_LOADED");
Frame0110:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame0110:RegisterEvent("CHAT_MSG_BG_SYSTEM_ALLIANCE");
Frame0110:RegisterEvent("CHAT_MSG_BG_SYSTEM_HORDE");
Frame0110:RegisterEvent("UPDATE_BATTLEFIELD_SCORE");
Frame0110:SetHeight(70);
Frame0110:SetWidth(200);
Frame0110:RegisterForDrag("LeftButton");

---Score Bars
local Frame0111 = CreateFrame("Frame","Frame0111",Frame0110);
Frame0111:RegisterForDrag("LeftButton");
local FrameTex0111 = Frame0111:CreateTexture("FrameTex0111");

local Frame0112 = CreateFrame("Frame","Frame0112",Frame0110);
Frame0112:RegisterForDrag("LeftButton");
local FrameTex0112 = Frame0112:CreateTexture("FrameTex0112");

---Timer text
local Frame0113 = CreateFrame("Frame","Frame0113",Frame0110);
Frame0113:RegisterForDrag("LeftButton");
Frame0113:SetHeight(15);
Frame0113:SetWidth(120);
local FrameText0113 = Frame0113:CreateFontString("FrameText0113");
FrameText0113:SetPoint("CENTER",Frame0113,"CENTER",0,0);

---Score text
local Frame0114 = CreateFrame("Frame","Frame0114",Frame0110);
Frame0114:RegisterForDrag("LeftButton");
Frame0114:SetHeight(15);
Frame0114:SetWidth(50);
local FrameText0114 = Frame0114:CreateFontString("FrameText0114");
FrameText0114:SetPoint("CENTER",Frame0114,"CENTER",0,0);

local Frame0115 = CreateFrame("Frame","Frame0115",Frame0110);
Frame0115:RegisterForDrag("LeftButton");
Frame0115:SetHeight(15);
Frame0115:SetWidth(50);
local FrameText0115 = Frame0115:CreateFontString("FrameText0115");
FrameText0115:SetPoint("CENTER",Frame0115,"CENTER",0,0);

---Flag Carriers
local Frame0116 = CreateFrame("Button","Frame0116",Frame0110,"SecureActionButtonTemplate");
local FrameText0116 = Frame0116:CreateFontString("FrameText0116");
FrameText0116:SetPoint("LEFT",Frame0116,"LEFT",0,0);
local FrameTex0116 = Frame0116:CreateTexture("FrameTex0116");
FrameTex0116:SetPoint("LEFT",Frame0116,"LEFT",0,-10);
FrameTex0116:SetHeight(3);

local Frame0117 = CreateFrame("Button","Frame0117",Frame0110,"SecureActionButtonTemplate");      
local FrameText0117 = Frame0117:CreateFontString("FrameText0117");
FrameText0117:SetPoint("LEFT",Frame0117,"LEFT",0,0);
local FrameTex0117 = Frame0117:CreateTexture("FrameTex0117");
FrameTex0117:SetPoint("LEFT",Frame0117,"LEFT",0,-10);
FrameTex0117:SetHeight(3);

---Carrier Health
local Frame0118 = CreateFrame("Frame","Frame0118",Frame0110);
Frame0118:SetHeight(15);
Frame0118:SetWidth(50);
local FrameText0118 = Frame0118:CreateFontString("FrameText0118");
FrameText0118:SetPoint("CENTER",Frame0118,"CENTER",0,0);

local Frame0119 = CreateFrame("Frame","Frame0119",Frame0110);
Frame0119:SetHeight(15);
Frame0119:SetWidth(50);      
local FrameText0119 = Frame0119:CreateFontString("FrameText0119");
FrameText0119:SetPoint("CENTER",Frame0119,"CENTER",0,0);

---------------------------------------------------------------------------Event
function Frame0110:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
      Frame0110:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame0110:SetBackdropColor(0,0,0,0);
      Frame0110:SetBackdropBorderColor(0,0,0,0);
      
      Frame0111:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame0112:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      
      Frame0113:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame0113:SetBackdropColor(0,0,0,0);
      Frame0113:SetBackdropBorderColor(0,0,0,0);
      
      Frame0114:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame0114:SetBackdropColor(0,0,0,0);
      Frame0114:SetBackdropBorderColor(0,0,0,0);
      
      Frame0115:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame0115:SetBackdropColor(0,0,0,0);
      Frame0115:SetBackdropBorderColor(0,0,0,0);
   
      Frame0116:RegisterForDrag("LeftButton");
      Frame0116:EnableMouse(true);
      Frame0116:SetMovable(false);
      Frame0116:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame0116:SetBackdropColor(0,0,0,0);
      Frame0116:SetBackdropBorderColor(0,0,0,0);
      Frame0116:SetWidth(100); 
      Frame0116:SetHeight(15);
      Frame0116:SetScript("OnEnter",function() Frame0116:SetBackdropColor(0,0,0.5,0.5); end);
      Frame0116:SetScript("OnLeave",function() Frame0116:SetBackdropColor(0,0,0,0); end);
      Frame0116:SetAttribute("type1","macro");
     
      FrameTex0116:SetTexture(Ll.Textures[1]);
      FrameTex0116:SetWidth(Ll.TexWidth[111]); 
      
      Frame0117:RegisterForDrag("LeftButton");
      Frame0117:EnableMouse(true);
      Frame0117:SetMovable(false);
      Frame0117:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame0117:SetBackdropColor(0,0,0,0);
      Frame0117:SetBackdropBorderColor(0,0,0,0);
      Frame0117:SetWidth(100); 
      Frame0117:SetHeight(15);
      Frame0117:SetScript("OnEnter",function() Frame0117:SetBackdropColor(0.5,0,0,0.5); end);
      Frame0117:SetScript("OnLeave",function() Frame0117:SetBackdropColor(0,0,0,0); end);     
      Frame0117:SetAttribute("type1","macro");
     
      FrameTex0117:SetTexture(Ll.Textures[1]);
      FrameTex0117:SetWidth(Ll.TexWidth[112]);  
      
      Frame0118:RegisterForDrag("LeftButton");
      Frame0118:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame0118:SetBackdropColor(0,0,0,0);
      Frame0118:SetBackdropBorderColor(0,0,0,0);       
      
      Frame0119:RegisterForDrag("LeftButton");
      Frame0119:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame0119:SetBackdropColor(0,0,0,0);
      Frame0119:SetBackdropBorderColor(0,0,0,0);          
     
   FDragStart(110);FDragStop(110);
   FDragStart(111);FDragStop(110,111);
   FDragStart(112);FDragStop(110,112);   
   FDragStart(113);FDragStop(110,113);
   FDragStart(114);FDragStop(110,114);
   FDragStart(115);FDragStop(110,115);   
   FDragStart(116);FDragStop(110,116);  
   FDragStart(117);FDragStop(110,117); 
   FDragStart(118);FDragStop(110,118);   
   FDragStart(119);FDragStop(110,119);     
   
   Frame0110:SetPoint(unpack(Ll.FramePos[110]));
   Frame0111:SetPoint(unpack(Ll.FramePos[111]));
   Frame0112:SetPoint(unpack(Ll.FramePos[112]));
   Frame0113:SetPoint(unpack(Ll.FramePos[113]));
   Frame0114:SetPoint(unpack(Ll.FramePos[114]));
   Frame0115:SetPoint(unpack(Ll.FramePos[115]));
   Frame0116:SetPoint(unpack(Ll.FramePos[116]));
   Frame0117:SetPoint(unpack(Ll.FramePos[117]));
   Frame0118:SetPoint(unpack(Ll.FramePos[118]));
   Frame0119:SetPoint(unpack(Ll.FramePos[119]));
        
   if (InBattleground(8)) then
     Frame0110:Show();     
   else
     Frame0110:Hide();     
   end      
end
end

if (event=="CHAT_MSG_BG_SYSTEM_ALLIANCE" or event=="CHAT_MSG_BG_SYSTEM_HORDE") then
local arg1=...;
msg=arg1;
          if (string.find(msg,L["Alliance take flag"])) then
                      Ll.TPCarrier[1] = WGallCar(msg);
          end
          if (string.find(msg,L["Horde take flag"])) then
                      Ll.TPCarrier[2] = WGhorCar(msg);                
          end          
          if (string.find(msg,L["Alliance loose flag"]) or string.find(msg,L["Alliance capture"])) then
                      Ll.TPCarrier[1] = nil;
                      Ll.CarrierHealth[1] = "";
                      Ll.TexWidth[111] = 50;
          end
          if (string.find(msg,L["Horde loose flag"]) or string.find(msg,L["Horde capture"])) then
                      Ll.TPCarrier[2] = nil;
                      Ll.CarrierHealth[2] = "";
                      Ll.TexWidth[112] = 50;
          end
          if (string.find(msg,L["Horde return"])) then
                      Ll.TPCarrier[1] = nil;
                      Ll.CarrierHealth[1] = "";
                      Ll.TexWidth[111] = 50;
          end
          if (string.find(msg,L["Alliance return"])) then
                      Ll.TPCarrier[2] = nil;
                      Ll.CarrierHealth[2] = "";
                      Ll.TexWidth[112] = 50;
          end              
end

if (event=="UPDATE_BATTLEFIELD_SCORE") then
RequestBattlefieldScoreData();
end

if (event=="ZONE_CHANGED_NEW_AREA") then
Ll.TPCarrier[1] = nil;
Ll.TPCarrier[2] = nil;
Ll.CarrierHealth[1] = "";
Ll.CarrierHealth[2] = "";
Ll.TexWidth[111] = 50;
Ll.TexWidth[112] = 50;
  if (InBattleground(8)) then
     Frame0110:Show();     
  else
     Frame0110:Hide();     
  end
end 
end
Frame0110:SetScript("OnEvent",Frame0110.OnEvent);

--------------------------------------------------------------------------Update
local function MainUpdate()

---Visibility 
if (InPrepa() or Ll.Active.Score==0 or Ll.Active.Addon==0) then
  Frame0110:SetAlpha(0);
else
  Frame0110:SetAlpha(1);
end

---Scale
Frame0110:SetScale(Ll.Scale[110]);

---Height/Width/Textures/Texts 1
local Bdr,Bdg,Bdb,Bda = unpack(Ll.Colors[86]);
local BBdr,BBdg,BBdb,BBda = unpack(Ll.Colors[87]);  
Frame0111:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame0111:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame0111:SetHeight(Ll.BarHeight[110]);
Frame0111:SetWidth(Ll.BarWidth[110]);

FrameTex0111:SetTexture(Ll.Textures[Ll.TextureKey[110]]);
FrameTex0111:SetPoint("LEFT",Frame0111,"LEFT",Ll.TexXofs[110],Ll.TexYofs[110]);
FrameTex0111:SetHeight(Ll.TexHeight[110]);

if (Ll.FillBars[110]==1) then
   FrameTex0111:SetWidth(Ll.TexWidth[110]);
else
   if (Ll.AlwaysUp[2]~="") then     
     if (WGscore(Ll.AlwaysUp[2])==0) then
        FrameTex0111:SetWidth(1);
     else
        FrameTex0111:SetWidth((Ll.TexWidth[110]/3)*WGscore(Ll.AlwaysUp[2]));         
     end
   end
end

local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[80]);
local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[81]);
FrameTex0111:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[110]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);

---Height/Width/Textures/Texts 2
Frame0112:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame0112:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame0112:SetHeight(Ll.BarHeight[110]);
Frame0112:SetWidth(Ll.BarWidth[110]);

FrameTex0112:SetTexture(Ll.Textures[Ll.TextureKey[110]]);
FrameTex0112:SetPoint("LEFT",Frame0112,"LEFT",Ll.TexXofs[110],Ll.TexYofs[110]);
FrameTex0112:SetHeight(Ll.TexHeight[110]);

if (Ll.FillBars[110]==1) then
   FrameTex0112:SetWidth(Ll.TexWidth[110]);
else
   if (Ll.AlwaysUp[3]~="") then     
     if (WGscore(Ll.AlwaysUp[3])==0) then
        FrameTex0112:SetWidth(1);
     else
        FrameTex0112:SetWidth((Ll.TexWidth[110]/3)*WGscore(Ll.AlwaysUp[3]));         
     end
   end
end

local Hr1,Hg1,Hb1,Ha1 = unpack(Ll.Colors[82]);
local Hr2,Hg2,Hb2,Ha2 = unpack(Ll.Colors[83]);
FrameTex0112:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[110]],Hr1,Hg1,Hb1,Ha1,Hr2,Hg2,Hb2,Ha2);

---Height/Width/Textures/Texts 3
FrameText0113:SetFont(Ll.Fonts[Ll.FontKey[110]],Ll.FontSize[110],Ll.FontOutline[Ll.FontOutlineKey[110]]);
if (Ll.AlwaysUp[1]~="") then
FrameText0113:SetText(Ll.AlwaysUp[1]);
end

---Frame Score Text 1
FrameText0114:SetFont(Ll.Fonts[Ll.FontKey[110]],Ll.FontSize[110],Ll.FontOutline[Ll.FontOutlineKey[110]]);
if (Ll.AlwaysUp[2]~="") then
FrameText0114:SetText(Ll.AlwaysUp[2]);
end

---Frame Score Text 2
FrameText0115:SetFont(Ll.Fonts[Ll.FontKey[110]],Ll.FontSize[110],Ll.FontOutline[Ll.FontOutlineKey[110]]);
if (Ll.AlwaysUp[3]~="") then
FrameText0115:SetText(Ll.AlwaysUp[3]);
end

FrameText0116:SetFont(Ll.Fonts[Ll.FontKey[111]],Ll.FontSize[111],Ll.FontOutline[Ll.FontOutlineKey[111]]);
FrameText0117:SetFont(Ll.Fonts[Ll.FontKey[111]],Ll.FontSize[111],Ll.FontOutline[Ll.FontOutlineKey[111]]);

FrameText0118:SetFont(Ll.Fonts[Ll.FontKey[111]],Ll.FontSize[111],Ll.FontOutline[Ll.FontOutlineKey[111]]);
FrameText0119:SetFont(Ll.Fonts[Ll.FontKey[111]],Ll.FontSize[111],Ll.FontOutline[Ll.FontOutlineKey[111]]);

--Check carrier with targets
IsCarrierTP(Faction);
for i=1,GetNumRaidMembers() do            
    local TargetID = format("raid%d%s",i,"target");
    local Target = UnitName(TargetID);
    local TargetTargetID = format("raid%d%s",i,"targettarget");
    local TargetTarget = UnitName(TargetTargetID);
     if (Target~=nil) then 
        IsCarrierATP(TargetID);
        IsCarrierHTP(TargetID);          
        if (TargetTarget~=nil) then
            IsCarrierATP(TargetTargetID);
            IsCarrierHTP(TargetTargetID);
        end          
     end
end 

--Frame Carrier Name 1
if (Ll.TPCarrier[1]==nil) then
             Frame0116:Hide();
             FrameText0116:SetText("");
             FrameText0118:SetText("");
             FrameTex0116:SetAlpha(0);                          
             Frame0116:SetAttribute("macrotext",format("/target %s",""));                  
else
             if (Frame0116:IsVisible()) then
               FrameText0118:SetText(Ll.CarrierHealth[1]);
               FrameTex0116:SetWidth(Ll.TexWidth[111]);
             end                        
             Frame0116:Show();
             FrameText0116:SetText(Ll.TPCarrier[1]);                                                       
             for i=1,GetNumBattlefieldScores() do
                  local Name,_,_,_,_,_,_,_,class = GetBattlefieldScore(i);               
                      local name = FormatCarrier(Name);                                                                                        
                  if (string.match(Ll.TPCarrier[1],name)~=nil) then
                      local A,B,C,D = ColorCarrier(class);                                          
                      FrameText0116:SetTextColor(A,B,C,D);
                      FrameTex0116:SetGradientAlpha("HORIZONTAL",A,B,C,D,A,B,C,D);                
                      Frame0116:SetAttribute("macrotext", format("/target %s",Name));                                                                                   
                  end
             end
                                   
end

if (Ll.TPCarrier[2]==nil) then             
             Frame0117:Hide();
             FrameText0117:SetText("");
             FrameText0119:SetText("");
             FrameTex0117:SetAlpha(0);                            
             Frame0117:SetAttribute("macrotext",format("/tar %s",""));
else
             if (Frame0117:IsVisible()) then
               FrameText0119:SetText(Ll.CarrierHealth[2]);
               FrameTex0117:SetWidth(Ll.TexWidth[112]);
             end                 
             Frame0117:Show();
             FrameText0117:SetText(Ll.TPCarrier[2]);                                             
             for i=1,GetNumBattlefieldScores() do
                      local Name,_,_,_,_,_,_,_,class = GetBattlefieldScore(i);                        
                      local name = FormatCarrier(Name);                                                                     
                  if (string.match(Ll.TPCarrier[2],name)~=nil) then
                      local D,E,F,G = ColorCarrier(class);                      
                      FrameText0117:SetTextColor(D,E,F,G);
                      FrameTex0117:SetGradientAlpha("HORIZONTAL",D,E,F,G,D,E,F,G);             
                      Frame0117:SetAttribute("macrotext",format("/tar %s",Name));                                                                      
                  end
             end                                        
end
end
Frame0110:SetScript("OnUpdate",function() MainUpdate(); end);

------------------------------------------------------------------Move-functions
function MoveTwinPeaks()
if (Frame0110:IsVisible()) then
MoveFrame(110);
MoveFrame(111,111);
MoveFrame(112,112);
MoveFrame(113);
MoveFrame(114);
MoveFrame(115);
MoveFrame(116);
MoveFrame(117);
MoveFrame(118);
MoveFrame(119);
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
end
end
