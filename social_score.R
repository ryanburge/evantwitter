a1 <- tweets %>% group_by(screenName) %>% summarise(rtsum = sum(retweetCount), favsum = sum(favoriteCount), totaltweets = n())

a1$rtscore <- a1$rtsum/a1$totaltweets
a1$favscore <- a1$favsum/a1$totaltweets

ggplot(a1 %>% filter(rtscore >=75), aes(x=reorder(screenName, rtscore), y = rtscore)) + geom_col() + coord_flip() + ylab("Retweets per Tweet") + xlab("Screen Name")

ggplot(a1 %>% filter(favscore >=75), aes(x=reorder(screenName, favscore), y = favscore)) + geom_col() + coord_flip() + ylab("Favorites per Tweet") + xlab("Screen Name")

## Plot with Point Size
ggplot(a1,aes(x=rtscore,y=favscore)) +
  ggtitle("Effectiveness of Evangelical Twitter Accounts",
          subtitle="Effectiveness Measured by the Mean Number of Retweets per Tweet\nand the Mean Number of Favoriteds Received per Tweet.\n
          Larger Point Size = More Followers") +
  xlab("Mean Number of Retweets (on a log10 scale)") +
  ylab("Mean Number of Favoriteds (on a log10 scale)") +
  geom_point(color="red",size=0.0025*a1$followers,alpha=I(.55)) + geom_text_repel(aes(label=screenName),size=2.5,
                                                                                          box.padding = unit(0.5, 'lines'),
                                                                                          point.padding = unit(1.6, 'lines'),
                                                                                          segment.color = "grey35",
                                                                                          segment.size = 0.5,
                                                                                          arrow = arrow(length = unit(0.01, 'npc')),
                                                                                          force = 1,
                                                                                          max.iter = 3e3) +
  scale_x_log10() + scale_y_log10() + theme_classic() + 
  theme(panel.grid.major=element_line(colour="grey50",linetype=2))


##Putting Retweet Score and Favorite Score in One Plot
rt <- a1
fav <- a1

rt$score <- rt$rtsum/rt$totaltweets
fav$score <- fav$favsum/fav$totaltweets



rt$label <- c("Retweets")
fav$label <- c("Favorites")
df <- rbind(fav, rt)

ggplot(df %>% filter(score >=100), aes(x=reorder(screenName, score), y = score)) + 
  geom_bar(aes(fill=label),stat="identity", position= "dodge")  +
coord_flip()
