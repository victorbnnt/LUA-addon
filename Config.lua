--------------------------------------------------------------------------Locals
--------------------------------------------------------------------------------
local background=("Interface\\AddOns\\LLPvpState\\Texture\\Blank.tga");
local edge =("Interface\\AddOns\\LLPvpState\\Texture\\Border.tga");
local fontM = ("Interface\\AddOns\\LLPvpState\\Font\\ARIALN.ttf");
local L = LLPvpState_Locals;
local Tabs = {[10] = "Arathi Basin",
              [20] = "Warsong Gulch",
              [30] = "I. of Conquest",
              [40] = "Eye of Storm",
              [50] = "Strand of Anc.",
              [60] = "Alterac V. 1", [61] = "Alterac V. 2", 
              [70] = "Wintergrasp",
              [80] = "Twin Peaks",
              [90] = "Gilneas Battle",
              [100] = "Tol Barad"};

--------------------------------Configuration-----------------------------------
--------------------------------------------------------------------------------
local MenuTitle = CreateFrame("Frame","MenuTitle",UIParent);
MenuTitle:SetPoint("CENTER",UIParent,"CENTER",0,220);
MenuTitle:SetFrameLevel(4);
MenuTitle:SetHeight(25);
MenuTitle:SetWidth(150);
MenuTitle:RegisterForDrag("LeftButton");
MenuTitle:SetMovable(true);
MenuTitle:EnableMouse(true);
MenuTitle:SetScript("OnDragStart", function(self) self:StartMoving() end);
MenuTitle:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end);
MenuTitle:SetBackdrop({bgFile=background,edgeFile=edge,edgeSize=10,insets={2,2,2,2}});
MenuTitle:SetBackdropBorderColor(0.6,0.6,1,1);
MenuTitle:SetBackdropColor(0.1,0.1,0.1,1);
MenuTitle:SetFrameLevel(1);
MenuTitle:Hide();

local Title = MenuTitle:CreateFontString(Title,"ARTWORK","GameFontNormal");
Title:SetPoint("CENTER",MenuTitle,"CENTER",0,0);
Title:SetText("LLPvpState Config");

local CloseButton = CreateFrame("Button","CloseButton",MenuTitle,"OptionsButtonTemplate");
CloseButton:SetPoint("TOP",MenuTitle,"BOTTOM",161,-450);
CloseButton:SetHeight(20);
CloseButton:SetWidth(100);
CloseButton:SetText("Close");
CloseButton:SetScript("OnClick",function() for i=0,11 do local frame = "MenuFrame%d"; Frame = _G[frame:format(i)]; Frame:Hide(); end MenuTitle:Hide(); end);

local ResetButton = CreateFrame("Button","ResetButton",MenuTitle,"OptionsButtonTemplate");
ResetButton:SetPoint("TOP",MenuTitle,"BOTTOM",-161,-450);
ResetButton:SetHeight(20);
ResetButton:SetWidth(100);
ResetButton:SetText("Reset");
ResetButton:SetScript("OnClick",function() Reset(); end);

-----------------------------------------------------------------------Functions
--------------------------------------------------------------------------------
------------------------------------------------------------------Frame_function
local function CreateBackgroundFrame(Name,key)
   local Name = Name:format(key);
   local Name = CreateFrame("Frame",Name,MenuTitle);
   Name:SetPoint("TOP",MenuTitle,"BOTTOM",0,12.5);
   Name:SetBackdrop({bgFile=background,edgeFile=edge,edgeSize=10,insets={2,2,2,2}});
   Name:SetBackdropBorderColor(0.6,0.6,1,1);
   Name:SetBackdropColor(0.1,0.1,0.1,1);
   Name:SetFrameLevel(0);
   Name:SetHeight(460);
   Name:SetWidth(420);   
   Name:Hide();
end

--------------------------------------------------------------------Tab_function
local function CreateTab(Name,key,xpos,ypos,TextName,Textkey,text)
  local name,textname = Name:format(key),TextName:format(Textkey);
  local name = CreateFrame("Button",name,MenuTitle);
      name:SetPoint("TOP",MenuTitle,"BOTTOM",xpos,ypos);
      name:SetBackdrop({bgFile=background,edgeFile=edge,edgeSize=8,insets={2,2,2,2}});
      name:SetBackdropColor(0.1,0.1,0.1,0.8);
      name:SetFrameLevel(1);
      name:SetBackdropBorderColor(0.6,0.6,1,1);        
      name:SetHeight(20);
      name:SetWidth(100);
  local textname = name:CreateFontString(textname,"ARTWORK","GameFontNormal");
      textname:SetPoint("CENTER",name,"CENTER",0,0);
      textname:SetText(text);
end

------------------------------------------------------------------Title_function
local function CreateTitle(Name,key,parent,parentkey,xofs,yofs,text)
local name,parent = Name:format(key),_G[parent:format(parentkey)];
local name = parent:CreateFontString(name);
name:SetPoint("TOPLEFT",parent,"TOPLEFT",xofs,yofs);
name:SetFont(fontM,14);
name:SetText(text);
name:SetTextColor(255/255,125/255,80/255);
end

-------------------------------------------------------------------Text_function
local function CreateText(Name,key,parent,parentkey,xofs,yofs,text)
local name,parent = Name:format(key),_G[parent:format(parentkey)];
local name = parent:CreateFontString(name);
name:SetPoint("TOPLEFT",parent,"TOPLEFT",xofs,yofs);
name:SetFont(fontM,12);
name:SetText(text);
end

-----------------------------------------------------------CheckButtons_function
local function CreateCheckB(name,key,Parent,parentkey,xpos,ypos)
   local Frame,parent = name:format(key),_G[Parent:format(parentkey)];
   local Frame = CreateFrame("CheckButton",Frame,parent,"OptionsCheckButtonTemplate");
   Frame:SetPoint("TOPLEFT",parent,"TOPLEFT",xpos,ypos);
   Frame:SetHitRectInsets(5,5,5,5);
end

-------------------------------------------------------------------Move_function
local function LlMove(Name,key,Parent,parentkey,xofs,yofs,text,width)
   local name,parent = Name:format(key),_G[Parent:format(parentkey)];
   local name = CreateFrame("Button",name,parent,"OptionsButtonTemplate");
         name:SetPoint("TOPLEFT",parent,"TOPLEFT",xofs,yofs);
         name:SetHeight(15);
         name:SetWidth(width);
         name:SetText(text);
end

-------------------------------------------------------Create-TextureDD_function
local function CreateDropDownTexture(Name,key,TexName,Texkey,TextName,Textkey,DDname,DDkey,parentname,parentkey,xofs,yofs)
   local name,tex,text,DD,parent = Name:format(key),TexName:format(Texkey),TextName:format(Textkey),DDname:format(DDkey),_G[parentname:format(parentkey)];
   local name = CreateFrame("Button",name,parent);
     name:SetPoint("TOPLEFT",parent,"TOPLEFT",xofs,yofs);
     name:SetHeight(14);
     name:SetWidth(90);
     name:SetBackdrop({edgeFile=edge,edgeSize=8});   
   local tex = name:CreateTexture(tex);
     tex:SetPoint("CENTER",name,"CENTER",0,0);
     tex:SetHeight(9);
     tex:SetWidth(85);
     tex:SetGradientAlpha("HORIZONTAL",173/255,173/255,173/255,1,173/255,173/255,173/255,1);   
   local text = name:CreateFontString(text,"ARTWORK","GameFontNormal");
     text:SetPoint("CENTER",name,"CENTER",0,1);                                                
   local DD = CreateFrame("Frame",DD,name,"UIDropDownMenuTemplate");
end

-----------------------------------------------------------Texture_dropdown_init
local function TexMenus(self,level,framekey,initkey)
   local T,U = "TextureTex%d","TextureText%d";
   local tex = _G[T:format(framekey)];        
   local text = _G[U:format(framekey)];
   info            = {};
   if not level then return end                            
       wipe(info)
    if level == 1 then
       for i=1,getn(Ll.TexturesName) do
          info.text = Ll.TexturesName[i];
          info.value = i;
          if (Ll.TextureKey[initkey]==i) then info.checked = 1; else info.checked = nil; end;         
          info.func       =  function() Ll.TextureKey[initkey]=i;text:SetText(Ll.TexturesName[i]);tex:SetTexture(Ll.Textures[i]); end; 
          UIDropDownMenu_AddButton(info,level);       
       end      
    end   
end

----------------------------------------------------------Texture_dropdown_Click
local function Texture_OnClick(framekey)
local T,V = "Texture%d","DDTex%d";
local button = _G[T:format(framekey)];
local DD = _G[V:format(framekey)];             
local bg = {
    edgeFile = edge,
    edgeSize = 10,
    bgFile = background,
    insets = { left = 1, right = 1, top = 1, bottom = 1 },
}
hooksecurefunc("ToggleDropDownMenu", function(level, ...)
if (MenuTitle:IsVisible()) then
    if not level then
        level = 1
    end
    local menu2 = _G["DropDownList"..level.."MenuBackdrop"]    
     if menu2 then
        menu2:SetBackdrop(bg);
        menu2:SetBackdropBorderColor(1,1,1);
        menu2:SetBackdropColor(0.1, 0.1, 0.1);        
    end    
  end  
end) 
       ToggleDropDownMenu(1,nil,DD,button,0,0);                      
end

----------------------------------------------------------Create-FontDD_function
local function CreateDropDownFont(Name,key,TextName,Textkey,DDName,DDkey,parentname,parentkey,xofs,yofs)
   local name,text,DD,parent = Name:format(key),TextName:format(Textkey),DDName:format(DDkey),_G[parentname:format(parentkey)];
   local name = CreateFrame("Button",name,parent);
         name:SetPoint("TOPLEFT",parent,"TOPLEFT",xofs,yofs);
         name:SetHeight(14);
         name:SetWidth(90);
         name:SetBackdrop({edgeFile=edge,edgeSize=8});        
   local text = name:CreateFontString(text,"ARTWORK","GameFontNormal");
         text:SetPoint("CENTER",name,"CENTER",0,1);                                                
   local DD = CreateFrame("Frame",DD,name,"UIDropDownMenuTemplate");
end

--------------------------------------------------------------Font_dropdown_init
local function FontsMenus(self,level,framekey,initkey)
   local T = "FontVtext%d";    
   local text = _G[T:format(framekey)];
   info            = {};                           
    if not level then return end
       wipe(info)
    if level == 1 then    
       for i=1,getn(Ll.FontName) do
          info.text = Ll.FontName[i];
          info.value = i;
          if (Ll.FontKey[initkey]==i) then info.checked = 1; else info.checked = nil; end;         
          info.func       =  function() Ll.FontKey[initkey]=i;text:SetText(Ll.FontName[i]);text:SetFont(Ll.Fonts[i],13); end; 
          UIDropDownMenu_AddButton(info,level);       
       end      
    end
end

-------------------------------------------------------------FONT_DropDown_Click
local function Fonts_OnClick(framekey)
local T,U = "FontV%d","FontVDD%d";
local button = _G[T:format(framekey)];
local DD = _G[U:format(framekey)];              
local bg = {
    edgeFile = edge,
    edgeSize = 10,
    bgFile = background,
    insets = { left = 1, right = 1, top = 1, bottom = 1 },
}
hooksecurefunc("ToggleDropDownMenu", function(level, ...)
if (MenuTitle:IsVisible()) then
    if not level then
        level = 1
    end
    local menu2 = _G["DropDownList"..level.."MenuBackdrop"]    
     if menu2 then
        menu2:SetBackdrop(bg);
        menu2:SetBackdropBorderColor(1,1,1);
        menu2:SetBackdropColor(0.1, 0.1, 0.1);        
    end    
  end  
end) 
       ToggleDropDownMenu(1,nil,DD,button,0,0);                      
end

------------------------------------------------------------------------Edit_Box
local function CreateEditBox(Name,key,parent,parentkey,xpos,ypos)
local name,parent = Name:format(key),_G[parent:format(parentkey)];
local name = CreateFrame("EditBox",name,parent);
name:SetPoint("TOPLEFT",parent,"TOPLEFT",xpos,ypos);
name:SetBackdrop({bgFile=background,edgeFile=edge,edgeSize=5});
name:EnableMouse(true);
name:SetBackdropColor(0,0,0,0.5);
name:SetFont(fontM,11);
name:SetHeight(15);
name:SetWidth(35);
name:SetMaxLetters(4);
name:SetAutoFocus(false);
name:EnableKeyboard(true);
name:SetScript("OnEditFocusGained",function() name:HighlightText(); end);
name:SetScript("OnEditFocusLost",function () name:HighlightText(0,0); end);
end

----------------------------------------------------------------CreateScaleFrame
local function CreateScale(name,key,parent,parentkey,xofs,yofs)
   local Frame,parent = name:format(key),_G[parent:format(parentkey)];
   local Frame = CreateFrame("Slider",Frame,parent,"OptionsSliderTemplate");
         Frame:SetPoint("TOPLEFT",parent,"TOPLEFT",xofs,yofs);
         Frame:SetWidth(100);
         Frame:SetMinMaxValues(0.1,2);
         Frame:SetValueStep(0.1);
         _G[Frame:GetName().."Low"]:SetText("0.1");
         _G[Frame:GetName().."High"]:SetText("2");
end

-----------------------------------------------------------ColorButtons_Function
local function colorbuttons(Name,textureName,textName,text,parent,parentkey,xpos,ypos)
local Name,Texture,Text = _G[Name],_G[textureName],_G[textName];
local Parent = _G[parent:format(parentkey)];
Name:SetPoint("TOPLEFT",Parent,"TOPLEFT",xpos,ypos);
Name:SetHeight(15);
Name:SetWidth(65);
Name:SetBackdrop({edgeFile="Interface\\AddOns\\LLPvpState\\Texture\\Border.tga",edgeSize=8});
Texture:SetPoint("CENTER",Name,"CENTER",0,0);
Texture:SetHeight(11);
Texture:SetWidth(61);
Texture:SetTexture("Interface\\AddOns\\LLPvpState\\Texture\\Blank.tga");
Text:SetPoint("CENTER",Name,"CENTER",0,0);
Text:SetText(text);
end
-----------------------------------------------------------------Colors_function
local function ColorMainS(texture,key)
local tex = _G[texture];
prev = {tex:GetVertexColor()};
prevOpa = Ll.Colors[key][4];
ColorPickerFrame.hasOpacity = Ll.Colors[key][4]~=nil ;
ColorPickerFrame.opacity = Ll.Colors[key][4];
ColorPickerFrame.func = function() newA,newB,newC = ColorPickerFrame:GetColorRGB();tex:SetVertexColor(newA,newB,newC);Ll.Colors[key]={newA,newB,newC,0.9}; end;
ColorPickerFrame.opacityFunc = function() newD=OpacitySliderFrame:GetValue();tex:SetVertexColor(newA,newB,newC,newD);Ll.Colors[key]={newA,newB,newC,newD}; end;
ColorPickerFrame.cancelFunc = function() a,b,c = unpack(prev);tex:SetVertexColor(a,b,c,prevOpa);ColorPickerFrame:SetColorRGB(a,b,c);Ll.Colors[key]={newA,newB,newC,prevOpa}; end;
ColorPickerFrame:SetColorRGB(unpack(Ll.Colors[key]));
ColorPickerFrame:Show();
end

--------------------------------------------------------------------------Colors     
local function CreateColorsButton(Name,TexName,TextName,key,parent,parentkey,colorkey,xpos,ypos,text)
    local A,B,C = Name:format(key),TexName:format(key),TextName:format(key);
    local P = _G[parent:format(parentkey)];
    local A  = CreateFrame("Button",A,P);
    local B = A:CreateTexture(B);
    local C = A:CreateFontString(C,"ARTWORK","GameFontNormal");
    colorbuttons(A:GetName(),B:GetName(),C:GetName(),text,parent,parentkey,xpos,ypos);
    A:SetScript("OnClick",function() ColorMainS(B:GetName(),colorkey); end);  
end

--------------------------------------------------------------------------------
-------------------------------------------------------------------------General
CreateBackgroundFrame("MenuFrame%d",0);

CreateTab("Tab%d",0,260,0,"TabText%d",0,"General");
Tab0:SetScript("OnClick",function() for i=0,11 do local parent = "MenuFrame%d";local Parent = _G[parent:format(i)]; Parent:Hide(); end MenuFrame0:Show(); end);

CreateTitle("Title%d",0,"MenuFrame%d",0,15,-15,"General");
CreateTitle("Title%d",1,"MenuFrame%d",0,15,-100,"60sec Timers");
CreateTitle("Title%d",2,"MenuFrame%d",0,15,-275,"Capture Bar");
CreateTitle("Title%d",3,"MenuFrame%d",0,15,-345,"Wall Health");
CreateTitle("Title%d",4,"MenuFrame%d",0,15,-380,"Class Colors");

CreateText("Text%d",0,"MenuFrame%d",0,55,-35,"Active / Desactive Scores");
CreateText("Text%d",1,"MenuFrame%d",0,55,-55,"Active / Desactive Bases Timers");
CreateText("Text%d",2,"MenuFrame%d",0,55,-75,"Active / Desactive Addon");
CreateText("Text%d",3,"MenuFrame%d",0,150,-103,"On / Off");
CreateText("Text%d",4,"MenuFrame%d",0,20,-125,"Texture");
CreateText("Text%d",5,"MenuFrame%d",0,20,-170,"Font");
CreateText("Text%d",6,"MenuFrame%d",0,190,-170,"Outline");
CreateText("Text%d",7,"MenuFrame%d",0,310,-170,"Font Size");
CreateText("Text%d",8,"MenuFrame%d",0,190,-127,"Tex. height");
CreateText("Text%d",9,"MenuFrame%d",0,190,-150,"Height");
CreateText("Text%d",10,"MenuFrame%d",0,310,-150,"Width");
CreateText("Text%d",11,"MenuFrame%d",0,310,-130,"Tex. Yofs");
CreateText("Text%d",12,"MenuFrame%d",0,150,-275,"On / Off");
CreateText("Text%d",13,"MenuFrame%d",0,150,-345,"On / Off");
CreateText("Text%d",14,"MenuFrame%d",0,20,-245,"Gradient");

--Active/Desactive Score
CreateCheckB("CheckB%d",0,"MenuFrame%d",0,20,-30);
CheckB0:SetScript("OnClick",function() if Ll.Active.Score==1 then CheckB0:SetChecked(0);Ll.Active.Score=0; else CheckB0:SetChecked(1);Ll.Active.Score=1; end end);

--Active/Desactive Base
CreateCheckB("CheckB%d",1,"MenuFrame%d",0,20,-50);
CheckB1:SetScript("OnClick",function() if Ll.Active.Base==1 then CheckB1:SetChecked(0);Ll.Active.Base=0; else CheckB1:SetChecked(1);Ll.Active.Base=1; end end);

--Active/Desactive Addon
CreateCheckB("CheckB%d",2,"MenuFrame%d",0,20,-70);
CheckB2:SetScript("OnClick",function() if Ll.Active.Addon==1 then CheckB2:SetChecked(0);Ll.Active.Addon=0; else CheckB2:SetChecked(1);Ll.Active.Addon=1; end end);

--Active/Desactive 60sec Timers
CreateCheckB("CheckB%d",3,"MenuFrame%d",0,115,-96);
CheckB3:SetScript("OnClick",function() if Ll.Active.Timer60==1 then CheckB3:SetChecked(0);Ll.Active.Timer60=0; else CheckB3:SetChecked(1);Ll.Active.Timer60=1; end end);

--Outline font
CreateCheckB("CheckB%d",4,"MenuFrame%d",0,240,-164);
CheckB4:SetScript("OnClick",function() if Ll.FontOutlineKey[1]==2 then CheckB4:SetChecked(0);Ll.FontOutlineKey[1]=1; else CheckB4:SetChecked(1);Ll.FontOutlineKey[1]=2; end end);

--Active/Desactive Capture Bar
CreateCheckB("CheckB%d",5,"MenuFrame%d",0,115,-270);
CheckB5:SetScript("OnClick",function() if Ll.Active.CaptureBar==1 then CheckB5:SetChecked(0);Ll.Active.CaptureBar=0; else CheckB5:SetChecked(1);Ll.Active.CaptureBar=1; end end);

--Active/Desactive Wall Health
CreateCheckB("CheckB%d",6,"MenuFrame%d",0,115,-340);
CheckB6:SetScript("OnClick",function() if Ll.Active.Wall==1 then CheckB6:SetChecked(0);Ll.Active.Wall=0; else CheckB6:SetChecked(1);Ll.Active.Wall=1; end end);

--Gradient
CreateCheckB("CheckB%d",7,"MenuFrame%d",0,90,-240);
CheckB7:SetScript("OnClick",function() if Ll.TexGradientKey[1]==1 then CheckB7:SetChecked(1);Ll.TexGradientKey[1]=2; else CheckB7:SetChecked(0);Ll.TexGradientKey[1]=1; end end);

--Move Timers
LlMove("MoveB%d",0,"MenuFrame%d",0,210,-102,"Test/Move",70);
MoveB0:SetScript("OnClick",function() TestTimer60(); end);

--Move Capture Bar
LlMove("MoveB%d",1,"MenuFrame%d",0,210,-275,"Test/Move",70);
MoveB1:SetScript("OnClick",function() MoveCaptureBar(); end);

--Texture choice
CreateDropDownTexture("Texture%d",0,"TextureTex%d",0,"TextureText%d",0,"DDTex%d",0,"MenuFrame%d",0,90,-125);
local function DDTex0_Load(self,level) TexMenus(self,level,0,1) end
UIDropDownMenu_Initialize(DDTex0,DDTex0_Load,"MENU");
Texture0:SetScript("OnClick",function() Texture_OnClick(0) end);

--Font choice
CreateDropDownFont("FontV%d",0,"FontVtext%d",0,"FontVDD%d",0,"MenuFrame%d",0,90,-170);
local function FontVDD0_Load(self,level) FontsMenus(self,level,0,1) end
UIDropDownMenu_Initialize(FontVDD0,FontVDD0_Load,"MENU");
FontV0:SetScript("OnClick",function() Fonts_OnClick(0) end);

--Font choice2
CreateDropDownFont("FontV%d",1,"FontVtext%d",1,"FontVDD%d",1,"MenuFrame%d",0,210,-345);
local function FontVDD1_Load(self,level) FontsMenus(self,level,1,2) end
UIDropDownMenu_Initialize(FontVDD1,FontVDD1_Load,"MENU");
FontV1:SetScript("OnClick",function() Fonts_OnClick(1) end);

--FontSize
CreateEditBox("LlEditBox%d",0,"MenuFrame%d",0,380,-170);
LlEditBox0:SetScript("OnEnterPressed",function() LlEditBox0:ClearFocus();LlEditBox0:SetAutoFocus(false);Ll.FontSize[1]=LlEditBox0:GetNumber(); end);

--Tex Height
CreateEditBox("LlEditBox%d",1,"MenuFrame%d",0,265,-130);
LlEditBox1:SetScript("OnEnterPressed",function() LlEditBox1:ClearFocus();LlEditBox1:SetAutoFocus(false);Ll.TexHeight[1]=LlEditBox1:GetNumber(); end);

--Bar Height
CreateEditBox("LlEditBox%d",2,"MenuFrame%d",0,265,-150);
LlEditBox2:SetScript("OnEnterPressed",function() LlEditBox2:ClearFocus();LlEditBox2:SetAutoFocus(false);Ll.BarHeight[1]=LlEditBox2:GetNumber(); end);

--Bar Width
CreateEditBox("LlEditBox%d",3,"MenuFrame%d",0,380,-150);
LlEditBox3:SetScript("OnEnterPressed",function() LlEditBox3:ClearFocus();LlEditBox3:SetAutoFocus(false);Ll.BarWidth[1]=LlEditBox3:GetNumber(); end);

--Tex Yofs
CreateEditBox("LlEditBox%d",4,"MenuFrame%d",0,380,-130);
LlEditBox4:SetScript("OnEnterPressed",function() LlEditBox4:ClearFocus();LlEditBox4:SetAutoFocus(false);Ll.TexYofs[1]=LlEditBox4:GetNumber(); end);

--Scale
CreateScale("LlScale%d",0,"MenuFrame%d",0,250,-205);
LlScale0:SetScript("OnValueChanged",function() Ll.Scale[1]=LlScale0:GetValue(); end);

--Scale CaptureBar
CreateScale("LlScale%d",1,"MenuFrame%d",0,250,-310);
LlScale1:SetScript("OnValueChanged",function() Ll.Scale[2]=LlScale1:GetValue(); end);

--Colors
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",0,"MenuFrame%d",0,1,20,-195,"Color 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",1,"MenuFrame%d",0,2,20,-215,"Color 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",2,"MenuFrame%d",0,3,100,-195,"Backdrop");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",3,"MenuFrame%d",0,4,100,-215,"Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",4,"MenuFrame%d",0,1500,20,-400,"Paladin");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",5,"MenuFrame%d",0,1501,20,-425,"Warrior");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",6,"MenuFrame%d",0,1502,100,-400,"Warlock");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",7,"MenuFrame%d",0,1503,100,-425,"Hunter");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",8,"MenuFrame%d",0,1504,180,-400,"Shaman");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",9,"MenuFrame%d",0,1505,180,-425,"Rogue");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",10,"MenuFrame%d",0,1506,260,-400,"Priest");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",11,"MenuFrame%d",0,1507,260,-425,"Mage");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",12,"MenuFrame%d",0,1508,340,-400,"Death K.");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",13,"MenuFrame%d",0,1509,340,-425,"Druid");

