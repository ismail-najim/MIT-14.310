# Data input
library(tidyverse)
stroke <- read.csv("train_2v.csv")

stroke$new_gender[stroke$gender=="Male"]=1
stroke$new_gender[stroke$gender=="Female"]=0

stroke$new_ever_married[stroke$ever_married=="Yes"]=1
stroke$new_ever_married[stroke$ever_married=="No"]=0

stroke$new_restype[stroke$Residence_type=="Urban"]=1
stroke$new_restype[stroke$Residence_type=="Rural"]=0

stroke$smokes[stroke$smoking_status=="smokes"]=1
stroke$smokes[stroke$smoking_status!="smokes"]=0

stroke$f_smoked[stroke$smoking_status=="formerly_smoked"]=1
stroke$f_smoked[stroke$smoking_status!="formerly_smoked"]=0


summary(stroke)



head(stroke)
model <- lm(formula= stroke ~ age + hypertension + heart_disease + new_ever_married + new_gender + new_restype + avg_glucose_level + bmi + smokes + f_smoked, data = stroke)

summary(model)
