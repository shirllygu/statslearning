
setwd("/Users/yugu/Downloads")
greenhouse<-read.csv("greenhouse.csv")

library(tidyverse)

is.factor(greenhouse$Fert)

str(greenhouse)

summary(greenhouse)

boxplot(greenhouse$Height, 
        horizontal = TRUE, 
        main="Height distribution across all groups",
        col = "blue")

boxplot(greenhouse$Height~greenhouse$Fert, 
        main="Fig.-1: Boxplot of Height of Four Brands of Greenhouse", col= rainbow(4))

library(ggplot2)
ggplot(greenhouse, aes(Fert,Height))+geom_boxplot(aes(col=Height))+labs(title="Boxplot of Height of Four Brands of Greenhouse")


model1<- aov(greenhouse$Height~greenhouse$Fert)


summary(model1)


TukeyHSD(model1, conf.level = 0.99)


plot(TukeyHSD(model1, conf.level = 0.99),las=1, col = "red")



par(mfrow=c(2,2))

plot(model1)
