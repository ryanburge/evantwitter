tweets <- read.csv("D:/evantwitter/total.csv")
dim(tweets)
library(twitteR)
library(ROAuth)
library(tm)
library(stringr)
library(wordcloud)
library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr)
library(RColorBrewer)


count <- count(tweets, screenName)
count  %>% arrange(count, desc(n))
count <- filter(count, n >1)
ggplot(count, aes(x=reorder(screenName, n), y = n)) + geom_bar(stat="identity") + coord_flip()
tweets$created <-as.POSIXct(tweets$created)
minutes <- 120
ggplot(data=tweets, aes(x=created)) +
geom_histogram(aes(fill=..count..), binwidth=160*minutes) +
scale_x_datetime("Date") +
scale_y_continuous("Frequency") + ggtitle("Usage of the #FundEIU Hashtag")


nohandles <- str_replace_all(tweets$text, "@\\w+", "")
wordCorpus <- Corpus(VectorSource(nohandles))
wordCorpus <- tm_map(wordCorpus, removePunctuation)
wordCorpus <- tm_map(wordCorpus, content_transformer(tolower))
wordCorpus <- tm_map(wordCorpus, removeWords, stopwords("english"))
wordCorpus <- tm_map(wordCorpus, stripWhitespace)

library(RColorBrewer)
pal <- brewer.pal(9,"YlGnBu")
pal <- pal[-(1:4)]
wordcloud(words = wordCorpus, scale=c(5,0.1), max.words=100, random.order=FALSE,
rot.per=0.35, use.r.layout=FALSE, colors=pal)