--OnShow
local function Menu0_OnShow()
   Tab0:SetBackdropColor(0.3,0.4,0.5,0.8);
   TextureTex0:SetTexture(Ll.Textures[Ll.TextureKey[1]]);
   TextureText0:SetText(Ll.TexturesName[Ll.TextureKey[1]]);
   FontVtext0:SetText(Ll.FontName[Ll.FontKey[1]]);
   FontVtext1:SetText(Ll.FontName[Ll.FontKey[2]]);
   LlEditBox0:SetText(Ll.FontSize[1]);
   LlEditBox1:SetText(Ll.TexHeight[1]);
   LlScale0:SetValue(Ll.Scale[1]);
   LlScale1:SetValue(Ll.Scale[2]);
   LlEditBox2:SetText(Ll.BarHeight[1]);
   LlEditBox3:SetText(Ll.BarWidth[1]);
   LlEditBox4:SetText(Ll.TexYofs[1]);
   ColorButTex0:SetVertexColor(unpack(Ll.Colors[1]));
   ColorButTex1:SetVertexColor(unpack(Ll.Colors[2]));
   ColorButTex2:SetVertexColor(unpack(Ll.Colors[3]));
   ColorButTex3:SetVertexColor(unpack(Ll.Colors[4]));
   ColorButTex4:SetVertexColor(unpack(Ll.Colors[1500]));
   ColorButTex5:SetVertexColor(unpack(Ll.Colors[1501]));
   ColorButTex6:SetVertexColor(unpack(Ll.Colors[1502]));
   ColorButTex7:SetVertexColor(unpack(Ll.Colors[1503]));
   ColorButTex8:SetVertexColor(unpack(Ll.Colors[1504]));
   ColorButTex9:SetVertexColor(unpack(Ll.Colors[1505]));
   ColorButTex10:SetVertexColor(unpack(Ll.Colors[1506]));
   ColorButTex11:SetVertexColor(unpack(Ll.Colors[1507]));
   ColorButTex12:SetVertexColor(unpack(Ll.Colors[1508]));
   ColorButTex13:SetVertexColor(unpack(Ll.Colors[1509]));           
   if (Ll.FontOutlineKey[1]==1) then CheckB4:SetChecked(0); else CheckB4:SetChecked(1); end
   if (Ll.Active.Score==1) then CheckB0:SetChecked(1); else CheckB0:SetChecked(0); end
   if (Ll.Active.Base==1) then CheckB1:SetChecked(1); else CheckB1:SetChecked(0); end
   if (Ll.Active.Addon==1) then CheckB2:SetChecked(1); else CheckB2:SetChecked(0); end
   if (Ll.Active.Timer60==1) then CheckB3:SetChecked(1); else CheckB3:SetChecked(0); end
   if (Ll.Active.CaptureBar==1) then CheckB5:SetChecked(1); else CheckB5:SetChecked(0); end
   if (Ll.Active.Wall==1) then CheckB6:SetChecked(1); else CheckB6:SetChecked(0); end 
   if (Ll.TexGradientKey[1]==1) then CheckB7:SetChecked(0); else CheckB7:SetChecked(1); end         
end
MenuFrame0:SetScript("OnShow",function() Menu0_OnShow(); end);

--OnHide
local function Menu0_OnHide()
   Tab0:SetBackdropColor(0.1,0.1,0.1,0.8);
end
MenuFrame0:SetScript("OnHide",function() Menu0_OnHide(); end);

--------------------------------------------------------------------------------
--------------------------------------------------------------------Arathi Basin
CreateBackgroundFrame("MenuFrame%d",1);

CreateTab("Tab%d",1,260,-22,"TabText%d",1,Tabs[10]);
Tab1:SetScript("OnClick",function() for i=0,11 do local parent = "MenuFrame%d";local Parent = _G[parent:format(i)]; Parent:Hide(); end MenuFrame1:Show(); end);

CreateTitle("Title%d",5,"MenuFrame%d",1,15,-15,"Arathi Basin / Score");
CreateTitle("Title%d",6,"MenuFrame%d",1,15,-220,"Arathi Basin / Timers");

CreateText("Text%d",15,"MenuFrame%d",1,20,-35,"Texture"); 
CreateText("Text%d",16,"MenuFrame%d",1,20,-55,"Tex. Height");
CreateText("Text%d",17,"MenuFrame%d",1,20,-75,"Tex. Width");
CreateText("Text%d",18,"MenuFrame%d",1,20,-95,"Tex. Xofs");
CreateText("Text%d",19,"MenuFrame%d",1,20,-115,"Tex. Yofs");
CreateText("Text%d",20,"MenuFrame%d",1,20,-135,"Bg Height");
CreateText("Text%d",21,"MenuFrame%d",1,20,-155,"Bg Width");
CreateText("Text%d",22,"MenuFrame%d",1,185,-35,"Font");
CreateText("Text%d",23,"MenuFrame%d",1,185,-55,"Font Size");
CreateText("Text%d",24,"MenuFrame%d",1,185,-75,"Outline");
CreateText("Text%d",25,"MenuFrame%d",1,185,-95,"Fill Bars");
CreateText("Text%d",26,"MenuFrame%d",1,185,-115,"Gradient");
CreateText("Text%d",27,"MenuFrame%d",1,185,-155,"Move Score");
--CreateText("Text%d",28,"MenuFrame%d",1,185,-175,"Reset Score");
CreateText("Text%d",29,"MenuFrame%d",1,20,-245,"Show / Hide Icons");
CreateText("Text%d",30,"MenuFrame%d",1,20,-266,"Show / Hide Timers");
CreateText("Text%d",31,"MenuFrame%d",1,190,-225,"Texture Height");
CreateText("Text%d",32,"MenuFrame%d",1,190,-245,"Texture Yofs");                                                 
CreateText("Text%d",33,"MenuFrame%d",1,190,-265,"Bar Height");
CreateText("Text%d",34,"MenuFrame%d",1,190,-285,"Bar Width");
CreateText("Text%d",35,"MenuFrame%d",1,190,-305,"Text Xofs");
CreateText("Text%d",36,"MenuFrame%d",1,190,-325,"Text Yofs");
CreateText("Text%d",37,"MenuFrame%d",1,190,-345,"Bars Xofs");
CreateText("Text%d",38,"MenuFrame%d",1,190,-365,"Bars Yofs");
CreateText("Text%d",39,"MenuFrame%d",1,190,-385,"Spacing");
CreateText("Text%d",40,"MenuFrame%d",1,20,-335,"Texture");
CreateText("Text%d",41,"MenuFrame%d",1,20,-355,"Font");
CreateText("Text%d",42,"MenuFrame%d",1,20,-375,"Font Size");
CreateText("Text%d",43,"MenuFrame%d",1,20,-395,"Outline");
CreateText("Text%d",44,"MenuFrame%d",1,20,-415,"Gradient");
CreateText("Text%d",45,"MenuFrame%d",1,190,-405,"Timer Xofs");
CreateText("Text%d",46,"MenuFrame%d",1,190,-425,"Timer Yofs");
CreateText("Text%d",47,"MenuFrame%d",1,20,-435,"Timers Scale");

--Check Buttons
--Icons
CreateCheckB("CheckB%d",8,"MenuFrame%d",1,150,-240);
CheckB8:SetScript("OnClick",function() if (Ll.ActiveAB[1]==1) then CheckB8:SetChecked(0);Ll.ActiveAB[1]=0; else CheckB8:SetChecked(1);Ll.ActiveAB[1]=1; end end);

--Outline1
CreateCheckB("CheckB%d",9,"MenuFrame%d",1,295,-70);
CheckB9:SetScript("OnClick",function() if Ll.FontOutlineKey[10]==2 then CheckB9:SetChecked(0);Ll.FontOutlineKey[10]=1; else CheckB9:SetChecked(1);Ll.FontOutlineKey[10]=2; end end);  

--Outline2
CreateCheckB("CheckB%d",10,"MenuFrame%d",1,150,-390);
CheckB10:SetScript("OnClick",function() if Ll.FontOutlineKey[11]==2 then CheckB10:SetChecked(0);Ll.FontOutlineKey[11]=1; else CheckB10:SetChecked(1);Ll.FontOutlineKey[11]=2; end end);        

--FillBars
CreateCheckB("CheckB%d",11,"MenuFrame%d",1,295,-90);
CheckB11:SetScript("OnClick",function() if (Ll.FillBars[10]==0) then CheckB11:SetChecked(1);Ll.FillBars[10]=1; else CheckB11:SetChecked(0);Ll.FillBars[10]=0; end end);

--Gradient1
CreateCheckB("CheckB%d",12,"MenuFrame%d",1,295,-110);
CheckB12:SetScript("OnClick",function() if Ll.TexGradientKey[10]==1 then CheckB12:SetChecked(1);Ll.TexGradientKey[10]=2; else CheckB12:SetChecked(0);Ll.TexGradientKey[10]=1; end end);

--Gradient2
CreateCheckB("CheckB%d",13,"MenuFrame%d",1,150,-410);
CheckB13:SetScript("OnClick",function() if Ll.TexGradientKey[11]==1 then CheckB13:SetChecked(1);Ll.TexGradientKey[11]=2; else CheckB13:SetChecked(0);Ll.TexGradientKey[11]=1; end end);

--Timers
CreateCheckB("CheckB%d",14,"MenuFrame%d",1,150,-260);
CheckB14:SetScript("OnClick",function() if (Ll.ActiveAB[2]==1) then CheckB14:SetChecked(0);Ll.ActiveAB[2]=0; else CheckB14:SetChecked(1);Ll.ActiveAB[2]=1; end end);

--Texture choice 1
CreateDropDownTexture("Texture%d",1,"TextureTex%d",1,"TextureText%d",1,"DDTex%d",1,"MenuFrame%d",1,90,-35);
local function DDTex1_Load(self,level) TexMenus(self,level,1,10) end
UIDropDownMenu_Initialize(DDTex1,DDTex1_Load,"MENU");
Texture1:SetScript("OnClick",function() Texture_OnClick(1) end);

--Texture choice 2
CreateDropDownTexture("Texture%d",2,"TextureTex%d",2,"TextureText%d",2,"DDTex%d",2,"MenuFrame%d",1,90,-335);
local function DDTex2_Load(self,level) TexMenus(self,level,2,11) end
UIDropDownMenu_Initialize(DDTex2,DDTex2_Load,"MENU");
Texture2:SetScript("OnClick",function() Texture_OnClick(2) end);

--Font choice1
CreateDropDownFont("FontV%d",2,"FontVtext%d",2,"FontVDD%d",2,"MenuFrame%d",1,230,-35);
local function FontVDD2_Load(self,level) FontsMenus(self,level,2,10) end
UIDropDownMenu_Initialize(FontVDD2,FontVDD2_Load,"MENU");
FontV2:SetScript("OnClick",function() Fonts_OnClick(2) end);

--Font choice2
CreateDropDownFont("FontV%d",3,"FontVtext%d",3,"FontVDD%d",3,"MenuFrame%d",1,90,-355);
local function FontVDD3_Load(self,level) FontsMenus(self,level,3,11) end
UIDropDownMenu_Initialize(FontVDD3,FontVDD3_Load,"MENU");
FontV3:SetScript("OnClick",function() Fonts_OnClick(3) end);

--Font Size1
CreateEditBox("LlEditBox%d",5,"MenuFrame%d",1,285,-55);
LlEditBox5:SetScript("OnEnterPressed",function() LlEditBox5:ClearFocus();LlEditBox5:SetAutoFocus(false);Ll.FontSize[10]=LlEditBox5:GetNumber(); end);

--Font Size2
CreateEditBox("LlEditBox%d",6,"MenuFrame%d",1,140,-375);
LlEditBox6:SetScript("OnEnterPressed",function() LlEditBox6:ClearFocus();LlEditBox6:SetAutoFocus(false);Ll.FontSize[11]=LlEditBox6:GetNumber(); end);

--Tex. Height1
CreateEditBox("LlEditBox%d",7,"MenuFrame%d",1,140,-55);
LlEditBox7:SetScript("OnEnterPressed",function() LlEditBox7:ClearFocus();LlEditBox7:SetAutoFocus(false);Ll.TexHeight[10]=LlEditBox7:GetNumber(); end);

--Tex. Height2
CreateEditBox("LlEditBox%d",8,"MenuFrame%d",1,285,-224);
LlEditBox8:SetScript("OnEnterPressed",function() LlEditBox8:ClearFocus();LlEditBox8:SetAutoFocus(false);Ll.TexHeight[11]=LlEditBox8:GetNumber(); end);

--Tex. Width
CreateEditBox("LlEditBox%d",9,"MenuFrame%d",1,140,-75);
LlEditBox9:SetScript("OnEnterPressed",function() LlEditBox9:ClearFocus();LlEditBox9:SetAutoFocus(false);Ll.TexWidth[10]=LlEditBox9:GetNumber(); end);

--Tex. Xofs
CreateEditBox("LlEditBox%d",10,"MenuFrame%d",1,140,-95);
LlEditBox10:SetScript("OnEnterPressed",function() LlEditBox10:ClearFocus();LlEditBox10:SetAutoFocus(false);Ll.TexXofs[10]=LlEditBox10:GetNumber(); end);

--Tex. Yofs
CreateEditBox("LlEditBox%d",11,"MenuFrame%d",1,140,-115);
LlEditBox11:SetScript("OnEnterPressed",function() LlEditBox11:ClearFocus();LlEditBox11:SetAutoFocus(false);Ll.TexYofs[10]=LlEditBox11:GetNumber(); end);

--Tex. Yofs2
CreateEditBox("LlEditBox%d",12,"MenuFrame%d",1,285,-244);
LlEditBox12:SetScript("OnEnterPressed",function() LlEditBox12:ClearFocus();LlEditBox12:SetAutoFocus(false);Ll.TexYofs[11]=LlEditBox12:GetNumber(); end);

--Bar height
CreateEditBox("LlEditBox%d",13,"MenuFrame%d",1,140,-135);
LlEditBox13:SetScript("OnEnterPressed",function() LlEditBox13:ClearFocus();LlEditBox13:SetAutoFocus(false);Ll.BarHeight[10]=LlEditBox13:GetNumber(); end);

--Bar height2
CreateEditBox("LlEditBox%d",14,"MenuFrame%d",1,285,-264);
LlEditBox14:SetScript("OnEnterPressed",function() LlEditBox14:ClearFocus();LlEditBox14:SetAutoFocus(false);Ll.BarHeight[11]=LlEditBox14:GetNumber(); end);

--Bar Width1
CreateEditBox("LlEditBox%d",15,"MenuFrame%d",1,140,-155);
LlEditBox15:SetScript("OnEnterPressed",function() LlEditBox15:ClearFocus();LlEditBox15:SetAutoFocus(false);Ll.BarWidth[10]=LlEditBox15:GetNumber(); end);

--Bar Width2
CreateEditBox("LlEditBox%d",16,"MenuFrame%d",1,285,-284);
LlEditBox16:SetScript("OnEnterPressed",function() LlEditBox16:ClearFocus();LlEditBox16:SetAutoFocus(false);Ll.BarWidth[11]=LlEditBox16:GetNumber(); end);

--Base Text xofs
CreateEditBox("LlEditBox%d",17,"MenuFrame%d",1,285,-304);
LlEditBox17:SetScript("OnEnterPressed",function() LlEditBox17:ClearFocus();LlEditBox17:SetAutoFocus(false);Ll.BaseTxtXofs[11]=LlEditBox17:GetNumber(); end);

--Base Text yofs
CreateEditBox("LlEditBox%d",18,"MenuFrame%d",1,285,-324);
LlEditBox18:SetScript("OnEnterPressed",function() LlEditBox18:ClearFocus();LlEditBox18:SetAutoFocus(false);Ll.BaseTxtYofs[11]=LlEditBox18:GetNumber(); end);

--Base Bar xofs
CreateEditBox("LlEditBox%d",19,"MenuFrame%d",1,285,-344);
LlEditBox19:SetScript("OnEnterPressed",function() LlEditBox19:ClearFocus();LlEditBox19:SetAutoFocus(false);Ll.BarsXofs[11]=LlEditBox19:GetNumber(); end);

--Base Bar yofs
CreateEditBox("LlEditBox%d",20,"MenuFrame%d",1,285,-364);
LlEditBox20:SetScript("OnEnterPressed",function() LlEditBox20:ClearFocus();LlEditBox20:SetAutoFocus(false);Ll.BarsYofs[11]=LlEditBox20:GetNumber(); end);

--Spacing
CreateEditBox("LlEditBox%d",21,"MenuFrame%d",1,285,-384);
LlEditBox21:SetScript("OnEnterPressed",function() LlEditBox21:ClearFocus();LlEditBox21:SetAutoFocus(false);Ll.BarSpacing[11]=LlEditBox21:GetNumber(); end);

--Base Timer xofs
CreateEditBox("LlEditBox%d",22,"MenuFrame%d",1,285,-404);
LlEditBox22:SetScript("OnEnterPressed",function() LlEditBox22:ClearFocus();LlEditBox22:SetAutoFocus(false);Ll.BaseTimeXofs[11]=LlEditBox22:GetNumber(); end);

--Base Timer yofs
CreateEditBox("LlEditBox%d",23,"MenuFrame%d",1,285,-424);
LlEditBox23:SetScript("OnEnterPressed",function() LlEditBox23:ClearFocus();LlEditBox23:SetAutoFocus(false);Ll.BaseTimeYofs[11]=LlEditBox23:GetNumber(); end);

--Scale1
CreateScale("LlScale%d",2,"MenuFrame%d",1,50,-190);
LlScale2:SetScript("OnValueChanged",function() Ll.Scale[10]=LlScale2:GetValue(); end);

--Scale3
CreateScale("LlScale%d",3,"MenuFrame%d",1,50,-300);
LlScale3:SetScript("OnValueChanged",function() Ll.Scale[11]=LlScale3:GetValue(); end);

--Scale2
CreateEditBox("LlEditBox%d",24,"MenuFrame%d",1,140,-435);
LlEditBox24:SetScript("OnEnterPressed",function() LlEditBox24:ClearFocus();LlEditBox24:SetAutoFocus(false);Ll.Scale[12]=LlEditBox24:GetNumber(); end);

--Move Score
LlMove("MoveB%d",2,"MenuFrame%d",1,280,-155,"Move",50);
MoveB2:SetScript("OnClick",function() MoveArathi(); end);

--Test Move Timers
LlMove("MoveB%d",3,"MenuFrame%d",1,340,-435,"Test/Move",70);
MoveB3:SetScript("OnClick",function() TestArathi(); end);

--Only Timer
LlMove("MoveB%d",4,"MenuFrame%d",1,340,-200,"Only Timer",70);
MoveB4:SetScript("OnClick",function() if (Ll.OnlyTime[11]==0) then Ll.OnlyTime[11]=1; else Ll.OnlyTime[11]=0; end end);

--Colors
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",14,"MenuFrame%d",1,10,340,-35,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",15,"MenuFrame%d",1,11,340,-55,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",16,"MenuFrame%d",1,12,340,-75,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",17,"MenuFrame%d",1,13,340,-95,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",18,"MenuFrame%d",1,16,340,-115,"Back.");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",19,"MenuFrame%d",1,17,340,-135,"Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",20,"MenuFrame%d",1,202,340,-224,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",21,"MenuFrame%d",1,203,340,-244,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",22,"MenuFrame%d",1,204,340,-264,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",23,"MenuFrame%d",1,205,340,-284,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",24,"MenuFrame%d",1,206,340,-304,"Neutral 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",25,"MenuFrame%d",1,207,340,-324,"Neutral 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",26,"MenuFrame%d",1,208,340,-344,"Bars.Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",27,"MenuFrame%d",1,209,340,-364,"Bars Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",28,"MenuFrame%d",1,200,340,-384,"Base.Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",29,"MenuFrame%d",1,201,340,-404,"Base Border");

--OnShow
local function Menu1_OnShow()
   Tab1:SetBackdropColor(0.3,0.4,0.5,0.8);
   if (Ll.ActiveAB[1]==1) then CheckB8:SetChecked(1); else CheckB8:SetChecked(0); end
   if (Ll.ActiveAB[2]==1) then CheckB14:SetChecked(1); else CheckB14:SetChecked(0); end
   if (Ll.FontOutlineKey[10]==1) then CheckB9:SetChecked(0); else CheckB9:SetChecked(1); end
   if (Ll.FontOutlineKey[11]==1) then CheckB10:SetChecked(0); else CheckB10:SetChecked(1); end
   if (Ll.FillBars[10]==1) then CheckB11:SetChecked(1); else CheckB11:SetChecked(0); end
   if (Ll.TexGradientKey[10]==1) then CheckB12:SetChecked(0); else CheckB12:SetChecked(1); end
   if (Ll.TexGradientKey[11]==1) then CheckB13:SetChecked(0); else CheckB13:SetChecked(1); end               
   TextureTex1:SetTexture(Ll.Textures[Ll.TextureKey[10]]);
   TextureText1:SetText(Ll.TexturesName[Ll.TextureKey[10]]);
   TextureTex2:SetTexture(Ll.Textures[Ll.TextureKey[11]]);
   TextureText2:SetText(Ll.TexturesName[Ll.TextureKey[11]]);      
   FontVtext2:SetText(Ll.FontName[Ll.FontKey[10]]);
   FontVtext3:SetText(Ll.FontName[Ll.FontKey[11]]);
   LlEditBox5:SetText(Ll.FontSize[10]);
   LlEditBox6:SetText(Ll.FontSize[11]);
   LlEditBox7:SetText(Ll.TexHeight[10]);
   LlEditBox8:SetText(Ll.TexHeight[11]);
   LlEditBox9:SetText(Ll.TexWidth[10]);
   LlEditBox10:SetText(Ll.TexXofs[10]);
   LlEditBox11:SetText(Ll.TexYofs[10]);
   LlEditBox12:SetText(Ll.TexYofs[11]);
   LlEditBox13:SetText(Ll.BarHeight[10]);
   LlEditBox14:SetText(Ll.BarHeight[11]);
   LlEditBox15:SetText(Ll.BarWidth[10]);
   LlEditBox16:SetText(Ll.BarWidth[11]);
   LlEditBox17:SetText(Ll.BaseTxtXofs[11]);
   LlEditBox18:SetText(Ll.BaseTxtYofs[11]);
   LlEditBox19:SetText(Ll.BarsXofs[11]);
   LlEditBox20:SetText(Ll.BarsYofs[11]);
   LlEditBox21:SetText(Ll.BarSpacing[11]);
   LlEditBox22:SetText(Ll.BaseTimeXofs[11]);
   LlEditBox23:SetText(Ll.BaseTimeYofs[11]);
   LlEditBox24:SetText(Ll.Scale[12]);
   LlScale2:SetValue(Ll.Scale[10]);
   LlScale3:SetValue(Ll.Scale[11]);  
   ColorButTex14:SetVertexColor(unpack(Ll.Colors[10]));
   ColorButTex15:SetVertexColor(unpack(Ll.Colors[11]));
   ColorButTex16:SetVertexColor(unpack(Ll.Colors[12]));
   ColorButTex17:SetVertexColor(unpack(Ll.Colors[13]));
   ColorButTex18:SetVertexColor(unpack(Ll.Colors[16]));
   ColorButTex19:SetVertexColor(unpack(Ll.Colors[17]));
   ColorButTex20:SetVertexColor(unpack(Ll.Colors[202]));
   ColorButTex21:SetVertexColor(unpack(Ll.Colors[203]));   
   ColorButTex22:SetVertexColor(unpack(Ll.Colors[204]));
   ColorButTex23:SetVertexColor(unpack(Ll.Colors[205]));
   ColorButTex24:SetVertexColor(unpack(Ll.Colors[206]));
   ColorButTex25:SetVertexColor(unpack(Ll.Colors[207]));
   ColorButTex26:SetVertexColor(unpack(Ll.Colors[208]));
   ColorButTex27:SetVertexColor(unpack(Ll.Colors[209]));
   ColorButTex28:SetVertexColor(unpack(Ll.Colors[200]));
   ColorButTex29:SetVertexColor(unpack(Ll.Colors[201]));          
end
MenuFrame1:SetScript("OnShow",function() Menu1_OnShow(); end);

--OnHide
local function Menu1_OnHide()
   Tab1:SetBackdropColor(0.1,0.1,0.1,0.8);
end
MenuFrame1:SetScript("OnHide",function() Menu1_OnHide(); end);




--------------------------------------------------------------------------------
-------------------------------------------------------------------Warsong Gulch
CreateBackgroundFrame("MenuFrame%d",2);

CreateTab("Tab%d",2,260,-44,"TabText%d",2,Tabs[20]);
Tab2:SetScript("OnClick",function() for i=0,11 do local parent = "MenuFrame%d";local Parent = _G[parent:format(i)]; Parent:Hide(); end MenuFrame2:Show(); end);

CreateTitle("Title%d",7,"MenuFrame%d",2,15,-15,"Warsong Gulch / Score");
CreateTitle("Title%d",8,"MenuFrame%d",2,15,-220,"Warsong Gulch / Flags");

CreateText("Text%d",48,"MenuFrame%d",2,20,-35,"Texture"); 
CreateText("Text%d",49,"MenuFrame%d",2,20,-55,"Tex. Height");
CreateText("Text%d",50,"MenuFrame%d",2,20,-75,"Tex. Width");
CreateText("Text%d",51,"MenuFrame%d",2,20,-95,"Tex. Xofs");
CreateText("Text%d",52,"MenuFrame%d",2,20,-115,"Tex. Yofs");
CreateText("Text%d",53,"MenuFrame%d",2,20,-135,"Bg Height");
CreateText("Text%d",54,"MenuFrame%d",2,20,-155,"Bg Width");
CreateText("Text%d",55,"MenuFrame%d",2,185,-35,"Font");
CreateText("Text%d",56,"MenuFrame%d",2,185,-55,"Font Size");
CreateText("Text%d",57,"MenuFrame%d",2,185,-75,"Outline");
CreateText("Text%d",58,"MenuFrame%d",2,185,-95,"Fill Bars");
CreateText("Text%d",59,"MenuFrame%d",2,185,-115,"Gradient");
CreateText("Text%d",60,"MenuFrame%d",2,185,-155,"Move Score");
--CreateText("Text%d",61,"MenuFrame%d",2,185,-175,"Reset Score");
CreateText("Text%d",62,"MenuFrame%d",2,20,-245,"Font");
CreateText("Text%d",63,"MenuFrame%d",2,20,-265,"Font Size");
CreateText("Text%d",64,"MenuFrame%d",2,20,-285,"Outline");

