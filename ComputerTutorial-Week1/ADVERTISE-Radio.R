# Set current working directory
setwd("/Users/Mylene/Documents/introduction-to-econometrics/ComputerTutorial-Week1/")

# Import data: ADVERTISE-Radio.xls
ADVERTISE_Radio <- read_excel("~/Documents/introduction-to-econometrics/ComputerTutorial-Week1/ADVERTISE-Radio.xls")

View(ADVERTISE_Radio)		# show what is in Data Frame ADVERTISE_Radio
Sales=ADVERTISE_Radio$Sales	# create variable Sales
Radio=ADVERTISE_Radio$Radio	#
Newsp=ADVERTISE_Radio$Newspaper #
Mean(Radio)
mean(Radio)			# case sensitive!
lm(Sale~Radio+Newsp)		# run a regression of Sales on Radio and Newsp
# and display some of the output. How to get more output?
lm=lm(Sale~Radio+Newsp)	#create object (List) lm (the estimated model)
summary(lm) 			# summary() extract elements from the List lm 
