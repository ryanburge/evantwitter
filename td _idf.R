tweets$text <- as.character(tweets$text)

tweets_words <- tweets  %>% unnest_tokens(word, text) %>%
count(screenName, word, sort = TRUE) %>%
ungroup()

tweets_words <- tweets_words  %>% bind_tf_idf(word, screenName, n) %>%
arrange(desc(tf_idf)) %>%
mutate(word = factor(word, levels = rev(unique(word))))

ggplot(tweets_words  %>% filter(screenName == "JaySekulow") %>% top_n(10), aes(x=word, y= tf_idf)) +
geom_bar(aes(alpha = tf_idf),
stat="identity",
fill = "#4169E1") +
coord_flip()

