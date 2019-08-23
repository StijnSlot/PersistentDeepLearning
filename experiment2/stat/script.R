library(Rcmdr)

# load dataset
Dataset <- 
  read.table("./stat.csv",
   header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
   
# filter dataset with relevant variables
DatasetFiltered <- subset(Dataset, select=c(crot90,crot180,crot270,
  cscale1.2,cscale1.5,cscale2,ctrans1_1,ctrans5_5,ctrans.5_.5,drot90,
  drot180,drot270,dscale1.2,dscale1.5,dscale2,dtrans1_1,dtrans5_5,
  dtrans.5_.5,loss,prot90,prot180,prot270,pscale1.2,pscale1.5,pscale2,
  ptrans1_1,ptrans5_5,ptrans.5_.5,rrot90,rrot180,rrot270,rscale1.2,rscale1.5,
  rscale2,rtrans1_1,rtrans5_5,rtrans.5_.5))

# make summary and write to csv
su <- numSummary(DatasetFiltered, statistics=c("mean", "median", "sd",
"quantiles"), quantiles=c(0,.25,.5,.75,1)) 
write.csv(su$table, file = "./summary.csv")

# create scatterplots of MSE change versus loss of initial prediction to check for correlation
scatterplot(prot90~loss, regLine=FALSE, smooth=FALSE, boxplots=FALSE, 
  data=DatasetFiltered)
scatterplot(prot180~loss, regLine=FALSE, smooth=FALSE, boxplots=FALSE, 
  data=DatasetFiltered)
scatterplot(prot270~loss, regLine=FALSE, smooth=FALSE, boxplots=FALSE, 
  data=DatasetFiltered)
scatterplot(ptrans1_1~loss, regLine=FALSE, smooth=FALSE, boxplots=FALSE, 
  data=DatasetFiltered)
scatterplot(ptrans5_5~loss, regLine=FALSE, smooth=FALSE, boxplots=FALSE, 
  data=DatasetFiltered)
scatterplot(ptrans.5_.5~loss, regLine=FALSE, smooth=FALSE, boxplots=FALSE, 
  data=DatasetFiltered)
scatterplot(pscale1.2~loss, regLine=FALSE, smooth=FALSE, boxplots=FALSE, 
  data=DatasetFiltered)
scatterplot(pscale1.5~loss, regLine=FALSE, smooth=FALSE, boxplots=FALSE, 
  data=DatasetFiltered)
scatterplot(pscale2~loss, regLine=FALSE, smooth=FALSE, boxplots=FALSE, 
  data=DatasetFiltered)
