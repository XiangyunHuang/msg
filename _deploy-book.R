# On CI connect to server, using API KEY and deploy using appId
rsconnect::addConnectServer("https://bookdown.org", "bookdown.org")
rsconnect::connectApiUser(
  account = "xiangyun", server = "bookdown.org",
  apiKey = Sys.getenv("CONNECT_API_KEY")
)
rsconnect::deploySite(
  appId = Sys.getenv("CONTENT_ID"),
  server = "bookdown.org",
  render = "none", logLevel = "verbose",
  forceUpdate = TRUE
)
