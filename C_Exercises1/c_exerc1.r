# this is the script file  c_exerc1.R 

# first load several libraries that we will use for the course Introduction to Econometrics
# note: you may have to run install.packages("  ") first as in next line
install.packages("Ecdat")
install.packages("car")
install.packages("lmtest")
install.packages("sandwich")
install.packages("e1071")
library(Ecdat)
library(car)
library(lmtest)
library(sandwich)
# package to compute certain statistics:
library(e1071)
#library(tonymisc)


setwd("/Users/Mylene/Documents/introduction-to-econometrics/C_Exercises1/")
library(foreign)
cps08 <- read.dta("cps08.dta")

# in case this failed, run the command
# load("H:/R/C_Exercises/cps08.Rdata")


head(cps08)
attach(cps08)
# E4.1a
summary(cps08)
boxplot(ahe)
title(main = "Average Hourly Earning")
# you could compute skewness and kurtosis, but also boxplot indicates non-normality
skewness(ahe)
kurtosis(ahe)

boxplot(age)
title(main = "Age")

#1b
plot(age,ahe)
title(main = "Average Hourly earning against Age")

#1c
x=female==1
ahe.f=ahe[female==1]
ahe.m=ahe[female!=1]
t.test(ahe.f,ahe.m)
# output: Welch two sample test, so did you assume equal variances?

# alternatively you could use
t.test(ahe ~ x)
# note that also having a bachelor degree or not may cause differences
# 

ahe.b=ahe[bachelor==1]
ahe.hs=ahe[bachelor==0]
t.test(ahe.b,ahe.hs)
# now having a bachelor degree might be the cause, but we do not exlore that here

# 1d
t.test(ahe.f,mu=17, conf.level = 0.99)
# or a more difficult option using the libraries above
confint(lm(ahe.f ~ 1), level = 0.99)
# can you explain previous command ?

# 1e
ahe.regr=lm(ahe ~ age, data = cps08)
ahe.regr
summary(ahe.regr)
# all output (the object ahe.regr) is stored in a list
names(ahe.regr)
b.hat=ahe.regr$coefficients
b.hat
# or usong the handy function coef()
b.hat.2 = coef(ahe.regr)
# similarly for fitted values
# ahe.fit=fitted(ahe.regr)

# Finding R-squared
n=length(ahe)
(var(ahe)-var(resid(ahe.regr)) )/var(ahe)
var(fitted(ahe.regr))/var(ahe)

# find fitted values
ahe.fit=fitted(ahe.regr)
# or by hand using estimated coefficients!
ahe.fit.2 = b.hat[1] + age*b.hat[2]
# and check equality
(ahe.fit-ahe.fit.2)[1:5]
# or perhaps check all elements, e.g.: 
sum((ahe.fit-ahe.fit.2)^2)

# 1f
b.hat
# is the slope large or small? We can increase slope by measuring age in decades (!)
sd(age)
sd(ahe)
# can you answer now?

# 1g
b.hat[1]+b.hat[2]*26
b.hat[1]+b.hat[2]*30

# 1h
# R squared
var(fitted(ahe.regr))/var(ahe)

# 1i
## compare low and high variance subsamples
lowVar <- age>=29 & age<=31	# selects only the points for which age is between 29 and 31
est2a<-lm(ahe~age,subset=lowVar)
summary(est2)

K<-length(which(lowVar==TRUE))

# see also section 7.4 internal tutorial
sample(age>31 | age<29)

lowSize <- sample(age,size=K) 
# takes a random sample from points for which age is larger than 31 or smaller than 29

est2b<-lm(ahe~age,subset=lowSize)
summary(est2b)

## plot to compare outcomes: 
plot(ahe ~ age)
points(ahe ~ age,col=2,subset=lowVar)
points(ahe ~ age,col=3,subset=lowSize)
abline(ahe.regr)
abline(est2a,col=2)
abline(est2b,col=3)