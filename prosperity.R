library(twitteR)
library(ROAuth)

consumerKey <- "8kb0nStdvvCvweN8Qvf9yUPaJ"
consumerSecret <- "kx470OqsATIQarO1GYY3MLUjrnG74J722pP3kAu4t2G70f6si9"
my_oauth <- OAuthFactory$new(consumerKey=consumerKey,
consumerSecret=consumerSecret, requestURL=requestURL,
accessURL=accessURL, authURL=authURL)
my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
save(my_oauth, file="backup/oauth_token.Rdata")
save(my_oauth, file="oauth_token.Rdata")
accessToken = '14851168-3ePk0sagpEJZzOWUa9RYFBv2AwhPl6mlvX9LirqgO'
accessSecret = '4WBb5FzvsDGNKTEtTxc5GsQIva2BLjk7ZpuAskQrtZ6oP'
setup_twitter_oauth(consumer_key=consumerKey, consumer_secret=consumerSecret,
access_token=accessToken, access_secret=accessSecret)



timeline <- userTimeline('Paula_White', n=3200)
pwhite <- twListToDF(timeline)

timeline <- userTimeline('Creflo_Dollar', n=3200)
cdolloar <- twListToDF(timeline)

timeline <- userTimeline('CopelandNetwork', n=3200)
copeland <- twListToDF(timeline)

timeline <- userTimeline('JoyceMeyer', n=3200)
jmeyer <- twListToDF(timeline)

timeline <- userTimeline('jesse_duplantis', n=3200)
duplantis <- twListToDF(timeline)

timeline <- userTimeline('Benny_Hinn', n=3200)
bhinn <- twListToDF(timeline)

timeline <- userTimeline('JoelOsteen', n=3200)
josteen <- twListToDF(timeline)

timeline <- userTimeline('RealRodParsley', n=3200)
rparsley<- twListToDF(timeline)

timeline <- userTimeline('BishopJakes', n=3200)
rparsley<- twListToDF(timeline)


