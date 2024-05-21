# On CI connect to server, using API KEY and deploy using appId
rsconnect::addServer(url = "https://bookdown.org", name = "bookdown.org")
rsconnect::connectApiUser(
  account = "xiangyun", server = "bookdown.org",
  apiKey = Sys.getenv("CONNECT_API_KEY")
)
rsconnect::deploySite(
  siteName = "msg",
  siteTitle = "现代统计图形",
  server = "bookdown.org",
  render = "none", account = "xiangyun",
  forceUpdate = TRUE
)
