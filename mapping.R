require(plyr)
mapping <- function(x){
  mapvalues(x, c("Present", "Absent", "Abstain", "Yes", "No"), c(0,0,0,1,-1),)
}
f <- colwise(mapping)
votedfv <-f(votedf)

num <- function(x){
  as.numeric(x)
}
g <- colwise(num)
votedfv[,3:72] <- g(votedfv[,3:72])