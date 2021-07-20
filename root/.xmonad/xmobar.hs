Config {
    font = "xft:Dejau Sans Mono for Powerline Plus Nerd File Types Mono Plus Font Awesome Plus Octicons Plus Pomicons-9",
    bgColor = "#1D1F21",
    fgColor = "#c5c8c6",
    position = Static { xpos = 0, ypos = 0, width = 1919, height = 17 },
    lowerOnStart = True,
    commands = [
      Run Date "<fc=#505050>%d.%m.%y %H:%M</fc> " "date" 10,
      Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ <fc=#c5c8c6>%date%</fc>"
}

