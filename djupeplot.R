anes <- read_dta("D:/anes.dta")
none <- filter(anes, VCF0129 == 998 | VCF0152 == 997 | VCF0152 == 998)
none$female <- none$VCF0104
none$female <- recode(none$female, "2=1; else=0")
ggplot(data = none, aes(x=female)) + geom_histogram() + stat_bin(binwidth = 1) + scale_x_discrete(name ="Female =1 ", limits=c("1","0")) + facet_wrap(~VCF0004)
