--------------------------------Warsong-Gulch-----------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
local _,Faction = UnitFactionGroup("player");
--------------------------------------------------------------------------------
---MainFrame
local Frame020 = CreateFrame("Frame","Frame020",UIParent);
Frame020:RegisterEvent("ADDON_LOADED");
Frame020:RegisterEvent("ZONE_CHANGED_NEW_AREA");
Frame020:RegisterEvent("CHAT_MSG_BG_SYSTEM_ALLIANCE");
Frame020:RegisterEvent("CHAT_MSG_BG_SYSTEM_HORDE");
Frame020:RegisterEvent("UPDATE_BATTLEFIELD_SCORE");
Frame020:SetHeight(70);
Frame020:SetWidth(200);
Frame020:RegisterForDrag("LeftButton");

---Score Bars
local Frame021 = CreateFrame("Frame","Frame021",Frame020);
Frame021:RegisterForDrag("LeftButton");
local FrameTex021 = Frame021:CreateTexture("FrameTex021");

local Frame022 = CreateFrame("Frame","Frame022",Frame020);
Frame022:RegisterForDrag("LeftButton");
local FrameTex022 = Frame022:CreateTexture("FrameTex022");

---Timer text
local Frame023 = CreateFrame("Frame","Frame023",Frame020);
Frame023:RegisterForDrag("LeftButton");
Frame023:SetHeight(15);
Frame023:SetWidth(120);
local FrameText023 = Frame023:CreateFontString("FrameText023");
FrameText023:SetPoint("CENTER",Frame023,"CENTER",0,0);

---Score text
local Frame024 = CreateFrame("Frame","Frame024",Frame020);
Frame024:RegisterForDrag("LeftButton");
Frame024:SetHeight(15);
Frame024:SetWidth(50);
local FrameText024 = Frame024:CreateFontString("FrameText024");
FrameText024:SetPoint("CENTER",Frame024,"CENTER",0,0);

local Frame025 = CreateFrame("Frame","Frame025",Frame020);
Frame025:RegisterForDrag("LeftButton");
Frame025:SetHeight(15);
Frame025:SetWidth(50);
local FrameText025 = Frame025:CreateFontString("FrameText025");
FrameText025:SetPoint("CENTER",Frame025,"CENTER",0,0);

---Flag Carriers
local Frame026 = CreateFrame("Button","Frame026",Frame020,"SecureActionButtonTemplate");
local FrameText026 = Frame026:CreateFontString("FrameText026");
FrameText026:SetPoint("LEFT",Frame026,"LEFT",0,0);
local FrameTex026 = Frame026:CreateTexture("FrameTex026");
FrameTex026:SetPoint("LEFT",Frame026,"LEFT",0,-10);
FrameTex026:SetHeight(3);

local Frame027 = CreateFrame("Button","Frame027",Frame020,"SecureActionButtonTemplate");      
local FrameText027 = Frame027:CreateFontString("FrameText027");
FrameText027:SetPoint("LEFT",Frame027,"LEFT",0,0);
local FrameTex027 = Frame027:CreateTexture("FrameTex027");
FrameTex027:SetPoint("LEFT",Frame027,"LEFT",0,-10);
FrameTex027:SetHeight(3);

---Carrier Health
local Frame028 = CreateFrame("Frame","Frame028",Frame020);
Frame028:SetHeight(15);
Frame028:SetWidth(50);
local FrameText028 = Frame028:CreateFontString("FrameText028");
FrameText028:SetPoint("CENTER",Frame028,"CENTER",0,0);

local Frame029 = CreateFrame("Frame","Frame029",Frame020);
Frame029:SetHeight(15);
Frame029:SetWidth(50);      
local FrameText029 = Frame029:CreateFontString("FrameText029");
FrameText029:SetPoint("CENTER",Frame029,"CENTER",0,0);