--Outline1
CreateCheckB("CheckB%d",15,"MenuFrame%d",2,295,-70);
CheckB15:SetScript("OnClick",function() if Ll.FontOutlineKey[20]==2 then CheckB15:SetChecked(0);Ll.FontOutlineKey[20]=1; else CheckB15:SetChecked(1);Ll.FontOutlineKey[20]=2; end end);  

--FillBars
CreateCheckB("CheckB%d",16,"MenuFrame%d",2,295,-90);
CheckB16:SetScript("OnClick",function() if (Ll.FillBars[20]==0) then CheckB16:SetChecked(1);Ll.FillBars[20]=1; else CheckB16:SetChecked(0);Ll.FillBars[20]=0; end end);

--Gradient
CreateCheckB("CheckB%d",17,"MenuFrame%d",2,295,-110);
CheckB17:SetScript("OnClick",function() if Ll.TexGradientKey[20]==1 then CheckB17:SetChecked(1);Ll.TexGradientKey[20]=2; else CheckB17:SetChecked(0);Ll.TexGradientKey[20]=1; end end);

--Outline2
CreateCheckB("CheckB%d",18,"MenuFrame%d",2,150,-280);
CheckB18:SetScript("OnClick",function() if Ll.FontOutlineKey[21]==2 then CheckB18:SetChecked(0);Ll.FontOutlineKey[21]=1; else CheckB18:SetChecked(1);Ll.FontOutlineKey[21]=2; end end);

--Texture choice 1
CreateDropDownTexture("Texture%d",3,"TextureTex%d",3,"TextureText%d",3,"DDTex%d",3,"MenuFrame%d",2,90,-35);
local function DDTex3_Load(self,level) TexMenus(self,level,3,20) end
UIDropDownMenu_Initialize(DDTex3,DDTex3_Load,"MENU");
Texture3:SetScript("OnClick",function() Texture_OnClick(3) end);

--Font choice1
CreateDropDownFont("FontV%d",4,"FontVtext%d",4,"FontVDD%d",4,"MenuFrame%d",2,230,-35);
local function FontVDD4_Load(self,level) FontsMenus(self,level,4,20) end
UIDropDownMenu_Initialize(FontVDD4,FontVDD4_Load,"MENU");
FontV4:SetScript("OnClick",function() Fonts_OnClick(4) end);

--Font choice2
CreateDropDownFont("FontV%d",5,"FontVtext%d",5,"FontVDD%d",5,"MenuFrame%d",2,90,-245);
local function FontVDD5_Load(self,level) FontsMenus(self,level,5,21) end
UIDropDownMenu_Initialize(FontVDD5,FontVDD5_Load,"MENU");
FontV5:SetScript("OnClick",function() Fonts_OnClick(5) end);

--Tex. Height1
CreateEditBox("LlEditBox%d",25,"MenuFrame%d",2,140,-55);
LlEditBox25:SetScript("OnEnterPressed",function() LlEditBox25:ClearFocus();LlEditBox25:SetAutoFocus(false);Ll.TexHeight[20]=LlEditBox25:GetNumber(); end);

--Tex. Width
CreateEditBox("LlEditBox%d",26,"MenuFrame%d",2,140,-75);
LlEditBox26:SetScript("OnEnterPressed",function() LlEditBox26:ClearFocus();LlEditBox26:SetAutoFocus(false);Ll.TexWidth[20]=LlEditBox26:GetNumber(); end);

--Tex. Xofs
CreateEditBox("LlEditBox%d",27,"MenuFrame%d",2,140,-95);
LlEditBox27:SetScript("OnEnterPressed",function() LlEditBox27:ClearFocus();LlEditBox27:SetAutoFocus(false);Ll.TexXofs[20]=LlEditBox27:GetNumber(); end);

--Tex. Yofs
CreateEditBox("LlEditBox%d",28,"MenuFrame%d",2,140,-115);
LlEditBox28:SetScript("OnEnterPressed",function() LlEditBox28:ClearFocus();LlEditBox28:SetAutoFocus(false);Ll.TexYofs[20]=LlEditBox28:GetNumber(); end);

--Bar height
CreateEditBox("LlEditBox%d",29,"MenuFrame%d",2,140,-135);
LlEditBox29:SetScript("OnEnterPressed",function() LlEditBox29:ClearFocus();LlEditBox29:SetAutoFocus(false);Ll.BarHeight[20]=LlEditBox29:GetNumber(); end);

--Bar Width
CreateEditBox("LlEditBox%d",30,"MenuFrame%d",2,140,-155);
LlEditBox30:SetScript("OnEnterPressed",function() LlEditBox30:ClearFocus();LlEditBox30:SetAutoFocus(false);Ll.BarWidth[20]=LlEditBox30:GetNumber(); end);

--Font Size1
CreateEditBox("LlEditBox%d",31,"MenuFrame%d",2,285,-55);
LlEditBox31:SetScript("OnEnterPressed",function() LlEditBox31:ClearFocus();LlEditBox31:SetAutoFocus(false);Ll.FontSize[20]=LlEditBox31:GetNumber(); end);

--Font Size2
CreateEditBox("LlEditBox%d",32,"MenuFrame%d",2,140,-265);
LlEditBox32:SetScript("OnEnterPressed",function() LlEditBox32:ClearFocus();LlEditBox32:SetAutoFocus(false);Ll.FontSize[21]=LlEditBox32:GetNumber(); end);

--Scale3
CreateScale("LlScale%d",4,"MenuFrame%d",2,50,-190);
LlScale4:SetScript("OnValueChanged",function() Ll.Scale[20]=LlScale4:GetValue(); end);

--Colors
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",30,"MenuFrame%d",2,20,340,-35,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",31,"MenuFrame%d",2,21,340,-55,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",32,"MenuFrame%d",2,22,340,-75,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",33,"MenuFrame%d",2,23,340,-95,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",34,"MenuFrame%d",2,26,340,-115,"Back.");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",35,"MenuFrame%d",2,27,340,-135,"Border");

--Move Score
LlMove("MoveB%d",5,"MenuFrame%d",2,280,-155,"Move",50);
MoveB5:SetScript("OnClick",function() MoveWgulch(); end);

--OnShow
local function Menu2_OnShow()
   Tab2:SetBackdropColor(0.3,0.4,0.5,0.8);
   if (Ll.FontOutlineKey[20]==1) then CheckB15:SetChecked(0); else CheckB15:SetChecked(1); end
   if (Ll.FillBars[20]==1) then CheckB16:SetChecked(1); else CheckB16:SetChecked(0); end
   if (Ll.TexGradientKey[20]==1) then CheckB17:SetChecked(0); else CheckB17:SetChecked(1); end
   if (Ll.FontOutlineKey[21]==1) then CheckB18:SetChecked(0); else CheckB18:SetChecked(1); end
   TextureTex3:SetTexture(Ll.Textures[Ll.TextureKey[20]]);
   TextureText3:SetText(Ll.TexturesName[Ll.TextureKey[20]]);
   FontVtext4:SetText(Ll.FontName[Ll.FontKey[20]]);
   FontVtext5:SetText(Ll.FontName[Ll.FontKey[21]]);
   LlEditBox25:SetText(Ll.TexHeight[20]);
   LlEditBox26:SetText(Ll.TexWidth[20]);
   LlEditBox27:SetText(Ll.TexXofs[20]);
   LlEditBox28:SetText(Ll.TexYofs[20]);
   LlEditBox29:SetText(Ll.BarHeight[20]);
   LlEditBox30:SetText(Ll.BarWidth[20]);
   LlEditBox31:SetText(Ll.FontSize[20]);
   LlEditBox32:SetText(Ll.FontSize[21]);
   LlScale4:SetValue(Ll.Scale[20]);   
   ColorButTex30:SetVertexColor(unpack(Ll.Colors[20]));
   ColorButTex31:SetVertexColor(unpack(Ll.Colors[21]));
   ColorButTex32:SetVertexColor(unpack(Ll.Colors[22]));
   ColorButTex33:SetVertexColor(unpack(Ll.Colors[23]));
   ColorButTex34:SetVertexColor(unpack(Ll.Colors[26]));
   ColorButTex35:SetVertexColor(unpack(Ll.Colors[27]));  
end
MenuFrame2:SetScript("OnShow",function() Menu2_OnShow(); end);

--OnHide
local function Menu2_OnHide()
   Tab2:SetBackdropColor(0.1,0.1,0.1,0.8);
end
MenuFrame2:SetScript("OnHide",function() Menu2_OnHide(); end);




--------------------------------------------------------------------------------
----------------------------------------------------------------Isle of Conquest
CreateBackgroundFrame("MenuFrame%d",3);

CreateTab("Tab%d",3,260,-66,"TabText%d",3,Tabs[30]);
Tab3:SetScript("OnClick",function() for i=0,11 do local parent = "MenuFrame%d";local Parent = _G[parent:format(i)]; Parent:Hide(); end MenuFrame3:Show(); end);

CreateTitle("Title%d",9,"MenuFrame%d",3,15,-15,"Isle Of Conquest / Score");
CreateTitle("Title%d",10,"MenuFrame%d",3,15,-220,"Isle Of Conquest / Timers");

CreateText("Text%d",65,"MenuFrame%d",3,20,-35,"Texture"); 
CreateText("Text%d",66,"MenuFrame%d",3,20,-55,"Tex. Height");
CreateText("Text%d",67,"MenuFrame%d",3,20,-75,"Tex. Width");
CreateText("Text%d",68,"MenuFrame%d",3,20,-95,"Tex. Xofs");
CreateText("Text%d",69,"MenuFrame%d",3,20,-115,"Tex. Yofs");
CreateText("Text%d",70,"MenuFrame%d",3,20,-135,"Bg Height");
CreateText("Text%d",71,"MenuFrame%d",3,20,-155,"Bg Width");
CreateText("Text%d",72,"MenuFrame%d",3,185,-35,"Font");
CreateText("Text%d",73,"MenuFrame%d",3,185,-55,"Font Size");
CreateText("Text%d",74,"MenuFrame%d",3,185,-75,"Outline");
CreateText("Text%d",75,"MenuFrame%d",3,185,-95,"Fill Bars");
CreateText("Text%d",76,"MenuFrame%d",3,185,-115,"Gradient");
CreateText("Text%d",77,"MenuFrame%d",3,185,-155,"Move Score");
--CreateText("Text%d",78,"MenuFrame%d",3,185,-175,"Reset Score");
CreateText("Text%d",79,"MenuFrame%d",3,20,-245,"Show / Hide Icons");
CreateText("Text%d",80,"MenuFrame%d",3,20,-266,"Show / Hide Timers");
CreateText("Text%d",81,"MenuFrame%d",3,190,-225,"Texture Height");
CreateText("Text%d",82,"MenuFrame%d",3,190,-245,"Texture Yofs");                                                 
CreateText("Text%d",83,"MenuFrame%d",3,190,-265,"Bar Height");
CreateText("Text%d",84,"MenuFrame%d",3,190,-285,"Bar Width");
CreateText("Text%d",85,"MenuFrame%d",3,190,-305,"Text Xofs");
CreateText("Text%d",86,"MenuFrame%d",3,190,-325,"Text Yofs");
CreateText("Text%d",87,"MenuFrame%d",3,190,-345,"Bars Xofs");
CreateText("Text%d",88,"MenuFrame%d",3,190,-365,"Bars Yofs");
CreateText("Text%d",89,"MenuFrame%d",3,190,-385,"Spacing");
CreateText("Text%d",90,"MenuFrame%d",3,20,-335,"Texture");
CreateText("Text%d",91,"MenuFrame%d",3,20,-355,"Font");
CreateText("Text%d",92,"MenuFrame%d",3,20,-375,"Font Size");
CreateText("Text%d",93,"MenuFrame%d",3,20,-395,"Outline");
CreateText("Text%d",94,"MenuFrame%d",3,20,-415,"Gradient");
CreateText("Text%d",95,"MenuFrame%d",3,190,-405,"Timer Xofs");
CreateText("Text%d",96,"MenuFrame%d",3,190,-425,"Timer Yofs");
CreateText("Text%d",97,"MenuFrame%d",3,20,-435,"Timers Scale");

--Check Buttons
--Icons
CreateCheckB("CheckB%d",19,"MenuFrame%d",3,150,-240);
CheckB19:SetScript("OnClick",function() if (Ll.ActiveIOC[1]==1) then CheckB19:SetChecked(0);Ll.ActiveIOC[1]=0; else CheckB19:SetChecked(1);Ll.ActiveIOC[1]=1; end end);

--Outline1
CreateCheckB("CheckB%d",20,"MenuFrame%d",3,295,-70);
CheckB20:SetScript("OnClick",function() if Ll.FontOutlineKey[30]==2 then CheckB20:SetChecked(0);Ll.FontOutlineKey[30]=1; else CheckB20:SetChecked(1);Ll.FontOutlineKey[30]=2; end end);  

--Outline2
CreateCheckB("CheckB%d",21,"MenuFrame%d",3,150,-390);
CheckB21:SetScript("OnClick",function() if Ll.FontOutlineKey[31]==2 then CheckB21:SetChecked(0);Ll.FontOutlineKey[31]=1; else CheckB21:SetChecked(1);Ll.FontOutlineKey[31]=2; end end);        

--FillBars
CreateCheckB("CheckB%d",22,"MenuFrame%d",3,295,-90);
CheckB22:SetScript("OnClick",function() if (Ll.FillBars[30]==0) then CheckB22:SetChecked(1);Ll.FillBars[30]=1; else CheckB22:SetChecked(0);Ll.FillBars[30]=0; end end);

--Gradient1
CreateCheckB("CheckB%d",23,"MenuFrame%d",3,295,-110);
CheckB23:SetScript("OnClick",function() if Ll.TexGradientKey[30]==1 then CheckB23:SetChecked(1);Ll.TexGradientKey[30]=2; else CheckB23:SetChecked(0);Ll.TexGradientKey[30]=1; end end);

--Gradient2
CreateCheckB("CheckB%d",24,"MenuFrame%d",3,150,-410);
CheckB24:SetScript("OnClick",function() if Ll.TexGradientKey[31]==1 then CheckB24:SetChecked(1);Ll.TexGradientKey[31]=2; else CheckB24:SetChecked(0);Ll.TexGradientKey[31]=1; end end);

--Timers
CreateCheckB("CheckB%d",25,"MenuFrame%d",3,150,-260);
CheckB25:SetScript("OnClick",function() if (Ll.ActiveIOC[2]==1) then CheckB25:SetChecked(0);Ll.ActiveIOC[2]=0; else CheckB25:SetChecked(1);Ll.ActiveIOC[2]=1; end end);

--Texture choice 1
CreateDropDownTexture("Texture%d",4,"TextureTex%d",4,"TextureText%d",4,"DDTex%d",4,"MenuFrame%d",3,90,-35);
local function DDTex4_Load(self,level) TexMenus(self,level,4,30) end
UIDropDownMenu_Initialize(DDTex4,DDTex4_Load,"MENU");
Texture4:SetScript("OnClick",function() Texture_OnClick(4) end);

--Texture choice 2
CreateDropDownTexture("Texture%d",5,"TextureTex%d",5,"TextureText%d",5,"DDTex%d",5,"MenuFrame%d",3,90,-335);
local function DDTex5_Load(self,level) TexMenus(self,level,5,31) end
UIDropDownMenu_Initialize(DDTex5,DDTex5_Load,"MENU");
Texture5:SetScript("OnClick",function() Texture_OnClick(5) end);

--Font choice1
CreateDropDownFont("FontV%d",6,"FontVtext%d",6,"FontVDD%d",6,"MenuFrame%d",3,230,-35);
local function FontVDD6_Load(self,level) FontsMenus(self,level,6,30) end
UIDropDownMenu_Initialize(FontVDD6,FontVDD6_Load,"MENU");
FontV6:SetScript("OnClick",function() Fonts_OnClick(6) end);

--Font choice2
CreateDropDownFont("FontV%d",7,"FontVtext%d",7,"FontVDD%d",7,"MenuFrame%d",3,90,-355);
local function FontVDD7_Load(self,level) FontsMenus(self,level,7,31) end
UIDropDownMenu_Initialize(FontVDD7,FontVDD7_Load,"MENU");
FontV7:SetScript("OnClick",function() Fonts_OnClick(7) end);

--Font Size1
CreateEditBox("LlEditBox%d",33,"MenuFrame%d",3,285,-55);
LlEditBox33:SetScript("OnEnterPressed",function() LlEditBox33:ClearFocus();LlEditBox33:SetAutoFocus(false);Ll.FontSize[30]=LlEditBox33:GetNumber(); end);

--Font Size2
CreateEditBox("LlEditBox%d",34,"MenuFrame%d",3,140,-375);
LlEditBox34:SetScript("OnEnterPressed",function() LlEditBox34:ClearFocus();LlEditBox34:SetAutoFocus(false);Ll.FontSize[31]=LlEditBox34:GetNumber(); end);

--Tex. Height1
CreateEditBox("LlEditBox%d",35,"MenuFrame%d",3,140,-55);
LlEditBox35:SetScript("OnEnterPressed",function() LlEditBox35:ClearFocus();LlEditBox35:SetAutoFocus(false);Ll.TexHeight[30]=LlEditBox35:GetNumber(); end);

--Tex. Height2
CreateEditBox("LlEditBox%d",36,"MenuFrame%d",3,285,-224);
LlEditBox36:SetScript("OnEnterPressed",function() LlEditBox36:ClearFocus();LlEditBox36:SetAutoFocus(false);Ll.TexHeight[31]=LlEditBox36:GetNumber(); end);

--Tex. Width
CreateEditBox("LlEditBox%d",37,"MenuFrame%d",3,140,-75);
LlEditBox37:SetScript("OnEnterPressed",function() LlEditBox37:ClearFocus();LlEditBox37:SetAutoFocus(false);Ll.TexWidth[30]=LlEditBox37:GetNumber(); end);

--Tex. Xofs
CreateEditBox("LlEditBox%d",38,"MenuFrame%d",3,140,-95);
LlEditBox38:SetScript("OnEnterPressed",function() LlEditBox38:ClearFocus();LlEditBox38:SetAutoFocus(false);Ll.TexXofs[30]=LlEditBox38:GetNumber(); end);

--Tex. Yofs
CreateEditBox("LlEditBox%d",39,"MenuFrame%d",3,140,-115);
LlEditBox39:SetScript("OnEnterPressed",function() LlEditBox39:ClearFocus();LlEditBox39:SetAutoFocus(false);Ll.TexYofs[30]=LlEditBox39:GetNumber(); end);

--Tex. Yofs2
CreateEditBox("LlEditBox%d",40,"MenuFrame%d",3,285,-244);
LlEditBox40:SetScript("OnEnterPressed",function() LlEditBox40:ClearFocus();LlEditBox40:SetAutoFocus(false);Ll.TexYofs[31]=LlEditBox40:GetNumber(); end);

--Bar height
CreateEditBox("LlEditBox%d",41,"MenuFrame%d",3,140,-135);
LlEditBox41:SetScript("OnEnterPressed",function() LlEditBox41:ClearFocus();LlEditBox41:SetAutoFocus(false);Ll.BarHeight[30]=LlEditBox41:GetNumber(); end);

--Bar height2
CreateEditBox("LlEditBox%d",42,"MenuFrame%d",3,285,-264);
LlEditBox42:SetScript("OnEnterPressed",function() LlEditBox42:ClearFocus();LlEditBox42:SetAutoFocus(false);Ll.BarHeight[31]=LlEditBox42:GetNumber(); end);

--Bar Width1
CreateEditBox("LlEditBox%d",43,"MenuFrame%d",3,140,-155);
LlEditBox43:SetScript("OnEnterPressed",function() LlEditBox43:ClearFocus();LlEditBox43:SetAutoFocus(false);Ll.BarWidth[30]=LlEditBox43:GetNumber(); end);

--Bar Width2
CreateEditBox("LlEditBox%d",44,"MenuFrame%d",3,285,-284);
LlEditBox44:SetScript("OnEnterPressed",function() LlEditBox44:ClearFocus();LlEditBox44:SetAutoFocus(false);Ll.BarWidth[31]=LlEditBox44:GetNumber(); end);

--Base Text xofs
CreateEditBox("LlEditBox%d",45,"MenuFrame%d",3,285,-304);
LlEditBox45:SetScript("OnEnterPressed",function() LlEditBox45:ClearFocus();LlEditBox45:SetAutoFocus(false);Ll.BaseTxtXofs[31]=LlEditBox45:GetNumber(); end);

--Base Text yofs
CreateEditBox("LlEditBox%d",46,"MenuFrame%d",3,285,-324);
LlEditBox46:SetScript("OnEnterPressed",function() LlEditBox46:ClearFocus();LlEditBox46:SetAutoFocus(false);Ll.BaseTxtYofs[31]=LlEditBox46:GetNumber(); end);

--Base Bar xofs
CreateEditBox("LlEditBox%d",47,"MenuFrame%d",3,285,-344);
LlEditBox47:SetScript("OnEnterPressed",function() LlEditBox47:ClearFocus();LlEditBox47:SetAutoFocus(false);Ll.BarsXofs[31]=LlEditBox47:GetNumber(); end);

--Base Bar yofs
CreateEditBox("LlEditBox%d",48,"MenuFrame%d",3,285,-364);
LlEditBox48:SetScript("OnEnterPressed",function() LlEditBox48:ClearFocus();LlEditBox48:SetAutoFocus(false);Ll.BarsYofs[31]=LlEditBox48:GetNumber(); end); 

--Spacing
CreateEditBox("LlEditBox%d",49,"MenuFrame%d",3,285,-384);
LlEditBox49:SetScript("OnEnterPressed",function() LlEditBox49:ClearFocus();LlEditBox49:SetAutoFocus(false);Ll.BarSpacing[31]=LlEditBox49:GetNumber(); end);

--Base Timer xofs
CreateEditBox("LlEditBox%d",50,"MenuFrame%d",3,285,-404);
LlEditBox50:SetScript("OnEnterPressed",function() LlEditBox50:ClearFocus();LlEditBox50:SetAutoFocus(false);Ll.BaseTimeXofs[31]=LlEditBox50:GetNumber(); end);

--Base Timer yofs
CreateEditBox("LlEditBox%d",51,"MenuFrame%d",3,285,-424);
LlEditBox51:SetScript("OnEnterPressed",function() LlEditBox51:ClearFocus();LlEditBox51:SetAutoFocus(false);Ll.BaseTimeYofs[31]=LlEditBox51:GetNumber(); end);

--Scale
CreateEditBox("LlEditBox%d",52,"MenuFrame%d",3,140,-435);
LlEditBox52:SetScript("OnEnterPressed",function() LlEditBox52:ClearFocus();LlEditBox52:SetAutoFocus(false);Ll.Scale[32]=LlEditBox52:GetNumber(); end);

--Scale1
CreateScale("LlScale%d",5,"MenuFrame%d",3,50,-190);
LlScale5:SetScript("OnValueChanged",function() Ll.Scale[30]=LlScale5:GetValue(); end);

--Scale3
CreateScale("LlScale%d",6,"MenuFrame%d",3,50,-300);
LlScale6:SetScript("OnValueChanged",function() Ll.Scale[31]=LlScale6:GetValue(); end);

--Move Score
LlMove("MoveB%d",6,"MenuFrame%d",3,280,-155,"Move",50);
MoveB6:SetScript("OnClick",function() MoveIOC(); end);

--Test Move Timers
LlMove("MoveB%d",7,"MenuFrame%d",3,340,-435,"Test/Move",70);
MoveB7:SetScript("OnClick",function() TestIsle(); end);

--Only Timer
LlMove("MoveB%d",8,"MenuFrame%d",3,340,-200,"Only Timer",70);
MoveB8:SetScript("OnClick",function() if (Ll.OnlyTime[31]==0) then Ll.OnlyTime[31]=1; else Ll.OnlyTime[31]=0; end end);

--Colors
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",36,"MenuFrame%d",3,30,340,-35,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",37,"MenuFrame%d",3,31,340,-55,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",38,"MenuFrame%d",3,32,340,-75,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",39,"MenuFrame%d",3,33,340,-95,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",40,"MenuFrame%d",3,36,340,-115,"Back.");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",41,"MenuFrame%d",3,37,340,-135,"Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",42,"MenuFrame%d",3,302,340,-224,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",43,"MenuFrame%d",3,303,340,-244,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",44,"MenuFrame%d",3,304,340,-264,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",45,"MenuFrame%d",3,305,340,-284,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",46,"MenuFrame%d",3,306,340,-304,"Neutral 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",47,"MenuFrame%d",3,307,340,-324,"Neutral 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",48,"MenuFrame%d",3,308,340,-344,"Bars.Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",49,"MenuFrame%d",3,309,340,-364,"Bars Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",50,"MenuFrame%d",3,300,340,-384,"Base.Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",51,"MenuFrame%d",3,301,340,-404,"Base Border");

