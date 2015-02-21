# load packages
library("ggplot2")

# do SVD
svd <- svd(votedfv[,3:72],nu=0,nv=2)
svdv <- svd$v
rownames(svdv) <- c( "TSANG Yok-sing", "Albert HO", "LEE Cheuk-yan", "James TO", "CHAN Kam-lam", "LEUNG Yiu-chung", "Dr LAU Wong-fat", "Emily LAU", "TAM Yiu-chung", "Abraham SHEK", "Tommy CHEUNG", "Frederick FUNG", "Vincent FANG", "WONG Kwok-hing", "Dr Joseph LEE", "Jeffrey LAM", "Andrew LEUNG", "WONG Ting-kwong", "Ronny TONG", "Cyd HO", "Starry LEE", "Dr LAM Tai-fai", "CHAN Hak-kan", "CHAN Kin-por", "Dr Priscilla LEUNG", "Dr LEUNG Ka-lau", "CHEUNG Kwok-che", "WONG Kwok-kin", "IP Kwok-him", "Mrs Regina IP", "Paul TSE", "Alan LEONG", "LEUNG Kwok-hung", "Albert CHAN", "WONG Yuk-man", "Claudia MO", "Michael TIEN", "James TIEN", "NG Leung-sing", "Steven HO", "Frankie YICK", "WU Chi-wai", "YIU Si-wing", "Gary FAN", "MA Fung-kwok", "Charles Peter MOK", "CHAN Chi-chuen", "CHAN Han-pan", "Dr Kenneth CHAN", "CHAN Yuen-han", "LEUNG Che-cheung", "Kenneth LEUNG", "Alice MAK", "Dr KWOK Ka-ki", "KWOK Wai-keung", "Dennis KWOK", "Christopher CHEUNG", "Dr Fernando CHEUNG", "SIN Chung-kai", "Dr Helena WONG", "IP Kin-yuen", "Dr Elizabeth QUAT", "Martin LIAO", "POON Siu-ping", "TANG Ka-piu", "Dr CHIANG Lai-wan", "Ir Dr LO Wai-kwok", "CHUNG Kwok-pan", "Christopher CHUNG", "Tony TSE" )

# read legco members data
legco.members.info <- read.csv("legco-members-info.csv")

# merge data
dataf <- merge (legco.members.info, svdv, by.x="Members", by.y="row.names")

# labeling for DAB
dataf$DAB = dataf$members
idx = (dataf$Political.Affiliation=="DAB")
dataf$DAB[!idx]=NA
# labeling for PP
dataf$PP = dataf$members
idx = (dataf$Political.Affiliation=="PP")
dataf$PP[!idx]=NA
#labeling for DP
dataf$DP = dataf$members
idx = (dataf$Political.Affiliation=="DP")
dataf$DP[!idx]=NA
# plot with ggplot2
ggplot(dataf,aes(x=V1,y=V2,color=Political.Bloc))+geom_point(alpha=0.3)+theme_bw()+xlim(-.25,.25)+ylim(-.25,.25)
# plot with Political Affiliations
ggplot(dataf,aes(x=V1,y=V2,color=Political.Affiliation))+geom_point()+theme_bw()
# plot with only DAB members labeled
ggplot(dataf,aes(x=V1,y=V2,color=Political.Bloc,label=DAB))+geom_point(alpha=0.5)+geom_point(size=3,data=subset(dataf,Political.Affiliation=="DAB"))+theme_bw()+xlim(-.25,.25)+ylim(-.25,.25)
# plot with only PP members labeled
ggplot(dataf,aes(x=V1,y=V2,color=Political.Bloc,label=PP))+geom_point(alpha=0.5)+geom_point(size=3,data=subset(dataf,Political.Affiliation=="PP"))+theme_bw()+xlim(-.25,.25)+ylim(-.25,.25)
# plot with names
ggplot(dataf,aes(x=V1,y=V2,color=Political.Bloc,label=Members))+geom_point(alpha=0)+geom_text()+theme_bw()+xlim(-.25,.25)+ylim(-.25,.25)
# plot with subset
ggplot(subset(dataf,Political.Bloc=="D"),aes(x=V1,y=V2,color=Political.Affiliation,label=Members))+geom_point(alpha=0)+geom_text(size=4)+theme_bw()+xlim(-.25,.25)+ylim(-.25,.25)
ggplot(subset(dataf,Political.Affiliation %in% c("DP","DAB", "LSD")),aes(x=V1,y=V2,color=Political.Affiliation,label=Members))+geom_point(alpha=0)+geom_text(size=4)+theme_bw()+xlim(-.25,.25)+ylim(-.25,.25)
# plot with Chinese text
ggplot(dataf,aes(x=V1,y=V2,color=Political.Bloc))+geom_point(size=3,alpha=0.6)+theme_bw()+xlim(-.25,.25)+ylim(-.25,.25)+scale_color_discrete(name="政治派系", breaks=c("D","E"),labels=c("泛民", "親建制"))+ggtitle("立法會議員投票取向")

# biplot with subset of motion displayed, education as example
biplot(votepca$x[grep("EDUCATION",votedfv$motion.name),],votepca$rotation,var.axes=0,cex=0.7)

biplot(votepca,grep("EDUCATION",votedfv$motion.name),var.axes=0,cex=0.7)
