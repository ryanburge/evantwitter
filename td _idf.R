
## Trying out the td-idf analysis

library(tidytext)

tweets$text <- as.character(tweets$text)

tweets_words <- tweets  %>% unnest_tokens(word, text) %>%
count(screenName, word, sort = TRUE) %>%
ungroup()

tweets_words <- tweets_words  %>% bind_tf_idf(word, screenName, n) %>%
arrange(desc(tf_idf)) %>%
mutate(word = factor(word, levels = rev(unique(word))))

## Just trying on Ted Haggard - This is a mess
ggplot(tweets_words  %>% filter(screenName == "realrobbell") %>% top_n(10), aes(x=word, y= tf_idf)) +
geom_bar(aes(alpha = tf_idf),
stat="identity",
fill = "#4169E1") +
coord_flip()

ggplot(tweets_words  %>% top_n(100), aes(x=word, y= tf_idf)) +
  geom_bar(aes(alpha = tf_idf),
           stat="identity",
           fill = "#4169E1") +
  coord_flip()



total_words <- tweets_words %>% group_by(screenName) %>% summarize(total = sum(n))
all_words <- left_join(tweets_words, total_words)
all_words <- all_words %>% bind_tf_idf(word, screenName, n)

## This is where it just gets terrible. Everyone is just tweeting about their own little niche. 
all_words %>%
group_by(screenName) %>% 
arrange(desc(tf_idf))


library(ggstance)
library(ggplot2)
library(viridis)

plot1 <- all_words %>%
arrange(desc(tf_idf)) %>%
mutate(word = factor(word, levels = rev(unique(word))))
ggplot(plot1[1:20,], aes(tf_idf, word, fill = screenName, alpha = tf_idf)) +
geom_barh(stat = "identity") +
labs(title = "Highest tf-idf words in Evangelical Tweets",
y = NULL, x = "tf-idf") +
scale_alpha_continuous(range = c(0.6, 1), guide = FALSE) +
scale_x_continuous(expand=c(0,0)) +
scale_fill_viridis(end = 0.85, discrete=TRUE) +
theme(legend.title=element_blank()) +
theme(legend.justification=c(1,0), legend.position=c(1,0))

