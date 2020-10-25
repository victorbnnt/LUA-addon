LLPvpState_init = {}

local L = LLPvpState_Locals

--------------------------------------------------------------------------------

LLPvpState_init = {

---------------------------------------------------------------------ActiveAddon
Active = {Score = 1,
          Base = 1,
          Addon = 1,
          Timer60 = 1,
          CaptureBar = 1,
          Wall = 1
         },

Test = {Timer60 = 0
       },

AlwaysUp = {[1] = "", [2] = "", [3] = ""},

CaptureBar = {"Interface\\AddOns\\LLPvpState\\Texture\\Arrow.tga"
             },

Icons = {Farm = {"Interface\\AddOns\\LLPvpState\\Texture\\Farm\\Neutral.tga",
                 "Interface\\AddOns\\LLPvpState\\Texture\\Farm\\MAlliance.tga",
                 "Interface\\AddOns\\LLPvpState\\Texture\\Farm\\Alliance.tga",
                 "Interface\\AddOns\\LLPvpState\\Texture\\Farm\\MHorde.tga",
                 "Interface\\AddOns\\LLPvpState\\Texture\\Farm\\Horde.tga"
                },
         Blacksmith = {"Interface\\AddOns\\LLPvpState\\Texture\\BlackSmith\\Neutral.tga",
                       "Interface\\AddOns\\LLPvpState\\Texture\\BlackSmith\\MAlliance.tga",
                       "Interface\\AddOns\\LLPvpState\\Texture\\BlackSmith\\Alliance.tga",
                       "Interface\\AddOns\\LLPvpState\\Texture\\BlackSmith\\MHorde.tga",
                       "Interface\\AddOns\\LLPvpState\\Texture\\BlackSmith\\Horde.tga"
                      },
         Mine = {"Interface\\AddOns\\LLPvpState\\Texture\\Mine\\Neutral.tga",
                 "Interface\\AddOns\\LLPvpState\\Texture\\Mine\\MAlliance.tga",
                 "Interface\\AddOns\\LLPvpState\\Texture\\Mine\\Alliance.tga",
                 "Interface\\AddOns\\LLPvpState\\Texture\\Mine\\MHorde.tga",
                 "Interface\\AddOns\\LLPvpState\\Texture\\Mine\\Horde.tga"
                },
         Stables = {"Interface\\AddOns\\LLPvpState\\Texture\\Stables\\Neutral.tga",
                    "Interface\\AddOns\\LLPvpState\\Texture\\Stables\\MAlliance.tga",
                    "Interface\\AddOns\\LLPvpState\\Texture\\Stables\\Alliance.tga",
                    "Interface\\AddOns\\LLPvpState\\Texture\\Stables\\MHorde.tga",
                    "Interface\\AddOns\\LLPvpState\\Texture\\Stables\\Horde.tga"
                   },
         Lumber = {"Interface\\AddOns\\LLPvpState\\Texture\\LumberMill\\Neutral.tga",
                   "Interface\\AddOns\\LLPvpState\\Texture\\LumberMill\\MAlliance.tga",
                   "Interface\\AddOns\\LLPvpState\\Texture\\LumberMill\\Alliance.tga",
                   "Interface\\AddOns\\LLPvpState\\Texture\\LumberMill\\MHorde.tga",
                   "Interface\\AddOns\\LLPvpState\\Texture\\LumberMill\\Horde.tga"
                  },
         Hangar = {"Interface\\AddOns\\LLPvpState\\Texture\\Hangar\\Neutral.tga",
                   "Interface\\AddOns\\LLPvpState\\Texture\\Hangar\\MAlliance.tga",
                   "Interface\\AddOns\\LLPvpState\\Texture\\Hangar\\Alliance.tga",
                   "Interface\\AddOns\\LLPvpState\\Texture\\Hangar\\MHorde.tga",
                   "Interface\\AddOns\\LLPvpState\\Texture\\Hangar\\Horde.tga"
                  },
         Docks = {"Interface\\AddOns\\LLPvpState\\Texture\\Docks\\Neutral.tga",
                  "Interface\\AddOns\\LLPvpState\\Texture\\Docks\\MAlliance.tga",
                  "Interface\\AddOns\\LLPvpState\\Texture\\Docks\\Alliance.tga",
                  "Interface\\AddOns\\LLPvpState\\Texture\\Docks\\MHorde.tga",
                  "Interface\\AddOns\\LLPvpState\\Texture\\Docks\\Horde.tga"
                 },
         Keep = {"Interface\\AddOns\\LLPvpState\\Texture\\Keep\\MAlliance.tga",
                 "Interface\\AddOns\\LLPvpState\\Texture\\Keep\\Alliance.tga",
                 "Interface\\AddOns\\LLPvpState\\Texture\\Keep\\MHorde.tga",                 
                 "Interface\\AddOns\\LLPvpState\\Texture\\Keep\\Horde.tga"
                },
         Workshop = {"Interface\\AddOns\\LLPvpState\\Texture\\Workshop\\Neutral.tga",
                     "Interface\\AddOns\\LLPvpState\\Texture\\Workshop\\MAlliance.tga",
                     "Interface\\AddOns\\LLPvpState\\Texture\\Workshop\\Alliance.tga",
                     "Interface\\AddOns\\LLPvpState\\Texture\\Workshop\\MHorde.tga",
                     "Interface\\AddOns\\LLPvpState\\Texture\\Workshop\\Horde.tga"
                    },
         Refinery = {"Interface\\AddOns\\LLPvpState\\Texture\\Refinery\\Neutral.tga",
                     "Interface\\AddOns\\LLPvpState\\Texture\\Refinery\\MAlliance.tga",
                     "Interface\\AddOns\\LLPvpState\\Texture\\Refinery\\Alliance.tga",
                     "Interface\\AddOns\\LLPvpState\\Texture\\Refinery\\MHorde.tga",
                     "Interface\\AddOns\\LLPvpState\\Texture\\Refinery\\Horde.tga"
                    },
         Towers = {"Interface\\AddOns\\LLPvpState\\Texture\\Light\\Neutral.tga",
                   "Interface\\AddOns\\LLPvpState\\Texture\\Light\\MAlliance.tga",
                   "Interface\\AddOns\\LLPvpState\\Texture\\Light\\Alliance.tga",
                   "Interface\\AddOns\\LLPvpState\\Texture\\Light\\MHorde.tga",
                   "Interface\\AddOns\\LLPvpState\\Texture\\Light\\Horde.tga"
                  }
        },

Textures = {"Interface\\AddOns\\LLPvpState\\Texture\\Blank.tga",
            "Interface\\AddOns\\LLPvpState\\Texture\\Smooth.tga",              
            "Interface\\AddOns\\LLPvpState\\Texture\\Degre.tga",
            "Interface\\AddOns\\LLPvpState\\Texture\\Healbot.tga"
           },
           
TexturesName = {"Blank",
                "Smooth",
                "Gradient",
                "Healbot"
               },
               
TextureKey = {[1] = 2,
              [10] = 2, [11] = 4, 
              [20] = 2,
              [30] = 2, [31] = 4,
              [40] = 4, [41] = 4,
              [50] = 4,
              [60] = 2, [61] = 4, [62] = 4,  [63] = 4,
              [70] = 2, [71] = 4,
              [80] = 2,
              [90] = 2, [91] = 3,
              [100] = 1, [101] = 3,
              [110] = 2
             },

FillBars = {[10] = 0, 
            [20] = 0,
            [30] = 0,
            [40] = 0,
            [50] = 0,
            [60] = 0,
            [70] = 0,
            [80] = 0,
            [90] = 0,
            [100] = 0,
            [110] = 0
           },

TexGradient = {"HORIZONTAL","VERTICAL"},

TexGradientKey = {[1] = 2,
                  [10] = 1, [11] = 2, 
                  [20] = 1,
                  [30] = 1, [31] = 2,
                  [40] = 1, [41] = 2,
                  [50] = 1,
                  [60] = 1, [61] = 2, [62] = 2, [63] = 2,
                  [70] = 1, [71] = 2, 
                  [80] = 1,
                  [90] = 2, [91] = 1,
                  [100] = 1, [101] = 1,
                  [110] = 1
                 },
               
Edges = {"Interface\\AddOns\\LLPvpState\\Texture\\Border.tga",         
        },

Fonts = {"Interface\\AddOns\\LLPvpState\\Font\\big_noodle_titling.ttf",
         "Interface\\AddOns\\LLPvpState\\Font\\ARIALN.ttf",
         "Interface\\AddOns\\LLPvpState\\Font\\WC_RoughTrad.ttf",
         "Interface\\AddOns\\LLPvpState\\Font\\bsicaunicode.ttf"
        },
         
FontName = {"Big Noodle Titling",
            "Arial",
            "WC RoughTrad",
            "Bsicaunicode"
           },
                       
FontKey = {[1] = 2, [2] = 2,
           [10] = 2, [11] = 2, 
           [20] = 2, [21] = 2,
           [30] = 2, [31] = 2,
           [40] = 2, [41] = 2, [42] = 2,
           [50] = 2,
           [60] = 2, [61] = 2, [62] = 2, [63] = 2,
           [70] = 2, [71] = 2, 
           [80] = 2,
           [90] = 2, [91] = 2,
           [100] = 2, [101] = 2,
           [110] = 2, [111] = 2           
          },
          
FontOutline = {"none",
               "OUTLINE"
              },

FontOutlineKey = {[1] = 2,
                  [10] = 2, [11] = 2, 
                  [20] = 2, [21] = 2,
                  [30] = 2, [31] = 2,
                  [40] = 2, [41] = 2, [42] = 2,
                  [50] = 2,
                  [60] = 2, [61] = 2, [62] = 2, [63] = 2,
                  [70] = 2, [71] = 2, 
                  [80] = 2,
                  [90] = 2, [91] = 2,
                  [100] = 2, [101] = 2,
                  [110] = 2, [111] = 2     
                 },
---------------------------------------------------------------------------Score
FontSize = {[1] = 12,
            [10] = 12, [11] = 12,
            [20] = 12, [21] = 14,
            [30] = 12, [31] = 12,
            [40] = 12, [41] = 12, [42] = 12,
            [50] = 12,
            [60] = 12, [61] = 12, [62] = 12, [63] = 12,
            [70] = 12, [71] = 12,
            [80] = 12,
            [90] = 12, [91] = 12,
            [100] = 12, [101] = 12,
            [110] = 12, [111] = 12
           },
           
TexHeight = {[1] = 9,
             [10] = 6, [11] = 11,             
             [20] = 6,
             [30] = 6, [31] = 11,
             [40] = 6,
             [50] = 7,
             [60] = 8, [61] = 11, [62] = 11,
             [70] = 6, [71] = 11,
             [80] = 8,
             [90] = 11, [91] = 8,
             [100] = 4, [101] = 8,
             [110] = 6
            },
            
TexWidth = {[10] = 96, 
            [20] = 96, [21] = 50, [22] = 50,
            [30] = 96,
            [40] = 96, [41] = 60,
            [50] = 100,
            [60] = 96, [61] = 60,
            [70] = 96,
            [80] = 131,
            [90] = 131, [91] = 131,
            [100] = 131, [101] = 131,
            [110] = 96, [111] = 50, [112] = 50
           },
           
TexXofs = {[10] = 2,  
           [20] = 2,
           [30] = 2, 
           [40] = 2,
           [50] = 0,
           [60] = 2,
           [70] = 0,
           [80] = 0,
           [90] = 0,
           [100] = 0,
           [110] = 2
          },
            
TexYofs = {[1] = 0,
           [10] = 0, [11] = 0, 
           [20] = 0,
           [30] = 0, [31] = 0,
           [40] = 0,
           [50] = 0,
           [60] = 0, [61] = 0, [62] = 0,
           [70] = 0, [71] = 0,
           [80] = 0,
           [90] = 0,
           [100] = 0,
           [110] = 0
          },

BarHeight = {[1] = 12,
             [10] = 10, [11]=15, 
             [20] = 10,
             [30] = 10, [31]=15,
             [40] = 10,
             [50] = 11,
             [60] = 12, [61]=15, [62]=15,
             [70] = 10, [71]=15,
             [80] = 12,
             [90] = 15,
             [100] = 12,
             [110] = 10, [111]=15
            },
            
BarWidth = {[1] = 150,
            [10] = 100, [11]=135, 
            [20] = 100,
            [30] = 100, [31]=170,
            [40] = 100,
            [50] = 104,
            [60] = 100, [61]=170, [62]=170,
            [70] = 100, [71]=135, 
            [80] = 131,
            [90] = 135,
            [100] = 131,
            [110] = 100, [111]=135 
           },

Scale = {[1] = 1, [2] = 1,
         [10] = 1, [11] = 1, [12] = 1, 
         [20] = 1,
         [30] = 1, [31] = 1, [32] = 1,
         [40] = 1, [41] = 1, [42] = 1,
         [50] = 1,
         [60] = 1, [61] = 1, [62] = 1, [63] = 1, [64] = 1,
         [70] = 1, [71] = 1, [72] = 1,
         [80] = 1,
         [90] = 1, [91] = 1, [92] = 1,
         [100] = 1, [101] = 1, [102] = 1,
         [110] = 1, [111] = 1, [112] = 1    
        },
        
BaseTxtXofs = {[11] = 2,
               [31] = 2,
               [61] = 2, [62] = 2,
               [71] = 2
              },
              
BaseTxtYofs = {[11] = 0,
               [31] = 0,
               [61] = 2, [62] = 2,
               [71] = 0
              },
              
BarsXofs = {[11] = -3,
            [31] = -3,
            [61] = -3, [62] = -3,
            [71] = -3
           },
           
BarsYofs = {[11] = 0,
            [31] = 0,
            [61] = 0,  [62] = 0,
            [71] = 0
           },
           
BarSpacing = {[11] = 3,
              [31] = 3,
              [61] = 3, [62] = 3,
              [71] = 3
             },

BaseTimeXofs = {[11] = 0,
                [31] = 0,
                [61] = 0, [62] = 0,
                [71] = 0
               },

BaseTimeYofs = {[11] = 0,
                [31] = 0,
                [61] = 0, [62] = 0,
                [71] = 0
               },

--------------------------------------------------------------------------Timers
TimerPos = {3,21,39,57,75,93,111,129},

BGtimer = {-1},

BGab = {Time = {-1,-1,-1,-1,-1},
        Color = {1,1,1,1,0},
        State = {3,3,3,3,3}
       },
       
BGbfg = {Time = {-1,-1,-1},
         Color = {1,1,1},
         State = {3,3,3}
        },

BGioc = {Time = {-1,-1,-1,-1,-1,-1,-1,-1},
         Color = {0,0,0,0,0,0,0,0},
         State = {3,3,3,3,3,3,2,1}
        },
        
BGeots = {State = {2,2,2,2}
        },

BGavt = {Time = {-1,-1,-1,-1,-1,-1,-1,-1},
         Color = {0,0,0,0,0,0,0,0},
         State = {3,3,3,3,3,3,3,3}
        },
        
BGavg = {Time = {-1,-1,-1,-1,-1,-1,-1},
         Color = {0,0,0,0,0,0,0},
         State = {0,0,0,2,1,1,1}
        },

BGavm = {State = {0,0}
        },                 
               
---------------------------------------------------------------------ActiveOrNot
ActiveAB = {1,1,1},
ActiveIOC = {1,1,1},
ActiveAVT = {1,1,1},
ActiveEOTS = {1,1,1},
ActiveAVG = {1,1,1},
ActiveAVM = {1,1,1},
ActiveBFG = {1,1,1},

------------------------------------------------------------------------TestMode
TestMode = {[11] = 0,
            [31] = 0,
            [41] = 0,
            [61] = 0, [62] = 0, [63] = 0,
            [71] = 0
           },
           
---------------------------------------------------------------------ArathiBasin
ABBars = {nil,nil,nil,nil,nil},
IOCBars = {nil,nil,nil,nil,nil,nil,nil,nil},
AVTBars = {nil,nil,nil,nil,nil,nil,nil,nil},
AVGBars = {nil,nil,nil,nil,nil,nil,nil},
BfGBars = {nil,nil,nil},

--------------------------------------------------------------------FlagCarriers
CarrierName = {nil,nil},
TPCarrier = {nil,nil},
EotsCarrier = {nil},
CarrierHealth = {"","",""}, 

---------------------------------------------------------------------------Other
WgWaitTime = {0},

TBWaitTime = {0},

Door = {0},

OnlyTime = {[11]=0,
            [31]=0,
            [60]=0, [61]=0,
            [70]=0, [71]=0
           }, 
                   
FramePos = {[1]  = {"TOP","UIParent","TOP",0,-300},  [2]  = {"CENTER","Frame01","CENTER",0,45},
                                                     [3]  = {"CENTER","Frame01","CENTER",0,60},
                                                     [4]  = {"CENTER","Frame01","CENTER",0,30},
                                                     [5]  = {"TOP","UIParent","TOP",0,-30},
            [10] = {"TOP","UIParent","TOP",0,-5},  [11] = {"CENTER","Frame010","CENTER",-60,11}, 
                                                   [12] = {"CENTER","Frame010","CENTER",60,11}, 
                                                   [13] = {"CENTER","Frame010","CENTER",-115,20},
                                                   [14] = {"CENTER","Frame010","CENTER",-15,20},
                                                   [15] = {"CENTER","Frame010","CENTER",115,20},
                                                   [16] = {"CENTER","Frame010","CENTER",15,20},
                                                   [17] = {"CENTER","Frame010","CENTER",0,-20},
                                                   [18] = {"RIGHT","UIParent","RIGHT",-20,0},                                                 
            [20] = {"TOP","UIParent","TOP",0,-25}, [21] = {"CENTER","Frame020","CENTER",0,11},
                                                   [22] = {"CENTER","Frame020","CENTER",25,-5},
                                                   [23] = {"CENTER","Frame020","CENTER",0,-30},
                                                   [24] = {"CENTER","Frame020","CENTER",40,17},
                                                   [25] = {"CENTER","Frame020","CENTER",63,0},
                                                   [26] = {"CENTER","Frame020","CENTER",-100,11},
                                                   [27] = {"CENTER","Frame020","CENTER",-100,-11},
                                                   [28] = {"CENTER","Frame020","CENTER",-180,11},
                                                   [29] = {"CENTER","Frame020","CENTER",-180,-11},
            [30] = {"TOP","UIParent","TOP",0,-5},  [31] = {"CENTER","Frame030","CENTER",-60,11},
                                                   [32] = {"CENTER","Frame030","CENTER",60,11},
                                                   [33] = {"CENTER","Frame030","CENTER",-115,20},
                                                   [34] = {"CENTER","Frame030","CENTER",115,20},
                                                   [35] = {"CENTER","Frame030","CENTER",0,-20},
                                                   [36] = {"RIGHT","UIParent","RIGHT",-20,0},
            [40] = {"TOP","UIParent","TOP",0,-5},  [41] = {"CENTER","Frame040","CENTER",-60,11},
                                                   [42] = {"CENTER","Frame040","CENTER",60,11},
                                                   [43] = {"CENTER","Frame040","CENTER",-115,20},
                                                   [44] = {"CENTER","Frame040","CENTER",-15,20},
                                                   [45] = {"CENTER","Frame040","CENTER",115,20},
                                                   [46] = {"CENTER","Frame040","CENTER",15,20},
                                                   [47] = {"CENTER","Frame040","CENTER",18,-30},
                                                   [48] = {"CENTER","Frame040","CENTER",-40,-30},
                                                   [49] = {"RIGHT","UIParent","RIGHT",-20,0},                
            [50] = {"TOP","UIParent","TOP",0,-25}, [51] = {"CENTER","Frame050","CENTER",0,9},
                                                   [52] = {"CENTER","Frame050","CENTER",0,-6},
                                                   [53] = {"CENTER","Frame050","CENTER",0,14},
                                                   [54] = {"CENTER","Frame050","CENTER",0,-11},
                                                   [55] = {"CENTER","Frame050","CENTER",0,-25},
            [60] = {"TOP","UIParent","TOP",0,-25}, [61] = {"CENTER","Frame060","CENTER",0,11},
                                                   [62] = {"CENTER","Frame060","CENTER",0,-11},
                                                   [63] = {"CENTER","Frame060","CENTER",100,11},
                                                   [64] = {"CENTER","Frame060","CENTER",100,-11},
                                                   [65] = {"RIGHT","UIParent","RIGHT",-20,50},
                                                   [66] = {"RIGHT","UIParent","RIGHT",-20,-100},
                                                   [67] = {"RIGHT","UIParent","RIGHT",-20,-170},
            [70] = {"TOP","UIParent","TOP",0,-5},  [71] = {"CENTER","Frame070","CENTER",-60,11}, 
                                                   [72] = {"CENTER","Frame070","CENTER",60,11}, 
                                                   [73] = {"CENTER","Frame070","CENTER",-115,20},
                                                   [74] = {"CENTER","Frame070","CENTER",-15,20},
                                                   [75] = {"CENTER","Frame070","CENTER",115,20},
                                                   [76] = {"CENTER","Frame070","CENTER",15,20},
                                                   [77] = {"CENTER","Frame070","CENTER",0,-20},
                                                   [78] = {"RIGHT","UIParent","RIGHT",-20,0},         
            [80] = {"TOP","UIParent","TOP",0,-25},
      --Wgrasp
            [90] = {"TOP","UIParent","TOP",0,-5}, [91] = {"CENTER","Frame090","CENTER",80,11},
                                                   [92] = {"CENTER","Frame090","CENTER",-80,11},
                                                   [93] = {"CENTER","Frame090","CENTER",0,-30},
      --Wgrasp UC
            [900] = {"TOP","UIParent","TOP",0,-25}, [901] = {"CENTER","Frame0900","CENTER",0,11},
                                                    [902] = {"CENTER","Frame0900","CENTER",0,-11},
      --Wgrasp Timer                                             
            [950] = {"TOP","UIParent","TOP",400,-5},
      --Tol Barad                                            
            [100] = {"TOP","UIParent","TOP",0,-35}, [101] = {"CENTER","Frame0100","CENTER",0,0},
                                                    [102] = {"CENTER","Frame0100","CENTER",35,-40}, 
                                                    [103] = {"CENTER","Frame0100","CENTER",0,-22},
                                                    [104] = {"CENTER","Frame0100","CENTER",0,-40},
            [110] = {"TOP","UIParent","TOP",0,-25}, [111] = {"CENTER","Frame0110","CENTER",0,11},
                                                    [112] = {"CENTER","Frame0110","CENTER",25,-5},
                                                    [113] = {"CENTER","Frame0110","CENTER",0,-30},
                                                    [114] = {"CENTER","Frame0110","CENTER",40,17},
                                                    [115] = {"CENTER","Frame0110","CENTER",63,0},
                                                    [116] = {"CENTER","Frame0110","CENTER",-100,11},
                                                    [117] = {"CENTER","Frame0110","CENTER",-100,-11},
                                                    [118] = {"CENTER","Frame0110","CENTER",-180,11},
                                                    [119] = {"CENTER","Frame0110","CENTER",-180,-11},
      --Tol Barad UC
            [1000] = {"TOP","UIParent","TOP",0,-25}, [1001] = {"CENTER","Frame01000","CENTER",0,11},
                                                     [1002] = {"CENTER","Frame01000","CENTER",0,-11}
           },
                            
--------------------------------------------------------------------------Colors
Colors = {
    ---Timer Color
          [1] = {0.12156,0.38823,0.58039,1},  [2]  = {0.58823,0.717647,1,1},
    ---Timer Bg Color
          [3] = {0.1,0.1,0.1,0.5},  [4]  = {0.733333,0.733333,0.733333,1},
    ---Alliance Color 1 / 2         
          [10] = {51/255,102/255,204/255,0.7}, [11] = {82/255,100/255,139/255,0.7},
          [20] = {51/255,102/255,204/255,0.7}, [21] = {82/255,100/255,139/255,0.7},
          [30] = {51/255,102/255,204/255,0.7}, [31] = {82/255,100/255,139/255,0.7},
          [40] = {51/255,102/255,204/255,0.7}, [41] = {82/255,100/255,139/255,0.7},
          [50] = {51/255,102/255,204/255,0.7}, [51] = {82/255,100/255,139/255,0.7},
          [60] = {51/255,102/255,204/255,0.7}, [61] = {82/255,100/255,139/255,0.7},
          [70] = {51/255,102/255,204/255,0.7}, [71] = {82/255,100/255,139/255,0.7},
          [80] = {51/255,102/255,204/255,0.7}, [81] = {82/255,100/255,139/255,0.7},
          [90] = {51/255,102/255,204/255,0.7}, [91] = {150/255,183/255,255/255,0.7},
          [900] = {51/255,102/255,204/255,0.7}, [901] = {82/255,100/255,139/255,0.7},
          [100] = {51/255,102/255,204/255,0.7}, [101] = {82/255,100/255,139/255,0.7},
          [1000] = {51/255,102/255,204/255,0.7}, [1001] = {82/255,100/255,139/255,0.7}, 
          
    ---Horde Color 1 / 2              
          [12] = {204/255,0,0,0.9}, [13] = {205/255,91/255,69/255,0.9},
          [22] = {204/255,0,0,0.9}, [23] = {205/255,91/255,69/255,0.9},
          [32] = {204/255,0,0,0.9}, [33] = {205/255,91/255,69/255,0.9},
          [42] = {204/255,0,0,0.9}, [43] = {205/255,91/255,69/255,0.9},
          [52] = {204/255,0,0,0.9}, [53] = {205/255,91/255,69/255,0.9},
          [62] = {204/255,0,0,0.9}, [63] = {205/255,91/255,69/255,0.9},
          [72] = {204/255,0,0,0.9}, [73] = {205/255,91/255,69/255,0.9},
          [82] = {204/255,0,0,0.9}, [83] = {205/255,91/255,69/255,0.9},
          [92] = {204/255,0,0,0.9}, [93] = {157/255,36/255,30/255,0.9},
          [902] = {204/255,0,0,0.9}, [903] = {204/255,91/255,69/255,0.9},
          [102] = {204/255,0,0,0.9}, [103] = {205/255,91/255,69/255,0.9},
          [1002] = {204/255,0,0,0.9}, [1003] = {205/255,91/255,69/255,0.9}, 
          
    ---Neutral Color 1 / 2              
          [14] = {193/255,193/255,193/255,0.7}, [15] = {132/255,132/255,132/255,0.7},
          [24] = {193/255,193/255,193/255,0.7}, [25] = {132/255,132/255,132/255,0.7},
          [34] = {193/255,193/255,193/255,0.7}, [35] = {132/255,132/255,132/255,0.7},
          [44] = {193/255,193/255,193/255,0.7}, [45] = {132/255,132/255,132/255,0.7},
          [54] = {193/255,193/255,193/255,0.7}, [55] = {132/255,132/255,132/255,0.7},
          [64] = {193/255,193/255,193/255,0.7}, [65] = {132/255,132/255,132/255,0.7},
          [74] = {193/255,193/255,193/255,0.7}, [75] = {132/255,132/255,132/255,0.7},
          [84] = {193/255,193/255,193/255,0.7}, [85] = {132/255,132/255,132/255,0.7},
          [94] = {193/255,193/255,193/255,0.7}, [95] = {132/255,132/255,132/255,0.7},
          [104] = {193/255,193/255,193/255,0.7}, [105] = {132/255,132/255,132/255,0.7},
          
    ---Backdrop / Border Color        
          [16] = {0.1,0.1,0.1,0.5}, [17] = {0.733333,0.733333,0.733333,1},  
          [26] = {0.1,0.1,0.1,0.5}, [27] = {0.733333,0.733333,0.733333,1},
          [36] = {0.1,0.1,0.1,0.5}, [37] = {0.733333,0.733333,0.733333,1},  
          [46] = {0.1,0.1,0.1,0.5}, [47] = {0.733333,0.733333,0.733333,1},  
          [56] = {0.1,0.1,0.1,0.5}, [57] = {0.733333,0.733333,0.733333,1},  
          [66] = {0.1,0.1,0.1,0.5}, [67] = {0.733333,0.733333,0.733333,1},
          [76] = {0.1,0.1,0.1,0.5}, [77] = {0.733333,0.733333,0.733333,1},
          [86] = {0.1,0.1,0.1,0.5}, [87] = {0.733333,0.733333,0.733333,1},
          [96] = {0.1,0.1,0.1,0.5}, [97] = {0.333333,0.333333,0.333333,1},  
          [106] = {0.1,0.1,0.1,0.5}, [107] = {0.733333,0.733333,0.733333,1},
          
    ---Bases Backdrop / backdrop border
          [200] = {0.082,0.082,0.082,1}, [201] = {0,0,0,1},  
          [300] = {0.082,0.082,0.082,1}, [301] = {0,0,0,1},  
          [400] = {0.082,0.082,0.082,1}, [401] = {0,0,0,1},  
          [500] = {0.082,0.082,0.082,1}, [501] = {0.733333,0.733333,0.733333,1},  
          [600] = {0.082,0.082,0.082,1}, [601] = {0.733333,0.733333,0.733333,1},
          [700] = {0.082,0.082,0.082,1}, [701] = {0.733333,0.733333,0.733333,1},
          [800] = {0.082,0.082,0.082,1}, [801] = {0.733333,0.733333,0.733333,1},
    ---Bases Alliance 1 / Alliance 2
          [202] = {51/255,102/255,204/255,0.7}, [203] = {82/255,100/255,139/255,0.7},  
          [302] = {51/255,102/255,204/255,0.7}, [303] = {82/255,100/255,139/255,0.7},  
          [402] = {51/255,102/255,204/255,0.7}, [403] = {82/255,100/255,139/255,0.7},  
          [502] = {51/255,102/255,204/255,0.7}, [503] = {82/255,100/255,139/255,0.7},  
          [602] = {51/255,102/255,204/255,0.7}, [603] = {82/255,100/255,139/255,0.7},
          [702] = {51/255,102/255,204/255,0.7}, [703] = {82/255,100/255,139/255,0.7},
          [802] = {51/255,102/255,204/255,0.7}, [803] = {82/255,100/255,139/255,0.7},          
    ---Bases Horde 1 / Horde 2
          [204] = {204/255,0,0,0.9}, [205] = {205/255,91/255,69/255,0.9},  
          [304] = {204/255,0,0,0.9}, [305] = {205/255,91/255,69/255,0.9},  
          [404] = {204/255,0,0,0.9}, [405] = {205/255,91/255,69/255,0.9},  
          [504] = {204/255,0,0,0.9}, [505] = {205/255,91/255,69/255,0.9},  
          [604] = {204/255,0,0,0.9}, [605] = {205/255,91/255,69/255,0.9},
          [704] = {204/255,0,0,0.9}, [705] = {205/255,91/255,69/255,0.9},
          [804] = {204/255,0,0,0.9}, [805] = {205/255,91/255,69/255,0.9},          
    ---Bases Neutral 1 / Neutral 2
          [206] = {193/255,193/255,193/255,0.7}, [207] = {132/255,132/255,132/255,0.7},  
          [306] = {193/255,193/255,193/255,0.7}, [307] = {132/255,132/255,132/255,0.7},  
          [406] = {193/255,193/255,193/255,0.7}, [407] = {132/255,132/255,132/255,0.7},  
          [506] = {193/255,193/255,193/255,0.7}, [507] = {132/255,132/255,132/255,0.7},  
          [606] = {193/255,193/255,193/255,0.7}, [607] = {132/255,132/255,132/255,0.7},
          [706] = {193/255,193/255,193/255,0.7}, [707] = {132/255,132/255,132/255,0.7},
          [806] = {193/255,193/255,193/255,0.7}, [807] = {132/255,132/255,132/255,0.7},          
    ---Bases BarsBack / BarsBackBorder
          [208] = {0.1,0.1,0.1,0.9}, [209] = {0.733333,0.733333,0.733333,0.5},  
          [308] = {0.1,0.1,0.1,0.9}, [309] = {0.733333,0.733333,0.733333,0.5},  
          [408] = {0.1,0.1,0.1,0.9}, [409] = {0.733333,0.733333,0.733333,1},  
          [508] = {0.1,0.1,0.1,0.9}, [509] = {0.733333,0.733333,0.733333,1},  
          [608] = {0.1,0.1,0.1,0.9}, [609] = {0.733333,0.733333,0.733333,0.5},
          [708] = {0.1,0.1,0.1,0.9}, [709] = {0.733333,0.733333,0.733333,0.5},
          [808] = {0.1,0.1,0.1,0.9}, [809] = {0.733333,0.733333,0.733333,0.5},          
          
    ---Class Colors     
          [1500] = {245/255,140/255,186/255,1},  --paladin
          [1501] = {199/255,156/255,110/255,1},  --warrior
          [1502] = {148/255,130/255,201/255,1},  --warlock
          [1503] = {171/255,212/255,115/255,1},  --hunt
          [1504] = {0/255,112/255,222/255,1},    --chaman
          [1505] = {255/255,245/255,105/255,1},  --rogue
          [1506] = {1,1,1,1},                    --priest
          [1507] = {105/255,204/255,240/255,1},  --mage
          [1508] = {196/255,30/255,59/255,1},    --dk
          [1509] = {255/255,125/255,10/255,1}    --druid                 
        }
}