--OnShow
local function Menu3_OnShow()
   Tab3:SetBackdropColor(0.3,0.4,0.5,0.8);
   if (Ll.ActiveIOC[2]==1) then CheckB25:SetChecked(1); else CheckB25:SetChecked(0); end
   if (Ll.TexGradientKey[31]==1) then CheckB24:SetChecked(0); else CheckB24:SetChecked(1); end
   if (Ll.TexGradientKey[30]==1) then CheckB23:SetChecked(0); else CheckB23:SetChecked(1); end
   if (Ll.FillBars[30]==1) then CheckB22:SetChecked(1); else CheckB22:SetChecked(0); end
   if (Ll.FontOutlineKey[31]==1) then CheckB21:SetChecked(0); else CheckB21:SetChecked(1); end
   if (Ll.FontOutlineKey[30]==1) then CheckB20:SetChecked(0); else CheckB20:SetChecked(1); end
   if (Ll.ActiveIOC[1]==1) then CheckB19:SetChecked(1); else CheckB19:SetChecked(0); end
   TextureTex4:SetTexture(Ll.Textures[Ll.TextureKey[30]]);
   TextureText4:SetText(Ll.TexturesName[Ll.TextureKey[30]]);
   TextureTex5:SetTexture(Ll.Textures[Ll.TextureKey[31]]);
   TextureText5:SetText(Ll.TexturesName[Ll.TextureKey[31]]);       
   FontVtext6:SetText(Ll.FontName[Ll.FontKey[30]]);
   FontVtext7:SetText(Ll.FontName[Ll.FontKey[31]]);
   LlEditBox33:SetText(Ll.FontSize[30]);
   LlEditBox34:SetText(Ll.FontSize[31]);
   LlEditBox35:SetText(Ll.TexHeight[30]);
   LlEditBox36:SetText(Ll.TexHeight[31]);     
   LlEditBox37:SetText(Ll.TexWidth[30]);
   LlEditBox38:SetText(Ll.TexXofs[30]);
   LlEditBox39:SetText(Ll.TexYofs[30]);
   LlEditBox40:SetText(Ll.TexYofs[31]);            
   LlEditBox41:SetText(Ll.BarHeight[30]);
   LlEditBox42:SetText(Ll.BarHeight[31]);
   LlEditBox43:SetText(Ll.BarWidth[30]);
   LlEditBox44:SetText(Ll.BarWidth[31]); 
   LlEditBox45:SetText(Ll.BaseTxtXofs[31]);
   LlEditBox46:SetText(Ll.BaseTxtYofs[31]);
   LlEditBox47:SetText(Ll.BarsXofs[31]);
   LlEditBox48:SetText(Ll.BarsYofs[31]);
   LlEditBox49:SetText(Ll.BarSpacing[31]);
   LlEditBox50:SetText(Ll.BaseTimeXofs[31]);
   LlEditBox51:SetText(Ll.BaseTimeYofs[31]);
   LlEditBox52:SetText(Ll.Scale[32]);
   LlScale5:SetValue(Ll.Scale[30]);
   LlScale6:SetValue(Ll.Scale[31]);
   ColorButTex36:SetVertexColor(unpack(Ll.Colors[30]));
   ColorButTex37:SetVertexColor(unpack(Ll.Colors[31]));
   ColorButTex38:SetVertexColor(unpack(Ll.Colors[32]));
   ColorButTex39:SetVertexColor(unpack(Ll.Colors[33]));
   ColorButTex40:SetVertexColor(unpack(Ll.Colors[36]));
   ColorButTex41:SetVertexColor(unpack(Ll.Colors[37]));
   ColorButTex42:SetVertexColor(unpack(Ll.Colors[302]));
   ColorButTex43:SetVertexColor(unpack(Ll.Colors[303]));   
   ColorButTex44:SetVertexColor(unpack(Ll.Colors[304]));
   ColorButTex45:SetVertexColor(unpack(Ll.Colors[305]));
   ColorButTex46:SetVertexColor(unpack(Ll.Colors[306]));
   ColorButTex47:SetVertexColor(unpack(Ll.Colors[307]));
   ColorButTex48:SetVertexColor(unpack(Ll.Colors[308]));
   ColorButTex49:SetVertexColor(unpack(Ll.Colors[309]));
   ColorButTex50:SetVertexColor(unpack(Ll.Colors[300]));
   ColorButTex51:SetVertexColor(unpack(Ll.Colors[301]));   
end
MenuFrame3:SetScript("OnShow",function() Menu3_OnShow(); end);

--OnHide
local function Menu3_OnHide()
   Tab3:SetBackdropColor(0.1,0.1,0.1,0.8);
end
MenuFrame3:SetScript("OnHide",function() Menu3_OnHide(); end);




--------------------------------------------------------------------------------
-------------------------------------------------------------------EyeOfTheStorm
CreateBackgroundFrame("MenuFrame%d",4);

CreateTab("Tab%d",4,260,-88,"TabText%d",4,Tabs[40]);
Tab4:SetScript("OnClick",function() for i=0,11 do local parent = "MenuFrame%d";local Parent = _G[parent:format(i)]; Parent:Hide(); end MenuFrame4:Show(); end);

CreateTitle("Title%d",11,"MenuFrame%d",4,15,-15,"Eye Of The Storm / Score");
CreateTitle("Title%d",12,"MenuFrame%d",4,15,-220,"Eye Of The Storm / Flags");
CreateTitle("Title%d",13,"MenuFrame%d",4,230,-220,"Eye Of The Storm / Bases");
CreateTitle("Title%d",14,"MenuFrame%d",4,15,-340,"Bases Colors");

CreateText("Text%d",98,"MenuFrame%d",4,20,-35,"Texture"); 
CreateText("Text%d",99,"MenuFrame%d",4,20,-55,"Tex. Height");
CreateText("Text%d",100,"MenuFrame%d",4,20,-75,"Tex. Width");
CreateText("Text%d",101,"MenuFrame%d",4,20,-95,"Tex. Xofs");
CreateText("Text%d",102,"MenuFrame%d",4,20,-115,"Tex. Yofs");
CreateText("Text%d",103,"MenuFrame%d",4,20,-135,"Bg Height");
CreateText("Text%d",104,"MenuFrame%d",4,20,-155,"Bg Width");
CreateText("Text%d",105,"MenuFrame%d",4,185,-35,"Font");
CreateText("Text%d",106,"MenuFrame%d",4,185,-55,"Font Size");
CreateText("Text%d",107,"MenuFrame%d",4,185,-75,"Outline");
CreateText("Text%d",108,"MenuFrame%d",4,185,-95,"Fill Bars");
CreateText("Text%d",109,"MenuFrame%d",4,185,-115,"Gradient");
CreateText("Text%d",110,"MenuFrame%d",4,185,-155,"Move Score");
--CreateText("Text%d",111,"MenuFrame%d",4,185,-175,"Reset Score");
CreateText("Text%d",112,"MenuFrame%d",4,20,-245,"Font");
CreateText("Text%d",113,"MenuFrame%d",4,20,-265,"Font Size");
CreateText("Text%d",114,"MenuFrame%d",4,20,-285,"Outline");
--CreateText("Text%d",115,"MenuFrame%d",4,235,-245,"Show / Hide Icons");
CreateText("Text%d",116,"MenuFrame%d",4,235,-245,"Show / Hide Bases");
CreateText("Text%d",117,"MenuFrame%d",4,235,-286,"Font");
CreateText("Text%d",118,"MenuFrame%d",4,235,-306,"Font Size");
CreateText("Text%d",119,"MenuFrame%d",4,235,-326,"Outline");
CreateText("Text%d",120,"MenuFrame%d",4,235,-346,"Texture");
CreateText("Text%d",121,"MenuFrame%d",4,235,-366,"Gradient");


--Outline1
CreateCheckB("CheckB%d",26,"MenuFrame%d",4,295,-70);
CheckB26:SetScript("OnClick",function() if Ll.FontOutlineKey[40]==2 then CheckB26:SetChecked(0);Ll.FontOutlineKey[40]=1; else CheckB26:SetChecked(1);Ll.FontOutlineKey[40]=2; end end);  

--FillBars
CreateCheckB("CheckB%d",27,"MenuFrame%d",4,295,-90);
CheckB27:SetScript("OnClick",function() if (Ll.FillBars[40]==0) then CheckB27:SetChecked(1);Ll.FillBars[40]=1; else CheckB27:SetChecked(0);Ll.FillBars[40]=0; end end);

--Gradient
CreateCheckB("CheckB%d",28,"MenuFrame%d",4,295,-110);
CheckB28:SetScript("OnClick",function() if Ll.TexGradientKey[40]==1 then CheckB28:SetChecked(1);Ll.TexGradientKey[40]=2; else CheckB28:SetChecked(0);Ll.TexGradientKey[40]=1; end end);

--Outline2
CreateCheckB("CheckB%d",29,"MenuFrame%d",4,150,-280);
CheckB29:SetScript("OnClick",function() if Ll.FontOutlineKey[41]==2 then CheckB29:SetChecked(0);Ll.FontOutlineKey[41]=1; else CheckB29:SetChecked(1);Ll.FontOutlineKey[41]=2; end end);

--Icons
--CreateCheckB("CheckB%d",30,"MenuFrame%d",4,360,-240);
--CheckB30:SetScript("OnClick",function() if Ll.ActiveEOTS[1]==1 then CheckB30:SetChecked(0);Ll.ActiveEOTS[1]=0; else CheckB30:SetChecked(1);Ll.ActiveEOTS[1]=1; end end);  

--Bases
CreateCheckB("CheckB%d",31,"MenuFrame%d",4,360,-240);
CheckB31:SetScript("OnClick",function() if (Ll.ActiveEOTS[2]==0) then CheckB31:SetChecked(1);Ll.ActiveEOTS[2]=1; else CheckB31:SetChecked(0);Ll.ActiveEOTS[2]=0; end end);

--Outline3
CreateCheckB("CheckB%d",32,"MenuFrame%d",4,360,-320);
CheckB32:SetScript("OnClick",function() if Ll.FontOutlineKey[42]==2 then CheckB32:SetChecked(0);Ll.FontOutlineKey[42]=1; else CheckB32:SetChecked(1);Ll.FontOutlineKey[42]=2; end end);

--Gradient
CreateCheckB("CheckB%d",33,"MenuFrame%d",4,360,-360);
CheckB33:SetScript("OnClick",function() if Ll.TexGradientKey[41]==1 then CheckB33:SetChecked(1);Ll.TexGradientKey[41]=2; else CheckB33:SetChecked(0);Ll.TexGradientKey[41]=1; end end);

--Texture choice 1
CreateDropDownTexture("Texture%d",6,"TextureTex%d",6,"TextureText%d",6,"DDTex%d",6,"MenuFrame%d",4,90,-35);
local function DDTex6_Load(self,level) TexMenus(self,level,6,40) end
UIDropDownMenu_Initialize(DDTex6,DDTex6_Load,"MENU");
Texture6:SetScript("OnClick",function() Texture_OnClick(6) end);

--Texture choice 2
CreateDropDownTexture("Texture%d",7,"TextureTex%d",7,"TextureText%d",7,"DDTex%d",7,"MenuFrame%d",4,292,-345);
local function DDTex7_Load(self,level) TexMenus(self,level,7,41) end
UIDropDownMenu_Initialize(DDTex7,DDTex7_Load,"MENU");
Texture7:SetScript("OnClick",function() Texture_OnClick(7) end);

--Font choice1
CreateDropDownFont("FontV%d",8,"FontVtext%d",8,"FontVDD%d",8,"MenuFrame%d",4,230,-35);
local function FontVDD8_Load(self,level) FontsMenus(self,level,8,40) end
UIDropDownMenu_Initialize(FontVDD8,FontVDD8_Load,"MENU");
FontV8:SetScript("OnClick",function() Fonts_OnClick(8) end);

--Font choice2
CreateDropDownFont("FontV%d",9,"FontVtext%d",9,"FontVDD%d",9,"MenuFrame%d",4,90,-245);
local function FontVDD9_Load(self,level) FontsMenus(self,level,9,41) end
UIDropDownMenu_Initialize(FontVDD9,FontVDD9_Load,"MENU");
FontV9:SetScript("OnClick",function() Fonts_OnClick(9) end);

--Font choice3
CreateDropDownFont("FontV%d",10,"FontVtext%d",10,"FontVDD%d",10,"MenuFrame%d",4,292,-285);
local function FontVDD10_Load(self,level) FontsMenus(self,level,10,42) end
UIDropDownMenu_Initialize(FontVDD10,FontVDD10_Load,"MENU");
FontV10:SetScript("OnClick",function() Fonts_OnClick(10) end);

--Tex. Height1
CreateEditBox("LlEditBox%d",53,"MenuFrame%d",4,140,-55);
LlEditBox53:SetScript("OnEnterPressed",function() LlEditBox53:ClearFocus();LlEditBox53:SetAutoFocus(false);Ll.TexHeight[40]=LlEditBox53:GetNumber(); end);

--Tex. Width
CreateEditBox("LlEditBox%d",54,"MenuFrame%d",4,140,-75);
LlEditBox54:SetScript("OnEnterPressed",function() LlEditBox54:ClearFocus();LlEditBox54:SetAutoFocus(false);Ll.TexWidth[40]=LlEditBox54:GetNumber(); end);

--Tex. Xofs
CreateEditBox("LlEditBox%d",55,"MenuFrame%d",4,140,-95);
LlEditBox55:SetScript("OnEnterPressed",function() LlEditBox55:ClearFocus();LlEditBox55:SetAutoFocus(false);Ll.TexXofs[40]=LlEditBox55:GetNumber(); end);

--Tex. Yofs
CreateEditBox("LlEditBox%d",56,"MenuFrame%d",4,140,-115);
LlEditBox56:SetScript("OnEnterPressed",function() LlEditBox56:ClearFocus();LlEditBox56:SetAutoFocus(false);Ll.TexYofs[40]=LlEditBox56:GetNumber(); end);

--Bar height
CreateEditBox("LlEditBox%d",57,"MenuFrame%d",4,140,-135);
LlEditBox57:SetScript("OnEnterPressed",function() LlEditBox57:ClearFocus();LlEditBox57:SetAutoFocus(false);Ll.BarHeight[40]=LlEditBox57:GetNumber(); end);

--Bar Width
CreateEditBox("LlEditBox%d",58,"MenuFrame%d",4,140,-155);
LlEditBox58:SetScript("OnEnterPressed",function() LlEditBox58:ClearFocus();LlEditBox58:SetAutoFocus(false);Ll.BarWidth[40]=LlEditBox58:GetNumber(); end);

--Font Size1
CreateEditBox("LlEditBox%d",59,"MenuFrame%d",4,285,-55);
LlEditBox59:SetScript("OnEnterPressed",function() LlEditBox59:ClearFocus();LlEditBox59:SetAutoFocus(false);Ll.FontSize[40]=LlEditBox59:GetNumber(); end);

--Font Size2
CreateEditBox("LlEditBox%d",60,"MenuFrame%d",4,140,-265);
LlEditBox60:SetScript("OnEnterPressed",function() LlEditBox60:ClearFocus();LlEditBox60:SetAutoFocus(false);Ll.FontSize[41]=LlEditBox60:GetNumber(); end);

--Font Size3
CreateEditBox("LlEditBox%d",61,"MenuFrame%d",4,348,-305);
LlEditBox61:SetScript("OnEnterPressed",function() LlEditBox61:ClearFocus();LlEditBox61:SetAutoFocus(false);Ll.FontSize[42]=LlEditBox61:GetNumber(); end);

--Scale
CreateScale("LlScale%d",7,"MenuFrame%d",4,50,-190);
LlScale7:SetScript("OnValueChanged",function() Ll.Scale[40]=LlScale7:GetValue(); end);

--Scale
CreateScale("LlScale%d",8,"MenuFrame%d",4,280,-425);
LlScale8:SetScript("OnValueChanged",function() Ll.Scale[42]=LlScale8:GetValue(); end);

--Colors
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",52,"MenuFrame%d",4,40,340,-35,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",53,"MenuFrame%d",4,41,340,-55,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",54,"MenuFrame%d",4,42,340,-75,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",55,"MenuFrame%d",4,43,340,-95,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",56,"MenuFrame%d",4,46,340,-115,"Back.");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",57,"MenuFrame%d",4,47,340,-135,"Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",58,"MenuFrame%d",4,402,20,-360,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",59,"MenuFrame%d",4,403,20,-380,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",60,"MenuFrame%d",4,404,120,-360,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",61,"MenuFrame%d",4,405,120,-380,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",62,"MenuFrame%d",4,406,20,-400,"Neutral 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",63,"MenuFrame%d",4,407,120,-400,"Neutral 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",112,"MenuFrame%d",4,400,20,-420,"Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",113,"MenuFrame%d",4,401,120,-420,"Bg Border");

--Move Score
LlMove("MoveB%d",9,"MenuFrame%d",4,280,-155,"Move",50);
MoveB9:SetScript("OnClick",function() MoveEots(); end);

--Move Base
LlMove("MoveB%d",10,"MenuFrame%d",4,235,-390,"Test/Move",70);
MoveB10:SetScript("OnClick",function() TestEOTS(); end);


--OnShow
local function Menu4_OnShow()
   Tab4:SetBackdropColor(0.3,0.4,0.5,0.8);
   if (Ll.FontOutlineKey[40]==1) then CheckB26:SetChecked(0); else CheckB26:SetChecked(1); end
   if (Ll.FillBars[40]==1) then CheckB27:SetChecked(1); else CheckB27:SetChecked(0); end
   if (Ll.TexGradientKey[40]==1) then CheckB28:SetChecked(0); else CheckB28:SetChecked(1); end
   if (Ll.FontOutlineKey[41]==1) then CheckB29:SetChecked(0); else CheckB29:SetChecked(1); end
   --if (Ll.ActiveEOTS[1]==1) then CheckB30:SetChecked(1); else CheckB30:SetChecked(0); end 
   if (Ll.ActiveEOTS[2]==1) then CheckB31:SetChecked(1); else CheckB31:SetChecked(0); end
   if (Ll.FontOutlineKey[42]==1) then CheckB32:SetChecked(0); else CheckB32:SetChecked(1); end
   if (Ll.TexGradientKey[41]==1) then CheckB33:SetChecked(0); else CheckB33:SetChecked(1); end   
   TextureTex6:SetTexture(Ll.Textures[Ll.TextureKey[40]]);
   TextureText6:SetText(Ll.TexturesName[Ll.TextureKey[40]]);
   TextureTex7:SetTexture(Ll.Textures[Ll.TextureKey[41]]);
   TextureText7:SetText(Ll.TexturesName[Ll.TextureKey[41]]);
   FontVtext8:SetText(Ll.FontName[Ll.FontKey[40]]);
   FontVtext9:SetText(Ll.FontName[Ll.FontKey[41]]);
   FontVtext10:SetText(Ll.FontName[Ll.FontKey[42]]);
   LlEditBox53:SetText(Ll.TexHeight[40]);
   LlEditBox54:SetText(Ll.TexWidth[40]);
   LlEditBox55:SetText(Ll.TexXofs[40]);
   LlEditBox56:SetText(Ll.TexYofs[40]);
   LlEditBox57:SetText(Ll.BarHeight[40]);
   LlEditBox58:SetText(Ll.BarWidth[40]);
   LlEditBox59:SetText(Ll.FontSize[40]);
   LlEditBox60:SetText(Ll.FontSize[41]);
   LlEditBox61:SetText(Ll.FontSize[42]);   
   LlScale7:SetValue(Ll.Scale[40]);
   LlScale8:SetValue(Ll.Scale[42]);   
   ColorButTex52:SetVertexColor(unpack(Ll.Colors[40]));
   ColorButTex53:SetVertexColor(unpack(Ll.Colors[41]));
   ColorButTex54:SetVertexColor(unpack(Ll.Colors[42]));
   ColorButTex55:SetVertexColor(unpack(Ll.Colors[43]));
   ColorButTex56:SetVertexColor(unpack(Ll.Colors[46]));
   ColorButTex57:SetVertexColor(unpack(Ll.Colors[47]));   
   ColorButTex58:SetVertexColor(unpack(Ll.Colors[402]));
   ColorButTex59:SetVertexColor(unpack(Ll.Colors[403]));
   ColorButTex60:SetVertexColor(unpack(Ll.Colors[404]));
   ColorButTex61:SetVertexColor(unpack(Ll.Colors[405]));
   ColorButTex62:SetVertexColor(unpack(Ll.Colors[406]));
   ColorButTex63:SetVertexColor(unpack(Ll.Colors[407]));
   ColorButTex112:SetVertexColor(unpack(Ll.Colors[400]));
   ColorButTex113:SetVertexColor(unpack(Ll.Colors[401]));     
end
MenuFrame4:SetScript("OnShow",function() Menu4_OnShow(); end);

--OnHide
local function Menu4_OnHide()
   Tab4:SetBackdropColor(0.1,0.1,0.1,0.8);
end
MenuFrame4:SetScript("OnHide",function() Menu4_OnHide(); end);



--------------------------------------------------------------------------------
--------------------------------------------------------------Strand of ancients
CreateBackgroundFrame("MenuFrame%d",5);

CreateTab("Tab%d",5,260,-110,"TabText%d",5,Tabs[50]);
Tab5:SetScript("OnClick",function() for i=0,11 do local parent = "MenuFrame%d";local Parent = _G[parent:format(i)]; Parent:Hide(); end MenuFrame5:Show(); end);

CreateTitle("Title%d",15,"MenuFrame%d",5,15,-15,"Strand of the Ancients");

CreateText("Text%d",122,"MenuFrame%d",5,20,-35,"Texture"); 
CreateText("Text%d",123,"MenuFrame%d",5,20,-55,"Tex. Height");
CreateText("Text%d",124,"MenuFrame%d",5,20,-75,"Tex. Width");
CreateText("Text%d",125,"MenuFrame%d",5,20,-95,"Tex. Xofs");
CreateText("Text%d",126,"MenuFrame%d",5,20,-115,"Tex. Yofs");
CreateText("Text%d",127,"MenuFrame%d",5,20,-135,"Bg Height");
CreateText("Text%d",128,"MenuFrame%d",5,20,-155,"Bg Width");
CreateText("Text%d",129,"MenuFrame%d",5,185,-35,"Font");
CreateText("Text%d",130,"MenuFrame%d",5,185,-55,"Font Size");
CreateText("Text%d",131,"MenuFrame%d",5,185,-75,"Outline");
CreateText("Text%d",132,"MenuFrame%d",5,185,-95,"Gradient");
CreateText("Text%d",133,"MenuFrame%d",5,185,-145,"Move Score");
--CreateText("Text%d",134,"MenuFrame%d",5,185,-165,"Reset Score");

--Outline1
CreateCheckB("CheckB%d",34,"MenuFrame%d",5,295,-70);
CheckB34:SetScript("OnClick",function() if Ll.FontOutlineKey[50]==2 then CheckB34:SetChecked(0);Ll.FontOutlineKey[50]=1; else CheckB34:SetChecked(1);Ll.FontOutlineKey[50]=2; end end);  

--Gradient
CreateCheckB("CheckB%d",35,"MenuFrame%d",5,295,-90);
CheckB35:SetScript("OnClick",function() if Ll.TexGradientKey[50]==1 then CheckB35:SetChecked(1);Ll.TexGradientKey[50]=2; else CheckB35:SetChecked(0);Ll.TexGradientKey[50]=1; end end);

--Texture choice 1
CreateDropDownTexture("Texture%d",8,"TextureTex%d",8,"TextureText%d",8,"DDTex%d",8,"MenuFrame%d",5,90,-35);
local function DDTex8_Load(self,level) TexMenus(self,level,8,50) end
UIDropDownMenu_Initialize(DDTex8,DDTex8_Load,"MENU");
Texture8:SetScript("OnClick",function() Texture_OnClick(8) end);

--Font choice1
CreateDropDownFont("FontV%d",11,"FontVtext%d",11,"FontVDD%d",11,"MenuFrame%d",5,230,-35);
local function FontVDD11_Load(self,level) FontsMenus(self,level,11,50) end
UIDropDownMenu_Initialize(FontVDD11,FontVDD11_Load,"MENU");
FontV11:SetScript("OnClick",function() Fonts_OnClick(11) end);

--Tex. Height
CreateEditBox("LlEditBox%d",62,"MenuFrame%d",5,140,-55);
LlEditBox62:SetScript("OnEnterPressed",function() LlEditBox62:ClearFocus();LlEditBox62:SetAutoFocus(false);Ll.TexHeight[50]=LlEditBox62:GetNumber(); end);

--Tex. Width
CreateEditBox("LlEditBox%d",63,"MenuFrame%d",5,140,-75);
LlEditBox63:SetScript("OnEnterPressed",function() LlEditBox63:ClearFocus();LlEditBox63:SetAutoFocus(false);Ll.TexWidth[50]=LlEditBox63:GetNumber(); end);

--Tex. Xofs
CreateEditBox("LlEditBox%d",64,"MenuFrame%d",5,140,-95);
LlEditBox64:SetScript("OnEnterPressed",function() LlEditBox64:ClearFocus();LlEditBox64:SetAutoFocus(false);Ll.TexXofs[50]=LlEditBox64:GetNumber(); end);

--Tex. Yofs
CreateEditBox("LlEditBox%d",65,"MenuFrame%d",5,140,-115);
LlEditBox65:SetScript("OnEnterPressed",function() LlEditBox65:ClearFocus();LlEditBox65:SetAutoFocus(false);Ll.TexYofs[50]=LlEditBox65:GetNumber(); end);

--Bar height
CreateEditBox("LlEditBox%d",66,"MenuFrame%d",5,140,-135);
LlEditBox66:SetScript("OnEnterPressed",function() LlEditBox66:ClearFocus();LlEditBox66:SetAutoFocus(false);Ll.BarHeight[50]=LlEditBox66:GetNumber(); end);

--Bar Width
CreateEditBox("LlEditBox%d",67,"MenuFrame%d",5,140,-155);
LlEditBox67:SetScript("OnEnterPressed",function() LlEditBox67:ClearFocus();LlEditBox67:SetAutoFocus(false);Ll.BarWidth[50]=LlEditBox67:GetNumber(); end);

