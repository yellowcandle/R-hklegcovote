# read data
x <- legco.division.20121017.20140416.csv.numeric.csv
names <- legco.members.info
# run SVD
svddata <- svd(x[,3:72],nu=2,nv=2)
# do data frame
dataf <- data.frame(members=names$Members,affi=names$Political.Affiliation,bloc=names$Political.Bloc,v1=svddata$v[,1],v2=svddata$v[,2])
# labeling for DAB
dataf$DAB = dataf$members
idx = (dataf$affi=="DAB")
dataf$DAB[!idx]=NA
# labeling for PP
dataf$PP = dataf$members
idx = (dataf$affi=="PP")
dataf$PP[!idx]=NA
# plot with ggplot2
ggplot(dataf,aes(x=v1,y=v2,color=bloc))+xlim(-0.2,0.2)+ylim(-0.25,0.25)+geom_point(alpha=0.5)+geom_text(size=3,hjust=0)+theme_bw()
# plot with only DAB members labeled
ggplot(dataf,aes(x=v1,y=v2,color=bloc,label=DAB))+xlim(-0.2,0.2)+ylim(-0.25,0.25)+geom_point()+geom_text(size=3,hjust=0)+theme_bw()
# plot with only PP members labeled
ggplot(dataf,aes(x=v1,y=v2,color=bloc,label=PP))+xlim(-0.2,0.2)+ylim(-0.25,0.25)+geom_point()+geom_text(size=3,hjust=0)+theme_bw()
# highlighting only DAB members
ggplot(dataf,aes(x=v1,y=v2,color=bloc))+xlim(-0.2,0.2)+ylim(-0.25,0.25)+geom_point(alpha=0.3)+geom_point(data=subset(dataf, affi=="DAB"))+theme_bw()
# highlighting only CP members
ggplot(dataf,aes(x=v1,y=v2,color=bloc))+xlim(-0.2,0.2)+ylim(-0.25,0.25)+geom_point(alpha=0.3)+geom_point(data=subset(dataf, affi=="CP"))+theme_bw()
# highlighting only LAB members with larger dots
gplot(dataf,aes(x=v1,y=v2,color=bloc))+xlim(-0.2,0.2)+ylim(-0.25,0.25)+geom_point(alpha=0.3)+geom_point(data=subset(dataf, affi=="LAB"),size=3)+theme_bw()
