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
cdollar <- twListToDF(timeline)

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
tdjakes <- twListToDF(timeline)

timeline <- userTimeline('Jim_Bakker', n=3200)
jbakker <- twListToDF(timeline)

timeline <- userTimeline('BishopEddieLong', n=3200)
blong <- twListToDF(timeline)

timeline <- userTimeline('pastormarkburns', n=3200)
mburns <- twListToDF(timeline)

timeline <- userTimeline('PastorDScott', n=3200)
dscott <- twListToDF(timeline)

prosper <- rbind(rparsley, pwhite, cdollar, copeland, jmeyer, duplantis, bhinn, josteen, tdjakes, jbakker, blong, mburns, dscott)

## Traditional Evangelical 

timeline <- userTimeline('RickWarren', n=3200)
rwarren <- twListToDF(timeline)

timeline <- userTimeline('MaxLucado', n=3200)
lucado <- twListToDF(timeline)

timeline <- userTimeline('BethMooreLPM', n=3200)
bmoore <- twListToDF(timeline)

timeline <- userTimeline('Franklin_Graham', n=3200)
fgraham <- twListToDF(timeline)

timeline <- userTimeline('PastorMark', n=3200)
mdriscoll <- twListToDF(timeline)

timeline <- userTimeline('Stevenfurtick', n=3200)
sfurtick <- twListToDF(timeline)

timeline <- userTimeline('timkellernyc', n=3200)
tkeller <- twListToDF(timeline)

timeline <- userTimeline('BillHybels', n=3200)
bhybels <- twListToDF(timeline)

timeline <- userTimeline('Edstetzer', n=3200)
stetzer <- twListToDF(timeline)

timeline <- userTimeline('judahsmith', n=3200)
jsmith <- twListToDF(timeline)

evan <- rbind(rwarren, lucado, bmoore, fgraham, sfurtick, tkeller, bhybels, stetzer, jsmith, mdriscoll)


a1 <- prosper %>% group_by(screenName) %>% summarise(rtsum = sum(retweetCount), favsum = sum(favoriteCount), totaltweets = n())

a1$rtscore <- a1$rtsum/a1$totaltweets
a1$favscore <- a1$favsum/a1$totaltweets
p1 <- read.csv("prosper1.csv")
a1$followers <- p1$followers


a2 <- evan %>% group_by(screenName) %>% summarise(rtsum = sum(retweetCount), favsum = sum(favoriteCount), totaltweets = n())

a2$rtscore <- a2$rtsum/a2$totaltweets
a2$favscore <- a2$favsum/a2$totaltweets
a2$followers <- c(724000, 267000, 197000, 644000, 376000, 1290000, 525000, 1840000, 313000, 278000)

a1$type <- c("Prosperity")
a2$type <- c("Evangelical")

a1$color <- c("darkolivegreen4")
a2$color <- c("darkblue")

combine <- rbind(a1, a2)

write.csv(combine, "538.csv")

ggplot(combine,aes(x=rtscore,y=favscore, color=type)) +
  ggtitle("Who Has a Bigger Audience?",
          subtitle="Larger Point Size = More Followers") +
  xlab("Mean Number of Retweets (on a log10 scale)") +
  ylab("Mean Number of Favoriteds (on a log10 scale)") +
  geom_point(color=combine$color,size=0.000005*combine$followers) + geom_text_repel(aes(label=screenName),size=2.5,
                                                                                     box.padding = unit(0.5, 'lines'),
                                                                                     point.padding = unit(1.6, 'lines'),
                                                                                     segment.color = "grey35",
                                                                                     segment.size = 0.5,
                                                                                     arrow = arrow(length = unit(0.01, 'npc')),
                                                                                     force = 1,
                                                                                     max.iter = 3e3) +
  scale_x_log10() + scale_y_log10() + theme_classic() + 
  theme(panel.grid.major=element_line(colour="grey50",linetype=2)) + scale_color_manual(values=c("darkblue", "darkolivegreen4")) + 
  guides(colour = guide_legend(override.aes = list(shape = 15)))
