library(grid)
heart<-function(lcolor)
{
    t<-seq(0,2*pi,by=0.1)
    x<-16*sin(t)^3
    y<-13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t)
    a<-(x-min(x))/(max(x)-min(x))
    b<-(y-min(y))/(max(y)-min(y))
    grid.lines(a,b,gp=gpar(col=lcolor,lty="solid",lwd=3))
}

grid.newpage()
for(j in 1:30)
{
    vp<-viewport(0.5,0.5,w=0.9,h=0.9,angle=15)
    pushViewport(vp)
    heart("hotpink")
}

grid.newpage()
ang<-15*c(1,rep(0,29))
for(j in 1:30)
{
    vp<-viewport(0.5,0.5,w=0.9,h=0.9,angle=ang[j])
    pushViewport(vp)
    heart("hotpink")
}
ang<--15*c(1,rep(0,29))
for(j in 1:30)
{
    vp<-viewport(0.5,0.5,w=0.9,h=0.9,angle=ang[j])
    pushViewport(vp)
    heart("red")
}

grid.newpage()
ang<-15*c(1,rep(0,29))
for(j in 1:30)
{
    vp<-viewport(0.5,0.5,w=0.9,h=0.9,angle=ang[j])
    pushViewport(vp)
    heart("hotpink")
}
ang<--30*c(1,rep(0,29))
vp<-viewport(3.3,-2.9,w=1.09,h=1.09,angle=ang[1],just="bottom")
pushViewport(vp)
heart("red")
for(j in 2:30)
{
    vp<-viewport(0.5,0.5,w=1.09,h=1.09,angle=ang[j])
    pushViewport(vp)
    heart("red")
}