---------------------------------------------------------------------------Event
function Frame020:OnEvent(event,...)
if (event=="ADDON_LOADED") then
local arg1=...;
if (arg1=="LLPvpState") then
      Frame020:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame020:SetBackdropColor(0,0,0,0);
      Frame020:SetBackdropBorderColor(0,0,0,0);
      
      Frame021:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      Frame022:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5,insets={left=2,right=2,top=2,bottom=2}});
      
      Frame023:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame023:SetBackdropColor(0,0,0,0);
      Frame023:SetBackdropBorderColor(0,0,0,0);
      
      Frame024:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame024:SetBackdropColor(0,0,0,0);
      Frame024:SetBackdropBorderColor(0,0,0,0);
      
      Frame025:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame025:SetBackdropColor(0,0,0,0);
      Frame025:SetBackdropBorderColor(0,0,0,0);
   
      Frame026:RegisterForDrag("LeftButton");
      Frame026:EnableMouse(true);
      Frame026:SetMovable(false);
      Frame026:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame026:SetBackdropColor(0,0,0,0);
      Frame026:SetBackdropBorderColor(0,0,0,0);
      Frame026:SetWidth(100); 
      Frame026:SetHeight(15);
      Frame026:SetScript("OnEnter",function() Frame026:SetBackdropColor(0,0,0.5,0.5); end);
      Frame026:SetScript("OnLeave",function() Frame026:SetBackdropColor(0,0,0,0); end);
      Frame026:SetAttribute("type1","macro");
      FrameTex026:SetTexture(Ll.Textures[1]);
      FrameTex026:SetWidth(Ll.TexWidth[21]); 
      
      Frame027:RegisterForDrag("LeftButton");
      Frame027:EnableMouse(true);
      Frame027:SetMovable(false);
      Frame027:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame027:SetBackdropColor(0,0,0,0);
      Frame027:SetBackdropBorderColor(0,0,0,0);
      Frame027:SetWidth(100); 
      Frame027:SetHeight(15);
      Frame027:SetScript("OnEnter",function() Frame027:SetBackdropColor(0.5,0,0,0.5); end);
      Frame027:SetScript("OnLeave",function() Frame027:SetBackdropColor(0,0,0,0); end);     
      Frame027:SetAttribute("type1","macro");
      FrameTex027:SetTexture(Ll.Textures[1]);
      FrameTex027:SetWidth(Ll.TexWidth[22]);  
      
      Frame028:RegisterForDrag("LeftButton");
      Frame028:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame028:SetBackdropColor(0,0,0,0);
      Frame028:SetBackdropBorderColor(0,0,0,0);       
      
      Frame029:RegisterForDrag("LeftButton");
      Frame029:SetBackdrop({bgFile=Ll.Textures[1],edgeFile=Ll.Edges[1],edgeSize=5});
      Frame029:SetBackdropColor(0,0,0,0);
      Frame029:SetBackdropBorderColor(0,0,0,0);          
     
   FDragStart(20);FDragStop(20);
   FDragStart(21);FDragStop(20,21);
   FDragStart(22);FDragStop(20,22);   
   FDragStart(23);FDragStop(20,23);
   FDragStart(24);FDragStop(20,24);
   FDragStart(25);FDragStop(20,25);   
   FDragStart(26);FDragStop(20,26);  
   FDragStart(27);FDragStop(20,27); 
   FDragStart(28);FDragStop(20,28);   
   FDragStart(29);FDragStop(20,29);     
   
   Frame020:SetPoint(unpack(Ll.FramePos[20]));
   Frame021:SetPoint(unpack(Ll.FramePos[21]));
   Frame022:SetPoint(unpack(Ll.FramePos[22]));
   Frame023:SetPoint(unpack(Ll.FramePos[23]));
   Frame024:SetPoint(unpack(Ll.FramePos[24]));
   Frame025:SetPoint(unpack(Ll.FramePos[25]));
   Frame026:SetPoint(unpack(Ll.FramePos[26]));
   Frame027:SetPoint(unpack(Ll.FramePos[27]));
   Frame028:SetPoint(unpack(Ll.FramePos[28]));
   Frame029:SetPoint(unpack(Ll.FramePos[29]));
        
   if (InBattleground(2)) then
     Frame020:Show();     
   else
     Frame020:Hide();     
   end      
end
end

if (event=="CHAT_MSG_BG_SYSTEM_ALLIANCE" or event=="CHAT_MSG_BG_SYSTEM_HORDE") then
local arg1=...;
msg=arg1;
          if (string.find(msg,L["Alliance take flag"])) then
                      Ll.CarrierName[1] = WGallCar(msg);
          end
          if (string.find(msg,L["Horde take flag"])) then
                      Ll.CarrierName[2] = WGhorCar(msg);                
          end          
          if (string.find(msg,L["Alliance loose flag"]) or string.find(msg,L["Alliance capture"])) then
                      Ll.CarrierName[1] = nil;
                      Ll.CarrierHealth[1] = "";
                      Ll.TexWidth[21] = 50;
          end
          if (string.find(msg,L["Horde loose flag"]) or string.find(msg,L["Horde capture"])) then
                      Ll.CarrierName[2] = nil;
                      Ll.CarrierHealth[2] = "";
                      Ll.TexWidth[22] = 50;
          end
          if (string.find(msg,L["Horde return"])) then
                      Ll.CarrierName[1] = nil;
                      Ll.CarrierHealth[1] = "";
                      Ll.TexWidth[21] = 50;
          end
          if (string.find(msg,L["Alliance return"])) then
                      Ll.CarrierName[2] = nil;
                      Ll.CarrierHealth[2] = "";
                      Ll.TexWidth[22] = 50;
          end              
