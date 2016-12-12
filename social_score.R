a1 <- tweets %>% group_by(screenName) %>% summarise(rtsum = sum(retweetCount), favsum = sum(favoriteCount), totaltweets = n())

a1$rtscore <- a1$rtsum/a1$totaltweets
a1$favscore <- a1$favsum/a1$totaltweets

ggplot(a1 %>% filter(rtscore >=75), aes(x=reorder(screenName, rtscore), y = rtscore)) + geom_col() + coord_flip() + ylab("Retweets per Tweet") + xlab("Screen Name")

ggplot(a1 %>% filter(favscore >=75), aes(x=reorder(screenName, favscore), y = favscore)) + geom_col() + coord_flip() + ylab("Favorites per Tweet") + xlab("Screen Name")