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