--Font Size1
CreateEditBox("LlEditBox%d",68,"MenuFrame%d",5,285,-55);
LlEditBox68:SetScript("OnEnterPressed",function() LlEditBox68:ClearFocus();LlEditBox68:SetAutoFocus(false);Ll.FontSize[50]=LlEditBox68:GetNumber(); end);

--Scale
CreateScale("LlScale%d",9,"MenuFrame%d",5,50,-190);
LlScale9:SetScript("OnValueChanged",function() Ll.Scale[50]=LlScale9:GetValue(); end);

--Move Score
LlMove("MoveB%d",11,"MenuFrame%d",5,280,-145,"Move",50);
MoveB11:SetScript("OnClick",function() MoveStrand(); end);

--Colors
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",64,"MenuFrame%d",5,50,340,-35,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",65,"MenuFrame%d",5,51,340,-55,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",66,"MenuFrame%d",5,52,340,-75,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",67,"MenuFrame%d",5,53,340,-95,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",68,"MenuFrame%d",5,56,340,-115,"Back.");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",69,"MenuFrame%d",5,57,340,-135,"Border");

--OnShow
local function Menu5_OnShow()
   Tab5:SetBackdropColor(0.3,0.4,0.5,0.8);
   TextureTex8:SetTexture(Ll.Textures[Ll.TextureKey[50]]);
   TextureText8:SetText(Ll.TexturesName[Ll.TextureKey[50]]);
   FontVtext11:SetText(Ll.FontName[Ll.FontKey[50]]);
   if (Ll.FontOutlineKey[50]==1) then CheckB34:SetChecked(0); else CheckB34:SetChecked(1); end
   if (Ll.TexGradientKey[50]==1) then CheckB35:SetChecked(0); else CheckB35:SetChecked(1); end
   LlEditBox62:SetText(Ll.TexHeight[50]);
   LlEditBox63:SetText(Ll.TexWidth[50]);
   LlEditBox64:SetText(Ll.TexXofs[50]);
   LlEditBox65:SetText(Ll.TexYofs[50]);
   LlEditBox66:SetText(Ll.BarHeight[50]);
   LlEditBox67:SetText(Ll.BarWidth[50]);
   LlEditBox68:SetText(Ll.FontSize[50]);
   LlScale9:SetValue(Ll.Scale[50]);
   ColorButTex64:SetVertexColor(unpack(Ll.Colors[50]));
   ColorButTex65:SetVertexColor(unpack(Ll.Colors[51]));
   ColorButTex66:SetVertexColor(unpack(Ll.Colors[52]));
   ColorButTex67:SetVertexColor(unpack(Ll.Colors[53]));
   ColorButTex68:SetVertexColor(unpack(Ll.Colors[56]));
   ColorButTex69:SetVertexColor(unpack(Ll.Colors[57]));
end
MenuFrame5:SetScript("OnShow",function() Menu5_OnShow(); end);

--OnHide
local function Menu5_OnHide()
   Tab5:SetBackdropColor(0.1,0.1,0.1,0.8);
end
MenuFrame5:SetScript("OnHide",function() Menu5_OnHide(); end);



--------------------------------------------------------------------------------
-------------------------------------------------------------AlteracScore + Mine
CreateBackgroundFrame("MenuFrame%d",6);

CreateTab("Tab%d",6,260,-132,"TabText%d",6,Tabs[60]);
Tab6:SetScript("OnClick",function() for i=0,11 do local parent = "MenuFrame%d";local Parent = _G[parent:format(i)]; Parent:Hide(); end MenuFrame6:Show(); end);

CreateTitle("Title%d",16,"MenuFrame%d",6,15,-15,"Alterac Valley / Score");
CreateTitle("Title%d",17,"MenuFrame%d",6,15,-220,"Alterac Valley / Mine");
CreateTitle("Title%d",18,"MenuFrame%d",6,220,-220,"Mine Colors");

CreateText("Text%d",135,"MenuFrame%d",6,20,-35,"Texture"); 
CreateText("Text%d",136,"MenuFrame%d",6,20,-55,"Tex. Height");
CreateText("Text%d",137,"MenuFrame%d",6,20,-75,"Tex. Width");
CreateText("Text%d",138,"MenuFrame%d",6,20,-95,"Tex. Xofs");
CreateText("Text%d",139,"MenuFrame%d",6,20,-115,"Tex. Yofs");
CreateText("Text%d",140,"MenuFrame%d",6,20,-135,"Bg Height");
CreateText("Text%d",141,"MenuFrame%d",6,20,-155,"Bg Width");
CreateText("Text%d",142,"MenuFrame%d",6,185,-35,"Font");
CreateText("Text%d",143,"MenuFrame%d",6,185,-55,"Font Size");
CreateText("Text%d",144,"MenuFrame%d",6,185,-75,"Outline");
CreateText("Text%d",145,"MenuFrame%d",6,185,-95,"FillBars");
CreateText("Text%d",146,"MenuFrame%d",6,185,-115,"Gradient");
CreateText("Text%d",147,"MenuFrame%d",6,185,-155,"Move Score");
--CreateText("Text%d",148,"MenuFrame%d",6,185,-175,"Reset Score");
CreateText("Text%d",149,"MenuFrame%d",6,20,-245,"Show / Hide Mines");
CreateText("Text%d",150,"MenuFrame%d",6,20,-285,"Texture");
CreateText("Text%d",151,"MenuFrame%d",6,20,-305,"Gradient");
CreateText("Text%d",152,"MenuFrame%d",6,20,-345,"Font");
CreateText("Text%d",153,"MenuFrame%d",6,20,-365,"Font Size");
CreateText("Text%d",154,"MenuFrame%d",6,20,-385,"Outline");

--Outline1
CreateCheckB("CheckB%d",36,"MenuFrame%d",6,295,-70);
CheckB36:SetScript("OnClick",function() if Ll.FontOutlineKey[60]==2 then CheckB36:SetChecked(0);Ll.FontOutlineKey[60]=1; else CheckB36:SetChecked(1);Ll.FontOutlineKey[60]=2; end end);  

--FillBars
CreateCheckB("CheckB%d",37,"MenuFrame%d",6,295,-90);
CheckB37:SetScript("OnClick",function() if (Ll.FillBars[60]==0) then CheckB37:SetChecked(1);Ll.FillBars[60]=1; else CheckB37:SetChecked(0);Ll.FillBars[60]=0; end end);

--Gradient 1
CreateCheckB("CheckB%d",38,"MenuFrame%d",6,295,-110);
CheckB38:SetScript("OnClick",function() if Ll.TexGradientKey[60]==1 then CheckB38:SetChecked(1);Ll.TexGradientKey[60]=2; else CheckB38:SetChecked(0);Ll.TexGradientKey[60]=1; end end);

--Bases
CreateCheckB("CheckB%d",39,"MenuFrame%d",6,160,-240);
CheckB39:SetScript("OnClick",function() if (Ll.ActiveAVM[2]==0) then CheckB39:SetChecked(1);Ll.ActiveAVM[2]=1; else CheckB39:SetChecked(0);Ll.ActiveAVM[2]=0; end end);

--Gradient 2
CreateCheckB("CheckB%d",40,"MenuFrame%d",6,160,-300);
CheckB40:SetScript("OnClick",function() if Ll.TexGradientKey[63]==1 then CheckB40:SetChecked(1);Ll.TexGradientKey[63]=2; else CheckB40:SetChecked(0);Ll.TexGradientKey[63]=1; end end);

--Outline2
CreateCheckB("CheckB%d",41,"MenuFrame%d",6,160,-380);
CheckB41:SetScript("OnClick",function() if Ll.FontOutlineKey[63]==2 then CheckB41:SetChecked(0);Ll.FontOutlineKey[63]=1; else CheckB41:SetChecked(1);Ll.FontOutlineKey[63]=2; end end);

--Texture choice 1
CreateDropDownTexture("Texture%d",9,"TextureTex%d",9,"TextureText%d",9,"DDTex%d",9,"MenuFrame%d",6,90,-35);
local function DDTex9_Load(self,level) TexMenus(self,level,9,60) end
UIDropDownMenu_Initialize(DDTex9,DDTex9_Load,"MENU");
Texture9:SetScript("OnClick",function() Texture_OnClick(9) end);

--Texture choice 2
CreateDropDownTexture("Texture%d",10,"TextureTex%d",10,"TextureText%d",10,"DDTex%d",10,"MenuFrame%d",6,90,-285);
local function DDTex10_Load(self,level) TexMenus(self,level,10,63) end
UIDropDownMenu_Initialize(DDTex10,DDTex10_Load,"MENU");
Texture10:SetScript("OnClick",function() Texture_OnClick(10) end);

--Font choice 1
CreateDropDownFont("FontV%d",12,"FontVtext%d",12,"FontVDD%d",12,"MenuFrame%d",6,230,-35);
local function FontVDD12_Load(self,level) FontsMenus(self,level,12,60) end
UIDropDownMenu_Initialize(FontVDD12,FontVDD12_Load,"MENU");
FontV12:SetScript("OnClick",function() Fonts_OnClick(12) end);

--Font choice 2
CreateDropDownFont("FontV%d",13,"FontVtext%d",13,"FontVDD%d",13,"MenuFrame%d",6,90,-345);
local function FontVDD13_Load(self,level) FontsMenus(self,level,13,63) end
UIDropDownMenu_Initialize(FontVDD13,FontVDD13_Load,"MENU");
FontV13:SetScript("OnClick",function() Fonts_OnClick(13) end);

--Font Size 1
CreateEditBox("LlEditBox%d",69,"MenuFrame%d",6,285,-55);
LlEditBox69:SetScript("OnEnterPressed",function() LlEditBox69:ClearFocus();LlEditBox69:SetAutoFocus(false);Ll.FontSize[60]=LlEditBox69:GetNumber(); end);

--Font Size 2
CreateEditBox("LlEditBox%d",70,"MenuFrame%d",6,145,-365);
LlEditBox70:SetScript("OnEnterPressed",function() LlEditBox70:ClearFocus();LlEditBox70:SetAutoFocus(false);Ll.FontSize[63]=LlEditBox70:GetNumber(); end);

--Tex. Height
CreateEditBox("LlEditBox%d",71,"MenuFrame%d",6,140,-55);
LlEditBox71:SetScript("OnEnterPressed",function() LlEditBox71:ClearFocus();LlEditBox71:SetAutoFocus(false);Ll.TexHeight[60]=LlEditBox71:GetNumber(); end);

--Tex. Width
CreateEditBox("LlEditBox%d",72,"MenuFrame%d",6,140,-75);
LlEditBox72:SetScript("OnEnterPressed",function() LlEditBox72:ClearFocus();LlEditBox72:SetAutoFocus(false);Ll.TexWidth[60]=LlEditBox72:GetNumber(); end);

--Tex. Xofs
CreateEditBox("LlEditBox%d",73,"MenuFrame%d",6,140,-95);
LlEditBox73:SetScript("OnEnterPressed",function() LlEditBox73:ClearFocus();LlEditBox73:SetAutoFocus(false);Ll.TexXofs[60]=LlEditBox73:GetNumber(); end);

--Tex. Yofs
CreateEditBox("LlEditBox%d",74,"MenuFrame%d",6,140,-115);
LlEditBox74:SetScript("OnEnterPressed",function() LlEditBox74:ClearFocus();LlEditBox74:SetAutoFocus(false);Ll.TexYofs[60]=LlEditBox74:GetNumber(); end);

--Bar height
CreateEditBox("LlEditBox%d",75,"MenuFrame%d",6,140,-135);
LlEditBox75:SetScript("OnEnterPressed",function() LlEditBox75:ClearFocus();LlEditBox75:SetAutoFocus(false);Ll.BarHeight[60]=LlEditBox75:GetNumber(); end);

--Bar Width
CreateEditBox("LlEditBox%d",76,"MenuFrame%d",6,140,-155);
LlEditBox76:SetScript("OnEnterPressed",function() LlEditBox76:ClearFocus();LlEditBox76:SetAutoFocus(false);Ll.BarWidth[60]=LlEditBox76:GetNumber(); end);

--Scale 1
CreateScale("LlScale%d",10,"MenuFrame%d",6,50,-190);
LlScale10:SetScript("OnValueChanged",function() Ll.Scale[60]=LlScale10:GetValue(); end);

--Scale 2
CreateScale("LlScale%d",11,"MenuFrame%d",6,50,-420);
LlScale11:SetScript("OnValueChanged",function() Ll.Scale[64]=LlScale11:GetValue(); end);

--Move Score
LlMove("MoveB%d",12,"MenuFrame%d",6,280,-155,"Move",50);
MoveB12:SetScript("OnClick",function() MoveAlterac(); end);

--Move Test Mine
LlMove("MoveB%d",13,"MenuFrame%d",6,225,-320,"Test/Move",70);
MoveB13:SetScript("OnClick",function() TestAVM(); end);

--Move Test All
LlMove("MoveB%d",14,"MenuFrame%d",6,225,-380,"Test/Move All",90);
MoveB14:SetScript("OnClick",function() TestAVM();TestAVT();TestAVG(); end);

--Colors
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",70,"MenuFrame%d",6,60,340,-35,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",71,"MenuFrame%d",6,61,340,-55,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",72,"MenuFrame%d",6,62,340,-75,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",73,"MenuFrame%d",6,63,340,-95,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",74,"MenuFrame%d",6,66,340,-115,"Back.");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",75,"MenuFrame%d",6,67,340,-135,"Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",76,"MenuFrame%d",6,702,225,-245,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",77,"MenuFrame%d",6,703,225,-265,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",78,"MenuFrame%d",6,704,325,-245,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",79,"MenuFrame%d",6,705,325,-265,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",80,"MenuFrame%d",6,706,225,-285,"Neutral 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",81,"MenuFrame%d",6,707,325,-285,"Neutral 2");

--OnShow
local function Menu6_OnShow()
   Tab6:SetBackdropColor(0.3,0.4,0.5,0.8);
   TextureTex9:SetTexture(Ll.Textures[Ll.TextureKey[60]]);
   TextureText9:SetText(Ll.TexturesName[Ll.TextureKey[60]]);
   TextureTex10:SetTexture(Ll.Textures[Ll.TextureKey[63]]);
   TextureText10:SetText(Ll.TexturesName[Ll.TextureKey[63]]);
   FontVtext12:SetText(Ll.FontName[Ll.FontKey[60]]);
   FontVtext13:SetText(Ll.FontName[Ll.FontKey[63]]);  
   if (Ll.FillBars[60]==1) then CheckB37:SetChecked(1); else CheckB37:SetChecked(0); end
   if (Ll.FontOutlineKey[60]==1) then CheckB36:SetChecked(0); else CheckB36:SetChecked(1); end
   if (Ll.TexGradientKey[60]==1) then CheckB38:SetChecked(0); else CheckB38:SetChecked(1); end
   if (Ll.ActiveAVM[2]==1) then CheckB39:SetChecked(1); else CheckB39:SetChecked(0); end
   if (Ll.TexGradientKey[63]==1) then CheckB40:SetChecked(0); else CheckB40:SetChecked(1); end
   if (Ll.FontOutlineKey[63]==1) then CheckB41:SetChecked(0); else CheckB41:SetChecked(1); end    
   LlEditBox69:SetText(Ll.FontSize[60]);
   LlEditBox70:SetText(Ll.FontSize[63]);
   LlEditBox71:SetText(Ll.TexHeight[60]);   
   LlEditBox72:SetText(Ll.TexWidth[60]);
   LlEditBox73:SetText(Ll.TexXofs[60]);
   LlEditBox74:SetText(Ll.TexYofs[60]);
   LlEditBox75:SetText(Ll.BarHeight[60]);
   LlEditBox76:SetText(Ll.BarWidth[60]);
   LlScale10:SetValue(Ll.Scale[60]);
   LlScale11:SetValue(Ll.Scale[64]);   
   ColorButTex70:SetVertexColor(unpack(Ll.Colors[60]));
   ColorButTex71:SetVertexColor(unpack(Ll.Colors[61]));
   ColorButTex72:SetVertexColor(unpack(Ll.Colors[62]));
   ColorButTex73:SetVertexColor(unpack(Ll.Colors[63]));
   ColorButTex74:SetVertexColor(unpack(Ll.Colors[66]));
   ColorButTex75:SetVertexColor(unpack(Ll.Colors[67]));   
   ColorButTex76:SetVertexColor(unpack(Ll.Colors[702]));
   ColorButTex77:SetVertexColor(unpack(Ll.Colors[703]));
   ColorButTex78:SetVertexColor(unpack(Ll.Colors[704]));
   ColorButTex79:SetVertexColor(unpack(Ll.Colors[705]));
   ColorButTex80:SetVertexColor(unpack(Ll.Colors[706]));
   ColorButTex81:SetVertexColor(unpack(Ll.Colors[707]));   
end
MenuFrame6:SetScript("OnShow",function() Menu6_OnShow(); end);

--OnHide
local function Menu6_OnHide()
   Tab6:SetBackdropColor(0.1,0.1,0.1,0.8);
end
MenuFrame6:SetScript("OnHide",function() Menu6_OnHide(); end);


--------------------------------------------------------------------------------
-------------------------------------------------------AlteracTower + Graveyards
CreateBackgroundFrame("MenuFrame%d",7);

CreateTab("Tab%d",7,260,-154,"TabText%d",7,Tabs[61]);
Tab7:SetScript("OnClick",function() for i=0,11 do local parent = "MenuFrame%d";local Parent = _G[parent:format(i)]; Parent:Hide(); end MenuFrame7:Show(); end);

CreateTitle("Title%d",19,"MenuFrame%d",7,15,-15,"Alterac Valley / Towers");
CreateTitle("Title%d",20,"MenuFrame%d",7,15,-240,"Alterac Valley / Graveyards");

CreateText("Text%d",155,"MenuFrame%d",7,20,-35,"Show / Hide Towers");
CreateText("Text%d",156,"MenuFrame%d",7,20,-260,"Show / Hide Graveyards");
CreateText("Text%d",157,"MenuFrame%d",7,20,-55,"Texture");
CreateText("Text%d",158,"MenuFrame%d",7,20,-280,"Texture");
CreateText("Text%d",159,"MenuFrame%d",7,20,-75,"Gradient");
CreateText("Text%d",160,"MenuFrame%d",7,20,-300,"Gradient");
CreateText("Text%d",161,"MenuFrame%d",7,20,-95,"Font");
CreateText("Text%d",162,"MenuFrame%d",7,20,-320,"Font");
CreateText("Text%d",163,"MenuFrame%d",7,20,-115,"Outline");
CreateText("Text%d",164,"MenuFrame%d",7,20,-340,"Outline");
CreateText("Text%d",165,"MenuFrame%d",7,20,-135,"Font Size");
CreateText("Text%d",166,"MenuFrame%d",7,20,-360,"Font Size");
CreateText("Text%d",167,"MenuFrame%d",7,20,-155,"Timer Xofs");
CreateText("Text%d",168,"MenuFrame%d",7,20,-380,"Timer Xofs");
CreateText("Text%d",169,"MenuFrame%d",7,20,-175,"Timer Yofs");
CreateText("Text%d",170,"MenuFrame%d",7,20,-400,"Timer Yofs");
CreateText("Text%d",171,"MenuFrame%d",7,20,-195,"Tex. Height");
CreateText("Text%d",172,"MenuFrame%d",7,20,-420,"Tex. Height");
CreateText("Text%d",173,"MenuFrame%d",7,150,-135,"Bar Xofs");
CreateText("Text%d",174,"MenuFrame%d",7,150,-360,"Bar Xofs");
CreateText("Text%d",175,"MenuFrame%d",7,150,-155,"Bar Yofs");
CreateText("Text%d",176,"MenuFrame%d",7,150,-380,"Bar Yofs");
CreateText("Text%d",177,"MenuFrame%d",7,150,-175,"Txt Xofs");
CreateText("Text%d",178,"MenuFrame%d",7,150,-400,"Txt Xofs"); 
CreateText("Text%d",179,"MenuFrame%d",7,150,-195,"Txt Yofs");
CreateText("Text%d",180,"MenuFrame%d",7,150,-420,"Txt Yofs");
CreateText("Text%d",181,"MenuFrame%d",7,255,-195,"Spacing");
CreateText("Text%d",182,"MenuFrame%d",7,255,-380,"Spacing");
CreateText("Text%d",183,"MenuFrame%d",7,20,-215,"Bar Height");
CreateText("Text%d",184,"MenuFrame%d",7,255,-408,"Bar Height");
CreateText("Text%d",185,"MenuFrame%d",7,150,-215,"Bar Width");
CreateText("Text%d",186,"MenuFrame%d",7,255,-428,"Bar Width");

--Towers
CreateCheckB("CheckB%d",42,"MenuFrame%d",7,180,-30);
CheckB42:SetScript("OnClick",function() if (Ll.ActiveAVT[2]==0) then CheckB42:SetChecked(1);Ll.ActiveAVT[2]=1; else CheckB42:SetChecked(0);Ll.ActiveAVT[2]=0; end end);

--Scale Tower
CreateScale("LlScale%d",12,"MenuFrame%d",7,235,-35);
LlScale12:SetScript("OnValueChanged",function() Ll.Scale[62]=LlScale12:GetValue(); end);

--Move Test Tower
LlMove("MoveB%d",15,"MenuFrame%d",7,345,-35,"Test/Move",70);
MoveB15:SetScript("OnClick",function() TestAVT(); end);

--Only Timer Towers 
LlMove("MoveB%d",18,"MenuFrame%d",7,345,-55,"Only Timer",70);
MoveB18:SetScript("OnClick",function() if (Ll.OnlyTime[60]==0) then Ll.OnlyTime[60]=1; else Ll.OnlyTime[60]=0; end end);

--Gradient T
CreateCheckB("CheckB%d",44,"MenuFrame%d",7,180,-70);
CheckB44:SetScript("OnClick",function() if Ll.TexGradientKey[61]==1 then CheckB44:SetChecked(1);Ll.TexGradientKey[61]=2; else CheckB44:SetChecked(0);Ll.TexGradientKey[61]=1; end end);

--Outline
CreateCheckB("CheckB%d",46,"MenuFrame%d",7,180,-110);
CheckB46:SetScript("OnClick",function() if Ll.FontOutlineKey[61]==2 then CheckB46:SetChecked(0);Ll.FontOutlineKey[61]=1; else CheckB46:SetChecked(1);Ll.FontOutlineKey[61]=2; end end);

--Font Size 
CreateEditBox("LlEditBox%d",77,"MenuFrame%d",7,100,-135);
LlEditBox77:SetScript("OnEnterPressed",function() LlEditBox77:ClearFocus();LlEditBox77:SetAutoFocus(false);Ll.FontSize[61]=LlEditBox77:GetNumber(); end);

--Base Timer xofs
CreateEditBox("LlEditBox%d",79,"MenuFrame%d",7,100,-155);
LlEditBox79:SetScript("OnEnterPressed",function() LlEditBox79:ClearFocus();LlEditBox79:SetAutoFocus(false);Ll.BaseTimeXofs[61]=LlEditBox79:GetNumber(); end);

--Base Timer yofs
CreateEditBox("LlEditBox%d",81,"MenuFrame%d",7,100,-175);
LlEditBox81:SetScript("OnEnterPressed",function() LlEditBox81:ClearFocus();LlEditBox81:SetAutoFocus(false);Ll.BaseTimeYofs[61]=LlEditBox81:GetNumber(); end);

--Tex. Height
CreateEditBox("LlEditBox%d",83,"MenuFrame%d",7,100,-195);
LlEditBox83:SetScript("OnEnterPressed",function() LlEditBox83:ClearFocus();LlEditBox83:SetAutoFocus(false);Ll.TexHeight[61]=LlEditBox83:GetNumber(); end);

--Base Bar xofs
CreateEditBox("LlEditBox%d",85,"MenuFrame%d",7,215,-135);
LlEditBox85:SetScript("OnEnterPressed",function() LlEditBox85:ClearFocus();LlEditBox85:SetAutoFocus(false);Ll.BarsXofs[61]=LlEditBox85:GetNumber(); end);

--Base Bar yofs
CreateEditBox("LlEditBox%d",87,"MenuFrame%d",7,215,-155);
LlEditBox87:SetScript("OnEnterPressed",function() LlEditBox87:ClearFocus();LlEditBox87:SetAutoFocus(false);Ll.BarsYofs[61]=LlEditBox87:GetNumber(); end);

--Base Text xofs
CreateEditBox("LlEditBox%d",89,"MenuFrame%d",7,215,-175);
LlEditBox89:SetScript("OnEnterPressed",function() LlEditBox89:ClearFocus();LlEditBox89:SetAutoFocus(false);Ll.BaseTxtXofs[61]=LlEditBox89:GetNumber(); end);

--Base Text yofs
CreateEditBox("LlEditBox%d",91,"MenuFrame%d",7,215,-195);
LlEditBox91:SetScript("OnEnterPressed",function() LlEditBox91:ClearFocus();LlEditBox91:SetAutoFocus(false);Ll.BaseTxtYofs[61]=LlEditBox91:GetNumber(); end);

--Spacing
CreateEditBox("LlEditBox%d",93,"MenuFrame%d",7,310,-195);
LlEditBox93:SetScript("OnEnterPressed",function() LlEditBox93:ClearFocus();LlEditBox93:SetAutoFocus(false);Ll.BarSpacing[61]=LlEditBox93:GetNumber(); end);

--Bar height
CreateEditBox("LlEditBox%d",95,"MenuFrame%d",7,100,-215);
LlEditBox95:SetScript("OnEnterPressed",function() LlEditBox95:ClearFocus();LlEditBox95:SetAutoFocus(false);Ll.BarHeight[61]=LlEditBox95:GetNumber(); end);

