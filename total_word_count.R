## Wnated to get a full word count for the entire dataset
## Had to truncate the analysis or my computer would blow up

dtm <- DocumentTermMatrix(wordCorpus,
                          control=list(wordLengths=c(1, Inf),
                                       bounds=list(global=c(floor(length(wordCorpus)*0.005), Inf))))
dtm2 <- as.matrix(dtm)
frequency <- colSums(dtm2)
frequency <- sort(frequency, decreasing=TRUE)
head(frequency, 25)

## Getting this in the right format for Wordcloud2 package
write.csv(frequency, "count.csv")
count <- read.csv("count.csv", stringsAsFactors = FALSE)

count$word <- count$X
count$freq <- count$x
count$X <- NULL
count$x <- NULL

## I still wanted to dump some words that didn't make much sense


#count <- count[-c(22, 28, 39, 52, 89, 101, 102, 198, 199, 204),]

wordcloud2(data = count)


## Plot the most used words with a focus on "just"
count <- read.csv("count.csv", stringsAsFactors = FALSE)
count <- filter(count, x >2500)

count$area.color <- c("one", "one", "one", "one", "one", "one" , "one", "one", "one", "one", "one", "one", "one", "one", "one", "two", "one", "one")

ggplot(count, aes(x=reorder(X, x), y = x, fill=area.color)) + geom_bar(stat="identity") + coord_flip() + ylab("Number of Times Used") + xlab("Word") + theme(legend.position="none")+ labs(title = "What Words Do Evangelicals Use the Most?") +scale_fill_manual(values = c("gray", "red"))