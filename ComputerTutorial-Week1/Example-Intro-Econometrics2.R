# Set current working directory
setwd("/Users/Mylene/Documents/introduction-to-econometrics/ComputerTutorial-Week1/")

# Example Session R:  Example-Intro-Econometrics2.R 
# Run two independent samples t-test

rm(list=ls())		#clear memory
# now read the Excel file "Zocor-Stata.xlsx" using the menu. 
# we want to run a t-test
# go to section 8.3 from internal R tutorial

# import Excel file Zocor_Stata.xlsx
library(readxl)
Zocor_Stata <- read_excel("Zocor_Stata.xlsx", sheet = "Extra Sheet")
View(Zocor_Stata)

# first a boxplot seems a good idea

help("boxplot")		# in the tutorial they have two separate variables, but 
# we have one variable split by another to get two independent groups
# so help() seems wise
Price=Zocor_Stata$Price	# make separate variables
State=Zocor_Stata$State
StateStr=Zocor_Stata$StateStr
boxplot(Price~State)  	 # a boxplot of Price, split in groups by State
boxplot(Price~StateStr)  # a boxplot of Price, split in groups by StateStr
# you could have used attach(Zocor_chap10) to use the variables

t.test(Price~StateStr)	# look at output. Which t-test are we using?
t.test(Price~StateStr, var.equal=TRUE)	# Which t-test are we using?
var.test(Price~StateStr)	# what variance test are we using?
wilcox.test(Price~StateStr)	# what is the meaning of the error message?

# we have forgotten to check some numerical measures ( internet R tutorial)
skewness(Price)	# if R does not know skewness: remember e1071
library(e1071)	# from before, possibly first:  install.packages(?e1071?)
skewness(Price)	# that helps, but Price should be split by State 
help(skewness)	# ?? does not solve our problem
			# we need logical vectors
Texas=(State==2)
Colorado=(State==1)
skewness(Price[Texas])		# symmetry no problem for this population
skewness(Price[Colorado])	
	# note: see also section 8.2 internal R tutorial about distribution 1 sample

# can we do 1-sample tests as well? Internal tutorial not very clear
# so try internet R tutorial: is mainly with 'hand calculations'
help("t.test")	# ! we can see: 1-sample is possible
t.test(Price[Colorado],mu=125)	# you have done it!

# can we find a proportion test? We used google
help("prop.test")		# something to find out yourself