# Define a with immediate output through parantheses:
(a <- c(1,2,3,4,5,6))
(b <- a+1)
(c <- a+b)
(d <- b*c)
sqrt(d)


# Vector functions
# Define vector
(a <- c(7,2,6,9,4,1,3))
# Basic functions:
sort(a)
length(a)
min(a)
max(a)
sum(a)
prod(a)

# Creating special vectors:
numeric(20)
rep(1,20)
seq(50)
5:15
15:5
seq(4,20,2)