--Bar Width1
CreateEditBox("LlEditBox%d",97,"MenuFrame%d",7,215,-215);
LlEditBox97:SetScript("OnEnterPressed",function() LlEditBox97:ClearFocus();LlEditBox97:SetAutoFocus(false);Ll.BarWidth[61]=LlEditBox97:GetNumber(); end);

--Texture Towers
CreateDropDownTexture("Texture%d",11,"TextureTex%d",11,"TextureText%d",11,"DDTex%d",11,"MenuFrame%d",7,90,-54);
local function DDTex11_Load(self,level) TexMenus(self,level,11,61) end
UIDropDownMenu_Initialize(DDTex11,DDTex11_Load,"MENU");
Texture11:SetScript("OnClick",function() Texture_OnClick(11) end);

--Font choice T
CreateDropDownFont("FontV%d",14,"FontVtext%d",14,"FontVDD%d",14,"MenuFrame%d",7,90,-94);
local function FontVDD14_Load(self,level) FontsMenus(self,level,14,61) end
UIDropDownMenu_Initialize(FontVDD14,FontVDD14_Load,"MENU");
FontV14:SetScript("OnClick",function() Fonts_OnClick(14) end);

--Colors Towers
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",82,"MenuFrame%d",7,602,347,-75,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",83,"MenuFrame%d",7,603,347,-95,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",84,"MenuFrame%d",7,604,347,-115,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",85,"MenuFrame%d",7,605,347,-135,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",86,"MenuFrame%d",7,606,347,-155,"Neutral 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",87,"MenuFrame%d",7,607,347,-175,"Neutral 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",88,"MenuFrame%d",7,608,267,-75,"Bars.Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",89,"MenuFrame%d",7,609,267,-95,"Bars Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",90,"MenuFrame%d",7,600,267,-115,"Base.Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",91,"MenuFrame%d",7,601,267,-135,"Base Border");

--Graveyards
CreateCheckB("CheckB%d",43,"MenuFrame%d",7,180,-255);
CheckB43:SetScript("OnClick",function() if (Ll.ActiveAVG[2]==0) then CheckB43:SetChecked(1);Ll.ActiveAVG[2]=1; else CheckB43:SetChecked(0);Ll.ActiveAVG[2]=0; end end);

--Scale Graveyards
CreateScale("LlScale%d",13,"MenuFrame%d",7,235,-245);
LlScale13:SetScript("OnValueChanged",function() Ll.Scale[63]=LlScale13:GetValue(); end);

--Move Test Graveyards
LlMove("MoveB%d",16,"MenuFrame%d",7,345,-245,"Test/Move",70);
MoveB16:SetScript("OnClick",function() TestAVG(); end);

--Only Timer Graveyards 
LlMove("MoveB%d",17,"MenuFrame%d",7,345,-265,"Only Timer",70);
MoveB17:SetScript("OnClick",function() if (Ll.OnlyTime[61]==0) then Ll.OnlyTime[61]=1; else Ll.OnlyTime[61]=0; end end);

--Gradient G
CreateCheckB("CheckB%d",45,"MenuFrame%d",7,180,-295);
CheckB45:SetScript("OnClick",function() if Ll.TexGradientKey[62]==1 then CheckB45:SetChecked(1);Ll.TexGradientKey[62]=2; else CheckB45:SetChecked(0);Ll.TexGradientKey[62]=1; end end);

--Outline
CreateCheckB("CheckB%d",47,"MenuFrame%d",7,180,-335);
CheckB47:SetScript("OnClick",function() if Ll.FontOutlineKey[62]==2 then CheckB47:SetChecked(0);Ll.FontOutlineKey[62]=1; else CheckB47:SetChecked(1);Ll.FontOutlineKey[62]=2; end end);

--Font Size 
CreateEditBox("LlEditBox%d",78,"MenuFrame%d",7,100,-360);
LlEditBox78:SetScript("OnEnterPressed",function() LlEditBox78:ClearFocus();LlEditBox78:SetAutoFocus(false);Ll.FontSize[62]=LlEditBox78:GetNumber(); end);

--Base Timer xofs
CreateEditBox("LlEditBox%d",80,"MenuFrame%d",7,100,-380);
LlEditBox80:SetScript("OnEnterPressed",function() LlEditBox80:ClearFocus();LlEditBox80:SetAutoFocus(false);Ll.BaseTimeXofs[62]=LlEditBox80:GetNumber(); end);

--Base Timer yofs
CreateEditBox("LlEditBox%d",82,"MenuFrame%d",7,100,-400);
LlEditBox82:SetScript("OnEnterPressed",function() LlEditBox82:ClearFocus();LlEditBox82:SetAutoFocus(false);Ll.BaseTimeYofs[62]=LlEditBox82:GetNumber(); end);

--Tex. Height
CreateEditBox("LlEditBox%d",84,"MenuFrame%d",7,100,-420);
LlEditBox84:SetScript("OnEnterPressed",function() LlEditBox84:ClearFocus();LlEditBox84:SetAutoFocus(false);Ll.TexHeight[62]=LlEditBox84:GetNumber(); end);

--Base Bar xofs
CreateEditBox("LlEditBox%d",86,"MenuFrame%d",7,215,-360);
LlEditBox86:SetScript("OnEnterPressed",function() LlEditBox86:ClearFocus();LlEditBox86:SetAutoFocus(false);Ll.BarsXofs[62]=LlEditBox86:GetNumber(); end);

--Base Bar yofs
CreateEditBox("LlEditBox%d",88,"MenuFrame%d",7,215,-380);
LlEditBox88:SetScript("OnEnterPressed",function() LlEditBox88:ClearFocus();LlEditBox88:SetAutoFocus(false);Ll.BarsYofs[62]=LlEditBox88:GetNumber(); end);

--Base Text xofs
CreateEditBox("LlEditBox%d",90,"MenuFrame%d",7,215,-400);
LlEditBox90:SetScript("OnEnterPressed",function() LlEditBox90:ClearFocus();LlEditBox90:SetAutoFocus(false);Ll.BaseTxtXofs[62]=LlEditBox90:GetNumber(); end);

--Base Text yofs
CreateEditBox("LlEditBox%d",92,"MenuFrame%d",7,215,-420);
LlEditBox92:SetScript("OnEnterPressed",function() LlEditBox92:ClearFocus();LlEditBox92:SetAutoFocus(false);Ll.BaseTxtYofs[62]=LlEditBox92:GetNumber(); end);

--Spacing
CreateEditBox("LlEditBox%d",94,"MenuFrame%d",7,310,-380);
LlEditBox94:SetScript("OnEnterPressed",function() LlEditBox94:ClearFocus();LlEditBox94:SetAutoFocus(false);Ll.BarSpacing[62]=LlEditBox94:GetNumber(); end);

--Bar height
CreateEditBox("LlEditBox%d",96,"MenuFrame%d",7,330,-405);
LlEditBox96:SetScript("OnEnterPressed",function() LlEditBox96:ClearFocus();LlEditBox96:SetAutoFocus(false);Ll.BarHeight[62]=LlEditBox96:GetNumber(); end);

--Bar Width1
CreateEditBox("LlEditBox%d",98,"MenuFrame%d",7,330,-425);
LlEditBox98:SetScript("OnEnterPressed",function() LlEditBox98:ClearFocus();LlEditBox98:SetAutoFocus(false);Ll.BarWidth[62]=LlEditBox98:GetNumber(); end);

--Texture Graveyards
CreateDropDownTexture("Texture%d",12,"TextureTex%d",12,"TextureText%d",12,"DDTex%d",12,"MenuFrame%d",7,90,-280);
local function DDTex12_Load(self,level) TexMenus(self,level,12,62) end
UIDropDownMenu_Initialize(DDTex12,DDTex12_Load,"MENU");
Texture12:SetScript("OnClick",function() Texture_OnClick(12) end);

--Font choice G
CreateDropDownFont("FontV%d",15,"FontVtext%d",15,"FontVDD%d",15,"MenuFrame%d",7,90,-320);
local function FontVDD15_Load(self,level) FontsMenus(self,level,15,62) end
UIDropDownMenu_Initialize(FontVDD15,FontVDD15_Load,"MENU");
FontV15:SetScript("OnClick",function() Fonts_OnClick(15) end);

--Colors Graveyards
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",92,"MenuFrame%d",7,502,347,-285,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",93,"MenuFrame%d",7,503,347,-305,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",94,"MenuFrame%d",7,504,347,-325,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",95,"MenuFrame%d",7,505,347,-345,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",96,"MenuFrame%d",7,506,347,-365,"Neutral 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",97,"MenuFrame%d",7,507,347,-385,"Neutral 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",98,"MenuFrame%d",7,508,267,-285,"Bars.Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",99,"MenuFrame%d",7,509,267,-305,"Bars Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",100,"MenuFrame%d",7,500,267,-325,"Base.Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",101,"MenuFrame%d",7,501,267,-345,"Base Border");

--OnShow
local function Menu7_OnShow()
   Tab7:SetBackdropColor(0.3,0.4,0.5,0.8);
   if (Ll.ActiveAVT[2]==1) then CheckB42:SetChecked(1); else CheckB42:SetChecked(0); end
   if (Ll.ActiveAVG[2]==1) then CheckB43:SetChecked(1); else CheckB43:SetChecked(0); end
   LlScale12:SetValue(Ll.Scale[62]);
   LlScale13:SetValue(Ll.Scale[63]);   
   ColorButTex82:SetVertexColor(unpack(Ll.Colors[602]));
   ColorButTex83:SetVertexColor(unpack(Ll.Colors[603]));
   ColorButTex84:SetVertexColor(unpack(Ll.Colors[604]));
   ColorButTex85:SetVertexColor(unpack(Ll.Colors[605]));
   ColorButTex86:SetVertexColor(unpack(Ll.Colors[606]));
   ColorButTex87:SetVertexColor(unpack(Ll.Colors[607]));   
   ColorButTex88:SetVertexColor(unpack(Ll.Colors[608]));
   ColorButTex89:SetVertexColor(unpack(Ll.Colors[609]));
   ColorButTex90:SetVertexColor(unpack(Ll.Colors[600]));
   ColorButTex91:SetVertexColor(unpack(Ll.Colors[601]));   
   ColorButTex92:SetVertexColor(unpack(Ll.Colors[502]));
   ColorButTex93:SetVertexColor(unpack(Ll.Colors[503]));
   ColorButTex94:SetVertexColor(unpack(Ll.Colors[504]));
   ColorButTex95:SetVertexColor(unpack(Ll.Colors[505]));
   ColorButTex96:SetVertexColor(unpack(Ll.Colors[506]));
   ColorButTex97:SetVertexColor(unpack(Ll.Colors[507]));   
   ColorButTex98:SetVertexColor(unpack(Ll.Colors[508]));
   ColorButTex99:SetVertexColor(unpack(Ll.Colors[509]));
   ColorButTex100:SetVertexColor(unpack(Ll.Colors[500]));
   ColorButTex101:SetVertexColor(unpack(Ll.Colors[501]));   
   TextureTex11:SetTexture(Ll.Textures[Ll.TextureKey[61]]);
   TextureText11:SetText(Ll.TexturesName[Ll.TextureKey[61]]);
   TextureTex12:SetTexture(Ll.Textures[Ll.TextureKey[62]]);
   TextureText12:SetText(Ll.TexturesName[Ll.TextureKey[62]]);
   if (Ll.TexGradientKey[61]==1) then CheckB44:SetChecked(0); else CheckB44:SetChecked(1); end
   if (Ll.TexGradientKey[62]==1) then CheckB45:SetChecked(0); else CheckB45:SetChecked(1); end   
   FontVtext14:SetText(Ll.FontName[Ll.FontKey[61]]);
   FontVtext15:SetText(Ll.FontName[Ll.FontKey[62]]);
   if (Ll.FontOutlineKey[61]==1) then CheckB46:SetChecked(0); else CheckB46:SetChecked(1); end
   if (Ll.FontOutlineKey[62]==1) then CheckB47:SetChecked(0); else CheckB47:SetChecked(1); end
   LlEditBox77:SetText(Ll.FontSize[61]);
   LlEditBox78:SetText(Ll.FontSize[62]);
   LlEditBox79:SetText(Ll.BaseTimeXofs[61]);
   LlEditBox80:SetText(Ll.BaseTimeXofs[62]);
   LlEditBox81:SetText(Ll.BaseTimeYofs[61]);
   LlEditBox82:SetText(Ll.BaseTimeYofs[62]);
   LlEditBox83:SetText(Ll.TexHeight[61]);
   LlEditBox84:SetText(Ll.TexHeight[62]);
   LlEditBox85:SetText(Ll.BarsXofs[61]);
   LlEditBox86:SetText(Ll.BarsXofs[62]);
   LlEditBox87:SetText(Ll.BarsYofs[61]);
   LlEditBox88:SetText(Ll.BarsYofs[62]);
   LlEditBox89:SetText(Ll.BaseTxtXofs[61]);
   LlEditBox90:SetText(Ll.BaseTxtXofs[62]);
   LlEditBox91:SetText(Ll.BaseTxtYofs[61]);
   LlEditBox92:SetText(Ll.BaseTxtYofs[62]);
   LlEditBox93:SetText(Ll.BarSpacing[61]);
   LlEditBox94:SetText(Ll.BarSpacing[62]);
   LlEditBox95:SetText(Ll.BarHeight[61]);
   LlEditBox96:SetText(Ll.BarHeight[62]);
   LlEditBox97:SetText(Ll.BarWidth[61]);
   LlEditBox98:SetText(Ll.BarWidth[62]);  
end
MenuFrame7:SetScript("OnShow",function() Menu7_OnShow(); end);

--OnHide
local function Menu7_OnHide()
   Tab7:SetBackdropColor(0.1,0.1,0.1,0.8);
end
MenuFrame7:SetScript("OnHide",function() Menu7_OnHide(); end);


--------------------------------------------------------------------------------
---------------------------------------------------------------------Wintergrasp
CreateBackgroundFrame("MenuFrame%d",8);

CreateTab("Tab%d",8,260,-176,"TabText%d",8,Tabs[70]);
Tab8:SetScript("OnClick",function() for i=0,11 do local parent = "MenuFrame%d";local Parent = _G[parent:format(i)]; Parent:Hide(); end MenuFrame8:Show(); end);

CreateTitle("Title%d",21,"MenuFrame%d",8,15,-15,"Wintergrasp / Battle in Progress");
CreateTitle("Title%d",22,"MenuFrame%d",8,15,-240,"Wintergrasp / Under Control");
CreateTitle("Title%d",23,"MenuFrame%d",8,15,-400,"Wintergrasp / Next Battle");

CreateText("Text%d",187,"MenuFrame%d",8,20,-35,"Texture");
CreateText("Text%d",188,"MenuFrame%d",8,20,-260,"Texture");
CreateText("Text%d",189,"MenuFrame%d",8,20,-55,"Texture Height");
CreateText("Text%d",190,"MenuFrame%d",8,20,-75,"Texture Width");
CreateText("Text%d",191,"MenuFrame%d",8,20,-95,"Texture Xofs");
CreateText("Text%d",192,"MenuFrame%d",8,20,-115,"Texture Yofs");
CreateText("Text%d",193,"MenuFrame%d",8,20,-135,"Height");
CreateText("Text%d",194,"MenuFrame%d",8,20,-155,"Width");
CreateText("Text%d",195,"MenuFrame%d",8,185,-35,"Font");
CreateText("Text%d",196,"MenuFrame%d",8,185,-55,"Font Size");
CreateText("Text%d",197,"MenuFrame%d",8,185,-75,"Outline");
CreateText("Text%d",198,"MenuFrame%d",8,185,-95,"Gradient");
CreateText("Text%d",199,"MenuFrame%d",8,185,-125,"Move Score");
--CreateText("Text%d",200,"MenuFrame%d",8,185,-145,"Reset Score");
CreateText("Text%d",201,"MenuFrame%d",8,20,-280,"Texture Height");
CreateText("Text%d",202,"MenuFrame%d",8,20,-300,"Texture Width");
CreateText("Text%d",203,"MenuFrame%d",8,185,-260,"Font");
CreateText("Text%d",204,"MenuFrame%d",8,185,-280,"Font Size");
CreateText("Text%d",205,"MenuFrame%d",8,185,-300,"Outline");
CreateText("Text%d",206,"MenuFrame%d",8,185,-320,"Gradient");
CreateText("Text%d",207,"MenuFrame%d",8,185,-350,"Move");
CreateText("Text%d",208,"MenuFrame%d",8,185,-370,"Reset");
CreateText("Text%d",209,"MenuFrame%d",8,195,-400,"On / Off");

--Texture 1
CreateDropDownTexture("Texture%d",13,"TextureTex%d",13,"TextureText%d",13,"DDTex%d",13,"MenuFrame%d",8,90,-35);
local function DDTex13_Load(self,level) TexMenus(self,level,13,90) end
UIDropDownMenu_Initialize(DDTex13,DDTex13_Load,"MENU");
Texture13:SetScript("OnClick",function() Texture_OnClick(13) end);

--Texture 2
CreateDropDownTexture("Texture%d",14,"TextureTex%d",14,"TextureText%d",14,"DDTex%d",14,"MenuFrame%d",8,90,-260);
local function DDTex14_Load(self,level) TexMenus(self,level,14,91) end
UIDropDownMenu_Initialize(DDTex14,DDTex14_Load,"MENU");
Texture14:SetScript("OnClick",function() Texture_OnClick(14) end);

--Font choice 1
CreateDropDownFont("FontV%d",16,"FontVtext%d",16,"FontVDD%d",16,"MenuFrame%d",8,220,-35);
local function FontVDD16_Load(self,level) FontsMenus(self,level,16,90) end
UIDropDownMenu_Initialize(FontVDD16,FontVDD16_Load,"MENU");
FontV16:SetScript("OnClick",function() Fonts_OnClick(16) end);

--Font choice 2
CreateDropDownFont("FontV%d",17,"FontVtext%d",17,"FontVDD%d",17,"MenuFrame%d",8,220,-260);
local function FontVDD17_Load(self,level) FontsMenus(self,level,17,91) end
UIDropDownMenu_Initialize(FontVDD17,FontVDD17_Load,"MENU");
FontV17:SetScript("OnClick",function() Fonts_OnClick(17) end);

--Font Size 1 
CreateEditBox("LlEditBox%d",99,"MenuFrame%d",8,275,-55);
LlEditBox99:SetScript("OnEnterPressed",function() LlEditBox99:ClearFocus();LlEditBox99:SetAutoFocus(false);Ll.FontSize[90]=LlEditBox99:GetNumber(); end);

--Font Size 2 
CreateEditBox("LlEditBox%d",100,"MenuFrame%d",8,275,-280);
LlEditBox100:SetScript("OnEnterPressed",function() LlEditBox100:ClearFocus();LlEditBox100:SetAutoFocus(false);Ll.FontSize[91]=LlEditBox100:GetNumber(); end);

--Tex. Height 1
CreateEditBox("LlEditBox%d",101,"MenuFrame%d",8,145,-55);
LlEditBox101:SetScript("OnEnterPressed",function() LlEditBox101:ClearFocus();LlEditBox101:SetAutoFocus(false);Ll.TexHeight[90]=LlEditBox101:GetNumber(); end);

--Tex. Height 2
CreateEditBox("LlEditBox%d",102,"MenuFrame%d",8,145,-280);
LlEditBox102:SetScript("OnEnterPressed",function() LlEditBox102:ClearFocus();LlEditBox102:SetAutoFocus(false);Ll.TexHeight[91]=LlEditBox102:GetNumber(); end);

--Tex. Width 1
CreateEditBox("LlEditBox%d",103,"MenuFrame%d",8,145,-75);
LlEditBox103:SetScript("OnEnterPressed",function() LlEditBox103:ClearFocus();LlEditBox103:SetAutoFocus(false);Ll.TexWidth[90]=LlEditBox103:GetNumber(); end);

--Tex. Width 2
CreateEditBox("LlEditBox%d",104,"MenuFrame%d",8,145,-300);
LlEditBox104:SetScript("OnEnterPressed",function() LlEditBox104:ClearFocus();LlEditBox104:SetAutoFocus(false);Ll.TexWidth[91]=LlEditBox104:GetNumber(); end);

--Tex. xofs 
CreateEditBox("LlEditBox%d",105,"MenuFrame%d",8,145,-95);
LlEditBox105:SetScript("OnEnterPressed",function() LlEditBox105:ClearFocus();LlEditBox105:SetAutoFocus(false);Ll.TexXofs[90]=LlEditBox105:GetNumber(); end);

--Tex. yofs 
CreateEditBox("LlEditBox%d",106,"MenuFrame%d",8,145,-115);
LlEditBox106:SetScript("OnEnterPressed",function() LlEditBox106:ClearFocus();LlEditBox106:SetAutoFocus(false);Ll.TexYofs[90]=LlEditBox106:GetNumber(); end);

--Bar. Height 
CreateEditBox("LlEditBox%d",107,"MenuFrame%d",8,145,-135);
LlEditBox107:SetScript("OnEnterPressed",function() LlEditBox107:ClearFocus();LlEditBox107:SetAutoFocus(false);Ll.BarHeight[90]=LlEditBox107:GetNumber(); end);

--Bar. Width 
CreateEditBox("LlEditBox%d",108,"MenuFrame%d",8,145,-155);
LlEditBox108:SetScript("OnEnterPressed",function() LlEditBox108:ClearFocus();LlEditBox108:SetAutoFocus(false);Ll.BarWidth[90]=LlEditBox108:GetNumber(); end);

--Outline 1
CreateCheckB("CheckB%d",48,"MenuFrame%d",8,285,-70);
CheckB48:SetScript("OnClick",function() if Ll.FontOutlineKey[90]==2 then CheckB48:SetChecked(0);Ll.FontOutlineKey[90]=1; else CheckB48:SetChecked(1);Ll.FontOutlineKey[90]=2; end end);

--Outline 2
CreateCheckB("CheckB%d",49,"MenuFrame%d",8,285,-295);
CheckB49:SetScript("OnClick",function() if Ll.FontOutlineKey[91]==2 then CheckB49:SetChecked(0);Ll.FontOutlineKey[91]=1; else CheckB49:SetChecked(1);Ll.FontOutlineKey[91]=2; end end);

--Gradient 1
CreateCheckB("CheckB%d",50,"MenuFrame%d",8,285,-90);
CheckB50:SetScript("OnClick",function() if Ll.TexGradientKey[90]==1 then CheckB50:SetChecked(1);Ll.TexGradientKey[90]=2; else CheckB50:SetChecked(0);Ll.TexGradientKey[90]=1; end end);

--Gradient 1
CreateCheckB("CheckB%d",51,"MenuFrame%d",8,285,-315);
CheckB51:SetScript("OnClick",function() if Ll.TexGradientKey[91]==1 then CheckB51:SetChecked(1);Ll.TexGradientKey[91]=2; else CheckB51:SetChecked(0);Ll.TexGradientKey[91]=1; end end);

--Next Battle
CreateCheckB("CheckB%d",52,"MenuFrame%d",8,275,-395);
CheckB52:SetScript("OnClick",function() if Ll.WgWaitTime[1]==1 then CheckB52:SetChecked(0);Ll.WgWaitTime[1]=0; else CheckB52:SetChecked(1);Ll.WgWaitTime[1]=1; end end);

--Move 1
LlMove("MoveB%d",19,"MenuFrame%d",8,265,-124,"Move",50);
MoveB19:SetScript("OnClick",function() MoveWgraspIP(); end);

--Move 2
LlMove("MoveB%d",20,"MenuFrame%d",8,265,-350,"Move",50);
MoveB20:SetScript("OnClick",function() MoveWgraspUC(); end);

--Move 3
LlMove("MoveB%d",21,"MenuFrame%d",8,40,-420,"Move",50);
MoveB21:SetScript("OnClick",function() MoveWgraspNB(); end);

--Scale 1
CreateScale("LlScale%d",14,"MenuFrame%d",8,50,-205);
LlScale14:SetScript("OnValueChanged",function() Ll.Scale[90]=LlScale14:GetValue(); end);

--Scale 2
CreateScale("LlScale%d",15,"MenuFrame%d",8,50,-340);
LlScale15:SetScript("OnValueChanged",function() Ll.Scale[91]=LlScale15:GetValue(); end);

--Scale 3
CreateScale("LlScale%d",16,"MenuFrame%d",8,310,-425);
LlScale16:SetScript("OnValueChanged",function() Ll.Scale[92]=LlScale16:GetValue(); end);

CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",102,"MenuFrame%d",8,90,347,-35,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",103,"MenuFrame%d",8,91,347,-55,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",104,"MenuFrame%d",8,92,347,-75,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",105,"MenuFrame%d",8,93,347,-95,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",106,"MenuFrame%d",8,96,347,-115,"Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",107,"MenuFrame%d",8,97,347,-135,"Bg Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",108,"MenuFrame%d",8,900,347,-260,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",109,"MenuFrame%d",8,901,347,-280,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",110,"MenuFrame%d",8,902,347,-300,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",111,"MenuFrame%d",8,903,347,-320,"Horde 2");


