tweets <- read.csv("D:/evantwitter/total.csv")
tweets <- filter(tweets, screenName != "realDonaldTrump")
tweets <- filter(tweets, screenName != "tedcruz")
tweets <- filter(tweets, screenName != "GovMikeHuckabee")
tweets <- filter(tweets, screenName != "GaryLBauer")

at <- '@'
reply <- subset(tweets, grepl(at, text) )

reply <- reply %>% group_by(screenName) %>% summarise(totaltweets = n())
tweet <- tweets %>% group_by(screenName) %>% summarise(totaltweets = n())
tweet$totalreplies <- reply$totaltweets
tweet$replyrate <- tweet$totalreplies/tweet$totaltweets
tweet$followers <- follow$followers


tweet$notreply <- tweet$totaltweets - tweet$totalreplies
notreply <- select(tweet, screenName, notreply)
withreply <- select(tweet, screenName, totalreplies)
notreply$label <- c("No Engagement")
withreply$label <- c("Engagement")
colnames(notreply)[2] <- "number"
colnames(withreply)[2] <- "number"
df <- rbind(notreply, withreply)
follow <- read.csv("clean_sheet.csv")
merge <- merge(df, follow, by=c("screenName"))

write.csv(merge, "engage.csv")
engage <-read.csv("engage.csv")

ggplot(engage %>% filter(Followers >500000) , 
       aes(x=reorder(screenName, -number), y= number, fill=label)) + 
  geom_col(position="dodge") + theme_classic() +
  theme(axis.text.x = element_text(angle = 90)) +
  scale_fill_manual(values = c("gray", "black")) + 
  theme(legend.justification=c(.9,.825),legend.position=c(.9,.825)) +
  theme(panel.grid.major.y=element_line(colour="grey50",linetype=2)) + 
  xlab("Screen Name") + 
  ylab("Number of Tweets") + labs(fill="") +
  ggtitle("Evangelical Leaders' Level of Engagement with Twitter Followers",
          subtitle = "Engagement measured by number of tweets\ncontaining '@.'")

scatter <-read.csv("engage_scatter.csv")
ggplot(scatter, aes(x=replyrate*100, y=followers/1000)) + geom_point(shape =1) + geom_smooth(method=lm) + theme_classic() +
  theme(axis.text.x = element_text(angle = 90)) +
  scale_fill_manual(values = c("gray", "black")) + 
  theme(legend.justification=c(.9,.825),legend.position=c(.9,.825)) +
  theme(panel.grid.major.y=element_line(colour="grey50",linetype=2)) + 
  xlab("Percent of Tweets That Contain '@'") + 
  ylab("Number of Followers (in thousands)") + labs(fill="") +
  ggtitle("Relationship Between Engagement and Popularity",
          subtitle = "Engagement measured by number of tweets containing '@.'")

ggplot(scatter, aes(x=replyrate*100, y=followers/1000)) + geom_point(shape =1) + geom_smooth(method=lm) + theme_classic() +
  theme(axis.text.x = element_text(angle = 90)) +
  scale_fill_manual(values = c("gray", "black")) + 
  theme(legend.justification=c(.9,.825),legend.position=c(.9,.825)) +
  theme(panel.grid.major.y=element_line(colour="grey50",linetype=2)) + 
  xlab("Percent of Tweets That Contain '@'") + 
  ylab("Number of Followers (in thousands)") + labs(fill="") +
  ggtitle("Relationship Between Engagement and Number of Followers",
          subtitle = "Engagement measured by number of tweets containing '@.'")
