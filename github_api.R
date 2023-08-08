library(httr)
library(jsonlite)

oauth_endpoints("github")     ##setting endpoint

myapp <- oauth_app("github",
                   key = "f663ab721bbe06e81d5b",
                   secret="7d609e23634d0b930b6d79fcfd6e166d0212ad30")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)


stop_for_status(req)
x <- content(req)

##httpub도 미리 설치해야 함.
##하고 local access에 no.
##하면 req의 클래스가 list 형태로 나옴.

gitx <- jsonlite::fromJSON(jsonlite::toJSON(x))

##하면 더 보기 좋은 데이터 프레임 형태로 나오는데, 여기서 열과 행을 찾아 데이터 찾으면 됨.
