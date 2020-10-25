---------------------------------Francais---------------------------------------
--------------------------------------------------------------------------------
local Language = GetLocale()

if (Language=="frFR") then 

LLPvpState_Locals = {};

LLPvpState_Locals = {

----Global
["Alliance"] = "Alliance",
["Horde"] = "Horde",

----Zone
["Arathi Basin"] = "Bassin Arathi",
["Warsong Gulch"] = "Goulet des Chanteguerres",
["Isle of Conquest"] = "Île des Conquérants",
["Eye of the Storm"] = "L'Œil du cyclone",
["Strand of the Ancients"] = "Rivage des Anciens",
["Alterac Valley"] = "Vallée d'Alterac",
["Battle for Gilneas"] = "La bataille de Gilnéas",
["Twin Peaks"] = "Pics-Jumeaux",
["Wintergrasp"] = "Joug-d'hiver",
["Tol Barad"] = "Tol Barad",
["Tol Barad Peninsula"] = "Péninsule de Tol Barad",
["Hellfire Peninsula"] = "Péninsule des Flammes infernales",
["Terokkar Forest"] = "Forêt de Terokkar",
["Nagrand"] = "Nagrand",
["Eastern Plaguelands"] = "Maleterres de l'est",

----Wintergrasp
["Horde Controlled"] = "Contrôle : Horde",
["Alliance Controlled"] = "Contrôle : Alliance",
["Timer unavailable"] = "indisponible",
["Battle in progress"] = "Bataille en cours",
["Wgrasp FortTower"] = "Tour de la forteresse de Joug-d'hiver",
["Wgrasp FortDoor"] = "Porte de la forteresse de Joug-d'hiver",
["Wgrasp FortWall"] = "Mur de la forteresse de Joug-d'hiver",
["Wgrasp Wall"] = "Mur de Joug-d'hiver",
["Wgrasp FortGate"] = "Portail de la forteresse de Joug-d'hiver",
["GobWorkshop"] = "Atelier gobelin",
["Shadow tower"] = "Tour d'Ombrevue",
["WE tower"] = "Tour Bornehiver",
["FW tower"] = "Tour Guetteflamme",

--STRAND OF ANCIENTS
["Gate Blue"] = "Porte du Saphir bleu",
["Gate Green"] = "Porte de l'Émeraude verte",
["Gate Purple"] = "Porte de l'Améthyste violette",
["Gate Red"] = "Porte du Soleil rouge",
["Gate Yellow"] = "Porte de la Lune jaune", 
["reliq chamber"] = "Chambre des anciennes reliques", 

----Battleground
["Preparation"] = "Préparation",
["Alterac Valley START"] = "La Vallée d'Alterac commence dans :",
["Arathi Basin START"] = "Le Bassin d'Arathi commence dans :",
["Eye of the Storm START"] = "L'Œil du cyclone commence dans :",
["Isle of Conquest START"] = "Île des Conquérants commence dans :",
["Strand of the Ancients START"] = "Le Rivage des Anciens commence dans :",
["Warsong Gulch START"] = "Le Goulet des Chanteguerres commence dans :",
["Gilneas START"] = "La Bataille de Gilnéas commence dans :",
["Twin START"] = "Pic-Jumeaux commence dans :",
["Battle Begins"] = "La Bataille commence dans :",
["1 minute"] = "1 minute",
["60 second"] = "60 second", 
["30 second"] = "30 second",
["15 second"] = "15 second",

----Warsong Gulch
["Alliance take flag"] = "Le drapeau de la Horde a été ramassé par ",
["Horde take flag"] = "Le drapeau de l'Alliance a été ramassé par ",
["Alliance loose flag"] = "Le drapeau de la Horde a été lâché par ",
["Alliance capture"] = "a pris le drapeau de la Horde",
["Alliance return"] = "Le drapeau de l'Alliance a été ramené",
["Horde return"] = "Le drapeau de la Horde a été ramené",
["Horde loose flag"] = "Le drapeau de l'Alliance a été lâché par ",
["Horde capture"] = "a pris le drapeau de l'Alliance",
["Alliance Flag"] = "Drapeau de l'Alliance",
["Horde Flag"] = "Drapeau Chanteguerre",
["Horde Flag 2"] = "Drapeau de la Horde",

----Arathi Basin
["Resources"] = "Ressources",
["stable"] = "écurie",
["stables"] = "écurie",
["farm claimed"] = "a pris la ferme",
["farm assaulted"] = "a attaqué la ferme",
["blacksmith claimed"] = "a pris la forge",
["blacksmith assaulted"] = "a attaqué la forge",
["mine claimed"] = "a pris la mine",
["mine assaulted"] = "a attaqué la mine",
["stables claimed"] = "pris",
["stables assaulted"] = "a attaqué l'écurie",
["lumber mill claimed"] = "a pris la scierie",
["lumber mill assaulted"] = "a attaqué la scierie",
["farm captured"] = "s'est emparée de la ferme", 
["blacksmith captured"] = "s'est emparée de la forge", 
["lumber mill captured"] = "s'est emparée de la scierie", 
["mine captured"] = "s'est emparée de la mine", 
["stables captured"] = "s'est emparée de l'écurie",
["farm"] = "Ferme",
["blacks"] = "Forge",
["lumb"] = "Scierie",
["mine"] = "Mine",
["stableN"] = "Ecurie", 

----Isle Of Conquest
["Reinforcements"] = "Renforts",
["quarry assaulted"] = "a attaqué la carrière",
["hangar assaulted"] = "a attaqué le hangar",
["docks assaulted"] = "a attaqué les docks",
["workshop assaulted"] = "a attaqué l'atelier",
["refinery assaulted"] = "a attaqué la raffinerie",
["horde keep assaulted"] = "a attaqué le donjon de la Horde",
["alliance keep assaulted"] = "a attaqué le donjon de l'Alliance",
["quarry captured"] = "a pris la carrière",
["hangar captured"] = "a pris le hangar",
["docks captured"] = "a pris les docks",
["workshop captured"] = "a pris l'atelier",
["refinery captured"] = "a pris la raffinerie",
["horde keep captured"] = "a pris le donjon de la Horde",
["alliance keep captured"] = "a pris le donjon de l'Alliance",
["alliance gate"] = "du donjon de l'Alliance est détruite",
["horde gate"] = "du donjon de la Horde est détruite",
["quarry"] = "Carrière",
["hangar"] = "Hangar",
["docks"] = "Docks",
["workshop"] = "Atelier",
["refinery"] = "Raffinerie",
["hordekeep"] = "Dongeon Horde",
["alliancekeep"] = "Dongeon Alliance",
["alliancesiege"] = "engin : alliance",
["hordesiege"] = "engin : horde",
["gate"] = "porte",
["SiegeEngine"] = "Engin de siège",
["Alliance Gate"] = "Porte de l'Alliance", 
["Horde Gate"] = "Porte de la Horde",
["horde door down"] = "Porte Horde détruite !",
["alliance door down"] = "Porte Alliance détruite !",

----EyeOfTheStorm
["Victory Points"] = "Points de victoire",
["has taken the flag"] = "a pris le drapeau",
["have captured the flag"] = "s'est emparée du drapeau",
["has been dropped"] = "Le drapeau a été lâché",
["EOTS Flag"] = "Drapeau de Raz",
["draenei captured"] = "a pris le contrôle des Ruines draeneï",
["mage captured"] = "a pris le contrôle de la Tour des mages",
["eds captured"] = "a pris le contrôle de la Tour des elfes de sang",
["felreaver captured"] = "a pris le contrôle des Ruines des saccageurs gangrenés",
["draenei lost"] = "a perdu le contrôle des Ruines draeneï",
["mage lost"] = "a perdu le contrôle de la Tour des mages",
["eds lost"] = "a perdu le contrôle de la Tour des elfes de sang",
["felreaver lost"] = "a perdu le contrôle des Ruines des saccageurs gangrenés",
["Draenei ruins"] = "Ruines draeneï",
["fel reaver"] = "Saccageurs",
["eds"] = "Tour EDS",
["mage"] = "Tour des mages",

----Alterac Valley
["Reinforcements"] = "Renforts",
["herald"] = "Héraut",
["Ndun"] = "Fortin nord DB",
["Sdun"] = "Fortin sud DB",
["icewingt"] = "Aile-de-glace",
["stoneheartht"] = "F. Gîtepierre",
["icebloodt"] = "Tour glace-sang",
["towerpoint"] = "Tour de la halte",
["eastfrost"] = "LDG est",
["westfrost"] = "LDG ouest",
["NDun defended"] = "Le fortin nord de Dun Baldar a été pris",
["NDun assaulted"] = "Le fortin nord de Dun Baldar est attaqué" ,
["NDun destroyed"] = "Le fortin nord de Dun Baldar a été détruit",
["SDun defended"] = "Le fortin sud de Dun Baldar a été pris",
["SDun assaulted"] = "Le fortin sud de Dun Baldar est attaqué",
["SDun destroyed"] = "Le fortin sud de Dun Baldar a été détruit",
["IcewingT defended"] = "Aile de glace a été pris",
["IcewingT assaulted"] = "Aile de glace est attaqué" ,
["IcewingT destroyed"] = "Aile de glace a été détruit",
["StonehearthT defended"] = "fortin de Gîtepierre a été pris",
["StonehearthT assaulted"] = "fortin de Gîtepierre est attaqué" ,
["StonehearthT destroyed"] = "fortin de Gîtepierre a été détruit",
["IcebloodT defended"] = "tour de Glace",
["takenice"] = "prise",
["IcebloodT assaulted"] = "tour de Glace",
["assaultedice"] = "attaquée",
["IcebloodT destroyed"] = "sang a été détruite",
["TowerPoint defended"] = "Tour de la halte a été prise",
["TowerPoint assaulted"] = "Tour de la halte est attaquée",
["TowerPoint destroyed"] = "Tour de la halte a été détruite",
["EastFrostT defended"] = "givre orientale a été prise par la Horde",
["EastFrostT assaulted"] = "givre orientale est attaquée",
["EastFrostT destroyed"] = "givre orientale a été détruite",
["WestFrostT defended"] = "givre occidentale a été prise par la Horde",
["WestFrostT assaulted"] = "givre occidentale est attaquée",
["WestFrostT destroyed"] = "givre occidentale a été détruite",
["Stormpike assaulted"] = "cimetière Foudrepique est attaqué", 
["Stormpike captured"] = "cimetière Foudrepique a été pris",
["stonehearth assaulted"] = "cimetière de Gîtepierre est attaqué",
["stonehearth captured"] = "cimetière de Gîtepierre a été pris",
["tower"] = "tour",
["graveyard"] = "cimetière",
--chat msg bg
["Snowfall assaulted2"] = "a pris le cimetière des neiges",
["Iceblood assaulted"] = "cimetière de Glace",
["Icebloodassault"] = "attaqué",
["Icebloodtaken"] = "a été pris",
["Stormpike Aid Station assaulted"] = "secours Foudrepique est attaqué",
["Stormpike Aid Station captured"] = "secours Foudrepique a été pris",
["Frostwolf assaulted"] = "cimetière Loup",
["FrostwolfRH assaulted"] = "hutte",
["Snowfall assaultedi"] = "cimetière des Neiges",
["Snowfall assaultedj"] = "cimetière des neiges",
["Stormpike Aid Station"] = "PS Foudrepique",
["Stormpike grave"] = "Cim. Foudrepique",
["stonehearth grave"] = "Cim. Gîtepierre",
["Snowfall grave"] = "Cim. des neiges",
["Iceblood grave"] = "Cim. Glace-sang",
["Frostwolf grave"] = "Cim. LDG",
["Frostwolf Relief Hut"] = "Hutte LDG",
["irondeepmine captured"] = "emparée de la mine de Gouffrefer",
["coldtoothmine captured"] = "emparée de la mine de Froide",
["irondeep"] = "Gouffrefer",
["coldtooth"] = "Froide-dent",

----Gilneas
--["Resources"] = "Resources",
["Waterworks"] = "Moulin à eau",
["mines"] = "Mines",
["lighthouse"] = "Phare",
["mines claimed"] = "a pris les mines",
["mines assaulted"] = "a attaqué les mines",
["waterworks claimed"] = "a pris le moulin",
["waterworks assaulted"] = "a attaqué le moulin",
["light claimed"] = "a pris le phare",
["light assaulted"] = "a attaqué le phare",
["mines captured"] = "emparée des mines",
["waterworks captured"] = "emparée du moulin", 
["light captured"] = "emparée du phare", 

----Tol Barad
["Control Alliance"] = "Contrôlé par l'Alliance",
["Control Horde"] = "Contrôlé par la Horde",
["Horde Attack"] = "La Horde attaque",
["Alliance Attack"] = "L'Alliance attaque",
["warden captured"] = "a pris la Veille des Gardiens",
["warden captured2"] = "a pris le contrôle de la Veille",
["warden lost"] = "a perdu le contrôle de la Veille",
["warden lost2"] = "a perdu la Veille",
["slagworks captured"] = "a pris la Forgeresse",
["slagworks captured2"] = "a pris le contrôle de la Forgeresse",
["slagworks lost"] = "a perdu le contrôle de la Forgeresse",
["slagworks lost2"] = "a perdu la Forgeresse",
["ironclad captured"] = "a pris la Garnison",
["ironclad captured2"] = "a pris le contrôle de la Garnison",
["ironclad lost"] = "a perdu le contrôle de la Garnison",
["ironclad lost2"] = "a perdu la Garnison",


----Alliance/Horde
["Alliance"] = "Alliance",   










}; 

end 