--OnShow
local function Menu8_OnShow()
   Tab8:SetBackdropColor(0.3,0.4,0.5,0.8);
   TextureTex13:SetTexture(Ll.Textures[Ll.TextureKey[90]]);
   TextureText13:SetText(Ll.TexturesName[Ll.TextureKey[90]]);
   TextureTex14:SetTexture(Ll.Textures[Ll.TextureKey[91]]);
   TextureText14:SetText(Ll.TexturesName[Ll.TextureKey[91]]);
   FontVtext16:SetText(Ll.FontName[Ll.FontKey[90]]);
   FontVtext17:SetText(Ll.FontName[Ll.FontKey[91]]);
   LlEditBox99:SetText(Ll.FontSize[90]);
   LlEditBox100:SetText(Ll.FontSize[91]);
   LlEditBox101:SetText(Ll.TexHeight[90]);
   LlEditBox102:SetText(Ll.TexHeight[91]);
   LlEditBox103:SetText(Ll.TexWidth[90]);
   LlEditBox104:SetText(Ll.TexWidth[91]);
   LlEditBox105:SetText(Ll.TexXofs[90]);
   LlEditBox106:SetText(Ll.TexYofs[90]);
   LlEditBox107:SetText(Ll.BarHeight[90]);
   LlEditBox108:SetText(Ll.BarWidth[90]);
   if (Ll.FontOutlineKey[90]==1) then CheckB48:SetChecked(0); else CheckB48:SetChecked(1); end
   if (Ll.FontOutlineKey[91]==1) then CheckB49:SetChecked(0); else CheckB49:SetChecked(1); end
   if (Ll.TexGradientKey[90]==1) then CheckB50:SetChecked(0); else CheckB50:SetChecked(1); end
   if (Ll.TexGradientKey[91]==1) then CheckB51:SetChecked(0); else CheckB51:SetChecked(1); end
   if (Ll.WgWaitTime[1]==1) then CheckB52:SetChecked(1); else CheckB52:SetChecked(0); end
   ColorButTex102:SetVertexColor(unpack(Ll.Colors[90]));
   ColorButTex103:SetVertexColor(unpack(Ll.Colors[91]));
   ColorButTex104:SetVertexColor(unpack(Ll.Colors[92]));
   ColorButTex105:SetVertexColor(unpack(Ll.Colors[93]));   
   ColorButTex106:SetVertexColor(unpack(Ll.Colors[96]));
   ColorButTex107:SetVertexColor(unpack(Ll.Colors[97]));
   ColorButTex108:SetVertexColor(unpack(Ll.Colors[900]));
   ColorButTex109:SetVertexColor(unpack(Ll.Colors[901]));
   ColorButTex110:SetVertexColor(unpack(Ll.Colors[902]));
   ColorButTex111:SetVertexColor(unpack(Ll.Colors[903]));  
   LlScale14:SetValue(Ll.Scale[90]);
   LlScale15:SetValue(Ll.Scale[91]);
   LlScale16:SetValue(Ll.Scale[92]); 
end
MenuFrame8:SetScript("OnShow",function() Menu8_OnShow(); end);

--OnHide
local function Menu8_OnHide()
   Tab8:SetBackdropColor(0.1,0.1,0.1,0.8);
end
MenuFrame8:SetScript("OnHide",function() Menu8_OnHide(); end);

--------------------------------------------------------------------------------
--------------------------------------------------------------Battle for gilneas
CreateBackgroundFrame("MenuFrame%d",9);

CreateTab("Tab%d",9,260,-198,"TabText%d",9,Tabs[90]);
Tab9:SetScript("OnClick",function() for i=0,11 do local parent = "MenuFrame%d";local Parent = _G[parent:format(i)]; Parent:Hide(); end MenuFrame9:Show(); end);

CreateTitle("Title%d",24,"MenuFrame%d",9,15,-15,"Battle for Gilneas / Score");
CreateTitle("Title%d",25,"MenuFrame%d",9,15,-220,"Battle for Gilneas / Timers");

CreateText("Text%d",210,"MenuFrame%d",9,20,-35,"Texture"); 
CreateText("Text%d",211,"MenuFrame%d",9,20,-55,"Tex. Height");
CreateText("Text%d",212,"MenuFrame%d",9,20,-75,"Tex. Width");
CreateText("Text%d",213,"MenuFrame%d",9,20,-95,"Tex. Xofs");
CreateText("Text%d",214,"MenuFrame%d",9,20,-115,"Tex. Yofs");
CreateText("Text%d",215,"MenuFrame%d",9,20,-135,"Bg Height");
CreateText("Text%d",216,"MenuFrame%d",9,20,-155,"Bg Width");
CreateText("Text%d",217,"MenuFrame%d",9,185,-35,"Font");
CreateText("Text%d",218,"MenuFrame%d",9,185,-55,"Font Size");
CreateText("Text%d",219,"MenuFrame%d",9,185,-75,"Outline");
CreateText("Text%d",220,"MenuFrame%d",9,185,-95,"Fill Bars");
CreateText("Text%d",221,"MenuFrame%d",9,185,-115,"Gradient");
CreateText("Text%d",222,"MenuFrame%d",9,185,-155,"Move Score");
--CreateText("Text%d",223,"MenuFrame%d",9,185,-175,"Reset Score");
CreateText("Text%d",224,"MenuFrame%d",9,20,-245,"Show / Hide Icons");
CreateText("Text%d",225,"MenuFrame%d",9,20,-266,"Show / Hide Timers");
CreateText("Text%d",226,"MenuFrame%d",9,190,-225,"Texture Height");
CreateText("Text%d",227,"MenuFrame%d",9,190,-245,"Texture Yofs");                                                 
CreateText("Text%d",228,"MenuFrame%d",9,190,-265,"Bar Height");
CreateText("Text%d",229,"MenuFrame%d",9,190,-285,"Bar Width");
CreateText("Text%d",230,"MenuFrame%d",9,190,-305,"Text Xofs");
CreateText("Text%d",231,"MenuFrame%d",9,190,-325,"Text Yofs");
CreateText("Text%d",232,"MenuFrame%d",9,190,-345,"Bars Xofs");
CreateText("Text%d",233,"MenuFrame%d",9,190,-365,"Bars Yofs");
CreateText("Text%d",234,"MenuFrame%d",9,190,-385,"Spacing");
CreateText("Text%d",235,"MenuFrame%d",9,20,-335,"Texture");
CreateText("Text%d",236,"MenuFrame%d",9,20,-355,"Font");
CreateText("Text%d",237,"MenuFrame%d",9,20,-375,"Font Size");
CreateText("Text%d",238,"MenuFrame%d",9,20,-395,"Outline");
CreateText("Text%d",239,"MenuFrame%d",9,20,-415,"Gradient");
CreateText("Text%d",240,"MenuFrame%d",9,190,-405,"Timer Xofs");
CreateText("Text%d",241,"MenuFrame%d",9,190,-425,"Timer Yofs");
CreateText("Text%d",242,"MenuFrame%d",9,20,-435,"Timers Scale");

--Check Buttons
--Icons
CreateCheckB("CheckB%d",53,"MenuFrame%d",9,150,-240);
CheckB53:SetScript("OnClick",function() if (Ll.ActiveBFG[1]==1) then CheckB53:SetChecked(0);Ll.ActiveBFG[1]=0; else CheckB53:SetChecked(1);Ll.ActiveBFG[1]=1; end end);

--Outline1
CreateCheckB("CheckB%d",54,"MenuFrame%d",9,295,-70);
CheckB54:SetScript("OnClick",function() if Ll.FontOutlineKey[70]==2 then CheckB54:SetChecked(0);Ll.FontOutlineKey[70]=1; else CheckB54:SetChecked(1);Ll.FontOutlineKey[70]=2; end end);  

--Outline2
CreateCheckB("CheckB%d",55,"MenuFrame%d",9,150,-390);
CheckB55:SetScript("OnClick",function() if Ll.FontOutlineKey[71]==2 then CheckB55:SetChecked(0);Ll.FontOutlineKey[71]=1; else CheckB55:SetChecked(1);Ll.FontOutlineKey[71]=2; end end);        

--FillBars
CreateCheckB("CheckB%d",56,"MenuFrame%d",9,295,-90);
CheckB56:SetScript("OnClick",function() if (Ll.FillBars[70]==0) then CheckB56:SetChecked(1);Ll.FillBars[70]=1; else CheckB56:SetChecked(0);Ll.FillBars[70]=0; end end);

--Gradient1
CreateCheckB("CheckB%d",57,"MenuFrame%d",9,295,-110);
CheckB57:SetScript("OnClick",function() if Ll.TexGradientKey[70]==1 then CheckB57:SetChecked(1);Ll.TexGradientKey[70]=2; else CheckB57:SetChecked(0);Ll.TexGradientKey[70]=1; end end);

--Gradient2
CreateCheckB("CheckB%d",58,"MenuFrame%d",9,150,-410);
CheckB58:SetScript("OnClick",function() if Ll.TexGradientKey[71]==1 then CheckB58:SetChecked(1);Ll.TexGradientKey[71]=2; else CheckB58:SetChecked(0);Ll.TexGradientKey[71]=1; end end);

--Timers
CreateCheckB("CheckB%d",59,"MenuFrame%d",9,150,-260);
CheckB59:SetScript("OnClick",function() if (Ll.ActiveBFG[2]==1) then CheckB59:SetChecked(0);Ll.ActiveBFG[2]=0; else CheckB59:SetChecked(1);Ll.ActiveBFG[2]=1; end end);

--Texture choice 1
CreateDropDownTexture("Texture%d",15,"TextureTex%d",15,"TextureText%d",15,"DDTex%d",15,"MenuFrame%d",9,90,-35);
local function DDTex15_Load(self,level) TexMenus(self,level,15,70) end
UIDropDownMenu_Initialize(DDTex15,DDTex15_Load,"MENU");
Texture15:SetScript("OnClick",function() Texture_OnClick(15) end);

--Texture choice 2
CreateDropDownTexture("Texture%d",16,"TextureTex%d",16,"TextureText%d",16,"DDTex%d",16,"MenuFrame%d",9,90,-335);
local function DDTex16_Load(self,level) TexMenus(self,level,16,71) end
UIDropDownMenu_Initialize(DDTex16,DDTex16_Load,"MENU");
Texture16:SetScript("OnClick",function() Texture_OnClick(16) end);

--Font choice1
CreateDropDownFont("FontV%d",18,"FontVtext%d",18,"FontVDD%d",18,"MenuFrame%d",9,230,-35);
local function FontVDD18_Load(self,level) FontsMenus(self,level,18,70) end
UIDropDownMenu_Initialize(FontVDD18,FontVDD18_Load,"MENU");
FontV18:SetScript("OnClick",function() Fonts_OnClick(18) end);

--Font choice2
CreateDropDownFont("FontV%d",19,"FontVtext%d",19,"FontVDD%d",19,"MenuFrame%d",9,90,-355);
local function FontVDD19_Load(self,level) FontsMenus(self,level,19,71) end
UIDropDownMenu_Initialize(FontVDD19,FontVDD19_Load,"MENU");
FontV19:SetScript("OnClick",function() Fonts_OnClick(19) end); 

--Font Size1
CreateEditBox("LlEditBox%d",109,"MenuFrame%d",9,285,-55);
LlEditBox109:SetScript("OnEnterPressed",function() LlEditBox109:ClearFocus();LlEditBox109:SetAutoFocus(false);Ll.FontSize[70]=LlEditBox109:GetNumber(); end);

--Font Size2
CreateEditBox("LlEditBox%d",110,"MenuFrame%d",9,140,-375);
LlEditBox110:SetScript("OnEnterPressed",function() LlEditBox110:ClearFocus();LlEditBox110:SetAutoFocus(false);Ll.FontSize[71]=LlEditBox110:GetNumber(); end);

--Tex. Height1
CreateEditBox("LlEditBox%d",111,"MenuFrame%d",9,140,-55);
LlEditBox111:SetScript("OnEnterPressed",function() LlEditBox111:ClearFocus();LlEditBox111:SetAutoFocus(false);Ll.TexHeight[70]=LlEditBox111:GetNumber(); end);

--Tex. Height2
CreateEditBox("LlEditBox%d",112,"MenuFrame%d",9,285,-224);
LlEditBox112:SetScript("OnEnterPressed",function() LlEditBox112:ClearFocus();LlEditBox112:SetAutoFocus(false);Ll.TexHeight[71]=LlEditBox112:GetNumber(); end);

--Tex. Width
CreateEditBox("LlEditBox%d",113,"MenuFrame%d",9,140,-75);
LlEditBox113:SetScript("OnEnterPressed",function() LlEditBox113:ClearFocus();LlEditBox113:SetAutoFocus(false);Ll.TexWidth[70]=LlEditBox113:GetNumber(); end);

--Tex. Xofs
CreateEditBox("LlEditBox%d",114,"MenuFrame%d",9,140,-95);
LlEditBox114:SetScript("OnEnterPressed",function() LlEditBox114:ClearFocus();LlEditBox114:SetAutoFocus(false);Ll.TexXofs[70]=LlEditBox114:GetNumber(); end);

--Tex. Yofs
CreateEditBox("LlEditBox%d",115,"MenuFrame%d",9,140,-115);
LlEditBox115:SetScript("OnEnterPressed",function() LlEditBox115:ClearFocus();LlEditBox115:SetAutoFocus(false);Ll.TexYofs[70]=LlEditBox115:GetNumber(); end);

--Tex. Yofs2
CreateEditBox("LlEditBox%d",116,"MenuFrame%d",9,285,-244);
LlEditBox116:SetScript("OnEnterPressed",function() LlEditBox116:ClearFocus();LlEditBox116:SetAutoFocus(false);Ll.TexYofs[71]=LlEditBox116:GetNumber(); end);

--Bar height
CreateEditBox("LlEditBox%d",117,"MenuFrame%d",9,140,-135);
LlEditBox117:SetScript("OnEnterPressed",function() LlEditBox117:ClearFocus();LlEditBox117:SetAutoFocus(false);Ll.BarHeight[70]=LlEditBox117:GetNumber(); end);

--Bar height2
CreateEditBox("LlEditBox%d",118,"MenuFrame%d",9,285,-264);
LlEditBox118:SetScript("OnEnterPressed",function() LlEditBox118:ClearFocus();LlEditBox118:SetAutoFocus(false);Ll.BarHeight[71]=LlEditBox118:GetNumber(); end);

--Bar Width1
CreateEditBox("LlEditBox%d",119,"MenuFrame%d",9,140,-155);
LlEditBox119:SetScript("OnEnterPressed",function() LlEditBox119:ClearFocus();LlEditBox119:SetAutoFocus(false);Ll.BarWidth[70]=LlEditBox119:GetNumber(); end);

--Bar Width2
CreateEditBox("LlEditBox%d",120,"MenuFrame%d",9,285,-284);
LlEditBox120:SetScript("OnEnterPressed",function() LlEditBox120:ClearFocus();LlEditBox120:SetAutoFocus(false);Ll.BarWidth[71]=LlEditBox120:GetNumber(); end);

--Base Text xofs
CreateEditBox("LlEditBox%d",121,"MenuFrame%d",9,285,-304);
LlEditBox121:SetScript("OnEnterPressed",function() LlEditBox121:ClearFocus();LlEditBox121:SetAutoFocus(false);Ll.BaseTxtXofs[71]=LlEditBox121:GetNumber(); end);

--Base Text yofs
CreateEditBox("LlEditBox%d",122,"MenuFrame%d",9,285,-324);
LlEditBox122:SetScript("OnEnterPressed",function() LlEditBox122:ClearFocus();LlEditBox122:SetAutoFocus(false);Ll.BaseTxtYofs[71]=LlEditBox122:GetNumber(); end);

--Base Bar xofs
CreateEditBox("LlEditBox%d",123,"MenuFrame%d",9,285,-344);
LlEditBox123:SetScript("OnEnterPressed",function() LlEditBox123:ClearFocus();LlEditBox123:SetAutoFocus(false);Ll.BarsXofs[71]=LlEditBox123:GetNumber(); end);

--Base Bar yofs
CreateEditBox("LlEditBox%d",124,"MenuFrame%d",9,285,-364);
LlEditBox124:SetScript("OnEnterPressed",function() LlEditBox124:ClearFocus();LlEditBox124:SetAutoFocus(false);Ll.BarsYofs[71]=LlEditBox124:GetNumber(); end);

--Spacing
CreateEditBox("LlEditBox%d",125,"MenuFrame%d",9,285,-384);
LlEditBox125:SetScript("OnEnterPressed",function() LlEditBox125:ClearFocus();LlEditBox125:SetAutoFocus(false);Ll.BarSpacing[71]=LlEditBox125:GetNumber(); end);

--Base Timer xofs
CreateEditBox("LlEditBox%d",126,"MenuFrame%d",9,285,-404);
LlEditBox126:SetScript("OnEnterPressed",function() LlEditBox126:ClearFocus();LlEditBox126:SetAutoFocus(false);Ll.BaseTimeXofs[71]=LlEditBox126:GetNumber(); end);

--Base Timer yofs
CreateEditBox("LlEditBox%d",127,"MenuFrame%d",9,285,-424);
LlEditBox127:SetScript("OnEnterPressed",function() LlEditBox127:ClearFocus();LlEditBox127:SetAutoFocus(false);Ll.BaseTimeYofs[71]=LlEditBox127:GetNumber(); end);

--Scale1
CreateScale("LlScale%d",17,"MenuFrame%d",9,50,-190);
LlScale17:SetScript("OnValueChanged",function() Ll.Scale[70]=LlScale17:GetValue(); end);

--Scale3
CreateScale("LlScale%d",18,"MenuFrame%d",9,50,-300);
LlScale18:SetScript("OnValueChanged",function() Ll.Scale[71]=LlScale18:GetValue(); end);

--Scale2
CreateEditBox("LlEditBox%d",128,"MenuFrame%d",9,140,-435);
LlEditBox128:SetScript("OnEnterPressed",function() LlEditBox128:ClearFocus();LlEditBox128:SetAutoFocus(false);Ll.Scale[72]=LlEditBox128:GetNumber(); end);

--Move Score
LlMove("MoveB%d",22,"MenuFrame%d",9,280,-155,"Move",50);
MoveB22:SetScript("OnClick",function() MoveGilneas(); end);

--Test Move Timers
LlMove("MoveB%d",23,"MenuFrame%d",9,340,-435,"Test/Move",70);
MoveB23:SetScript("OnClick",function() TestGilneas(); end);

--Only Timer
LlMove("MoveB%d",24,"MenuFrame%d",9,340,-200,"Only Timer",70);
MoveB24:SetScript("OnClick",function() if (Ll.OnlyTime[71]==0) then Ll.OnlyTime[71]=1; else Ll.OnlyTime[71]=0; end end);

--Colors
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",114,"MenuFrame%d",9,70,340,-35,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",115,"MenuFrame%d",9,71,340,-55,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",116,"MenuFrame%d",9,72,340,-75,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",117,"MenuFrame%d",9,73,340,-95,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",118,"MenuFrame%d",9,76,340,-115,"Back.");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",119,"MenuFrame%d",9,77,340,-135,"Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",120,"MenuFrame%d",9,802,340,-224,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",121,"MenuFrame%d",9,803,340,-244,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",122,"MenuFrame%d",9,804,340,-264,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",123,"MenuFrame%d",9,805,340,-284,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",124,"MenuFrame%d",9,806,340,-304,"Neutral 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",125,"MenuFrame%d",9,807,340,-324,"Neutral 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",126,"MenuFrame%d",9,808,340,-344,"Bars.Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",127,"MenuFrame%d",9,809,340,-364,"Bars Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",128,"MenuFrame%d",9,800,340,-384,"Base.Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",129,"MenuFrame%d",9,801,340,-404,"Base Border");

--OnShow
local function Menu9_OnShow()
   Tab9:SetBackdropColor(0.3,0.4,0.5,0.8);
   if (Ll.ActiveBFG[1]==1) then CheckB53:SetChecked(1); else CheckB53:SetChecked(0); end
   if (Ll.ActiveBFG[2]==1) then CheckB59:SetChecked(1); else CheckB59:SetChecked(0); end
   if (Ll.FontOutlineKey[70]==1) then CheckB54:SetChecked(0); else CheckB54:SetChecked(1); end
   if (Ll.FontOutlineKey[71]==1) then CheckB55:SetChecked(0); else CheckB55:SetChecked(1); end
   if (Ll.FillBars[70]==1) then CheckB56:SetChecked(1); else CheckB56:SetChecked(0); end
   if (Ll.TexGradientKey[70]==1) then CheckB57:SetChecked(0); else CheckB57:SetChecked(1); end
   if (Ll.TexGradientKey[71]==1) then CheckB58:SetChecked(0); else CheckB58:SetChecked(1); end               
   TextureTex15:SetTexture(Ll.Textures[Ll.TextureKey[70]]);
   TextureText15:SetText(Ll.TexturesName[Ll.TextureKey[70]]);
   TextureTex16:SetTexture(Ll.Textures[Ll.TextureKey[71]]);
   TextureText16:SetText(Ll.TexturesName[Ll.TextureKey[71]]);      
   FontVtext18:SetText(Ll.FontName[Ll.FontKey[70]]);
   FontVtext19:SetText(Ll.FontName[Ll.FontKey[71]]);
   LlEditBox109:SetText(Ll.FontSize[70]);
   LlEditBox110:SetText(Ll.FontSize[71]);
   LlEditBox111:SetText(Ll.TexHeight[70]);
   LlEditBox112:SetText(Ll.TexHeight[71]);
   LlEditBox113:SetText(Ll.TexWidth[70]);
   LlEditBox114:SetText(Ll.TexXofs[70]);
   LlEditBox115:SetText(Ll.TexYofs[70]);
   LlEditBox116:SetText(Ll.TexYofs[71]);
   LlEditBox117:SetText(Ll.BarHeight[70]);
   LlEditBox118:SetText(Ll.BarHeight[71]);
   LlEditBox119:SetText(Ll.BarWidth[70]);
   LlEditBox120:SetText(Ll.BarWidth[71]);
   LlEditBox121:SetText(Ll.BaseTxtXofs[71]);
   LlEditBox122:SetText(Ll.BaseTxtYofs[71]);
   LlEditBox123:SetText(Ll.BarsXofs[71]);
   LlEditBox124:SetText(Ll.BarsYofs[71]);
   LlEditBox125:SetText(Ll.BarSpacing[71]);
   LlEditBox126:SetText(Ll.BaseTimeXofs[71]);
   LlEditBox127:SetText(Ll.BaseTimeYofs[71]);  
   LlEditBox128:SetText(Ll.Scale[72]);   
   LlScale17:SetValue(Ll.Scale[70]);
   LlScale18:SetValue(Ll.Scale[71]);     
   ColorButTex114:SetVertexColor(unpack(Ll.Colors[70]));
   ColorButTex115:SetVertexColor(unpack(Ll.Colors[71]));
   ColorButTex116:SetVertexColor(unpack(Ll.Colors[72]));
   ColorButTex117:SetVertexColor(unpack(Ll.Colors[73]));
   ColorButTex118:SetVertexColor(unpack(Ll.Colors[76]));
   ColorButTex119:SetVertexColor(unpack(Ll.Colors[77]));
   ColorButTex120:SetVertexColor(unpack(Ll.Colors[802]));
   ColorButTex121:SetVertexColor(unpack(Ll.Colors[803]));   
   ColorButTex122:SetVertexColor(unpack(Ll.Colors[804]));
   ColorButTex123:SetVertexColor(unpack(Ll.Colors[805]));
   ColorButTex124:SetVertexColor(unpack(Ll.Colors[806]));
   ColorButTex125:SetVertexColor(unpack(Ll.Colors[807]));
   ColorButTex126:SetVertexColor(unpack(Ll.Colors[808]));
   ColorButTex127:SetVertexColor(unpack(Ll.Colors[809]));
   ColorButTex128:SetVertexColor(unpack(Ll.Colors[800]));
   ColorButTex129:SetVertexColor(unpack(Ll.Colors[801]));          
end
MenuFrame9:SetScript("OnShow",function() Menu9_OnShow(); end);

--OnHide
local function Menu9_OnHide()
   Tab9:SetBackdropColor(0.1,0.1,0.1,0.8);
end
MenuFrame9:SetScript("OnHide",function() Menu9_OnHide(); end); 



--------------------------------------------------------------------------------
-----------------------------------------------------------------------Tol Barad
CreateBackgroundFrame("MenuFrame%d",10);

CreateTab("Tab%d",10,260,-220,"TabText%d",10,Tabs[100]);
Tab10:SetScript("OnClick",function() for i=0,11 do local parent = "MenuFrame%d";local Parent = _G[parent:format(i)]; Parent:Hide(); end MenuFrame10:Show(); end);

CreateTitle("Title%d",26,"MenuFrame%d",10,15,-15,"Tol Barad / Battle in Progress");
CreateTitle("Title%d",27,"MenuFrame%d",10,15,-240,"Tol Barad / Under Control");
--CreateTitle("Title%d",28,"MenuFrame%d",10,15,-400,"Tol Barad / Next Battle");

CreateText("Text%d",243,"MenuFrame%d",10,20,-35,"Texture");
CreateText("Text%d",244,"MenuFrame%d",10,20,-260,"Texture");
CreateText("Text%d",245,"MenuFrame%d",10,20,-55,"Texture Height");
CreateText("Text%d",246,"MenuFrame%d",10,20,-75,"Texture Width");
CreateText("Text%d",247,"MenuFrame%d",10,20,-95,"Texture Xofs");
CreateText("Text%d",248,"MenuFrame%d",10,20,-115,"Texture Yofs");
CreateText("Text%d",249,"MenuFrame%d",10,20,-135,"Height");
CreateText("Text%d",250,"MenuFrame%d",10,20,-155,"Width");
CreateText("Text%d",251,"MenuFrame%d",10,185,-35,"Font");
CreateText("Text%d",252,"MenuFrame%d",10,185,-55,"Font Size");
CreateText("Text%d",253,"MenuFrame%d",10,185,-75,"Outline");
CreateText("Text%d",254,"MenuFrame%d",10,185,-95,"Gradient");
CreateText("Text%d",255,"MenuFrame%d",10,185,-125,"Move Score");
--CreateText("Text%d",256,"MenuFrame%d",10,185,-145,"Reset Score");
CreateText("Text%d",257,"MenuFrame%d",10,20,-280,"Texture Height");
CreateText("Text%d",258,"MenuFrame%d",10,20,-300,"Texture Width");
CreateText("Text%d",259,"MenuFrame%d",10,185,-260,"Font");
CreateText("Text%d",260,"MenuFrame%d",10,185,-280,"Font Size");
CreateText("Text%d",261,"MenuFrame%d",10,185,-300,"Outline");
CreateText("Text%d",262,"MenuFrame%d",10,185,-320,"Gradient");
CreateText("Text%d",263,"MenuFrame%d",10,185,-350,"Move");
--CreateText("Text%d",264,"MenuFrame%d",10,185,-370,"Reset");
--CreateText("Text%d",265,"MenuFrame%d",10,195,-400,"On / Off");

