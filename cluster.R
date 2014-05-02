# read data
x <- legco.division.20121017.20140416.csv.numeric.csv
names <- legco.members.info
# run SVD
svddata <- svd(x[,3:72],nu=2,nv=2)
# do data frame
dataf <- data.frame(members=names$Members,affi=names$Political.Affiliation,bloc=names$Political.Bloc,v1=svddata$v[,1],v2=svddata$v[,2])
# do cluster
hc <- hclust(dist(dataf))
#plot cluster
plot(hc,labels=dataf$members, hang = -1, cex=0.5)