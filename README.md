R-hklegcovote
=============

Visualisation of voting patterns of the Legislative Council of Hong Kong using R.

Inspired by [How divided is the Senate?](http://vikparuchuri.com/blog/how-divided-is-the-senate/) and [Visualization of voting behaviour in the 17th German Bundestag](http://www.joyofdata.de/blog/visualization-of-voting-behaviour-in-the-17th-german-bundestag/).

# Required packages
- [ggplot2](http://ggplot2.org/)


# Example plot
![A plot highlighting all DAB members' voting pattern.](https://raw.githubusercontent.com/yellowcandle/R-hklegcovote/master/Rplot06.png)
A plot highlighting all DAB members' voting pattern.  
R Code: 
```R   
ggplot(dataf,aes(x=V1,y=V2,color=Political.Bloc,label=DAB))+geom_point(alpha=0.5)+geom_point(size=3,data=subset(dataf,Political.Affiliation=="DAB"))+theme_bw()+xlim(-.25,.25)+ylim(-.25,.25) 
```
