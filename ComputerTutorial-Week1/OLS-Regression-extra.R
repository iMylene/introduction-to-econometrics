
library(foreign)
ceosal1<-read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/ceosal1.dta")


# OLS regression
CEOregres <- lm( salary ~ roe, data=ceosal1 )
# extract variables as vectors:
sal <- ceosal1$salary
roe <- ceosal1$roe


# obtain predicted values and residuals and coefficients
sal.hat <- fitted(CEOregres)
u.hat <- resid(CEOregres)
b.hat <- coef(CEOregres)

# obtain predicted values and residuals yourself
sal.hat.2 = b.hat[1] + b.hat[2] * roe
u.hat.2 = salary - sal.hat.2


# check first 5 rows
sal.hat.2[1:5]-sal.hat[1:5]
u.hat.2[1:5]-u.hat[1:5]


