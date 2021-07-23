Config {
    font = "xft:Dejau Sans Mono for Powerline Plus Nerd File Types Mono Plus Font Awesome Plus Octicons Plus Pomicons-9",
    bgColor = "#1D1F21",
    -- fgColor = "#c5c8c6",
    fgColor = "#505050",
    position = Static { xpos = 0, ypos = 0, width = 1919, height = 17 },
    lowerOnStart = True,
    commands = [
      Run Date "<fc=#505050>%d.%m.%y %H:%M</fc> " "date" 10,
      Run Battery [
        "-t", "<acstatus>: <left>% - <timeleft>",
      "--",
      --"-c", "charge_full",
      "-O", "ac",
      "-o", "Bat",
      "-h", "green",
      "-l", "red"
      ] 10,
      Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %battery% %date%"
}

