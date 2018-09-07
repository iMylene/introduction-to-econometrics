# Example Session R Example-Intro-Econometrics1.R 
#   What you really should try: open this example Script file in R
#   Menu/File/Open File?/
#   Note that in R you can very easily run the commands one at a time
#   Make sure you see extensions of file names on your computer
#   In Windows 10: in Explorer  Menu/View and check File Name Extensions

# Set current working directory
setwd("/Users/Mylene/Documents/introduction-to-econometrics/ComputerTutorial-Week1/")

# Importing external data and doing a regression
# Import the data file (we used menu in R Studio to generate next 3 lines)
install.packages("haven")
library(haven)
LifeExp <- read_dta("LifeExp.dta")
View(LifeExp)		# on one of our computers this failed

# first import the Stata file LifeExp.dta !!
attach(LifeExp)		# all variables available
mean(lexp)		# it is working
lm(lexp~gnppc)		# a linear regression of lexp on gnppc
	# lm from Linear Model, see 11.2 internal tutorial
	# or perhaps also look at internet tutorial
	# next we try to find better procedure to extract more output
anova(lm(lexp~gnppc))	# section 11.3 internal tutorial
plot(lm(lexp~gnppc))	# most plots we do not understand (yet)
summary(lm(lexp~gnppc)) # perhaps remember this one to extract output 

# can we save the data somehow? 
save(LifeExp,file="LifeExp.Rda")	# note: suggestion from Google

# have we really saved the data? Clear memory and reload the data
rm(list=ls())		# remove environment: see Window 2
load("LifeExp.Rda")	# and try to reload

# are the vectors still available? (not visible in environment)
lm(lexp~gnppc)		# yes! linear regression still runs 


# MULTIPLE REGRESSION EXAMPLE

rm(list=ls())		# clear all: see Window 2
data()	# we want to run multiple regression
	# from internet tutorial, data frame stackloss
# note that Window 1 has got output from command data()
# Use tabs in Window 1 to return to Example-Intro-Econometrics1.R
#    to continue running commands one by one

View(stackloss)	# the data frame in internet tutorial
help("stackloss")	# the example in this tutorial
head(stackloss)	# the example in this tutorial
	# run multiple regression from the internet tutorial
attach(stackloss)	# now we can use the variables
unrest.lm = lm(stack.loss ~ Air.Flow + Water.Temp + Acid.Conc.)  
#   that was a multiple regression, result is stored in the object unrest.lm
#   shorthand for 'unrestricted lm'
coef(unrest.lm)	# show the estimated coefficients in object unrest.lm
rest.lm = lm(stack.loss ~ Air.Flow + Water.Temp)  
# restricted multiple regression (we removed variable), 
# result stored in object rest.lm

anova(unrest.lm, rest.lm)   # compare both (nested) models
# At the moment you may have no idea yet what we are doing