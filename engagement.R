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


ggplot(merge %>% filter(Followers >500000) , aes(x=reorder(screenName, -number), y= number, fill=label)) + 
  geom_col(position="dodge") + theme(axis.text.x = element_text(angle = 90)) +
  scale_fill_manual(values = c("gray", "black")) + xlab("Screen Name") + ylab("Number of Tweets")  +     
  theme(legend.position="bottom") + labs(fill="")
