corr<-function(directory,threshold=0)
{
    files<-dir(directory);
    alldata<-vector(mode = "numeric",length = 0);
    for(i in 1:332)
    {
        #num<-complete(directory,i);
        tempdata<-read.csv(paste(directory,"/",fileall[i],sep = ""));
        num<-sum((!is.na(tempdata$sulfate)) & (!is.na(tempdata$nitrate)))
        
        if(num > threshold)
        {
            #needdata<-na.omit(tempdata);
            temp<-tempdata[which(!is.na(tempdata$sulfate)),];
            needdata<-temp[which(!is.na(temp$nitrate)),];
            
            alldata<-c(alldata,cor(needdata$sulfate,needdata$nitrate,use = "complete.obs"));
        }
    }
    alldata;
}



tcorr <- function(fname,threshold=0) {
    data <- read.csv(file.path(directory, fname))
    nobs <- sum(complete.cases(data))
    if (nobs > threshold) {
        return (cor(data$nitrate, data$sulfate, use="complete.obs"))
    }
    
tcorrs <- sapply(list.files(directory), tcorr) #get all correlations + NULLs
tcorrs <- unlist(tcorrs[!sapply(tcorrs, is.null)]) #remove NULLs
return (tcorrs)
}