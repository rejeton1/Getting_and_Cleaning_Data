library(httr)

oauth_endpoints("github")     ##setting endpoint

myapp <- oauth_app("github",
                   key = "f663ab721bbe06e81d5b",
                   secret="7d609e23634d0b930b6d79fcfd6e166d0212ad30")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)


stop_for_status(req)
content(req)