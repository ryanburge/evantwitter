
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

cruz<- tweets[ grep("Cruz", tweets$text), ]
count <- count(cruz, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Cruz'")
length(unique(cruz$screenName))  #23

bernie<- tweets[ grep("Bernie", tweets$text), ]
count <- count(bernie, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Bernie'")
length(unique(bernie$screenName)) #13

politics<- tweets[ grep("politics", tweets$text), ]
count <- count(politics, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Politics'")
length(unique(politics$screenName)) #27

govt<- tweets[ grep("government", tweets$text), ]
count <- count(govt, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Government'")
length(unique(govt$screenName))  #25

dem <- tweets[ grep("Democrat", tweets$text), ]
count <- count(dem, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Democrat'")
length(unique(dem$screenName))  #19

rep <- tweets[ grep("Republican", tweets$text), ]
count <- count(rep, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Democrat'")
length(unique(rep$screenName))  #19
