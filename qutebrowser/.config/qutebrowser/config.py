c = c; config = config

DDG_HTML = "https://html.duckduckgo.com"
SEARCH = DDG_HTML + "/html"

config.load_autoconfig(False)

c.editor.command = ["kitty", "-e", "nvim", "{file}", "-f", "-c", "normal {line}G{column0}l"]
c.fonts.default_family = "JetBrainsMono Nerd Font"
c.prompt.radius = 0
c.hints.radius = 0
c.keyhint.radius = 0
c.colors.webpage.darkmode.enabled = True
c.downloads.location.remember = False
c.content.autoplay = True

c.url.default_page = DDG_HTML
c.url.searchengines = {"DEFAULT": SEARCH + "?q={}"}
c.url.start_pages = [DDG_HTML]

config.unbind("<Ctrl-Q>")
config.unbind("ZZ")
config.unbind("ZQ")

config.unbind("sk")
config.unbind("sl")
config.unbind("ss")
config.unbind("sf")
config.unbind("Ss")
config.unbind("Sb")
config.unbind("Sq")
config.unbind("Sh")

config.bind("sn", "navigate next")
config.bind("sN", "navigate prev")
