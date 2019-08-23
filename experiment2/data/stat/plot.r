library(Rcmdr)

# load dataset
train <- 
  read.table("./persistence_train.csv",
   header=FALSE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
train <- within(train, {
  V1 <- as.factor(V1)
})
train_filtered <- 
  read.table("./persistence_filter_train.csv",
   header=FALSE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
train_filtered <- within(train_filtered, {
  V1 <- as.factor(V1)
})

# add summaries of dataset
summary(train)
summary(train_filtered)

# aggregate in different ways on test case and create scatterplots
scatterplot(V3~V2, regLine=FALSE, smooth=FALSE, boxplots=FALSE, 
  data=train, xlab="Birth", ylab="Death")
with(train_filtered, Hist(V4, scale="frequency", breaks="Sturges", 
  col="darkgray", xlab="Persistence", ylab="Frequence"))
train_filtered2 <- subset(train_filtered, subset=V4 >= 1.0)
with(train_filtered2, Hist(V4, scale="frequency", breaks="Sturges", 
  col="darkgray", xlab="Persistence", ylab="Frequence"))
aggr_train_sum<- aggregate(V4 ~ V1, data=train, FUN=sum)
with(aggr_train_sum, Hist(V4, scale="frequency", breaks="Sturges", 
  col="darkgray", xlab="Persistence Sum", ylab="Frequency",
  xlim=c(0,100), ylim=c(0,1200)))
aggr_train_filtered_sum<- aggregate(V4 ~ V1, data=train_filtered, FUN=sum)
with(aggr_train_filtered_sum, Hist(V4, scale="frequency", breaks="Sturges", 
  col="darkgray", xlab="Persistence Sum Filtered", ylab="Frequency",
  xlim=c(0,100), ylim=c(0,1200)))
aggr_train_length<- aggregate(V4 ~ V1, data=train, FUN=length)
with(aggr_train_length, Hist(V4, scale="frequency", breaks="Sturges", 
  col="darkgray", xlab="# persistence pairs", ylab="Frequency"))
aggr_train_mean<- aggregate(V4 ~ V1, data=train, FUN=mean)
with(aggr_train_mean, Hist(V4, scale="frequency", breaks="Sturges", 
  col="darkgray", xlab="Persistence mean", ylab="Frequency"))
  
# create numerical summeries of aggregation
summary(aggr_train_sum)
aggr_train_sum_filtered<- aggregate(V4 ~ V1, data=train_filtered, FUN=sum)
summary(aggr_train_sum_filtered)