end

if (event=="UPDATE_BATTLEFIELD_SCORE") then
RequestBattlefieldScoreData();
end

if (event=="ZONE_CHANGED_NEW_AREA") then
Ll.CarrierName[1] = nil;
Ll.CarrierName[2] = nil;
Ll.CarrierHealth[1] = "";
Ll.CarrierHealth[2] = "";
Ll.TexWidth[21] = 50;
Ll.TexWidth[22] = 50;
  if (InBattleground(2)) then
     Frame020:Show();     
  else
     Frame020:Hide();     
  end
end 
end
Frame020:SetScript("OnEvent",Frame020.OnEvent);

--------------------------------------------------------------------------Update
local function MainUpdate()

---Visibility 
if (InPrepa() or Ll.Active.Score==0 or Ll.Active.Addon==0) then
  Frame020:SetAlpha(0);
else
  Frame020:SetAlpha(1);
end

---Scale
Frame020:SetScale(Ll.Scale[20]);

---Height/Width/Textures/Texts 1
local Bdr,Bdg,Bdb,Bda = unpack(Ll.Colors[26]);
local BBdr,BBdg,BBdb,BBda = unpack(Ll.Colors[27]);  
Frame021:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame021:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame021:SetHeight(Ll.BarHeight[20]);
Frame021:SetWidth(Ll.BarWidth[20]);

FrameTex021:SetTexture(Ll.Textures[Ll.TextureKey[20]]);
FrameTex021:SetPoint("LEFT",Frame021,"LEFT",Ll.TexXofs[20],Ll.TexYofs[20]);
FrameTex021:SetHeight(Ll.TexHeight[20]);
SCBars("FrameTex021",WGscore(Ll.AlwaysUp[2]),3,20);

local Ar1,Ag1,Ab1,Aa1 = unpack(Ll.Colors[20]);
local Ar2,Ag2,Ab2,Aa2 = unpack(Ll.Colors[21]);
FrameTex021:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[20]],Ar1,Ag1,Ab1,Aa1,Ar2,Ag2,Ab2,Aa2);

---Height/Width/Textures/Texts 2
Frame022:SetBackdropColor(Bdr,Bdg,Bdb,Bda);
Frame022:SetBackdropBorderColor(BBdr,BBdg,BBdb,BBda);
Frame022:SetHeight(Ll.BarHeight[20]);
Frame022:SetWidth(Ll.BarWidth[20]);

FrameTex022:SetTexture(Ll.Textures[Ll.TextureKey[20]]);
FrameTex022:SetPoint("LEFT",Frame022,"LEFT",Ll.TexXofs[20],Ll.TexYofs[20]);
FrameTex022:SetHeight(Ll.TexHeight[20]);
SCBars("FrameTex022",WGscore(Ll.AlwaysUp[3]),3,20);

local Hr1,Hg1,Hb1,Ha1 = unpack(Ll.Colors[22]);
local Hr2,Hg2,Hb2,Ha2 = unpack(Ll.Colors[23]);
FrameTex022:SetGradientAlpha(Ll.TexGradient[Ll.TexGradientKey[20]],Hr1,Hg1,Hb1,Ha1,Hr2,Hg2,Hb2,Ha2);

---Height/Width/Textures/Texts 3
FrameText023:SetFont(Ll.Fonts[Ll.FontKey[20]],Ll.FontSize[20],Ll.FontOutline[Ll.FontOutlineKey[20]]);
if (Ll.AlwaysUp[1]~="") then
FrameText023:SetText(Ll.AlwaysUp[1]);
end

---Frame Score Text 1
FrameText024:SetFont(Ll.Fonts[Ll.FontKey[20]],Ll.FontSize[20],Ll.FontOutline[Ll.FontOutlineKey[20]]);
if (Ll.AlwaysUp[2]~="") then
FrameText024:SetText(Ll.AlwaysUp[2]);
end

