
trump<- tweets[ grep("Trump", tweets$text), ]
count <- count(trump, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Trump'")
length(unique(trump$screenName)) #35

clinton<- tweets[ grep("Clinton", tweets$text), ]
count <- count(clinton, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Clinton'")
length(unique(clinton$screenName)) #26

obama<- tweets[ grep("Obama", tweets$text), ]
count <- count(obama, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Obama'")
length(unique(obama$screenName)) #24

romney<- tweets[ grep("Romney", tweets$text), ]
count <- count(romney, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Obama'")
length(unique(romney$screenName)) #24

cruz<- tweets[ grep("Cruz", tweets$text), ]
count <- count(cruz, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Cruz'")
length(unique(cruz$screenName))  #20

bernie<- tweets[ grep("Bernie", tweets$text), ]
count <- count(bernie, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Bernie'")
length(unique(bernie$screenName)) #11

politics<- tweets[ grep("politics", tweets$text), ]
count <- count(politics, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Politics'")
length(unique(politics$screenName)) #25

govt<- tweets[ grep("government", tweets$text), ]
count <- count(govt, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Government'")
length(unique(govt$screenName))  #24

dem <- tweets[ grep("Democrat", tweets$text), ]
count <- count(dem, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Democrat'")
length(unique(dem$screenName))  #16

rep <- tweets[ grep("Republican", tweets$text), ]
count <- count(rep, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Republican'")
length(unique(rep$screenName))  #17

gay <- tweets[ grep("gay", tweets$text), ]
count <- count(gay, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Gay'")
length(unique(gay$screenName))  #22

homo <- tweets[ grep("homosexual", tweets$text), ]
count <- count(homo, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Gay'")
length(unique(homo$screenName))  #9

homo2 <- tweets[ grep("homosexuality", tweets$text), ]
count <- count(hom2o, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Gay'")
length(unique(homo2$screenName))  #6

abortion <- tweets[ grep("abortion", tweets$text), ]
count <- count(abortion, screenName)
count  %>% arrange(count, desc(n))
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip() + ggtitle("Number of Tweets Containing 'Homosexual'")
length(unique(abortion$screenName))  #21


