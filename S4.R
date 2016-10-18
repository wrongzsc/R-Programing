# S1
outcome<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
head(outcome)
str(outcome)
outcome[,11]<-as.numeric(outcome[,11])
hist(outcome[,11])

# S2
best<-function(state,outcome)
{
    # read outcome data
    
    # check that state and outcome is valid
    
    # return hospital name with outcome
    # (heart attack//heart failure//pneumonia//)
}

#S3

