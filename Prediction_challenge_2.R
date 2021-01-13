#Asks Questions
PermutationTestSecond::Permutation(train, "ASKS_QUESTIONS", "SCORE", 1000, "never", "always")
PermutationTestSecond::Permutation(train, "ASKS_QUESTIONS", "SCORE", 1000, "sometimes", "always")
PermutationTestSecond::Permutation(train, "ASKS_QUESTIONS", "SCORE", 1000, "sometimes", "never")

tree <- rpart(GRADE ~ SCORE+PARTICIPATION+ASKS_QUESTIONS+LEAVES_EARLY, data=train)
rpart.plot::rpart.plot(tree)
pred.tree <- predict(tree, newdata = train,type = "class")

#error <- mean(train$GRADE!= pred.tree)
#error

pred.tree <- predict(tree, newdata = moody_test, type = "class")
View(pred.tree)

submission$GRADE <- pred.tree
write.csv(submission, file = "mysubmission.csv", row.names = FALSE)

CrossValidation::cross_validate(train, tree, 5, 0.7)