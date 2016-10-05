
trump<- tweets[ grep("Trump", tweets$text), ]
count <- count(trump, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Trump'")
length(unique(trump$screenName)) #37

clinton<- tweets[ grep("Clinton", tweets$text), ]
count <- count(clinton, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Clinton'")
length(unique(clinton$screenName)) #29

obama<- tweets[ grep("Obama", tweets$text), ]
count <- count(obama, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Obama'")
length(unique(obama$screenName)) #27

