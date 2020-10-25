-----------------------------------LLMain---------------------------------------
--------------------------------------------------------------------------------
local L = LLPvpState_Locals;
--------------------------------------------------------------------------------
local LLInitialize = CreateFrame("Frame","InitializeFrame",UIParent);
LLInitialize:RegisterEvent("ADDON_LOADED");
LLInitialize:RegisterEvent("PLAYER_LOGOUT"); 
                                  
----------------------------------------------------------------------Initialize
function LLInitialize:OnEvent(event,arg1)
if (event=="ADDON_LOADED") then
local arg1=arg1;
if (arg1=="LLPvpState") then
   if (LLPvpStateSaves==nil) then    
    Ll = LLPvpState_init;
   else    
    Ll = LLPvpStateSaves;
   end     
end
end
if (event=="PLAYER_LOGOUT") then
LLPvpStateSaves=Ll;
end
end
LLInitialize:SetScript("OnEvent",LLInitialize.OnEvent);

----------------------------------------------------------Refresh-Always-Up-Text
function LLInitialize:OnUpdate(elpased)
if ((Ll.Active.Score == 1 and Ll.Active.Addon==1) or not GetRealZoneText()=="Tol Barad Peninsula") then
   if (AlwaysUpFrame1Text) then
     Ll.AlwaysUp[1] = AlwaysUpFrame1Text:GetText();
     AlwaysUpFrame1:SetAlpha(0);
   else
     Ll.AlwaysUp[1] = "";   
   end
   
   if (AlwaysUpFrame2Text) then
     Ll.AlwaysUp[2] = AlwaysUpFrame2Text:GetText();
     AlwaysUpFrame2:SetAlpha(0);
   else
     Ll.AlwaysUp[2] = "";   
   end
   
   if (AlwaysUpFrame3Text) then
     Ll.AlwaysUp[3] = AlwaysUpFrame3Text:GetText();
     AlwaysUpFrame3:SetAlpha(0);
   else
     Ll.AlwaysUp[3] = "";   
   end  
else
 if (AlwaysUpFrame1) then
  AlwaysUpFrame1:SetAlpha(1);
 end
 if (AlwaysUpFrame2) then
  AlwaysUpFrame2:SetAlpha(1);
 end
 if (AlwaysUpFrame3) then
  AlwaysUpFrame3:SetAlpha(1);
 end
end
end
LLInitialize:SetScript("OnUpdate",LLInitialize.OnUpdate);