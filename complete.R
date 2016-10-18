complete<-function(directory="specdata",id=1:332)
{
    fileall<-dir(directory);
    
    curdat<-data.frame();
    returndat<-data.frame(row.names = c("id","nobs"));
    for(i in id)
    {
        curdat<-read.csv(paste(directory,"/",fileall[i],sep=""));
        judge<-unique(table(!is.na(curdat$nitrate) & !is.na(curdat$sulfate))[2]);
        ret<-cbind(i,judge);
        returndat<-rbind(returndat,ret);
    }
   
    colnames(returndat)<-c("id","nobs");
    returndat;
}