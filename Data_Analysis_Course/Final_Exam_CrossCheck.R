data <- as.tbl(read.csv("data_gerber_trunc.csv")) %>% select(11:16)
model_normal <- lm(voting ~civicduty + hawthorne + neighbors + self, data = data)
summary(model_normal)
model_normal$coef[2,1]^2
vcov(model_normal)


data2 <- as.tbl(read.csv("data_TE_data.csv"))
m <- t.test(data2$Y[data2$W==1], data2$Y[data2$W==0])
pnorm(m$statistic, lower.tail = FALSE)*2

ks.test(data2$Y[data2$W==1], data2$Y[data2$W==0])
