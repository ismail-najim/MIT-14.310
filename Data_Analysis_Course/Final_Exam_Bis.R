setwd(dir="/Users/inajim/Downloads/R_Folder/Data_Analysis_Course")
# EXERCISE 2

# 5 combinations include 4 as the smallest number, among 36
q2.1 <- 5/36

#40% non conservative when male, 55% non conservative when not male, male is 49%
q2.2 <-0.4*0.49 + 0.55*0.51


# EXERCISE 3

blood_m <- c(118,117,123,124,116,125,128,114)

q3.1 <- sum((blood_m-mean(blood_m))^2)/(length(blood_m)-1)
q3.2 <- sqrt(q3.1)

#t test quantile calculation
q0.92 <- qt(0.96, df = 7, lower.tail = TRUE)

#confidence interval calculation
q3.3.A <- mean(blood_m) - q0.92*q3.2/sqrt(8)
q3.3.B <- mean(blood_m) + q0.92*q3.2/sqrt(8)


# EXERCISE 4

df5 = data.frame()
for (i in 1:10000) {df5 <- rbind(df5, rexp(5, 3))}
df5$mean <- rowMeans(df5, na.rm = TRUE, dims = 1)

du5 = data.frame()
for (i in 1:10000) {du5 <- rbind(du5, runif(5))}
du5$mean <- rowMeans(du5, na.rm = TRUE, dims = 1)

df20 = data.frame()
for (i in 1:10000) {df20 <- rbind(df20, rexp(20, 3))}
df20$mean <- rowMeans(df20, na.rm = TRUE, dims = 1)

du20 = data.frame()
for (i in 1:10000) {du20 <- rbind(du20, runif(20))}
du20$mean <- rowMeans(du20, na.rm = TRUE, dims = 1)

par(mfrow = c(2,2))
hist(df5$mean)
hist(df20$mean)
hist(du5$mean)
hist(du20$mean)

par(mfrow = c(1,1))

# EXERCISE 5

mydt <- read.csv("data_TE_data.csv")
summary(mydt)
str(mydt)

t.test(formula = Y~W, data = mydt)
pvalue_asympt <- 2*pnorm(t, lower.tail = FALSE)

model_1 <- lm(Y~W, data = mydt)
summary(model_1)

ks.test(mydt$Y[mydt$W==0], mydt$Y[mydt$W==1])

# EXERCISE 6
library(perm)
output <- matrix(c(0.5, 0.2, 0.4, 0.7), ncol = 1, nrow = 4)
input <- matrix(c(1, 0, 0, 1), ncol=1, nrow=4)
tau <- mean(output[input==1]) - mean(output[input==0])

Perm <- chooseMatrix(4, 2)
Fisher <- (Perm%*%output - (1-Perm)%*%output)/2
Fisher[abs(Fisher)>=tau]

# EXERCISE 7
library(tidyverse)
library(dplyr)
vote <- as.tbl(read.csv("data_gerber_trunc.csv")) %>% select(11:16)

model_2 <- lm(voting ~ civicduty + hawthorne + self + neighbors, data = vote)
summary(model_2)

var_2 <- 0.010773^2

model_3 <- lm(voting ~ civicduty + hawthorne + self + neighbors + control, data = vote)
summary(model_3)

vote_bis <- rbind(vote,vote)
model_4 <- lm(voting ~ civicduty + hawthorne + self + neighbors, data = vote_bis)
summary(model_4)
summary(model_2)

# EXERCISE 8

#tidying board
board <- as.tbl(read.csv("data_GCEEx.csv")) %>% gather("year","score", -State, -X) %>% mutate(year = 1*(year == "After"))
model_5 <- lm(score ~ State + year + State*year, data = board)
summary(model_5)

average_B_before <- model_5$coefficients[1]+model_5$coefficients[2]

board_bis <- as.tbl(read.csv("data_GCEEx.csv"))

# EXERCISE 9
health <- as.tbl(read.csv("data_iv_health2.csv"))

model_6 <- lm(logmedexpense ~ healthinsu + illnesses + age + logincome + female + marry, data = health)
summary(model_6)

library(AER)

iv_model <- ivreg(logmedexpense ~ healthinsu + illnesses + age + logincome + female + marry | ssiratio + illnesses + age + logincome + female + marry, data = health)
summary(iv_model)

percent_change <- exp(6.404606-0.990169)/exp(6.404606)