--Texture 1
CreateDropDownTexture("Texture%d",17,"TextureTex%d",17,"TextureText%d",17,"DDTex%d",17,"MenuFrame%d",10,90,-35);
local function DDTex17_Load(self,level) TexMenus(self,level,17,100) end
UIDropDownMenu_Initialize(DDTex17,DDTex17_Load,"MENU");
Texture17:SetScript("OnClick",function() Texture_OnClick(17) end);

--Texture 2
CreateDropDownTexture("Texture%d",18,"TextureTex%d",18,"TextureText%d",18,"DDTex%d",18,"MenuFrame%d",10,90,-260);
local function DDTex18_Load(self,level) TexMenus(self,level,18,101) end
UIDropDownMenu_Initialize(DDTex18,DDTex18_Load,"MENU");
Texture18:SetScript("OnClick",function() Texture_OnClick(18) end);

--Font choice 1
CreateDropDownFont("FontV%d",20,"FontVtext%d",20,"FontVDD%d",20,"MenuFrame%d",10,220,-35);
local function FontVDD20_Load(self,level) FontsMenus(self,level,20,100) end
UIDropDownMenu_Initialize(FontVDD20,FontVDD20_Load,"MENU");
FontV20:SetScript("OnClick",function() Fonts_OnClick(20) end);

--Font choice 2
CreateDropDownFont("FontV%d",21,"FontVtext%d",21,"FontVDD%d",21,"MenuFrame%d",10,220,-260);
local function FontVDD21_Load(self,level) FontsMenus(self,level,21,101) end
UIDropDownMenu_Initialize(FontVDD21,FontVDD21_Load,"MENU");
FontV21:SetScript("OnClick",function() Fonts_OnClick(21) end);    

--Font Size 1 
CreateEditBox("LlEditBox%d",129,"MenuFrame%d",10,275,-55);
LlEditBox129:SetScript("OnEnterPressed",function() LlEditBox129:ClearFocus();LlEditBox129:SetAutoFocus(false);Ll.FontSize[100]=LlEditBox129:GetNumber(); end);

--Font Size 2 
CreateEditBox("LlEditBox%d",130,"MenuFrame%d",10,275,-280);
LlEditBox130:SetScript("OnEnterPressed",function() LlEditBox130:ClearFocus();LlEditBox130:SetAutoFocus(false);Ll.FontSize[101]=LlEditBox130:GetNumber(); end);

--Tex. Height 1
CreateEditBox("LlEditBox%d",131,"MenuFrame%d",10,145,-55);
LlEditBox131:SetScript("OnEnterPressed",function() LlEditBox131:ClearFocus();LlEditBox131:SetAutoFocus(false);Ll.TexHeight[100]=LlEditBox131:GetNumber(); end);

--Tex. Height 2
CreateEditBox("LlEditBox%d",132,"MenuFrame%d",10,145,-280);
LlEditBox132:SetScript("OnEnterPressed",function() LlEditBox132:ClearFocus();LlEditBox132:SetAutoFocus(false);Ll.TexHeight[101]=LlEditBox132:GetNumber(); end);

--Tex. Width 1
CreateEditBox("LlEditBox%d",133,"MenuFrame%d",10,145,-75);
LlEditBox133:SetScript("OnEnterPressed",function() LlEditBox133:ClearFocus();LlEditBox133:SetAutoFocus(false);Ll.TexWidth[100]=LlEditBox133:GetNumber(); end);

--Tex. Width 2
CreateEditBox("LlEditBox%d",134,"MenuFrame%d",10,145,-300);
LlEditBox134:SetScript("OnEnterPressed",function() LlEditBox134:ClearFocus();LlEditBox134:SetAutoFocus(false);Ll.TexWidth[101]=LlEditBox134:GetNumber(); end);

--Tex. xofs 
CreateEditBox("LlEditBox%d",135,"MenuFrame%d",10,145,-95);
LlEditBox135:SetScript("OnEnterPressed",function() LlEditBox135:ClearFocus();LlEditBox135:SetAutoFocus(false);Ll.TexXofs[100]=LlEditBox135:GetNumber(); end);

--Tex. yofs 
CreateEditBox("LlEditBox%d",136,"MenuFrame%d",10,145,-115);
LlEditBox136:SetScript("OnEnterPressed",function() LlEditBox136:ClearFocus();LlEditBox136:SetAutoFocus(false);Ll.TexYofs[100]=LlEditBox136:GetNumber(); end);

--Bar. Height 
CreateEditBox("LlEditBox%d",137,"MenuFrame%d",10,145,-135);
LlEditBox137:SetScript("OnEnterPressed",function() LlEditBox137:ClearFocus();LlEditBox137:SetAutoFocus(false);Ll.BarHeight[100]=LlEditBox137:GetNumber(); end);

--Bar. Width 
CreateEditBox("LlEditBox%d",138,"MenuFrame%d",10,145,-155);
LlEditBox138:SetScript("OnEnterPressed",function() LlEditBox138:ClearFocus();LlEditBox138:SetAutoFocus(false);Ll.BarWidth[100]=LlEditBox138:GetNumber(); end);  

--Outline 1
CreateCheckB("CheckB%d",59,"MenuFrame%d",10,285,-70);
CheckB59:SetScript("OnClick",function() if Ll.FontOutlineKey[100]==2 then CheckB59:SetChecked(0);Ll.FontOutlineKey[100]=1; else CheckB59:SetChecked(1);Ll.FontOutlineKey[100]=2; end end);

--Outline 2
CreateCheckB("CheckB%d",60,"MenuFrame%d",10,285,-295);
CheckB60:SetScript("OnClick",function() if Ll.FontOutlineKey[101]==2 then CheckB60:SetChecked(0);Ll.FontOutlineKey[101]=1; else CheckB60:SetChecked(1);Ll.FontOutlineKey[101]=2; end end);

--Gradient 1
CreateCheckB("CheckB%d",61,"MenuFrame%d",10,285,-90);
CheckB61:SetScript("OnClick",function() if Ll.TexGradientKey[100]==1 then CheckB61:SetChecked(1);Ll.TexGradientKey[100]=2; else CheckB61:SetChecked(0);Ll.TexGradientKey[100]=1; end end);

--Gradient 1
CreateCheckB("CheckB%d",62,"MenuFrame%d",10,285,-315);
CheckB62:SetScript("OnClick",function() if Ll.TexGradientKey[101]==1 then CheckB62:SetChecked(1);Ll.TexGradientKey[101]=2; else CheckB62:SetChecked(0);Ll.TexGradientKey[101]=1; end end);

--Next Battle
--CreateCheckB("CheckB%d",63,"MenuFrame%d",10,275,-395);
--CheckB63:SetScript("OnClick",function() if Ll.TBWaitTime[1]==1 then CheckB63:SetChecked(0);Ll.TBWaitTime[1]=0; else CheckB63:SetChecked(1);Ll.TBWaitTime[1]=1; end end);

--Move 1
LlMove("MoveB%d",25,"MenuFrame%d",10,265,-124,"Move",50);
MoveB25:SetScript("OnClick",function() MoveTolBaradIP(); end);

--Move 2
LlMove("MoveB%d",26,"MenuFrame%d",10,265,-350,"Move",50);
MoveB26:SetScript("OnClick",function() MoveTolBaradUC(); end);

--Move 3
--LlMove("MoveB%d",27,"MenuFrame%d",10,40,-420,"Move",50);
--MoveB27:SetScript("OnClick",function()  end);

--Scale 1
CreateScale("LlScale%d",19,"MenuFrame%d",10,50,-205);
LlScale19:SetScript("OnValueChanged",function() Ll.Scale[100]=LlScale19:GetValue(); end);

--Scale 2
CreateScale("LlScale%d",20,"MenuFrame%d",10,50,-340);
LlScale20:SetScript("OnValueChanged",function() Ll.Scale[101]=LlScale20:GetValue(); end);

--Scale 3
--CreateScale("LlScale%d",21,"MenuFrame%d",10,310,-425);
--LlScale21:SetScript("OnValueChanged",function() Ll.Scale[102]=LlScale21:GetValue(); end);

CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",130,"MenuFrame%d",10,100,347,-35,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",131,"MenuFrame%d",10,101,347,-55,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",132,"MenuFrame%d",10,102,347,-75,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",133,"MenuFrame%d",10,103,347,-95,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",134,"MenuFrame%d",10,106,347,-115,"Bg");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",135,"MenuFrame%d",10,107,347,-135,"Bg Border");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",136,"MenuFrame%d",10,1000,347,-260,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",137,"MenuFrame%d",10,1001,347,-280,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",138,"MenuFrame%d",10,1002,347,-300,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",139,"MenuFrame%d",10,1003,347,-320,"Horde 2");

--OnShow
local function Menu10_OnShow()
   Tab10:SetBackdropColor(0.3,0.4,0.5,0.8);
   TextureTex17:SetTexture(Ll.Textures[Ll.TextureKey[100]]);
   TextureText17:SetText(Ll.TexturesName[Ll.TextureKey[100]]);
   TextureTex18:SetTexture(Ll.Textures[Ll.TextureKey[101]]);
   TextureText18:SetText(Ll.TexturesName[Ll.TextureKey[101]]);
   FontVtext20:SetText(Ll.FontName[Ll.FontKey[100]]);
   FontVtext21:SetText(Ll.FontName[Ll.FontKey[101]]);
   LlEditBox129:SetText(Ll.FontSize[100]);
   LlEditBox130:SetText(Ll.FontSize[101]);
   LlEditBox131:SetText(Ll.TexHeight[100]);
   LlEditBox132:SetText(Ll.TexHeight[101]);
   LlEditBox133:SetText(Ll.TexWidth[100]);
   LlEditBox134:SetText(Ll.TexWidth[101]);
   LlEditBox135:SetText(Ll.TexXofs[100]);
   LlEditBox136:SetText(Ll.TexYofs[100]);
   LlEditBox137:SetText(Ll.BarHeight[100]);
   LlEditBox138:SetText(Ll.BarWidth[100]);
   if (Ll.FontOutlineKey[100]==1) then CheckB59:SetChecked(0); else CheckB59:SetChecked(1); end
   if (Ll.FontOutlineKey[101]==1) then CheckB60:SetChecked(0); else CheckB60:SetChecked(1); end
   if (Ll.TexGradientKey[100]==1) then CheckB61:SetChecked(0); else CheckB61:SetChecked(1); end
   if (Ll.TexGradientKey[101]==1) then CheckB62:SetChecked(0); else CheckB62:SetChecked(1); end
   --if (Ll.TBWaitTime[1]==1) then CheckB63:SetChecked(1); else CheckB63:SetChecked(0); end
   ColorButTex130:SetVertexColor(unpack(Ll.Colors[100]));
   ColorButTex131:SetVertexColor(unpack(Ll.Colors[101]));
   ColorButTex132:SetVertexColor(unpack(Ll.Colors[102]));
   ColorButTex133:SetVertexColor(unpack(Ll.Colors[103]));   
   ColorButTex134:SetVertexColor(unpack(Ll.Colors[106]));
   ColorButTex135:SetVertexColor(unpack(Ll.Colors[107]));
   ColorButTex136:SetVertexColor(unpack(Ll.Colors[1000]));
   ColorButTex137:SetVertexColor(unpack(Ll.Colors[1001]));
   ColorButTex138:SetVertexColor(unpack(Ll.Colors[1002]));
   ColorButTex139:SetVertexColor(unpack(Ll.Colors[1003]));  
   LlScale19:SetValue(Ll.Scale[100]);
   LlScale20:SetValue(Ll.Scale[101]);
   --LlScale21:SetValue(Ll.Scale[102]); 
end
MenuFrame10:SetScript("OnShow",function() Menu10_OnShow(); end);

--OnHide
local function Menu10_OnHide()
   Tab10:SetBackdropColor(0.1,0.1,0.1,0.8);
end
MenuFrame10:SetScript("OnHide",function() Menu10_OnHide(); end);



--------------------------------------------------------------------------------
----------------------------------------------------------------------Twin Peaks
CreateBackgroundFrame("MenuFrame%d",11);

CreateTab("Tab%d",11,260,-242,"TabText%d",11,Tabs[80]);
Tab11:SetScript("OnClick",function() for i=0,11 do local parent = "MenuFrame%d";local Parent = _G[parent:format(i)]; Parent:Hide(); end MenuFrame11:Show(); end);

CreateTitle("Title%d",29,"MenuFrame%d",11,15,-15,"Twin Peaks / Score");
CreateTitle("Title%d",30,"MenuFrame%d",11,15,-220,"Twin Peaks / Flags");

CreateText("Text%d",266,"MenuFrame%d",11,20,-35,"Texture"); 
CreateText("Text%d",267,"MenuFrame%d",11,20,-55,"Tex. Height");
CreateText("Text%d",268,"MenuFrame%d",11,20,-75,"Tex. Width");
CreateText("Text%d",269,"MenuFrame%d",11,20,-95,"Tex. Xofs");
CreateText("Text%d",270,"MenuFrame%d",11,20,-115,"Tex. Yofs");
CreateText("Text%d",271,"MenuFrame%d",11,20,-135,"Bg Height");
CreateText("Text%d",272,"MenuFrame%d",11,20,-155,"Bg Width");
CreateText("Text%d",273,"MenuFrame%d",11,185,-35,"Font");
CreateText("Text%d",274,"MenuFrame%d",11,185,-55,"Font Size");
CreateText("Text%d",275,"MenuFrame%d",11,185,-75,"Outline");
CreateText("Text%d",276,"MenuFrame%d",11,185,-95,"Fill Bars");
CreateText("Text%d",277,"MenuFrame%d",11,185,-115,"Gradient");
CreateText("Text%d",278,"MenuFrame%d",11,185,-155,"Move Score");
--CreateText("Text%d",279,"MenuFrame%d",11,185,-175,"Reset Score");
CreateText("Text%d",280,"MenuFrame%d",11,20,-245,"Font");
CreateText("Text%d",281,"MenuFrame%d",11,20,-265,"Font Size");
CreateText("Text%d",282,"MenuFrame%d",11,20,-285,"Outline");

--Outline1
CreateCheckB("CheckB%d",64,"MenuFrame%d",11,295,-70);
CheckB64:SetScript("OnClick",function() if Ll.FontOutlineKey[110]==2 then CheckB64:SetChecked(0);Ll.FontOutlineKey[110]=1; else CheckB64:SetChecked(1);Ll.FontOutlineKey[110]=2; end end);  

--FillBars
CreateCheckB("CheckB%d",65,"MenuFrame%d",11,295,-90);
CheckB65:SetScript("OnClick",function() if (Ll.FillBars[110]==0) then CheckB65:SetChecked(1);Ll.FillBars[110]=1; else CheckB65:SetChecked(0);Ll.FillBars[110]=0; end end);

--Gradient
CreateCheckB("CheckB%d",66,"MenuFrame%d",11,295,-110);
CheckB66:SetScript("OnClick",function() if Ll.TexGradientKey[110]==1 then CheckB66:SetChecked(1);Ll.TexGradientKey[110]=2; else CheckB66:SetChecked(0);Ll.TexGradientKey[110]=1; end end);

--Outline2
CreateCheckB("CheckB%d",67,"MenuFrame%d",11,150,-280);
CheckB67:SetScript("OnClick",function() if Ll.FontOutlineKey[111]==2 then CheckB67:SetChecked(0);Ll.FontOutlineKey[111]=1; else CheckB67:SetChecked(1);Ll.FontOutlineKey[111]=2; end end);

--Texture choice 1
CreateDropDownTexture("Texture%d",19,"TextureTex%d",19,"TextureText%d",19,"DDTex%d",19,"MenuFrame%d",11,90,-35);
local function DDTex19_Load(self,level) TexMenus(self,level,19,110) end
UIDropDownMenu_Initialize(DDTex19,DDTex19_Load,"MENU");
Texture19:SetScript("OnClick",function() Texture_OnClick(19) end);

--Font choice1
CreateDropDownFont("FontV%d",22,"FontVtext%d",22,"FontVDD%d",22,"MenuFrame%d",11,230,-35);
local function FontVDD22_Load(self,level) FontsMenus(self,level,22,110) end
UIDropDownMenu_Initialize(FontVDD22,FontVDD22_Load,"MENU");
FontV22:SetScript("OnClick",function() Fonts_OnClick(22) end);

--Font choice2
CreateDropDownFont("FontV%d",23,"FontVtext%d",23,"FontVDD%d",23,"MenuFrame%d",11,90,-245);
local function FontVDD23_Load(self,level) FontsMenus(self,level,23,111) end
UIDropDownMenu_Initialize(FontVDD23,FontVDD23_Load,"MENU");
FontV23:SetScript("OnClick",function() Fonts_OnClick(23) end);

--Tex. Height1
CreateEditBox("LlEditBox%d",139,"MenuFrame%d",11,140,-55);
LlEditBox139:SetScript("OnEnterPressed",function() LlEditBox139:ClearFocus();LlEditBox139:SetAutoFocus(false);Ll.TexHeight[110]=LlEditBox139:GetNumber(); end);

--Tex. Width
CreateEditBox("LlEditBox%d",140,"MenuFrame%d",11,140,-75);
LlEditBox140:SetScript("OnEnterPressed",function() LlEditBox140:ClearFocus();LlEditBox140:SetAutoFocus(false);Ll.TexWidth[110]=LlEditBox140:GetNumber(); end);

--Tex. Xofs
CreateEditBox("LlEditBox%d",141,"MenuFrame%d",11,140,-95);
LlEditBox141:SetScript("OnEnterPressed",function() LlEditBox141:ClearFocus();LlEditBox141:SetAutoFocus(false);Ll.TexXofs[110]=LlEditBox141:GetNumber(); end);

--Tex. Yofs
CreateEditBox("LlEditBox%d",142,"MenuFrame%d",11,140,-115);
LlEditBox142:SetScript("OnEnterPressed",function() LlEditBox142:ClearFocus();LlEditBox142:SetAutoFocus(false);Ll.TexYofs[110]=LlEditBox142:GetNumber(); end);

--Bar height
CreateEditBox("LlEditBox%d",143,"MenuFrame%d",11,140,-135);
LlEditBox143:SetScript("OnEnterPressed",function() LlEditBox143:ClearFocus();LlEditBox143:SetAutoFocus(false);Ll.BarHeight[110]=LlEditBox143:GetNumber(); end);

--Bar Width
CreateEditBox("LlEditBox%d",144,"MenuFrame%d",11,140,-155);
LlEditBox144:SetScript("OnEnterPressed",function() LlEditBox144:ClearFocus();LlEditBox144:SetAutoFocus(false);Ll.BarWidth[110]=LlEditBox144:GetNumber(); end);

--Font Size1
CreateEditBox("LlEditBox%d",145,"MenuFrame%d",11,285,-55);
LlEditBox145:SetScript("OnEnterPressed",function() LlEditBox145:ClearFocus();LlEditBox145:SetAutoFocus(false);Ll.FontSize[110]=LlEditBox145:GetNumber(); end);

--Font Size2
CreateEditBox("LlEditBox%d",146,"MenuFrame%d",11,140,-265);
LlEditBox146:SetScript("OnEnterPressed",function() LlEditBox146:ClearFocus();LlEditBox146:SetAutoFocus(false);Ll.FontSize[111]=LlEditBox146:GetNumber(); end);

--Scale3
CreateScale("LlScale%d",22,"MenuFrame%d",11,50,-190);
LlScale22:SetScript("OnValueChanged",function() Ll.Scale[110]=LlScale22:GetValue(); end);

--Colors
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",140,"MenuFrame%d",11,80,340,-35,"Alliance 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",141,"MenuFrame%d",11,81,340,-55,"Alliance 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",142,"MenuFrame%d",11,82,340,-75,"Horde 1");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",143,"MenuFrame%d",11,83,340,-95,"Horde 2");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",144,"MenuFrame%d",11,86,340,-115,"Back.");
CreateColorsButton("ColorBut%d","ColorButTex%d","ColorButText%d",145,"MenuFrame%d",11,87,340,-135,"Border");

--Move Score
LlMove("MoveB%d",28,"MenuFrame%d",11,280,-155,"Move",50);
MoveB28:SetScript("OnClick",function() MoveTwinPeaks(); end);

--OnShow
local function Menu11_OnShow()
   Tab11:SetBackdropColor(0.3,0.4,0.5,0.8);
   if (Ll.FontOutlineKey[110]==1) then CheckB64:SetChecked(0); else CheckB64:SetChecked(1); end
   if (Ll.FillBars[110]==1) then CheckB65:SetChecked(1); else CheckB65:SetChecked(0); end
   if (Ll.TexGradientKey[110]==1) then CheckB66:SetChecked(0); else CheckB66:SetChecked(1); end
   if (Ll.FontOutlineKey[111]==1) then CheckB67:SetChecked(0); else CheckB67:SetChecked(1); end
   TextureTex19:SetTexture(Ll.Textures[Ll.TextureKey[110]]);
   TextureText19:SetText(Ll.TexturesName[Ll.TextureKey[110]]);
   FontVtext22:SetText(Ll.FontName[Ll.FontKey[110]]);
   FontVtext23:SetText(Ll.FontName[Ll.FontKey[111]]);
   LlEditBox139:SetText(Ll.TexHeight[110]);
   LlEditBox140:SetText(Ll.TexWidth[110]);
   LlEditBox141:SetText(Ll.TexXofs[110]);
   LlEditBox142:SetText(Ll.TexYofs[110]);
   LlEditBox143:SetText(Ll.BarHeight[110]);
   LlEditBox144:SetText(Ll.BarWidth[110]);
   LlEditBox145:SetText(Ll.FontSize[110]);
   LlEditBox146:SetText(Ll.FontSize[111]);
   LlScale22:SetValue(Ll.Scale[110]);   
   ColorButTex140:SetVertexColor(unpack(Ll.Colors[80]));
   ColorButTex141:SetVertexColor(unpack(Ll.Colors[81]));
   ColorButTex142:SetVertexColor(unpack(Ll.Colors[82]));
   ColorButTex143:SetVertexColor(unpack(Ll.Colors[83]));
   ColorButTex144:SetVertexColor(unpack(Ll.Colors[86]));
   ColorButTex145:SetVertexColor(unpack(Ll.Colors[87]));  
end
MenuFrame11:SetScript("OnShow",function() Menu11_OnShow(); end);

--OnHide
local function Menu11_OnHide()
   Tab11:SetBackdropColor(0.1,0.1,0.1,0.8);
end
MenuFrame11:SetScript("OnHide",function() Menu11_OnHide(); end);


-------------------------------------------------------------------Slider_Update
function MenuTitle:OnUpdate(elapsed)
_G[LlScale0:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale0:GetValue()))));
_G[LlScale1:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale1:GetValue()))));
_G[LlScale2:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale2:GetValue()))));
_G[LlScale3:GetName().."Text"]:SetText(strjoin("","Icon Scale | ",tostring(string.format("%.1f",LlScale3:GetValue()))));   
_G[LlScale4:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale4:GetValue()))));
_G[LlScale5:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale5:GetValue()))));   
_G[LlScale6:GetName().."Text"]:SetText(strjoin("","Icon Scale | ",tostring(string.format("%.1f",LlScale6:GetValue()))));
_G[LlScale7:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale7:GetValue()))));
_G[LlScale8:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale8:GetValue()))));
_G[LlScale9:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale9:GetValue()))));
_G[LlScale10:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale10:GetValue()))));
_G[LlScale11:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale11:GetValue()))));
_G[LlScale12:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale12:GetValue()))));
_G[LlScale13:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale13:GetValue()))));
_G[LlScale14:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale14:GetValue()))));
_G[LlScale15:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale15:GetValue()))));
_G[LlScale16:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale16:GetValue()))));
_G[LlScale17:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale17:GetValue()))));
_G[LlScale18:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale18:GetValue()))));
_G[LlScale19:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale19:GetValue()))));
_G[LlScale20:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale20:GetValue()))));
--_G[LlScale21:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale21:GetValue()))));
_G[LlScale22:GetName().."Text"]:SetText(strjoin("","Scale | ",tostring(string.format("%.1f",LlScale22:GetValue()))));
end
MenuTitle:SetScript("OnUpdate",MenuTitle.OnUpdate);

-------------------------------------------------------------------Slash_command
SLASH_LLP1 = "/llconfig";
function SlashCmdList.LLP()
MenuTitle:Show();
local Z=GetRealZoneText();
if (Z==L["Wintergrasp"]) then
MenuFrame8:Show();
elseif (Z==L["Warsong Gulch"]) then
MenuFrame2:Show();
elseif (Z==L["Arathi Basin"]) then
MenuFrame1:Show();
elseif (Z==L["Alterac Valley"]) then
MenuFrame6:Show();
elseif (Z==L["Eye of the Storm"]) then
MenuFrame4:Show();
elseif (Z==L["Isle of Conquest"]) then
MenuFrame3:Show();
elseif (Z==L["Strand of the Ancients"]) then
MenuFrame5:Show();
elseif (Z==L["Battle for Gilneas"]) then
MenuFrame9:Show();
elseif (Z==L["Twin Peaks"]) then
MenuFrame11:Show();
elseif (Z==L["Tol Barad"]) then
MenuFrame10:Show();
else
MenuFrame0:Show();
end
end
     






