df <- read.csv("/Users/hillman/Desktop/Interesting Dataset/Cause of death/API_SP.POP.TOTL_DS2_en_csv_v2_4697565.csv", skip = 3, header = T)
drop <- c(2:4)
df <- df[,-drop]
dropX <- which(names(df) == "X")
df <- df[,-dropX]
ny <- 2018-1960+1
newdf <- data.frame()
for (x in 1:nrow(df)){
      for(i in 1:ny ){
            newdf <- rbind(newdf, df[x,1])
      }
}
newdf <- cbind(newdf, "Year" = rep("NA",nrow(newdf)))
newdf <- cbind(newdf, "Population" = rep("NA",nrow(newdf)))
z <- 1
for (x in 1:nrow(df)){
      for (i in 1:ny){
            newdf[z,2] <- 1959 + i
            newdf[z,3] <- df[x,i+1]
            z = z + 1
      }
}
names(newdf)[1] <- "Country/Territory"
write.csv(newdf,"/Users/hillman/Desktop/Interesting Dataset/Cause of death/population.csv", row.names = FALSE)
