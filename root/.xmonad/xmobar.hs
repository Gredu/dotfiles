-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
-- Config {
--     font = "xft:Fixed-8",
--     bgColor = "#000000",
--     fgColor = "#ffffff",
--     position = Static { xpos = 0, ypos = 0, width = 2560, height = 16 },
--     lowerOnStart = True,
--     commands = [
--         Run Weather "KPAO" ["-t","<tempF>F <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
--         Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
--         Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
--         Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
--         Run Network "em1" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
--         Run Date "%a %b %_d %l:%M" "date" 10,
--         Run StdinReader
--     ],
--     sepChar = "%",
--     alignSep = "}{",
--     template = "%StdinReader% }{ %multicpu%   %memory%   %swap%   %em1%   <fc=#FFFFCC>%date%</fc>   %KPAO%"
-- }

Config {
    font = "xft:DejaVu Sans Mono for Powerline Plus Nerd File Types Mono Plus Font Awesome Plus Octicons Plus Pomicons-9",
    bgColor = "#1D1F21",
    fgColor = "#c5c8c6",
    -- position = Static { xpos = 1680, ypos = 0, width = 1680, height = 16 },
    position = Static { xpos = 0, ypos = 0, width = 1919, height = 17 },
    lowerOnStart = True,
    commands = [
      Run Weather "KPAO" [
        "-t","<tempC>° <skyCondition>"
          ,"-L","5"
          ,"-H","25"
          ,"-n","#b5bd68"
          ,"-h","#cc6666"
          ,"-l","#81a2be"
      ] 36000,
      -- Run Weather "EFHF" ["-t","<tempC>° <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
      -- Run MultiCpu ["-t","cpu: <total0> <total1> <total2> <total3> <total4> <total5> <total6> <total7>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
      -- Run MultiCpu ["-t","cpu: <usedratio>%","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
      Run MultiCpu [
        "-t","♒<total>%"
          ,"-L","30"
          ,"-H","60"
          ,"-h","#cc6666"
          ,"-l","#b5bd68"
          ,"-n","#c5c8c6"
          ,"-w","3"
      ] 10,
      Run Memory [
        "-t","⛃ <usedratio>%"
          ,"-H","8192"
          ,"-L","4096"
          ,"-h","#cc6666"
          ,"-l","#b5bd68"
          ,"-n","#c5c8c6"
      ] 10,
      Run Swap [
        "-t","⛁ <usedratio>%"
          ,"-H","1024"
          ,"-L","512"
          ,"-h","#cc6666"
          ,"-l","#b5bd68"
          ,"-n","#c5c8c6"
      ] 10,
      Run Network "enp3s0" [
        "-t","⇩<rx> ⇧<tx>"
          ,"-H","200"
          ,"-L","10"
          ,"-h","#cc6666"
          ,"-l","#b5bd68"
          ,"-n","#c5c8c6"
      ] 10,
      Run Date "<fc=#cc6666>%d</fc>%m%y<fc=#8abeb7>%H%M</fc> " "date" 10,
      -- Run DiskU [("/", "<used>"),  ("/", "<usedbar>")]               
      --             ["-L", "20", "-H", "50", "-m", "1", "-p", "3",
      --             "--normal", "grey50", "--high", "#a0522d",
      --             "--low", "#2f4f4f"] 20,
      Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    -- template = "%StdinReader% }{ %multicpu%   %memory%   %swap%   %DiskU%   %enp2s0%   <fc=#FFFFCC>%date%</fc>   %EFHF%"
    -- template = "%StdinReader% }{ %multicpu%   %memory%   %swap%   %enp7s0%   <fc=#FFFFCC>%date%</fc>   %EFHF%"
    template = "%StdinReader% }{ %multicpu%   %memory%   %swap%   %enp3s0%   <fc=#c5c8c6>%KPAO%</fc>   <fc=#c5c8c6>%date%</fc>"
}

