# read data
x <- legco.division.20121017.20140416.csv.numeric.csv
names <- legco.members.info1
# run SVD
svddata <- svd(x[,3:72],nu=2,nv=2)
# do data frame
dataf <- data.frame(members=names$Members,affi=names$Political.Affiliation,bloc=names$Political.Bloc,v1=svddata$v[,1],v2=svddata$v[,2])
# plot with ggplot2
ggplot(dataf,aes(x=v1,y=v2,color=bloc))+xlim(-0.2,0.2)+ylim(-0.25,0.25)+geom_point()