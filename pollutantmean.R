pollutantmean<-function(directory,pollutant,id=1:332){
    dat<-data.frame();
    fileall<-dir(directory);
    for(i in id){
        dat<-rbind(dat,read.csv(paste(directory,"/",fileall[i],sep = "")));
    }
    
    ref<-mean(dat[,pollutant],na.rm = T);
    round(ref,digits = 3);
}