---Frame Score Text 2
FrameText025:SetFont(Ll.Fonts[Ll.FontKey[20]],Ll.FontSize[20],Ll.FontOutline[Ll.FontOutlineKey[20]]);
if (Ll.AlwaysUp[3]~="") then
FrameText025:SetText(Ll.AlwaysUp[3]);
end

FrameText026:SetFont(Ll.Fonts[Ll.FontKey[21]],Ll.FontSize[21],Ll.FontOutline[Ll.FontOutlineKey[21]]);
FrameText027:SetFont(Ll.Fonts[Ll.FontKey[21]],Ll.FontSize[21],Ll.FontOutline[Ll.FontOutlineKey[21]]);

FrameText028:SetFont(Ll.Fonts[Ll.FontKey[21]],Ll.FontSize[21],Ll.FontOutline[Ll.FontOutlineKey[21]]);
FrameText029:SetFont(Ll.Fonts[Ll.FontKey[21]],Ll.FontSize[21],Ll.FontOutline[Ll.FontOutlineKey[21]]);

--Check carrier with targets
IsCarrier(Faction);
for i=1,GetNumRaidMembers() do            
    local TargetID = format("raid%d%s",i,"target");
    local Target = UnitName(TargetID);
    local TargetTargetID = format("raid%d%s",i,"targettarget");
    local TargetTarget = UnitName(TargetTargetID);
     if (Target~=nil) then 
        IsCarrierA(TargetID);
        IsCarrierH(TargetID);          
        if (TargetTarget~=nil) then
            IsCarrierA(TargetTargetID);
            IsCarrierH(TargetTargetID);
        end          
     end
end 

--Frame Carrier Name 1
if (Ll.CarrierName[1]==nil) then
             Frame026:Hide();
             FrameText026:SetText("");
             FrameText028:SetText("");
             FrameTex026:SetAlpha(0);                          
             Frame026:SetAttribute("macrotext",format("/target %s",""));                  
else
             if (Frame026:IsVisible()) then
               FrameText028:SetText(Ll.CarrierHealth[1]);
               FrameTex026:SetWidth(Ll.TexWidth[21]);
             end                        
             Frame026:Show();
             FrameText026:SetText(Ll.CarrierName[1]);                                                       
             for i=1,GetNumBattlefieldScores() do
                  local Name,_,_,_,_,_,_,_,class = GetBattlefieldScore(i);               
                      local name = FormatCarrier(Name);                                                                                        
                  if (string.match(Ll.CarrierName[1],name)~=nil) then
                      local A,B,C,D = ColorCarrier(class);                                          
                      FrameText026:SetTextColor(A,B,C,D);
                      FrameTex026:SetGradientAlpha("HORIZONTAL",A,B,C,D,A,B,C,D);                
                      Frame026:SetAttribute("macrotext", format("/target %s",Name));                                                                                   
                  end
             end
                                   
end

if (Ll.CarrierName[2]==nil) then             
             Frame027:Hide();
             FrameText027:SetText("");
             FrameText029:SetText("");
             FrameTex027:SetAlpha(0);                            
             Frame027:SetAttribute("macrotext",format("/tar %s",""));
else
             if (Frame027:IsVisible()) then
               FrameText029:SetText(Ll.CarrierHealth[2]);
               FrameTex027:SetWidth(Ll.TexWidth[22]);
             end                 
             Frame027:Show();
             FrameText027:SetText(Ll.CarrierName[2]);                                             
             for i=1,GetNumBattlefieldScores() do
                      local Name,_,_,_,_,_,_,_,class = GetBattlefieldScore(i);                        
                      local name = FormatCarrier(Name);                                                                     
                  if (string.match(Ll.CarrierName[2],name)~=nil) then
                      local D,E,F,G = ColorCarrier(class);                      
                      FrameText027:SetTextColor(D,E,F,G);
                      FrameTex027:SetGradientAlpha("HORIZONTAL",D,E,F,G,D,E,F,G);             
                      Frame027:SetAttribute("macrotext",format("/tar %s",Name));                                                                      
                  end
             end                                        
end
end
Frame020:SetScript("OnUpdate",function() MainUpdate(); end);

------------------------------------------------------------------Move-functions
function MoveWgulch()
if (Frame020:IsVisible()) then
MoveFrame(20);
MoveFrame(21,21);
MoveFrame(22,22);
MoveFrame(23);
MoveFrame(24);
MoveFrame(25);
MoveFrame(26);
MoveFrame(27);
MoveFrame(28);
MoveFrame(29);
else
   ChatFrame1:AddMessage("[LLPvpState] : Can't do it now.",0.5,0.5,0.9);
end
end



