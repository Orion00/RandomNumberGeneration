#RNGversion("3.5.2")
#RNGversion("4.2.1")
library(readr)
library(dplyr)
library(data.table)
library(purrr)

set.seed(121)
# Generating 10,000,000 random integers from the set {1,2,...,16} using R's Random Sample Function
dat1 <- sample(c(1:16),10000000,replace=T)
write.table(dat1,"Rsample.txt",row.names = F, sep=",")

dat1b <- read_csv("Rsample.txt") %>% pull("x")

#Generating 10,000,000 random numbers between 1 and 17 using R's continuous Uniform sampling then using floor to remove decimals. 
dat2 <- floor(runif(10000000)*16+1)
write.table(dat2,"Rrunif.txt",row.names = F, sep=",")

dat2b <- read_csv("Rrunif.txt") %>% pull("x")

### Exactly the same as Rsample
# #Generating 10,000,000 random integers between 1 and 16 (inclusive) using purrr's rdunif Function
# dat3 <- rdunif(n=10000000,1,16)
# write.table(dat3,"Rdunif.txt",row.names = F, sep=",")
# 
# dat3b <- read_csv("Rdunif.txt") %>% pull("x")





#I'll be using Rsample.txt (dat1b) from R, Rrunif.txt (dat2b) from R, and Rdunif.txt (dat3b) from purrr
#(random sample from a set, dropping decimals from floats, and random integers between 1 and 16)
#Rolling 100 or 1000 dice and montecarlo simulating

#Importing d20.txt (Rolling 1,000 dice) (20 d20s several times, rerolling 17-20s)
dat4b <- read_csv("d20.txt")


###Anything below this shouldn't be needed
###I'll clean it up once I verify I don't need a third way for R to generate this,
###but right now I can't convert from continuous to discrete super effectively







#Testing Time (fwrite about 9 times faster than write.table. read_csv comparable between the two)

#write.table
start_time <- Sys.time()
write.table(dat2,"Rrunif.txt",row.names = F, sep=",")
end_time <- Sys.time()
print("Write.table")
print(end_time - start_time)

#read_csv for write.table
start_time <- Sys.time()
dat2b <- read_csv("Rrunif.txt") %>% pull("x")
end_time <- Sys.time()
print("Reading write.table")
print(end_time - start_time)


#fwrite
start_time <- Sys.time()
fwrite(list(dat2),"Funif.txt")
end_time <- Sys.time()
print("fwrite")
print(end_time - start_time)

#read_csv for fwrite
start_time <- Sys.time()
dat2c <- read_csv("Funif.txt",col_names=F) %>% pull("X1")
end_time <- Sys.time()
print("Reading fwrite")
print(end_time - start_time)

