#PLOTS
boxplot(M2019btrain$PARTICIPATION~M2019btrain$GRADE)
ranges <- tapply(M2019btrain$SCORE, M2019btrain$GRADE,range)
means <- tapply(M2019btrain$SCORE, M2019btrain$GRADE, mean)
meansPart <- tapply(M2019btrain$PARTICIPATION, M2019btrain$GRADE,mean)
View(meansPart)
View(means)

neverleave<-subset(M2019btrain, M2019btrain$LEAVES_EARLY=="never")
somelev<-subset(M2019btrain, M2019btrain$LEAVES_EARLY=="sometimes")
rarely<-subset(M2019btrain, M2019btrain$LEAVES_EARLY=="rarely")
alwaysleave<-subset(M2019btrain, M2019btrain$LEAVES_EARLY=="always")

#prediction vector
p <- M2019_test_students
answer <- rep('F', nrow(p))
#D
answer[p$SCORE>37.19]<- 'D'
answer[p$SCORE>37.19 & p$PARTICIPATION<0.36] <- 'F'

#C
answer[p$SCORE>46] <- 'C'
answer[p$SCORE>46 & p$PARTICIPATION<0.45] <- 'D'

#B
answer[p$SCORE>60.92] <- 'B'
answer[p$SCORE>60.92 & p$PARTICIPATION<0.45] <- 'C'

#A
answer[p$SCORE>76.22] <- 'A'
answer[p$SCORE>76.22 & p$PARTICIPATION<0.50] <- 'B'

#error test
p$GRADE <- answer
#error <- mean(M2019btrain$GRADE!=p$GRADE)
#error

M2019_sample_submission$GRADE <- p$GRADE
write.csv(M2019_sample_submission, file="mysubmission.csv", row.names=FALSE)