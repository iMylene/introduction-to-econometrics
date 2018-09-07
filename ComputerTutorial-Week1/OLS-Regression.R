
library(foreign)
ceosal1<-read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/ceosal1.dta")

# OLS regression through origin, immediate output  
lm( salary ~ 0 + roe, data=ceosal1 )

# OLS regression through origin, brackets for immediate output  
(CEOregres <- lm( salary ~ 0 + roe, data=ceosal1 ))

# OLS regression
CEOregres <- lm( salary ~ roe, data=ceosal1 )

# Scatter plot (restrict y axis limits)
plot(ceosal1$roe, ceosal1$salary, ylim=c(0,4000))

# Add OLS regression line
abline(CEOregres)


# Regression using vectors
# extract variables as vectors:
sal <- ceosal1$salary
roe <- ceosal1$roe

# regression with vectors:
CEOregres <- lm( sal ~ roe )

# obtain predicted values and residuals
sal.hat <- fitted(CEOregres)
u.hat <- resid(CEOregres)
plot(roe,u.hat)

# make table of first 15 rows of data , predicted and residuals
cbind(roe, sal, sal.hat, u.hat)[1:15,]

